#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PHONE_BUTTON_MODE enum describes the mode of a phone button.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_button_mode
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_BUTTON_MODE extends Win32Enum{

    /**
     * Dummy button.
     * @type {Integer (Int32)}
     */
    static PBM_DUMMY => 0

    /**
     * Call button.
     * @type {Integer (Int32)}
     */
    static PBM_CALL => 1

    /**
     * Feature button.
     * @type {Integer (Int32)}
     */
    static PBM_FEATURE => 2

    /**
     * Keypad button.
     * @type {Integer (Int32)}
     */
    static PBM_KEYPAD => 3

    /**
     * Local function button, such as mute or volume control.
     * @type {Integer (Int32)}
     */
    static PBM_LOCAL => 4

    /**
     * Display button.
     * @type {Integer (Int32)}
     */
    static PBM_DISPLAY => 5
}
