#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import ".\THUMBBUTTONMASK.ahk" { THUMBBUTTONMASK }
#Import ".\THUMBBUTTONFLAGS.ahk" { THUMBBUTTONFLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used by methods of the ITaskbarList3 interface to define buttons used in a toolbar embedded in a window's thumbnail representation.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-thumbbutton
 * @namespace Windows.Win32.UI.Shell
 */
export default struct THUMBBUTTON {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-thumbbuttonmask">THUMBBUTTONMASK</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-thumbbuttonmask">THUMBBUTTONMASK</a> values that specify which members of this structure contain valid data; other members are ignored, with the exception of <b>iId</b>, which is always required.
     */
    dwMask : THUMBBUTTONMASK

    /**
     * Type: <b>UINT</b>
     * 
     * The application-defined identifier of the button, unique within the toolbar.
     */
    iId : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The zero-based index of the button image within the image list set through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbarsetimagelist">ITaskbarList3::ThumbBarSetImageList</a>.
     */
    iBitmap : UInt32

    /**
     * Type: <b>HICON</b>
     * 
     * The handle of an icon to use as the button image.
     */
    hIcon : HICON

    /**
     * Type: <b>WCHAR[260]</b>
     * 
     * A wide character array that contains the text of the button's tooltip, displayed when the mouse pointer hovers over the button.
     */
    szTip : WCHAR[260]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-thumbbuttonflags">THUMBBUTTONFLAGS</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-thumbbuttonflags">THUMBBUTTONFLAGS</a> values that control specific states and behaviors of the button.
     */
    dwFlags : THUMBBUTTONFLAGS

}
