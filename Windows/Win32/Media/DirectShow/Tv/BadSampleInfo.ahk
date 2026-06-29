#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BadSampleInfo {
    #StructPack 4

    hrReason : HRESULT

}
