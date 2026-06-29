#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the way in which ink is erased from the InkOverlay object and the InkPicture control.This mode is used when the InkOverlayEditingMode is set to Delete.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkoverlayerasermode
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkOverlayEraserMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Ink is erased by stroke.
     * 
     * This is the default value.
     * @type {Integer (Int32)}
     */
    static IOERM_StrokeErase => 0

    /**
     * Ink is erased by point.
     * @type {Integer (Int32)}
     */
    static IOERM_PointErase => 1
}
