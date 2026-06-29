#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct NTSCSI_UNICODE_STRING {
    #StructPack 8

    Length : UInt16

    MaximumLength : UInt16

    Buffer : PWSTR

}
