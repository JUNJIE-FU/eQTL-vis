# ZEAMAP eQTL Visualization module
A drupal module for eQTL signals and LD matrix visualization in ZEAMAP. 

Find a demo here: [DEMO](http://www.zeamap.com/eqtlviz)

The gene-eQTL bubble heatmap visualization script in this module were modified from [GTEx Gene-eQTL Visualizer](https://github.com/broadinstitute/gtex-viz#gene-eqtl-visualizer).

## Platform

- Drupal 7.x
- Tripal 7.x-3.x

## Installation and Usage

Download this repository, switch to drupal environment, and lunch this module with
    `drush en -y zmap_eqtlviz`

Once the module was correctly loaded, it would create four tables to store necessary information for Gene-eQTL in ZEAMAP in the PostgreSQL database. These tables could also be manually created through `includes/zmap_eqtlviz.sql`. The related Gene-eQTL information should be imported to these tables using `sql` command accordingly.

In order to display the LD matrix, this module would search for Pairwise LD score files in the drupal public dir (sites/default/files) with the gene_id as prefix and "LD" as suffix. So please make sure the related pairwise LD files were correctly prepared. The LD file should be tab-separated files with format below.

 ```shell
    # pairwise LD file format (no header)
    <variant1>   <variant2>    <LD_r2>
    # example:
    chr5.s_209839785        chr5.s_209839821        0.4060
    chr5.s_209839785        chr5.s_209839830        0.3034
    chr5.s_209839785        chr5.s_209839926        0.3581
    chr5.s_209839785        chr5.s_209839951        0.3547
    chr5.s_209839785        chr5.s_209840008        0.3304
    chr5.s_209839785        chr5.s_209840012        0.3487
```
