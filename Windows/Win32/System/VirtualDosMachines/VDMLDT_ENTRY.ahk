#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class VDMLDT_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    LimitLow {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BaseLow {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    class _Bytes extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        BaseMid {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Flags1 {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        Flags2 {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        BaseHi {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
    }

    /**
     * @type {_Bytes}
     */
    Bytes{
        get {
            if(!this.HasProp("__Bytes"))
                this.__Bytes := %this.__Class%._Bytes(this.ptr + 4)
            return this.__Bytes
        }
    }

    /**
     * @type {Integer}
     */
    Bits {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
