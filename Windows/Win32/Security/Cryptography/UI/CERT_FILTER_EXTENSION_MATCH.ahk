#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CERT_FILTER_EXTENSION_MATCH {
    #StructPack 8

    szExtensionOID : PSTR

    dwTestOperation : UInt32

    pbTestData : IntPtr

    cbTestData : UInt32

}
