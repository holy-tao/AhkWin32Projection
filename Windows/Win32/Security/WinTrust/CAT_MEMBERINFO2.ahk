#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CAT_MEMBERINFO2 {
    #StructPack 4

    SubjectGuid : Guid

    dwCertVersion : UInt32

}
