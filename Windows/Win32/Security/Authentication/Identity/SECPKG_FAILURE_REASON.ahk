#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_FAILURE_SPECIAL_REASON.ahk" { SECPKG_FAILURE_SPECIAL_REASON }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_FAILURE_REASON {
    #StructPack 4

    Status : NTSTATUS

    Reason : SECPKG_FAILURE_SPECIAL_REASON

}
