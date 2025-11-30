#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PO_FX_COMPONENT_PERF_SET extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := UNICODE_STRING(0, this)
            return this.__Name
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Unit {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
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
    Discrete{
        get {
            if(!this.HasProp("__Discrete"))
                this.__Discrete := %this.__Class%._Discrete(32, this)
            return this.__Discrete
        }
    }

    /**
     * @type {_Range}
     */
    Range{
        get {
            if(!this.HasProp("__Range"))
                this.__Range := %this.__Class%._Range(32, this)
            return this.__Range
        }
    }
}
