#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WindowsAndMessaging\HICON.ahk

/**
 * Used by methods of the ITaskbarList3 interface to define buttons used in a toolbar embedded in a window's thumbnail representation.
 * @remarks
 * 
  * When a button is clicked, a <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> message that contains the button ID is sent to the associated application window. The application handles whatever action it has assigned to the button.
  * 
  * <h3><a id="Button_Images"></a><a id="button_images"></a><a id="BUTTON_IMAGES"></a>Button Images</h3>
  * When using an icon, specified through the <b>hIcon</b> member, the taskbar makes its own copy of the icon. It is the caller's responsibility to free the handle it passed in <b>hIcon</b> when it is no longer needed.
  * 
  * 
  * 
  * If both an icon and an image list are specified for a button's image, the icon is used if possible. If for some reason the attempt to retrieve the icon fails, the image from the image list is used.
  * 
  * Applications must provide these button images:
  *             
  * <ul>
  * <li>The button in its default active state.</li>
  * <li>Images suitable for use with high-dpi (dots per inch) displays.</li>
  * </ul>
  * 
  * 
  * Images must be 32-bit and of dimensions <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a>(SM_CXICON) x <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a>(SM_CYICON). The toolbar itself provides visuals for a button's clicked, disabled, and hover states.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-thumbbutton
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class THUMBBUTTON extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-thumbbuttonmask">THUMBBUTTONMASK</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-thumbbuttonmask">THUMBBUTTONMASK</a> values that specify which members of this structure contain valid data; other members are ignored, with the exception of <b>iId</b>, which is always required.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The application-defined identifier of the button, unique within the toolbar.
     * @type {Integer}
     */
    iId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The zero-based index of the button image within the image list set through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbarsetimagelist">ITaskbarList3::ThumbBarSetImageList</a>.
     * @type {Integer}
     */
    iBitmap {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>HICON</b>
     * 
     * The handle of an icon to use as the button image.
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(16, this)
            return this.__hIcon
        }
    }

    /**
     * Type: <b>WCHAR[260]</b>
     * 
     * A wide character array that contains the text of the button's tooltip, displayed when the mouse pointer hovers over the button.
     * @type {String}
     */
    szTip {
        get => StrGet(this.ptr + 24, 259, "UTF-16")
        set => StrPut(value, this.ptr + 24, 259, "UTF-16")
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-thumbbuttonflags">THUMBBUTTONFLAGS</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-thumbbuttonflags">THUMBBUTTONFLAGS</a> values that control specific states and behaviors of the button.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 544, "int")
        set => NumPut("int", value, this, 544)
    }
}
