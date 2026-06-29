#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CALPSTR {
    #StructPack 8

    cElems : UInt32

    pElems : PSTR.Ptr

}
