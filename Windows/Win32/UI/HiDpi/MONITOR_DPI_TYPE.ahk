#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the dots per inch (dpi) setting for a monitor.
 * @remarks
 * 
 * All of these settings are affected by the <a href="https://docs.microsoft.com/windows/desktop/api/shellscalingapi/ne-shellscalingapi-process_dpi_awareness">PROCESS_DPI_AWARENESS</a> of your application
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shellscalingapi/ne-shellscalingapi-monitor_dpi_type
 * @namespace Windows.Win32.UI.HiDpi
 * @version v4.0.30319
 */
class MONITOR_DPI_TYPE extends Win32Enum{

    /**
     * The effective DPI. This value should be used when determining the correct scale factor for scaling UI elements. This incorporates the scale factor set by the user for this specific display.
     * @type {Integer (Int32)}
     */
    static MDT_EFFECTIVE_DPI => 0

    /**
     * The angular DPI. This DPI ensures rendering at a compliant angular resolution on the screen. This does not include the scale factor set by the user for this specific display.
     * @type {Integer (Int32)}
     */
    static MDT_ANGULAR_DPI => 1

    /**
     * The raw DPI. This value is the linear DPI of the screen as measured on the screen itself. Use this value when you want to read the pixel density and not the recommended scaling setting. This does not include the scale factor set by the user for this specific display and is not guaranteed to be a supported DPI value.
     * @type {Integer (Int32)}
     */
    static MDT_RAW_DPI => 2

    /**
     * The default DPI setting for a monitor is MDT_EFFECTIVE_DPI.
     * @type {Integer (Int32)}
     */
    static MDT_DEFAULT => 0
}
