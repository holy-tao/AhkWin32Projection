#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TAPI_TONEMODE enum is used to describe the different selections that are used when generating line tones.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-tapi_tonemode
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TAPI_TONEMODE{

    /**
     * The tone is a ringback tone. Exact definition is service-provider defined.
     * @type {Integer (Int32)}
     */
    static TTM_RINGBACK => 2

    /**
     * The tone is a busy tone. Exact definition is service-provider defined.
     * @type {Integer (Int32)}
     */
    static TTM_BUSY => 4

    /**
     * The tone is a beep, such as that used to announce the beginning of a recording. Exact definition is service-provider defined.
     * @type {Integer (Int32)}
     */
    static TTM_BEEP => 8

    /**
     * The tone is a billing information tone, such as a credit card prompt tone. Exact definition is service-provider defined.
     * @type {Integer (Int32)}
     */
    static TTM_BILLING => 16
}
