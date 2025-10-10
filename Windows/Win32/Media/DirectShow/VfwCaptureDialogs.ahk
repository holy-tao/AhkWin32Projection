#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a dialog box that might exist in a Video for Windows capture driver.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-vfwcapturedialogs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VfwCaptureDialogs{

    /**
     * Video source dialog box.
     * @type {Integer (Int32)}
     */
    static VfwCaptureDialog_Source => 1

    /**
     * Video format dialog box.
     * @type {Integer (Int32)}
     */
    static VfwCaptureDialog_Format => 2

    /**
     * Video display dialog box.
     * @type {Integer (Int32)}
     */
    static VfwCaptureDialog_Display => 4
}
