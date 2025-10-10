#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PHONECAPS_STRING enum is used by methods that set or get phone capabilities described by a string.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-phonecaps_string
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONECAPS_STRING{

    /**
     * Name of the phone.
     * @type {Integer (Int32)}
     */
    static PCS_PHONENAME => 0

    /**
     * Phone information string.
     * @type {Integer (Int32)}
     */
    static PCS_PHONEINFO => 1

    /**
     * Phone provider string.
     * @type {Integer (Int32)}
     */
    static PCS_PROVIDERINFO => 2
}
