#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies watermark flags. Used by IVisualProperties::SetWatermark.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/ne-shobjidl-vpwatermarkflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class VPWATERMARKFLAGS{

    /**
     * Default Windows XP behavior.
     * @type {Integer (Int32)}
     */
    static VPWF_DEFAULT => 0

    /**
     * Alpha blend the respective bitmap; assumed 24-bit color + 8-bit alpha.
     * @type {Integer (Int32)}
     */
    static VPWF_ALPHABLEND => 1
}
