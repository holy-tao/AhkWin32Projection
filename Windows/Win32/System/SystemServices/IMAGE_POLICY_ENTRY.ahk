#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\IMAGE_POLICY_ID.ahk
#Include .\IMAGE_POLICY_ENTRY_TYPE.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_POLICY_ENTRY extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        None {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {BOOLEAN}
         */
        BoolValue {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Int8Value {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        UInt8Value {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Int16Value {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        UInt16Value {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Int32Value {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        UInt32Value {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Int64Value {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        UInt64Value {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {PSTR}
         */
        AnsiStringValue {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        UnicodeStringValue {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    /**
     * @type {IMAGE_POLICY_ENTRY_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {IMAGE_POLICY_ID}
     */
    PolicyId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {_u}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := IMAGE_POLICY_ENTRY._u(8, this)
            return this.__u
        }
    }
}
