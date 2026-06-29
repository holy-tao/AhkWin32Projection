#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains client window coordinates.
 * @remarks
 * This structure is used by the Remote Desktop Services service to redraw the client window.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_small_rect
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_SMALL_RECT {
    #StructPack 2

    /**
     * Specifies the upper left x-coordinate.
     */
    Left : Int16

    /**
     * Specifies the upper left y-coordinate.
     */
    Top : Int16

    /**
     * Specifies the lower right x-coordinate.
     */
    Right : Int16

    /**
     * Specifies the lower right y-coordinate.
     */
    Bottom : Int16

}
