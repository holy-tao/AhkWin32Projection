#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to specify the permissions associated with a particular record in the URL namespace reservation store.
 * @remarks
 * The security descriptor string pointed to by the <b>pStringSecurityDescriptor</b> member has the following elements:
 * 
 * 
 * 
 * An example of a security descriptor string is:
 * 
 * 
 * ``` syntax
 * D:(A;;GX;;;S-1-0-0)(A;;GA;;;S-1-5-11)
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_urlacl_param
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_URLACL_PARAM {
    #StructPack 8

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor Definition Language (SDDL) string</a> that contains the permissions associated with this URL namespace reservation record.
     */
    pStringSecurityDescriptor : PWSTR

}
