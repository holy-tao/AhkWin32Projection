#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Specifies a fully qualified binary name value associated with a security attribute.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_security_attribute_fqbn_value
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE {
    #StructPack 8

    /**
     * The version number of the structure.
     */
    Version : Int64

    /**
     * A pointer to strings that specify the names of the publisher, the product, and the original binary file of the value.
     */
    pName : PWSTR

}
