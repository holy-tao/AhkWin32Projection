#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains title bar information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-titlebarinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class TITLEBARINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the structure. The caller must set this member to <c>sizeof(TITLEBARINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the title bar. These coordinates include all title-bar elements except the window menu.
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
     * An array that receives a 
     * 					value for each element of the title bar. The following are the title bar elements represented by the array. 
     * 					
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
                this.__rgstateProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__rgstateProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
