#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CABSTR {
    #StructPack 8

    cElems : UInt32

    pElems : BSTR.Ptr

}
