#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_BINARY_DATA.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DATE_TIME.ahk
#Include .\DHCP_HOST_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLIENT_INFO_EX extends Win32Struct
{
    static sizeof => 112

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
                this.__ClientHardwareAddress := DHCP_BINARY_DATA(this.ptr + 8)
            return this.__ClientHardwareAddress
        }
    }

    /**
     * @type {PWSTR}
     */
    ClientName{
        get {
            if(!this.HasProp("__ClientName"))
                this.__ClientName := PWSTR(this.ptr + 24)
            return this.__ClientName
        }
    }

    /**
     * @type {PWSTR}
     */
    ClientComment{
        get {
            if(!this.HasProp("__ClientComment"))
                this.__ClientComment := PWSTR(this.ptr + 32)
            return this.__ClientComment
        }
    }

    /**
     * @type {DATE_TIME}
     */
    ClientLeaseExpires{
        get {
            if(!this.HasProp("__ClientLeaseExpires"))
                this.__ClientLeaseExpires := DATE_TIME(this.ptr + 40)
            return this.__ClientLeaseExpires
        }
    }

    /**
     * @type {DHCP_HOST_INFO}
     */
    OwnerHost{
        get {
            if(!this.HasProp("__OwnerHost"))
                this.__OwnerHost := DHCP_HOST_INFO(this.ptr + 48)
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
                this.__ProbationEnds := DATE_TIME(this.ptr + 80)
            return this.__ProbationEnds
        }
    }

    /**
     * @type {Integer}
     */
    QuarantineCapable {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    FilterStatus {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {PWSTR}
     */
    PolicyName{
        get {
            if(!this.HasProp("__PolicyName"))
                this.__PolicyName := PWSTR(this.ptr + 96)
            return this.__PolicyName
        }
    }

    /**
     * @type {Pointer<DHCP_PROPERTY_ARRAY>}
     */
    Properties {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
