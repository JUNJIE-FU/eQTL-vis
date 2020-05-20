<?php

function api_zmap_eqtlviz_retrive_tissue()
{
    $table = 'zmap_eqtlviz_tissue';
    $res = db_select($table, $table)->fields($table)->execute()->fetchAll(PDO::FETCH_ASSOC);
    $tissue = [];
    if (!empty($res)) {
        foreach ($res as $k => $v) {
            $tissue[] = array(
                'datasetId' => trim($v['dataset_id']),
                'eGeneCount' => (int) $v['egene_count'],
                'expressedGeneCount' => (int) $v['expressed_gene_count'],
                'hasEGenes' => (bool) $v['has_egenes'],
                'rnaSeqAndGenotypeSampleCount' => (int) $v['rna_seq_and_genotype_sample_count'],
                'rnaSeqSampleCount' => (int) $v['rna_seq_sample_count'],
                'tissueSiteDetailId' => trim($v['tissue_site_detail_id']),
            );
        }
    }

    drupal_json_output(['tissueSummary' => $tissue]);
}

function api_zmap_eqtlviz_retrive_gene($ref, $geneid)
{
    $table = 'zmap_eqtlviz_'.$ref.'_gene';
    $res = db_select($table, $table)->fields($table)->condition('gencodeid', $geneid, '=')->execute()->fetchAll(PDO::FETCH_ASSOC);
    $gene = array();
    if (!empty($res)) {
        foreach ($res as $k => $v) {
            $gene = array(
                'chromosome' => trim($v['chromosome']),
                'datasource' => trim($v['datasource']),
                'description' => trim($v['description']),
                'end' => (int) $v['gend'],
                'entrezGeneID' => trim($v['entrezgeneid']),
                'gencodeId' => trim($v['gencodeid']),
                'gencodeVersion' => trim($v['gencodeversion']),
                'geneStatus' => trim($v['genestatus']),
                'geneSymbol' => trim($v['genesymbol']),
                'geneSymbolUpper' => trim($v['genesymbolupper']),
                'geneType' => trim($v['genetype']),
                'genomeBuild' => trim($v['genomebuild']),
                'start' => (int) $v['gstart'],
                'strand' => trim($v['strand']),
                'tss' => (int) $v['tss'],
            );
        }
    }

    drupal_json_output(['gene' => [$gene]]);
}

function api_zmap_eqtlviz_retrive_snp($ref, $geneid)
{
    $table = 'zmap_eqtlviz_'.$ref.'_snp';
    $res = db_select($table, $table)->fields($table)->condition('gene', $geneid, '=')->execute()->fetchAll(PDO::FETCH_ASSOC);
    $singleTissueEqtl = array();
    if (!empty($res)) {
        foreach ($res as $k => $v) {
            $chr = trim(substr($v['snpid'], 3, strpos($v['snpid'], '.') - 3));
            $pos = trim(substr($v['snpid'], strpos($v['snpid'], '_') + 1));
            $singleTissueEqtl[] = array(
                'chromosome' => $chr,
                'datasetId' => 'mays',
                'gencodeId' => $v['gene'],
                'geneSymbol' => $v['gene'],
                'geneSymbolUpper' => $v['gene'],
                'nes' => (float) trim($v['beta']),
                'pValue' => (float) trim($v['pvalue']),
                'pos' => (float) $pos,
                'snpId' => trim($v['snpid']),
                'tissueSiteDetailId' => 'kernel',
                'variantId' => trim($v['snpid']),
            );
        }
    }
    $data = array('singleTissueEqtl' => $singleTissueEqtl);

    drupal_json_output($data);
}

function api_zmap_eqtlviz_retrive_ld($ref, $geneid)
{
    ini_set('memory_limit', '1024M');
    ini_set('max_execution_time', 0);

    $ref = strtolower($ref);
    $LDdir = 'zmap_eqtlviz_'.$ref.'_LDs';
    $files_dir = variable_get('file_public_path', conf_path().'/files')."/$LDdir/";
    $ldfile = $files_dir.$geneid.'.LD';
    if (file_exists($ldfile)) {
        $data = [];
        if (($handle = fopen($ldfile, 'r')) !== false) {
            while (($line = fgetcsv($handle, 1024, "\t")) !== false) {
                $site = trim($line[0]).','.trim($line[1]);
                $r2 = (float) $line[2];
                $data[] = array($site, $r2);
                unset($line);
                unset($site);
                unset($r2);
            }
        }
    }
    drupal_json_output(['ld' => $data]);
}
