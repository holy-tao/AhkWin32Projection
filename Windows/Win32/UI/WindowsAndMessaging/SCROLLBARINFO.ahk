#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The SCROLLBARINFO structure contains scroll bar information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-scrollbarinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class SCROLLBARINFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the size, in bytes, of the structure. Before calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getscrollbarinfo">GetScrollBarInfo</a> function, set <b>cbSize</b> to <b>sizeof</b>(<b>SCROLLBARINFO</b>).
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * Coordinates of the scroll bar as specified in a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure.
     * @type {RECT}
     */
    rcScrollBar{
        get {
            if(!this.HasProp("__rcScrollBar"))
                this.__rcScrollBar := RECT(this.ptr + 8)
            return this.__rcScrollBar
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Height or width of the thumb.
     * @type {Integer}
     */
    dxyLineButton {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Position of the top or left of the thumb.
     * @type {Integer}
     */
    xyThumbTop {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b>int</b>
     * 
     * Position of the bottom or right of the thumb.
     * @type {Integer}
     */
    xyThumbBottom {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>[CCHILDREN_SCROLLBAR+1]</b>
     * 
     * An array of <b>DWORD</b> elements. Each element indicates the state of a scroll bar component. The following values show the scroll bar component that corresponds to each array index.
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Index</th>
     * <th>Scroll bar component</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>The scroll bar itself.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>The top or right arrow button.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>The page up or page right region.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>The scroll box (thumb).</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>The page down or page left region.</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>The bottom or left arrow button.</td>
     * </tr>
     * </table>
     *  
     * 
     * The <b>DWORD</b> element for each scroll bar component can include a combination of the following bit flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATE_SYSTEM_INVISIBLE"></a><a id="state_system_invisible"></a><dl>
     * <dt><b>STATE_SYSTEM_INVISIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For the scroll bar itself, indicates the specified vertical or horizontal scroll bar does not exist. For the page up or page down regions, indicates the thumb is positioned such that the region does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATE_SYSTEM_OFFSCREEN"></a><a id="state_system_offscreen"></a><dl>
     * <dt><b>STATE_SYSTEM_OFFSCREEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For the scroll bar itself, indicates the window is sized such that the specified vertical or horizontal scroll bar is not currently displayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATE_SYSTEM_PRESSED"></a><a id="state_system_pressed"></a><dl>
     * <dt><b>STATE_SYSTEM_PRESSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arrow button or page region is pressed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATE_SYSTEM_UNAVAILABLE"></a><a id="state_system_unavailable"></a><dl>
     * <dt><b>STATE_SYSTEM_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component is disabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Array<UInt32>}
     */
    rgstate{
        get {
            if(!this.HasProp("__rgstateProxyArray"))
                this.__rgstateProxyArray := Win32FixedArray(this.ptr + 40, 4, Primitive, "uint")
            return this.__rgstateProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 64
    }
}
