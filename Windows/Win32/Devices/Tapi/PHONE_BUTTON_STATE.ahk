#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PHONE_BUTTON_STATE enum describes the state of a phone button.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-phone_button_state
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_BUTTON_STATE extends Win32Enum{

    /**
     * State of the button is up.
     * @type {Integer (Int32)}
     */
    static PBS_UP => 1

    /**
     * State of the button is down.
     * @type {Integer (Int32)}
     */
    static PBS_DOWN => 2

    /**
     * State of the button is not known.
     * @type {Integer (Int32)}
     */
    static PBS_UNKNOWN => 4

    /**
     * State of the button is not available.
     * @type {Integer (Int32)}
     */
    static PBS_UNAVAIL => 8
}
