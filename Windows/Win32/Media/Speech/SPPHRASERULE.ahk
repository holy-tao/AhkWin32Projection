#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASERULE {
    #StructPack 8

    pszName : PWSTR

    ulId : UInt32

    ulFirstElement : UInt32

    ulCountOfElements : UInt32

    pNextSibling : SPPHRASERULE.Ptr

    pFirstChild : SPPHRASERULE.Ptr

    SREngineConfidence : Float32

    Confidence : Int8

}
