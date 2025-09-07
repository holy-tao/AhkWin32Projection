#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DHCP_BINARY_DATA.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_PROPERTY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ID {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ByteValue {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    WordValue {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DWordValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    StringValue{
        get {
            if(!this.HasProp("__StringValue"))
                this.__StringValue := PWSTR(this.ptr + 8)
            return this.__StringValue
        }
    }

    /**
     * @type {DHCP_BINARY_DATA}
     */
    BinaryValue{
        get {
            if(!this.HasProp("__BinaryValue"))
                this.__BinaryValue := DHCP_BINARY_DATA(this.ptr + 8)
            return this.__BinaryValue
        }
    }
}
