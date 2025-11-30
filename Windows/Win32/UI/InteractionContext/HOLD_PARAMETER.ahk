#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class HOLD_PARAMETER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_MIN_CONTACT_COUNT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_MAX_CONTACT_COUNT => 1

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_THRESHOLD_RADIUS => 2

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_THRESHOLD_START_DELAY => 3

    /**
     * @type {Integer (Int32)}
     */
    static HOLD_PARAMETER_MAX => -1
}
