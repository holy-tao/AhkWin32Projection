#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Specifies the fully qualified binary name.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attribute_fqbn_value
 * @namespace Windows.Win32.Security
 */
export default struct CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE {
    #StructPack 8

    /**
     * The version of the fully qualified binary name value.
     */
    Version : Int64

    /**
     * A fully qualified binary name.
     */
    Name : PWSTR

}
