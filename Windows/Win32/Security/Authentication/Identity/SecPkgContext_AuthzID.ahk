#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about the AuthzID of the security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_authzid
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_AuthzID {
    #StructPack 8

    /**
     * The length of **AuthzID**, in bytes.
     */
    AuthzIDLength : UInt32

    /**
     * The AuthzID.
     */
    AuthzID : PSTR

}
