#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURITY_PACKAGE_OPTIONS_TYPE.ahk" { SECURITY_PACKAGE_OPTIONS_TYPE }

/**
 * Specifies information about a security package.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-security_package_options
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECURITY_PACKAGE_OPTIONS {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    Size : UInt32

    Type : SECURITY_PACKAGE_OPTIONS_TYPE

    /**
     * This member is reserved. Do not use it.
     */
    Flags : UInt32

    /**
     * The size, in bytes, of a digital signature for this security package.
     */
    SignatureSize : UInt32

    /**
     * A digital signature for this security package.
     */
    Signature : IntPtr

}
