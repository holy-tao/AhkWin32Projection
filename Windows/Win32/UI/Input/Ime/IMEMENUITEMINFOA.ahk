#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * Contains information about IME menu items.
 * @remarks
 * 
  * > [!NOTE]
  * > The imm.h header defines IMEMENUITEMINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imm/ns-imm-imemenuiteminfoa
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 * @charset ANSI
 */
class IMEMENUITEMINFOA extends Win32Struct
{
    static sizeof => 128

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
     * @type {HBITMAP}
     */
    hbmpChecked{
        get {
            if(!this.HasProp("__hbmpChecked"))
                this.__hbmpChecked := HBITMAP(16, this)
            return this.__hbmpChecked
        }
    }

    /**
     * Handle to the bitmap to display next to the item if it is not checked. If this member is <b>NULL</b>, no bitmap is used.
     * @type {HBITMAP}
     */
    hbmpUnchecked{
        get {
            if(!this.HasProp("__hbmpUnchecked"))
                this.__hbmpUnchecked := HBITMAP(24, this)
            return this.__hbmpUnchecked
        }
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
        get => StrGet(this.ptr + 36, 79, "UTF-8")
        set => StrPut(value, this.ptr + 36, 79, "UTF-8")
    }

    /**
     * Handle to a bitmap to display.
     * @type {HBITMAP}
     */
    hbmpItem{
        get {
            if(!this.HasProp("__hbmpItem"))
                this.__hbmpItem := HBITMAP(120, this)
            return this.__hbmpItem
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 128
    }
}
