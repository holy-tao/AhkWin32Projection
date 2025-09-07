#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the behavior mode of the InkOverlay object and the InkPicture control.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkoverlayeditingmode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkOverlayEditingMode{

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
