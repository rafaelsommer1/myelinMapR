#' This function provide preprocess options for QMM objects
#' @param dti a qmm object
#' @param mask a brain mask (if provided bet won´t be performed)
#' @param bet_opts options to be pass to \code{fsl_bet}
#' @param ref_eddy reference volume for eddy corrections
#' @param ret_img if TRUE returns an qmm object
#' @export
#' @author R.C.S



preproc_qmm <- function(qmm,
                        mask = NULL,
                        bet_opts = NULL,
                        eddy = c("eddy","eddy_correct"),
                        ref_eddy = 0,
                        bvals,
                        bvecs,
                        ret_img = F) {

        bval = qmm@bvals
        bvec = qmm@bvecs
        dwi = qmm@signal
        b0 = fslroi(dwi, outfile = "b0", 0, retimg = T)




}
