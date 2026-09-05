#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_PIN_MODE enumerated type indicates if the PIN type is enabled.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_pin_mode
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_PIN_MODE extends Win32Enum {

    /**
     * The PIN type is currently enabled.
     * Native name: MBN_PIN_MODE_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 1

    /**
     * The PIN type is currently disabled.
     * Native name: MBN_PIN_MODE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 2
}
