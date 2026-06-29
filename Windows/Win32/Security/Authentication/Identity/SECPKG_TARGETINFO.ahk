#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Specifies the target of an authentication request.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_targetinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_TARGETINFO {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that specifies the domain of the target computer.
     */
    DomainSid : PSID

    /**
     * The name of the target computer.
     */
    ComputerName : PWSTR

}
