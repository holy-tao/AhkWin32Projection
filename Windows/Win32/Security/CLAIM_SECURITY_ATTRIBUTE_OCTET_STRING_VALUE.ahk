#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the OCTET_STRING value type of the claim security attribute.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attribute_octet_string_value
 * @namespace Windows.Win32.Security
 */
export default struct CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE {
    #StructPack 8

    /**
     * A pointer buffer that contains the <b>OCTET_STRING</b> value. The value is a series of bytes of the length indicated in the <b>ValueLength</b>  member.
     */
    pValue : IntPtr

    /**
     * The length, in bytes, of the <b>OCTET_STRING</b>  value.
     */
    ValueLength : UInt32

}
