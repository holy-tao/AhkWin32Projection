#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        class _Range extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Begin {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            End {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        }

        /**
         * @type {Integer}
         */
        CounterIndex {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {_Range}
         */
        Range {
            get {
                if(!this.HasProp("__Range"))
                    this.__Range := PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR._u_e__Union._Range(0, this)
                return this.__Range
            }
        }

        /**
         * @type {Pointer<PPHYSICAL_COUNTER_OVERFLOW_HANDLER>}
         */
        OverflowHandler {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        EventBufferConfiguration {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        IdentificationTag {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_u_e__Union}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := PHYSICAL_COUNTER_RESOURCE_DESCRIPTOR._u_e__Union(8, this)
            return this.__u
        }
    }
}
