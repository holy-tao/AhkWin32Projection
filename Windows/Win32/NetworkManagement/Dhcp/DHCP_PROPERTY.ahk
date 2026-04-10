#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_PROPERTY_ID.ahk
#Include .\DHCP_PROPERTY_TYPE.ahk
#Include .\DHCP_BINARY_DATA.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_PROPERTY extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    class _DHCP_PROPERTY_VALUE_UNION extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ByteValue {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        WordValue {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        DWordValue {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        StringValue {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {DHCP_BINARY_DATA}
         */
        BinaryValue {
            get {
                if(!this.HasProp("__BinaryValue"))
                    this.__BinaryValue := DHCP_BINARY_DATA(0, this)
                return this.__BinaryValue
            }
        }
    }

    /**
     * @type {DHCP_PROPERTY_ID}
     */
    ID {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DHCP_PROPERTY_TYPE}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {_DHCP_PROPERTY_VALUE_UNION}
     */
    Value {
        get {
            if(!this.HasProp("__Value"))
                this.__Value := DHCP_PROPERTY._DHCP_PROPERTY_VALUE_UNION(8, this)
            return this.__Value
        }
    }
}
