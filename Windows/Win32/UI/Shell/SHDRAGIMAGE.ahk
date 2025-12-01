#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * Contains the information needed to create a drag image.
 * @remarks
 * In Windows Vista this structure is defined in Shobjidl.idl. Prior to that, it was defined in Shlobj.h.
 * 
 * Use the following procedure to create the drag image.
 * 
 * <ol>
 * <li>Create a bitmap of the size specified by <b>sizeDragImage</b> with a handle to a device context (HDC) that is compatible with the screen.</li>
 * <li>Draw the bitmap.</li>
 * <li>Select the bitmap out of the HDC it was created with.</li>
 * <li>Destroy the HDC.</li>
 * <li>Assign the bitmap handle to <b>hbmpDragImage</b>.</li>
 * </ol>
 * <div class="alert"><b>Note</b>  Turn off antialiasing when drawing text. Otherwise, artifacts could occur at the edges, between the text color and the color key.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-shdragimage
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHDRAGIMAGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure with the length and width of the drag image.
     * @type {SIZE}
     */
    sizeDragImage{
        get {
            if(!this.HasProp("__sizeDragImage"))
                this.__sizeDragImage := SIZE(0, this)
            return this.__sizeDragImage
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that specifies the location of the cursor within the drag image. The structure should contain the offset from the upper-left corner of the drag image to the location of the cursor.
     * @type {POINT}
     */
    ptOffset{
        get {
            if(!this.HasProp("__ptOffset"))
                this.__ptOffset := POINT(8, this)
            return this.__ptOffset
        }
    }

    /**
     * Type: <b>HBITMAP</b>
     * 
     * The drag image's bitmap handle.
     * @type {HBITMAP}
     */
    hbmpDragImage{
        get {
            if(!this.HasProp("__hbmpDragImage"))
                this.__hbmpDragImage := HBITMAP(16, this)
            return this.__hbmpDragImage
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * The color used by the control to fill the background of the drag image.
     * @type {COLORREF}
     */
    crColorKey {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
