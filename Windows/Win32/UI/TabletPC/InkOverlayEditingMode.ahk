#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the behavior mode of the InkOverlay object and the InkPicture control.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkoverlayeditingmode
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkOverlayEditingMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The object or control is in collection mode.
     * @type {Integer (Int32)}
     */
    static IOEM_Ink => 0

    /**
     * The object or control is in deletion mode.
     * @type {Integer (Int32)}
     */
    static IOEM_Delete => 1

    /**
     * The object or control is in selection and editing mode.
     * @type {Integer (Int32)}
     */
    static IOEM_Select => 2
}
