#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_LINENUMBER extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    class _Type_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 2

        /**
         * @type {Integer}
         */
        SymbolTableIndex {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        VirtualAddress {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {_Type_e__Union}
     */
    Type{
        get {
            if(!this.HasProp("__Type"))
                this.__Type := %this.__Class%._Type_e__Union(0, this)
            return this.__Type
        }
    }

    /**
     * @type {Integer}
     */
    Linenumber {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
