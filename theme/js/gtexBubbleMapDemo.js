$(document).ready(function(){
    var gene = Drupal.settings.zmap_eqtlviz.geneid ? Drupal.settings.zmap_eqtlviz.geneid : 'Zm00001d037393';
    var gene_ref = Drupal.settings.zmap_eqtlviz.ref ? Drupal.settings.zmap_eqtlviz.ref : 'b73';
    $('#bbTooltip').appendTo('body');
    // gene search handling on the demo page
    var useRsId = false;
    var gtexMap = undefined;
    var proceed = function(gId, useRs, gene_ref){
        $('#bbGeneInput').val(gId);
        var urls = {
            tissue: gtexBubbleMapConfig.getTissueUrl,
            gene: gtexBubbleMapConfig.getGeneUrl,
            eqtl: gtexBubbleMapConfig.getEqtlUrl,
            exons:gtexBubbleMapConfig.getExonsUrl,
            eqtlBoxplot: gtexBubbleMapConfig.getEqtlBoxplotUrl,
            ld: gtexBubbleMapConfig.getLDUrl
        };
        gtexMap = new gtexBubbleMap(gId, gtexBubbleMapConfig.build(gId), urls, useRs, gene_ref);
        gtexMap.launch();
    };
    proceed(gene, useRsId, gene_ref);

    $('#bbGeneSearch').click(function(){
        gene = $('#bbGeneInput').val().trim();
        gene_ref = $('#select_ref').val().trim();
        proceed(gene, useRsId, gene_ref);
    });

    $('#tissueMenu').click(function(){
        return false;
    });

    /*
    $('#bbGeneInput').keydown(function(e){
        if(e.keyCode == 13) {
            gene = $('#bbGeneInput').val().trim();
            gene_ref = $('#select_ref').val().trim();
            proceed(gene, useRsId, gene_ref);
        }
    });
    */

    $('#useRsId').change(function(){
        if(this.checked){
            // the checkbox is now checked
            useRsId = true;
            gtexMap.changeXLabels(useRsId);

        } else {
            // the checkbox is no longer checked
            useRsId = false;
            gtexMap.changeXLabels(useRsId);
        }
    });
});

