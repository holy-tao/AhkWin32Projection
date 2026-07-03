#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DHCP_SERVER_OPTIONS structure specifies requested DHCP Server options.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpssdk/ns-dhcpssdk-dhcp_server_options
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SERVER_OPTIONS {
    #StructPack 8

    /**
     * DHCP message type.
     */
    MessageType : IntPtr

    /**
     * Subnet mask.
     */
    SubnetMask : IntPtr

    /**
     * Requested IP address.
     */
    RequestedAddress : IntPtr

    /**
     * Requested duration of the IP address lease, in seconds.
     */
    RequestLeaseTime : IntPtr

    /**
     * Overlay fields to apply to the request.
     */
    OverlayFields : IntPtr

    /**
     * IP address of the default gateway.
     */
    RouterAddress : IntPtr

    /**
     * IP address of the DHCP Server.
     */
    Server : IntPtr

    /**
     * List of requested parameters.
     */
    ParameterRequestList : IntPtr

    /**
     * Length of <i>ParameterRequestList</i>, in bytes.
     */
    ParameterRequestListLength : UInt32

    /**
     * Machine name (host name) of the computer making the request.
     */
    MachineName : PSTR

    /**
     * Length of <i>MachineName</i>, in bytes.
     */
    MachineNameLength : UInt32

    /**
     * Type of hardware address expressed in <i>ClientHardwareAddress</i>.
     */
    ClientHardwareAddressType : Int8

    /**
     * Length of <i>ClientHardwareAddress</i>, in bytes.
     */
    ClientHardwareAddressLength : Int8

    /**
     * Client hardware address.
     */
    ClientHardwareAddress : IntPtr

    /**
     * Class identifier for the client.
     */
    ClassIdentifier : PSTR

    /**
     * Length of <i>ClassIdentifier</i>, in bytes.
     */
    ClassIdentifierLength : UInt32

    /**
     * Vendor class, if applicable.
     */
    VendorClass : IntPtr

    /**
     * Length of <i>VendorClass</i>, in bytes.
     */
    VendorClassLength : UInt32

    /**
     * Flags used for DNS.
     */
    DNSFlags : UInt32

    /**
     * Length of <i>DNSName</i>, in bytes.
     */
    DNSNameLength : UInt32

    /**
     * Pointer to the DNS name.
     */
    DNSName : IntPtr

    /**
     * Specifies whether the domain name is requested.
     */
    DSDomainNameRequested : BOOLEAN

    /**
     * Pointer to the domain name.
     */
    DSDomainName : PSTR

    /**
     * Length of <i>DSDomainName</i>, in characters.
     */
    DSDomainNameLen : UInt32

    /**
     * Scope identifier for the IP address.
     */
    ScopeId : IntPtr

}
