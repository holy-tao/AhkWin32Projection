#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_SURROGATE_LOGON_ENTRY {
    #StructPack 8

    Type : Guid

    Data : IntPtr

}
