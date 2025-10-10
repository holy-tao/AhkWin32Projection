#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the picture behaves inside the InkPicture control.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkpicturesizemode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkPictureSizeMode{

    /**
     * The control auto sizes to fit the picture.
     * @type {Integer (Int32)}
     */
    static IPSM_AutoSize => 0

    /**
     * The picture is centered within the control.
     * @type {Integer (Int32)}
     */
    static IPSM_CenterImage => 1

    /**
     * The picture appears at its regular size within the control.
     * @type {Integer (Int32)}
     */
    static IPSM_Normal => 2

    /**
     * The picture is stretched within the control.
     * @type {Integer (Int32)}
     */
    static IPSM_StretchImage => 3
}
