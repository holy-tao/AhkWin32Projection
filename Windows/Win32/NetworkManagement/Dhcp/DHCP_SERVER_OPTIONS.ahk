#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_SERVER_OPTIONS structure specifies requested DHCP Server options.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpssdk/ns-dhcpssdk-dhcp_server_options
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SERVER_OPTIONS extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * DHCP message type.
     * @type {Pointer<Integer>}
     */
    MessageType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Subnet mask.
     * @type {Pointer<Integer>}
     */
    SubnetMask {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Requested IP address.
     * @type {Pointer<Integer>}
     */
    RequestedAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Requested duration of the IP address lease, in seconds.
     * @type {Pointer<Integer>}
     */
    RequestLeaseTime {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Overlay fields to apply to the request.
     * @type {Pointer<Integer>}
     */
    OverlayFields {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * IP address of the default gateway.
     * @type {Pointer<Integer>}
     */
    RouterAddress {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * IP address of the DHCP Server.
     * @type {Pointer<Integer>}
     */
    Server {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * List of requested parameters.
     * @type {Pointer<Integer>}
     */
    ParameterRequestList {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Length of <i>ParameterRequestList</i>, in bytes.
     * @type {Integer}
     */
    ParameterRequestListLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Machine name (host name) of the computer making the request.
     * @type {PSTR}
     */
    MachineName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Length of <i>MachineName</i>, in bytes.
     * @type {Integer}
     */
    MachineNameLength {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type of hardware address expressed in <i>ClientHardwareAddress</i>.
     * @type {Integer}
     */
    ClientHardwareAddressType {
        get => NumGet(this, 84, "char")
        set => NumPut("char", value, this, 84)
    }

    /**
     * Length of <i>ClientHardwareAddress</i>, in bytes.
     * @type {Integer}
     */
    ClientHardwareAddressLength {
        get => NumGet(this, 85, "char")
        set => NumPut("char", value, this, 85)
    }

    /**
     * Client hardware address.
     * @type {Pointer<Integer>}
     */
    ClientHardwareAddress {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Class identifier for the client.
     * @type {PSTR}
     */
    ClassIdentifier {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Length of <i>ClassIdentifier</i>, in bytes.
     * @type {Integer}
     */
    ClassIdentifierLength {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Vendor class, if applicable.
     * @type {Pointer<Integer>}
     */
    VendorClass {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Length of <i>VendorClass</i>, in bytes.
     * @type {Integer}
     */
    VendorClassLength {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Flags used for DNS.
     * @type {Integer}
     */
    DNSFlags {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Length of <i>DNSName</i>, in bytes.
     * @type {Integer}
     */
    DNSNameLength {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Pointer to the DNS name.
     * @type {Pointer<Integer>}
     */
    DNSName {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Specifies whether the domain name is requested.
     * @type {BOOLEAN}
     */
    DSDomainNameRequested {
        get => NumGet(this, 144, "char")
        set => NumPut("char", value, this, 144)
    }

    /**
     * Pointer to the domain name.
     * @type {PSTR}
     */
    DSDomainName {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Length of <i>DSDomainName</i>, in characters.
     * @type {Integer}
     */
    DSDomainNameLen {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Scope identifier for the IP address.
     * @type {Pointer<Integer>}
     */
    ScopeId {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }
}
