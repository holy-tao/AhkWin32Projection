#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class TRANSDATA extends Win32Struct {
    static sizeof => 4

    static packingSize => 2

    class _uCode extends Win32Struct {
        static sizeof => 2
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
         * @type {Array<Integer>}
         */
        ubPairs {
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
     * @type {_uCode}
     */
    uCode {
        get {
            if(!this.HasProp("__uCode"))
                this.__uCode := TRANSDATA._uCode(2, this)
            return this.__uCode
        }
    }
}
