#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/console/char-info-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CHAR_INFO extends Win32Struct
{
    static sizeof => 6

    static packingSize => 3

    class _Char_e__Union extends Win32Struct {
        static sizeof => 3
        static packingSize => 2

        /**
         * @type {Integer}
         */
        UnicodeChar {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {CHAR}
         */
        AsciiChar {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    /**
     * @type {_Char_e__Union}
     */
    Char{
        get {
            if(!this.HasProp("__Char"))
                this.__Char := %this.__Class%._Char_e__Union(0, this)
            return this.__Char
        }
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
