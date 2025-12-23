#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a Unicode or ANSI character and its attributes. This structure is used by console functions to read from and write to a console screen buffer.
 * @see https://learn.microsoft.com/windows/console/char-info-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CHAR_INFO extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

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
     * A union of the following members.
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
     * The character attributes. This member can be zero or any combination of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **FOREGROUND_BLUE** `0x0001` | Text color contains blue. |
     * | **FOREGROUND_GREEN** `0x0002` | Text color contains green. |
     * | **FOREGROUND_RED** `0x0004` | Text color contains red. |
     * | **FOREGROUND_INTENSITY** `0x0008` | Text color is intensified. |
     * | **BACKGROUND_BLUE** `0x0010` | Background color contains blue. |
     * | **BACKGROUND_GREEN** `0x0020` | Background color contains green. |
     * | **BACKGROUND_RED** `0x0040` | Background color contains red. |
     * | **BACKGROUND_INTENSITY** `0x0080` | Background color is intensified. |
     * | **COMMON_LVB_LEADING_BYTE** `0x0100` | Leading byte. |
     * | **COMMON_LVB_TRAILING_BYTE** `0x0200` | Trailing byte. |
     * | **COMMON_LVB_GRID_HORIZONTAL** `0x0400` | Top horizontal. |
     * | **COMMON_LVB_GRID_LVERTICAL** `0x0800` | Left vertical. |
     * | **COMMON_LVB_GRID_RVERTICAL** `0x1000` | Right vertical. |
     * | **COMMON_LVB_REVERSE_VIDEO** `0x4000` | Reverse foreground and background attribute. |
     * | **COMMON_LVB_UNDERSCORE** `0x8000` | Underscore. |
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
