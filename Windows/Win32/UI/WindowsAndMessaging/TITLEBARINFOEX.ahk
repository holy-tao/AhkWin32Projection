#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Expands on the information described in the TITLEBARINFO structure by including the coordinates of each element of the title bar.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-titlebarinfoex
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class TITLEBARINFOEX extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. Set this member to <c>sizeof(TITLEBARINFOEX)</c> before sending with the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-gettitlebarinfoex">WM_GETTITLEBARINFOEX</a> message.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The bounding rectangle of the title bar. The rectangle is expressed in screen coordinates and includes all titlebar elements except the window menu.
     * @type {RECT}
     */
    rcTitleBar{
        get {
            if(!this.HasProp("__rcTitleBar"))
                this.__rcTitleBar := RECT(this.ptr + 8)
            return this.__rcTitleBar
        }
    }

    /**
     * Type: <b>DWORD[CCHILDREN_TITLEBAR+1]</b>
     * 
     * An array that receives a <b>DWORD</b> value for each element of the title bar. The following are the title bar elements represented by the array.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Index</th>
     * <th>Title Bar Element</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>The title bar itself.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Reserved.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Minimize button.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Maximize button.</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>Help button.</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>Close button.</td>
     * </tr>
     * </table>
     * @type {Array<UInt32>}
     */
    rgstate{
        get {
            if(!this.HasProp("__rgstateProxyArray"))
                this.__rgstateProxyArray := Win32FixedArray(this.ptr + 24, 6, Primitive, "uint")
            return this.__rgstateProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>[CCHILDREN_TITLEBAR+1]</b>
     * 
     * An array that receives a structure for each element of the title bar. The structures are expressed in screen coordinates. The following are the title bar elements represented by the array.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Index</th>
     * <th>Title Bar Element</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Reserved.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Reserved.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Minimize button.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Maximize button.</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>Help button.</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>Close button.</td>
     * </tr>
     * </table>
     * @type {Array<RECT>}
     */
    rgrect{
        get {
            if(!this.HasProp("__rgrectProxyArray"))
                this.__rgrectProxyArray := Win32FixedArray(this.ptr + 48, 6, RECT, "")
            return this.__rgrectProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 96
    }
}
