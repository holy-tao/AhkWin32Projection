#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies an octet string value for a security attribute.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_security_attribute_octet_string_value
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE {
    #StructPack 8

    /**
     * A pointer to the value.
     */
    pValue : IntPtr

    /**
     * The length, in bytes, of the <b>pValue</b> member.
     */
    ValueLength : UInt32

}
