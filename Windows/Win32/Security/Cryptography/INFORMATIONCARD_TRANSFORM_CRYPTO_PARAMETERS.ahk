#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct INFORMATIONCARD_TRANSFORM_CRYPTO_PARAMETERS {
    #StructPack 4

    inputBlockSize : Int32

    outputBlockSize : Int32

    canTransformMultipleBlocks : BOOL

    canReuseTransform : BOOL

}
