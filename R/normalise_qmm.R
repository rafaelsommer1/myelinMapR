#' Caculate the Normalised Leptokurtic Diffusion from a q-Space Myelin Map
#' @importFrom neurobase readnii writenii
#' @param qmm Nifti object of a processed myelinmap
#' @param outfile Output file name
#' @param write If = TRUE, write a Nifti file for the NLD in the current directory
#' @param verbose If = TRUE show log messages
#' @return A calculated NLD nifti object
#' @author R.C.S
#' @export

normalise_qmm <- function (qmm, outfile = NULL, write = TRUE, verbose = TRUE) {
  if(verbose){message("Calculating NLD")}
  nld <- ((max(qmm) - qmm) / (max(qmm)-min(qmm[qmm>0])) ) * 100
  mask = nld < 1000
  if(verbose){message("Masking")}
  nld = nld * mask
  if (write){
    if(verbose){message("Writing Nifti")}
        if (is.null(outfile)){
          message("No Output defined!!")
          return(NULL)
        }

    writenii(nld, outfile)

    }

    return(nld)
  }
