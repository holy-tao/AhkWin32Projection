#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that are used to indicate the scaling change that occurred.
 * @see https://docs.microsoft.com/windows/win32/api//shellscalingapi/ne-shellscalingapi-scale_change_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SCALE_CHANGE_FLAGS{

    /**
     * No change.
     * @type {Integer (Int32)}
     */
    static SCF_VALUE_NONE => 0

    /**
     * The scale factor has changed.
     * @type {Integer (Int32)}
     */
    static SCF_SCALE => 1

    /**
     * The physical dpi of the device has changed. A change in the physical dpi is generally caused either by switching display devices or switching display resolutions.
     * @type {Integer (Int32)}
     */
    static SCF_PHYSICAL => 2
}
