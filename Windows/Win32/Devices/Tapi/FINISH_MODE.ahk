#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FINISH_MODE enum is used by applications to indicate the type of call finish required. Operations that the TAPI DLL performs vary depending on whether a call transfer is being completed or a call is being added to a conference.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-finish_mode
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class FINISH_MODE{

    /**
     * A call transfer is being finished.
     * @type {Integer (Int32)}
     */
    static FM_ASTRANSFER => 0

    /**
     * A call is being added to a conference call.
     * @type {Integer (Int32)}
     */
    static FM_ASCONFERENCE => 1
}
