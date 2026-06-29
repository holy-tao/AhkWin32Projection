#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DHCP_POL_COND_ARRAY.ahk
#Include .\DHCP_POL_EXPR_ARRAY.ahk
#Include .\DHCP_PROPERTY_ARRAY.ahk
#Include .\DHCP_IP_RANGE_ARRAY.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_POLICY_EX extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    PolicyName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    IsGlobalPolicy {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
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
    Description {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {BOOL}
     */
    Enabled {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Pointer<DHCP_PROPERTY_ARRAY>}
     */
    Properties {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
