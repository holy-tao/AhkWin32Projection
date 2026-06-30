#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains information about a property value to retrieve from the protocol.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_property_value
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTS_PROPERTY_VALUE extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        class _strVal extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Integer}
             */
            size {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {PWSTR}
             */
            pstrVal {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        }

        class _bVal extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Integer}
             */
            size {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {PSTR}
             */
            pbVal {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        }

        /**
         * @type {Integer}
         */
        ulVal {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {_strVal}
         */
        strVal {
            get {
                if(!this.HasProp("__strVal"))
                    this.__strVal := WTS_PROPERTY_VALUE._u._strVal(0, this)
                return this.__strVal
            }
        }

        /**
         * @type {_bVal}
         */
        bVal {
            get {
                if(!this.HasProp("__bVal"))
                    this.__bVal := WTS_PROPERTY_VALUE._u._bVal(0, this)
                return this.__bVal
            }
        }

        /**
         * @type {Guid}
         */
        guidVal {
            get {
                if(!this.HasProp("__guidVal"))
                    this.__guidVal := Guid(0, this)
                return this.__guidVal
            }
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A union that contains the property value.
     * @type {_u}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := WTS_PROPERTY_VALUE._u(8, this)
            return this.__u
        }
    }
}
