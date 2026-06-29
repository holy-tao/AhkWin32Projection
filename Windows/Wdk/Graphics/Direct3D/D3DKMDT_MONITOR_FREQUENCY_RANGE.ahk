#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_MONITOR_CAPABILITIES_ORIGIN.ahk
#Include .\D3DKMDT_MONITOR_FREQUENCY_RANGE_CONSTRAINT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_FREQUENCY_RANGE extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    class _Constraint extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        ActiveSize {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        MaxPixelRate {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    /**
     * @type {D3DKMDT_MONITOR_CAPABILITIES_ORIGIN}
     */
    Origin {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    RangeLimits {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {D3DKMDT_MONITOR_FREQUENCY_RANGE_CONSTRAINT}
     */
    ConstraintType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {_Constraint}
     */
    Constraint {
        get {
            if(!this.HasProp("__Constraint"))
                this.__Constraint := D3DKMDT_MONITOR_FREQUENCY_RANGE._Constraint(24, this)
            return this.__Constraint
        }
    }
}
