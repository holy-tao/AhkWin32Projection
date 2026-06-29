#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Returns the security attribute information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_subjectattributes
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_SubjectAttributes {
    #StructPack 8

    /**
     * Pointer to a <b>void</b> that receives the attribute information stored in a <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure.
     */
    AttributeInfo : IntPtr

}
