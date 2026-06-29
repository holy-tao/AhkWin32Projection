#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWORD_DWORD structure defines a 64-bit integer value.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dword_dword
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DWORD_DWORD {
    #StructPack 4

    /**
     * Specifies the upper 32 bits of the value.
     */
    DWord1 : UInt32

    /**
     * Specifies the lower 32 bits of the value.
     */
    DWord2 : UInt32

}
