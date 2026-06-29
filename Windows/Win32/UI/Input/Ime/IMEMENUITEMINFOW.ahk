#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The IMEMENUITEMINFOW (Unicode) structure (immdev.h) contains information about IME menu items.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines IMEMENUITEMINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-imemenuiteminfow
 * @namespace Windows.Win32.UI.Input.Ime
 * @charset Unicode
 */
export default struct IMEMENUITEMINFOW {
    #StructPack 8

    /**
     * Size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    fType : UInt32

    fState : UInt32

    /**
     * Application-defined 16-bit value that identifies the menu item.
     */
    wID : UInt32

    /**
     * Handle to the bitmap to display next to the item if it is checked. If this member is <b>NULL</b>, a default bitmap is used. If the IMFT_RADIOCHECK type value is specified, the default bitmap is a bullet. Otherwise, it is a check mark.
     */
    hbmpChecked : HBITMAP

    /**
     * Handle to the bitmap to display next to the item if it is not checked. If this member is <b>NULL</b>, no bitmap is used.
     */
    hbmpUnchecked : HBITMAP

    /**
     * Application-defined value associated with the menu item.
     */
    dwItemData : UInt32

    /**
     * Content of the menu item. This is a null-terminated string.
     */
    szString : WCHAR[80]

    /**
     * Handle to a bitmap to display.
     */
    hbmpItem : HBITMAP

}
