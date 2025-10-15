#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * Contains information about an icon or a cursor.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-iconinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class ICONINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies whether this structure defines an icon or a cursor. A value of <b>TRUE</b> specifies an icon; <b>FALSE</b> specifies a cursor.
     * @type {BOOL}
     */
    fIcon{
        get {
            if(!this.HasProp("__fIcon"))
                this.__fIcon := BOOL(this.ptr + 0)
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
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The y-coordinate of the cursor's hot spot. If this structure defines an icon, the hot spot is always in the center of the icon, and this member is ignored.
     * @type {Integer}
     */
    yHotspot {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
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
}
