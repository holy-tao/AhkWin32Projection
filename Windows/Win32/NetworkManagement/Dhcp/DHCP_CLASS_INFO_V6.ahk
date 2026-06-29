#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the information for a particular DHCPv6 user class or vendor class.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_class_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLASS_INFO_V6 {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the class name.
     */
    ClassName : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the comment for the class.
     */
    ClassComment : PWSTR

    /**
     * The length of data as pointed to by <b>ClassData</b>.
     */
    ClassDataLength : UInt32

    /**
     * If <b>TRUE</b>, this information applies to a vendor class; if <b>FALSE</b>, it applies to a user class.
     */
    IsVendor : BOOL

    /**
     * The vendor class identifier. It is default (0x00000000) for user class.
     */
    EnterpriseNumber : UInt32

    /**
     * This field MUST be set to zero (0x00000000) when sending and ignored on receipt.
     */
    Flags : UInt32

    /**
     * Pointer to a BYTE blob that contains an array of bytes of length specified by <b>ClassDataLength</b>. This contains opaque data regarding a user class or a vendor class.
     */
    ClassData : IntPtr

}
