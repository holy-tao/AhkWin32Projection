#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_BINARY_DATA.ahk
#Include .\DATE_TIME.ahk
#Include .\DHCP_HOST_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV4_FAILOVER_CLIENT_INFO_EX extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ClientIpAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SubnetMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {DHCP_BINARY_DATA}
     */
    ClientHardwareAddress{
        get {
            if(!this.HasProp("__ClientHardwareAddress"))
                this.__ClientHardwareAddress := DHCP_BINARY_DATA(8, this)
            return this.__ClientHardwareAddress
        }
    }

    /**
     * @type {PWSTR}
     */
    ClientName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    ClientComment {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {DATE_TIME}
     */
    ClientLeaseExpires{
        get {
            if(!this.HasProp("__ClientLeaseExpires"))
                this.__ClientLeaseExpires := DATE_TIME(40, this)
            return this.__ClientLeaseExpires
        }
    }

    /**
     * @type {DHCP_HOST_INFO}
     */
    OwnerHost{
        get {
            if(!this.HasProp("__OwnerHost"))
                this.__OwnerHost := DHCP_HOST_INFO(48, this)
            return this.__OwnerHost
        }
    }

    /**
     * @type {Integer}
     */
    bClientType {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    AddressState {
        get => NumGet(this, 73, "char")
        set => NumPut("char", value, this, 73)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {DATE_TIME}
     */
    ProbationEnds{
        get {
            if(!this.HasProp("__ProbationEnds"))
                this.__ProbationEnds := DATE_TIME(80, this)
            return this.__ProbationEnds
        }
    }

    /**
     * @type {BOOL}
     */
    QuarantineCapable {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    SentPotExpTime {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    AckPotExpTime {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    RecvPotExpTime {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    CltLastTransTime {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    LastBndUpdTime {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    BndMsgStatus {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {PWSTR}
     */
    PolicyName {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 128, "char")
        set => NumPut("char", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    AddressStateEx {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }
}
