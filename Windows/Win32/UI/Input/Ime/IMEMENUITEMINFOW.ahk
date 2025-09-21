#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The IMEMENUITEMINFOW (Unicode) structure (immdev.h) contains information about IME menu items.
 * @remarks
 * > [!NOTE]
  * > The immdev.h header defines IMEMENUITEMINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-imemenuiteminfow
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 * @charset Unicode
 */
class IMEMENUITEMINFOW extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

    /**
     * Size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    fType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    fState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Application-defined 16-bit value that identifies the menu item.
     * @type {Integer}
     */
    wID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Handle to the bitmap to display next to the item if it is checked. If this member is <b>NULL</b>, a default bitmap is used. If the IMFT_RADIOCHECK type value is specified, the default bitmap is a bullet. Otherwise, it is a check mark.
     * @type {Pointer<Void>}
     */
    hbmpChecked {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Handle to the bitmap to display next to the item if it is not checked. If this member is <b>NULL</b>, no bitmap is used.
     * @type {Pointer<Void>}
     */
    hbmpUnchecked {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Application-defined value associated with the menu item.
     * @type {Integer}
     */
    dwItemData {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Content of the menu item. This is a null-terminated string.
     * @type {String}
     */
    szString {
        get => StrGet(this.ptr + 36, 79, "UTF-16")
        set => StrPut(value, this.ptr + 36, 79, "UTF-16")
    }

    /**
     * Handle to a bitmap to display.
     * @type {Pointer<Void>}
     */
    hbmpItem {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 208
    }
}
