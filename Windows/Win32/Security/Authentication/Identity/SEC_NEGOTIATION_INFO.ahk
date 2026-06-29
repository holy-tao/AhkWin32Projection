#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the security negotiation information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_negotiation_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_NEGOTIATION_INFO {
    #StructPack 8

    /**
     * The size of this structure.
     */
    Size : UInt32

    /**
     * The length of the name hint.
     */
    NameLength : UInt32

    /**
     * The name hint.
     */
    Name : IntPtr

    /**
     * Reserved.
     */
    Reserved : IntPtr

}
