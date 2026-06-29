#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DHCPDS_SERVER structure defines information on a DHCP server in the context of directory services.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpds_server
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPDS_SERVER {
    #StructPack 8

    /**
     * Reserved. This value should be set to 0.
     */
    Version : UInt32

    /**
     * Unicode string that contains the unique name of the DHCP server.
     */
    ServerName : PWSTR

    /**
     * Specifies the IP address of the DHCP server as an unsigned 32-bit integer.
     */
    ServerAddress : UInt32

    /**
     * Specifies a set of bit flags that describe active directory settings for the DHCP server.
     */
    Flags : UInt32

    /**
     * Reserved. This value should be set to 0.
     */
    State : UInt32

    /**
     * Unicode string that contains the active directory path to the DHCP server.
     */
    DsLocation : PWSTR

    /**
     * Reserved. This value should be set to 0.
     */
    DsLocType : UInt32

}
