#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the hardware capabilities of the Tablet PC.
 * @remarks
 * In C++, explicit casting is required when trying to set more than one flag at a time. A compilation error occurs if explicit casting is not used.
  * 
  * The value is 0 if the tablet device cannot provide this information.
  * 
  * This enumeration is a flag.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-tablethardwarecapabilities
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class TabletHardwareCapabilities{

    /**
     * The digitizer is integrated with the display.
     * @type {Integer (Int32)}
     */
    static THWC_Integrated => 1

    /**
     * The cursor must be in physical contact with the device to report position.
     * @type {Integer (Int32)}
     */
    static THWC_CursorMustTouch => 2

    /**
     * The device can generate in-air packets when the cursor is in the physical detection range (proximity) of the device.
     * @type {Integer (Int32)}
     */
    static THWC_HardProximity => 4

    /**
     * The device can uniquely identify the active cursor.
     * @type {Integer (Int32)}
     */
    static THWC_CursorsHavePhysicalIds => 8
}
