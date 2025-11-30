#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags used by the [DwmGetWindowAttribute](/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetwindowattribute) and [DwmSetWindowAttribute](/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute) functions to specify window attributes for Desktop Window Manager (DWM) non-client rendering.
 * @remarks
 * 
 * > [!IMPORTANT]
 * > The value described below is available in pre-release versions of the [SDK Insider Preview](https://www.microsoft.com/software-download/windowsinsiderpreviewSDK).
 * 
 * `DWMWA_USE_HOSTBACKDROPBRUSH`
 * 
 * Use with [DwmSetWindowAttribute](/windows/win32/api/dwmapi/nf-dwmapi-dwmsetwindowattribute). Enables a non-UWP window to use host backdrop brushes. If this flag is set, then a Win32 app that calls [Windows::UI::Composition](/uwp/api/windows.ui.composition) APIs can build transparency effects using the host backdrop brush (see [Compositor.CreateHostBackdropBrush](/uwp/api/windows.ui.composition.compositor.createhostbackdropbrush)). The retrieved value is of type **BOOL**. **TRUE** to enable host backdrop brushes for the window; otherwise, **FALSE**.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ne-dwmapi-dwmwindowattribute
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWMWINDOWATTRIBUTE extends Win32Enum{

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetwindowattribute">DwmGetWindowAttribute</a>. Discovers whether non-client rendering is enabled. The retrieved value is of type <b>BOOL</b>. <b>TRUE</b> if non-client rendering is enabled; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static DWMWA_NCRENDERING_ENABLED => 1

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Sets the non-client rendering policy. The <i>pvAttribute</i> parameter points to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ne-dwmapi-dwmncrenderingpolicy">DWMNCRENDERINGPOLICY</a> enumeration.
     * @type {Integer (Int32)}
     */
    static DWMWA_NCRENDERING_POLICY => 2

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Enables or forcibly disables DWM transitions. The <i>pvAttribute</i> parameter points to a value of type <b>BOOL</b>. <b>TRUE</b> to disable transitions, or <b>FALSE</b> to enable transitions.
     * @type {Integer (Int32)}
     */
    static DWMWA_TRANSITIONS_FORCEDISABLED => 3

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Enables content rendered in the non-client area to be visible on the frame drawn by DWM. The <i>pvAttribute</i> parameter points to a value of type <b>BOOL</b>. <b>TRUE</b> to enable content rendered in the non-client area to be visible on the frame; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static DWMWA_ALLOW_NCPAINT => 4

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetwindowattribute">DwmGetWindowAttribute</a>. Retrieves the bounds of the caption button area in the window-relative space. The retrieved value is of type <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>. If the window is minimized or otherwise not visible to the user, then the value of the **RECT** retrieved is undefined. You should check whether the retrieved **RECT** contains a boundary that you can work with, and if it doesn't then you can conclude that the window is minimized or otherwise not visible.
     * @type {Integer (Int32)}
     */
    static DWMWA_CAPTION_BUTTON_BOUNDS => 5

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Specifies whether non-client content is right-to-left (RTL) mirrored. The <i>pvAttribute</i> parameter points to a value of type <b>BOOL</b>. <b>TRUE</b> if the non-client content is right-to-left (RTL) mirrored; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static DWMWA_NONCLIENT_RTL_LAYOUT => 6

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Forces the window to display an iconic thumbnail or peek representation (a static bitmap), even if a live or snapshot representation of the window is available. This value is normally set during a window's creation, and not changed throughout the window's lifetime. Some scenarios, however, might require the value to change over time. The <i>pvAttribute</i> parameter points to a value of type <b>BOOL</b>. <b>TRUE</b> to require a iconic thumbnail or peek representation; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static DWMWA_FORCE_ICONIC_REPRESENTATION => 7

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Sets how Flip3D treats the window. The <i>pvAttribute</i> parameter points to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ne-dwmapi-dwmflip3dwindowpolicy">DWMFLIP3DWINDOWPOLICY</a> enumeration.
     * @type {Integer (Int32)}
     */
    static DWMWA_FLIP3D_POLICY => 8

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmgetwindowattribute">DwmGetWindowAttribute</a>. Retrieves the extended frame bounds rectangle in screen space. The retrieved value is of type <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>.
     * @type {Integer (Int32)}
     */
    static DWMWA_EXTENDED_FRAME_BOUNDS => 9

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. The window will provide a bitmap for use by DWM as an iconic thumbnail or peek representation (a static bitmap) for the window. <b>DWMWA_HAS_ICONIC_BITMAP</b> can be specified with <b>DWMWA_FORCE_ICONIC_REPRESENTATION</b>. <b>DWMWA_HAS_ICONIC_BITMAP</b> normally is set during a window's creation and not changed throughout the window's lifetime. Some scenarios, however, might require the value to change over time. The <i>pvAttribute</i> parameter points to a value of type <b>BOOL</b>.  <b>TRUE</b> to inform DWM that the window will provide an iconic thumbnail or peek representation; otherwise, <b>FALSE</b>.
     * 
     * <b>Windows Vista and earlier: </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static DWMWA_HAS_ICONIC_BITMAP => 10

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Do not show peek preview for the window. The peek view shows a full-sized preview of the window when the mouse hovers over the window's thumbnail in the taskbar. If this attribute is set, hovering the mouse pointer over the window's thumbnail dismisses peek (in case another window in the group has a peek preview showing). The <i>pvAttribute</i> parameter points to a value of type <b>BOOL</b>. <b>TRUE</b> to prevent peek functionality, or <b>FALSE</b> to allow it.
     * 
     * <b>Windows Vista and earlier: </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static DWMWA_DISALLOW_PEEK => 11

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Prevents a window from fading to a glass sheet when peek is invoked. The <i>pvAttribute</i> parameter points to a value of type <b>BOOL</b>. <b>TRUE</b> to prevent the window from fading during another window's peek, or <b>FALSE</b> for normal behavior.
     * 
     * <b>Windows Vista and earlier: </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static DWMWA_EXCLUDED_FROM_PEEK => 12

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Cloaks the window such that it is not visible to the user. The window is still composed by DWM.
     * 
     * <b>Using with DirectComposition: </b>Use the DWMWA_CLOAK flag to cloak the layered child window when animating a representation of the window's content via a DirectComposition visual that has been associated with the layered child window. For more details on this usage case, see <a href="https://docs.microsoft.com/windows/desktop/directcomp/how-to--animate-the-bitmap-of-a-layered-child-window">How to animate the bitmap of a layered child window</a>.
     * 
     * <b>Windows 7 and earlier: </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static DWMWA_CLOAK => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWMWA_CLOAKED => 14

    /**
     * Use with <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a>. Freeze the window's thumbnail image with its current visuals. Do no further live updates on the thumbnail image to match the window's contents.
     * 
     * <b>Windows 7 and earlier: </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static DWMWA_FREEZE_REPRESENTATION => 15

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_PASSIVE_UPDATE_MODE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_USE_HOSTBACKDROPBRUSH => 17

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_USE_IMMERSIVE_DARK_MODE => 20

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_WINDOW_CORNER_PREFERENCE => 33

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_BORDER_COLOR => 34

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_CAPTION_COLOR => 35

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_TEXT_COLOR => 36

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_VISIBLE_FRAME_BORDER_THICKNESS => 37

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_SYSTEMBACKDROP_TYPE => 38

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_REDIRECTIONBITMAP_ALPHA => 39

    /**
     * @type {Integer (Int32)}
     */
    static DWMWA_BORDER_MARGINS => 40

    /**
     * The maximum recognized <b>DWMWINDOWATTRIBUTE</b> value, used for validation purposes.
     * @type {Integer (Int32)}
     */
    static DWMWA_LAST => 41
}
