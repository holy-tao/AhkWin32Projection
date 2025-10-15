#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_POLICY_EX extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    PolicyName{
        get {
            if(!this.HasProp("__PolicyName"))
                this.__PolicyName := PWSTR(this.ptr + 0)
            return this.__PolicyName
        }
    }

    /**
     * @type {BOOL}
     */
    IsGlobalPolicy{
        get {
            if(!this.HasProp("__IsGlobalPolicy"))
                this.__IsGlobalPolicy := BOOL(this.ptr + 8)
            return this.__IsGlobalPolicy
        }
    }

    /**
     * @type {Integer}
     */
    Subnet {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ProcessingOrder {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<DHCP_POL_COND_ARRAY>}
     */
    Conditions {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<DHCP_POL_EXPR_ARRAY>}
     */
    Expressions {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<DHCP_IP_RANGE_ARRAY>}
     */
    Ranges {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {PWSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PWSTR(this.ptr + 48)
            return this.__Description
        }
    }

    /**
     * @type {BOOL}
     */
    Enabled{
        get {
            if(!this.HasProp("__Enabled"))
                this.__Enabled := BOOL(this.ptr + 56)
            return this.__Enabled
        }
    }

    /**
     * @type {Pointer<DHCP_PROPERTY_ARRAY>}
     */
    Properties {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
