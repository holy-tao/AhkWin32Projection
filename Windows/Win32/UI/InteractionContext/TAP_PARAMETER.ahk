#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.InteractionContext
 */
class TAP_PARAMETER extends Win32Enum {

    /**
     * Native name: TAP_PARAMETER_MIN_CONTACT_COUNT
     * @type {Integer (Int32)}
     */
    static MIN_CONTACT_COUNT => 0

    /**
     * Native name: TAP_PARAMETER_MAX_CONTACT_COUNT
     * @type {Integer (Int32)}
     */
    static MAX_CONTACT_COUNT => 1

    /**
     * Native name: TAP_PARAMETER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
