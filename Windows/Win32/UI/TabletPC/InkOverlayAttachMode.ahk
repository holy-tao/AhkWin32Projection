#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies where to attach the new InkOverlay object, behind or in front of the active layer.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkoverlayattachmode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkOverlayAttachMode{

    /**
     * The new <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object is attached behind the active window.
     * 
     * This is the default value.
     * @type {Integer (Int32)}
     */
    static IOAM_Behind => 0

    /**
     * The new <a href="https://docs.microsoft.com/windows/desktop/tablet/inkoverlay-class">InkOverlay</a> object is attached in front of the active window.
     * @type {Integer (Int32)}
     */
    static IOAM_InFront => 1
}
