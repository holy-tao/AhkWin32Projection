#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CALPWSTR {
    #StructPack 8

    cElems : UInt32

    pElems : PWSTR.Ptr

}
