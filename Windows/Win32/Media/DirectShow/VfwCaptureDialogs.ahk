#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a dialog box that might exist in a Video for Windows capture driver.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vfwcapturedialogs
 * @namespace Windows.Win32.Media.DirectShow
 */
class VfwCaptureDialogs extends Win32Enum {

    /**
     * Video source dialog box.
     * Native name: VfwCaptureDialog_Source
     * @type {Integer (Int32)}
     */
    static Dialog_Source => 1

    /**
     * Video format dialog box.
     * Native name: VfwCaptureDialog_Format
     * @type {Integer (Int32)}
     */
    static Dialog_Format => 2

    /**
     * Video display dialog box.
     * Native name: VfwCaptureDialog_Display
     * @type {Integer (Int32)}
     */
    static Dialog_Display => 4
}
