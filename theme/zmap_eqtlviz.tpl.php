<div id="demo" class="container-flow">
    <p class="desc">Show genetics variations that are highly correlated with gene expression patterns (expression quantitative trait loci, or eQTLs). Currently, only the <i>cis</i>-variants (within 1 megabase up/downstream of the transcription start site) that passed the cut-off of Bonferroni correction were displayed. </p>
    <div>
        <div class="float">
            Select a reference: 
            <select id="select_ref">
                <option value="b73">B73</option>
                <!-- <option value="sk">SK</option> -->
            </select>
        </div>
        <div>
            Gene ID:
            <input id="bbGeneInput" type="text" class="searchInput search-query">
            <input id="bbGeneSearch" type="button" value="Search">
            e.g. Zm00001d037393
            <br>
            <br>
        </div>
        <div>
            <div>
                <div>
                    <span id="geneSymbol" style="font-weight:500;"></span> <!-- where the query gene name appears-->
                </div>

                <div>
                    <div id="bbInfo"></div>
                </div>
                <div id="filterInfo" style="border:1px solid #aaa; background-color:#eee; color:#000; padding:2px; display:none;"></div>
            </div>
        </div>   
    </div>  
</div>
<hr>

<!-- bbMap tooltip -->
<div id="bbTooltip" class="bbMap-tooltip-class"></div>
<div id="bbTooltip2"></div>


<!-- bbMap tissue modal -->
<div id="bbMap-modal" class="modal fade" aria-hidden='true' role='dialog'>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <h4 class="modal-title" id="myModalLabel">GTEx Gene EQTL Visualizer Tissue Selector</h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<div id="gtexBB" class="container-flow">

    <div>
        <!-- info & tissue menu-->
        <div id="tissueMenu" class="float">
            <div>
                <div></div>
                <div data-toggle="modal" data-target="#bbMap-modal">Tissue Menu</div>
            </div>
        </div>

        <!-- data filtering UI -->
        <div id="bbFilters" class="float">
            <div class="filter">
                <div class="float">
                    -log<sub>10</sub>(p-value) >=
                    <input id="pvalueLimit" type="text" size="4" value="0.0"><br/>
                    <input id="pvalueSlider" type="range" min="5.0" max="25.0" step="1.0" value="0.0"/>
                </div>
                <div>
                    Abs(effect size) >=
                    <input id="effectSizeLimit" type="text" size="4" value="0.00"><br/>
                    <input id="effectSizeSlider" type="range" min="0.00" max="1.00" step="0.05" value = "0.00"/>
                </div>

            </div>
        </div>

        <!-- SNP search -->
        <div class="float snpSearch" id="snpSearch">
            <div>
                SNP Locator
            </div>
            <div>
                <input id="bbSnpSearch" type="text" placeholder="SNP ID...">
            </div>
        </div>
            <!-- legends -->

        <div id="bbLegends"></div>
    </div>


    <div>
        <div>
            
            <div style="width:1250px;height:117px;overflow:auto;margin-top:30px;margin-bottom:-50px;">
                <div id="bbMapCanvas"></div>
            </div>
            <!-- bbMap SVG rendering -->
            <div id="bbMap"></div>

            <div id="ldCanvas"></div>
            <!-- text-loader animation, from cssload.net -->
            <br><br>
            <div id="fountainTextG">
                <div id="fountainTextG_1" class="fountainTextG">L</div>
                <div id="fountainTextG_2" class="fountainTextG">o</div>
                <div id="fountainTextG_3" class="fountainTextG">a</div>
                <div id="fountainTextG_4" class="fountainTextG">d</div>
                <div id="fountainTextG_5" class="fountainTextG">i</div>
                <div id="fountainTextG_6" class="fountainTextG">n</div>
                <div id="fountainTextG_7" class="fountainTextG">g</div>
                <div id="fountainTextG_8" class="fountainTextG">.</div>
                <div id="fountainTextG_9" class="fountainTextG">.</div>
                <div id="fountainTextG_10" class="fountainTextG">.</div>
            </div>

        </div>
    </div>    
</div>
