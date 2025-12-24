#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class TRANSDATA extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    class _uCode_e__Union extends Win32Struct {
        static sizeof => 3
        static packingSize => 2

        /**
         * @type {Integer}
         */
        sCode {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ubCode {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        ubPairs{
            get {
                if(!this.HasProp("__ubPairsProxyArray"))
                    this.__ubPairsProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "char")
                return this.__ubPairsProxyArray
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    ubCodePageID {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ubType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {_uCode_e__Union}
     */
    uCode{
        get {
            if(!this.HasProp("__uCode"))
                this.__uCode := %this.__Class%._uCode_e__Union(2, this)
            return this.__uCode
        }
    }
}
