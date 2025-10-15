#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * Contains information about an icon or a cursor. Extends ICONINFO. Used by GetIconInfoEx.
 * @remarks
 * 
  * > [!NOTE]
  * > The winuser.h header defines ICONINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-iconinfoexa
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset ANSI
 */
class ICONINFOEXA extends Win32Struct
{
    static sizeof => 560

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies whether this structure defines an icon or a cursor. A value of <b>TRUE</b> specifies an icon; <b>FALSE</b> specifies a cursor.
     * @type {BOOL}
     */
    fIcon{
        get {
            if(!this.HasProp("__fIcon"))
                this.__fIcon := BOOL(this.ptr + 4)
            return this.__fIcon
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The x-coordinate of a cursor's hot spot. If this structure defines an icon, the hot spot is always in the center of the icon, and this member is ignored.
     * @type {Integer}
     */
    xHotspot {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The y-coordinate of the cursor's hot spot. If this structure defines an icon, the hot spot is always in the center of the icon, and this member is ignored.
     * @type {Integer}
     */
    yHotspot {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>HBITMAP</b>
     * 
     * The icon bitmask bitmap. If this structure defines a black and white icon, this bitmask is formatted so that the upper half is the icon AND bitmask and the lower half is the icon XOR bitmask. Under this condition, the height should be an even multiple of two. If this structure defines a color icon, this mask only defines the AND bitmask of the icon.
     * @type {HBITMAP}
     */
    hbmMask{
        get {
            if(!this.HasProp("__hbmMask"))
                this.__hbmMask := HBITMAP(this.ptr + 16)
            return this.__hbmMask
        }
    }

    /**
     * Type: <b>HBITMAP</b>
     * 
     * A handle to the icon color bitmap. This member can be optional if this structure defines a black and white icon. The AND bitmask of <b>hbmMask</b> is applied with the <b>SRCAND</b> flag to the destination; subsequently, the color bitmap is applied (using XOR) to the destination by using the <b>SRCINVERT</b> flag.
     * @type {HBITMAP}
     */
    hbmColor{
        get {
            if(!this.HasProp("__hbmColor"))
                this.__hbmColor := HBITMAP(this.ptr + 24)
            return this.__hbmColor
        }
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The icon or cursor resource bits. These bits are typically loaded by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-lookupiconidfromdirectoryex">LookupIconIdFromDirectoryEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> functions.
     * @type {Integer}
     */
    wResID {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * The fully qualified path of the module.
     * @type {String}
     */
    szModName {
        get => StrGet(this.ptr + 34, 259, "UTF-8")
        set => StrPut(value, this.ptr + 34, 259, "UTF-8")
    }

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * The fully qualified path of the resource.
     * @type {String}
     */
    szResName {
        get => StrGet(this.ptr + 294, 259, "UTF-8")
        set => StrPut(value, this.ptr + 294, 259, "UTF-8")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 560
    }
}
