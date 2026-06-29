#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VA_TRANSFER_CHARACTERISTICS.ahk" { VA_TRANSFER_CHARACTERISTICS }
#Import ".\VA_COLOR_PRIMARIES.ahk" { VA_COLOR_PRIMARIES }
#Import ".\VA_MATRIX_COEFFICIENTS.ahk" { VA_MATRIX_COEFFICIENTS }
#Import ".\VA_VIDEO_FORMAT.ahk" { VA_VIDEO_FORMAT }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct VA_OPTIONAL_VIDEO_PROPERTIES {
    #StructPack 4

    dwPictureHeight : UInt16

    dwPictureWidth : UInt16

    dwAspectRatioX : UInt16

    dwAspectRatioY : UInt16

    VAVideoFormat : VA_VIDEO_FORMAT

    VAColorPrimaries : VA_COLOR_PRIMARIES

    VATransferCharacteristics : VA_TRANSFER_CHARACTERISTICS

    VAMatrixCoefficients : VA_MATRIX_COEFFICIENTS

}
