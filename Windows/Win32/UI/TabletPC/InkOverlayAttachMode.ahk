#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies where to attach the new InkOverlay object, behind or in front of the active layer.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkoverlayattachmode
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkOverlayAttachMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
