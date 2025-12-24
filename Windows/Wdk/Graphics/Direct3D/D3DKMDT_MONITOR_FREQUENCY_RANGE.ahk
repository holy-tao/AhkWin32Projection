#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_MONITOR_FREQUENCY_RANGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _Constraint_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<D3DKMDT_2DREGION>}
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
     * @type {Integer}
     */
    Origin {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<D3DKMDT_FREQUENCY_RANGE>}
     */
    RangeLimits {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ConstraintType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {_Constraint_e__Union}
     */
    Constraint{
        get {
            if(!this.HasProp("__Constraint"))
                this.__Constraint := %this.__Class%._Constraint_e__Union(24, this)
            return this.__Constraint
        }
    }
}
