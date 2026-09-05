#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.InteractionContext
 */
class HOLD_PARAMETER extends Win32Enum {

    /**
     * Native name: HOLD_PARAMETER_MIN_CONTACT_COUNT
     * @type {Integer (Int32)}
     */
    static MIN_CONTACT_COUNT => 0

    /**
     * Native name: HOLD_PARAMETER_MAX_CONTACT_COUNT
     * @type {Integer (Int32)}
     */
    static MAX_CONTACT_COUNT => 1

    /**
     * Native name: HOLD_PARAMETER_THRESHOLD_RADIUS
     * @type {Integer (Int32)}
     */
    static THRESHOLD_RADIUS => 2

    /**
     * Native name: HOLD_PARAMETER_THRESHOLD_START_DELAY
     * @type {Integer (Int32)}
     */
    static THRESHOLD_START_DELAY => 3

    /**
     * Native name: HOLD_PARAMETER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
