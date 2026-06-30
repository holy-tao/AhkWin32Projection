#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_COUNTER_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_COUNTER extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _Value extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        class _ManufactureDate extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Week {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Year {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        }

        /**
         * @type {_ManufactureDate}
         */
        ManufactureDate {
            get {
                if(!this.HasProp("__ManufactureDate"))
                    this.__ManufactureDate := STORAGE_COUNTER._Value._ManufactureDate(0, this)
                return this.__ManufactureDate
            }
        }

        /**
         * @type {Integer}
         */
        AsUlonglong {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {STORAGE_COUNTER_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_Value}
     */
    Value {
        get {
            if(!this.HasProp("__Value"))
                this.__Value := STORAGE_COUNTER._Value(8, this)
            return this.__Value
        }
    }
}
