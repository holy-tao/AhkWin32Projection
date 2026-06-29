#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SR_SECURITY_DESCRIPTOR structure contains information about the security privileges of the user.
 * @see https://learn.microsoft.com/windows/win32/api/subauth/ns-subauth-sr_security_descriptor
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SR_SECURITY_DESCRIPTOR {
    #StructPack 8

    /**
     * Indicates the size in bytes of the structure.
     */
    Length : UInt32

    /**
     * Indicates the user's security privileges.
     */
    SecurityDescriptor : IntPtr

}
