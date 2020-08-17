setClass("gtab",
         slots = c(bvals = "numeric",
                        bvecs = "matrix",
                        b0_ind = "integer"
                        bval_uni = "numeric"
                        bval_n = "integer"

        )
        )

setClass("qmm",
         slots = c(

         )


         contains = c("list","gradient_tab")
         )



# Functions for creating classes

#' Create a gradient table Object
#' @param bvec the gradient directions matrix file
#' @param bval the b-values file
#' @return A gradient table object
#' @author R.C.S
#' @export

gradient <- function (bvec, bval) {
        g = list(
                        bvec = as.matrix(read.delim2(bvec, header = F)),
                        bval = as.numeric(read.table(bval, header = F)),
                        b0_ind = bval == 0,
                        bval_uni = unique(bval[!b0_ind]),
                        bval_n = length(unique(bval[!b0_ind])
        ))

        new(gtab)
}

#' Create a qmm object
#' @param nifti_file A nifti object with dwi data
#' @param gradient A gradient_table object created with \codegradient()
#' @return A qmm object
#' @author R.C.S
#' @export

qmm <- function (nifti_file, gtab){


        nii <- readnii(nifti_file)


}
