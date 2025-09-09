#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains data about a word in the Word data of the Microsoft IME dictionary.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-imewrd
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEWRD extends Win32Struct
{
    static sizeof => 44

    static packingSize => 1

    /**
     * The reading string.
     * @type {Pointer<Ptr>}
     */
    pwchReading {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The display string.
     * @type {Pointer<Ptr>}
     */
    pwchDisplay {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulPos {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    nPos1 {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    nPos2 {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Reserved.
     * @type {Array<UInt32>}
     */
    rgulAttrs{
        get {
            if(!this.HasProp("__rgulAttrsProxyArray"))
                this.__rgulAttrsProxyArray := Win32FixedArray(this.ptr + 20, 2, Primitive, "uint")
            return this.__rgulAttrsProxyArray
        }
    }

    /**
     * Size of the comment, in bytes, of <b>pvComment</b>.
     * @type {Integer}
     */
    cbComment {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type of comment. This must be one of the values of the <a href="https://docs.microsoft.com/windows/desktop/api/msime/ne-msime-imeuct">IMEUCT</a> enumeration.
     * @type {Integer}
     */
    uct {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Comment string.
     * @type {Pointer<Void>}
     */
    pvComment {
        get => NumGet(this, 36, "ptr")
        set => NumPut("ptr", value, this, 36)
    }
}
