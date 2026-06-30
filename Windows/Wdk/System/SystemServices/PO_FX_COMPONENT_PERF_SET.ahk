#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PO_FX_PERF_STATE_UNIT.ahk
#Include .\PO_FX_PERF_STATE.ahk
#Include .\PO_FX_PERF_STATE_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PO_FX_COMPONENT_PERF_SET extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PO_FX_PERF_STATE_UNIT}
     */
    Unit {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {PO_FX_PERF_STATE_TYPE}
     */
    Type {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    class _Discrete extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Count {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Pointer<PO_FX_PERF_STATE>}
         */
        States {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    class _Range extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Minimum {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Maximum {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    }

    /**
     * @type {_Discrete}
     */
    Discrete {
        get {
            if(!this.HasProp("__Discrete"))
                this.__Discrete := PO_FX_COMPONENT_PERF_SET._Discrete(24, this)
            return this.__Discrete
        }
    }

    /**
     * @type {_Range}
     */
    Range {
        get {
            if(!this.HasProp("__Range"))
                this.__Range := PO_FX_COMPONENT_PERF_SET._Range(24, this)
            return this.__Range
        }
    }
}
