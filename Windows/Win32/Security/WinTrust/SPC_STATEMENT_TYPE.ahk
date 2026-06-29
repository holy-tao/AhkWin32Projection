#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_STATEMENT_TYPE {
    #StructPack 8

    cKeyPurposeId : UInt32

    rgpszKeyPurposeId : PSTR.Ptr

}
