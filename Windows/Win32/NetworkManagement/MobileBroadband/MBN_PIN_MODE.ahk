#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_PIN_MODE enumerated type indicates if the PIN type is enabled.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_pin_mode
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_PIN_MODE extends Win32Enum{

    /**
     * The PIN type is currently enabled.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_MODE_ENABLED => 1

    /**
     * The PIN type is currently disabled.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_MODE_DISABLED => 2
}
