#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * Contains information about an icon or a cursor. Extends ICONINFO. Used by GetIconInfoEx. (Unicode)
 * @remarks
 * For monochrome icons, the <b>hbmMask</b> is twice the height of the icon (with the AND mask on top and the XOR mask on the bottom), and <b>hbmColor</b> is <b>NULL</b>. Also, in this case the height should be an even multiple of two.
 * 
 * For color icons, the <b>hbmMask</b> and <b>hbmColor</b> bitmaps are the same size, each of which is the size of the icon.
 * 
 * You can use a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getobject">GetObject</a> function to get contents of <b>hbmMask</b> and <b>hbmColor</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a> structure. The bitmap bits can be obtained with call to <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getdibits">GetDIBits</a> on the bitmaps in this structure.
 * 
 * > [!NOTE]
 * > The winuser.h header defines ICONINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-iconinfoexw
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset Unicode
 */
class ICONINFOEXW extends Win32Struct
{
    static sizeof => 1080

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
    fIcon {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
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
     * A handle to the icon monochrome mask <a href="https://docs.microsoft.com/windows/win32/gdi/bitmaps">bitmap</a>.
     * @type {HBITMAP}
     */
    hbmMask{
        get {
            if(!this.HasProp("__hbmMask"))
                this.__hbmMask := HBITMAP(16, this)
            return this.__hbmMask
        }
    }

    /**
     * Type: <b>HBITMAP</b>
     * 
     * A handle to the icon color <a href="https://docs.microsoft.com/windows/win32/gdi/bitmaps">bitmap</a>.
     * @type {HBITMAP}
     */
    hbmColor{
        get {
            if(!this.HasProp("__hbmColor"))
                this.__hbmColor := HBITMAP(24, this)
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
        get => StrGet(this.ptr + 34, 259, "UTF-16")
        set => StrPut(value, this.ptr + 34, 259, "UTF-16")
    }

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * The fully qualified path of the resource.
     * @type {String}
     */
    szResName {
        get => StrGet(this.ptr + 554, 259, "UTF-16")
        set => StrPut(value, this.ptr + 554, 259, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 1080
    }
}
