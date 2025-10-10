#Requires AutoHotkey v2.0.0 64-bit

/**
 * The CALLINFO_STRING enum is used by ITCallInfo methods that set and get call information involving the use of strings.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-callinfo_string
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALLINFO_STRING{

    /**
     * The name of the caller.
     * @type {Integer (Int32)}
     */
    static CIS_CALLERIDNAME => 0

    /**
     * The number of the caller.
     * @type {Integer (Int32)}
     */
    static CIS_CALLERIDNUMBER => 1

    /**
     * The name of the called location.
     * @type {Integer (Int32)}
     */
    static CIS_CALLEDIDNAME => 2

    /**
     * The number of the called location.
     * @type {Integer (Int32)}
     */
    static CIS_CALLEDIDNUMBER => 3

    /**
     * The name of the connected location.
     * @type {Integer (Int32)}
     */
    static CIS_CONNECTEDIDNAME => 4

    /**
     * The number of the connected location.
     * @type {Integer (Int32)}
     */
    static CIS_CONNECTEDIDNUMBER => 5

    /**
     * The name of the location to which a call has been redirected.
     * @type {Integer (Int32)}
     */
    static CIS_REDIRECTIONIDNAME => 6

    /**
     * The number of the location to which a call has been redirected.
     * @type {Integer (Int32)}
     */
    static CIS_REDIRECTIONIDNUMBER => 7

    /**
     * The name of the location that redirected the call.
     * @type {Integer (Int32)}
     */
    static CIS_REDIRECTINGIDNAME => 8

    /**
     * The number of the location that redirected the call.
     * @type {Integer (Int32)}
     */
    static CIS_REDIRECTINGIDNUMBER => 9

    /**
     * The called party friendly name.
     * @type {Integer (Int32)}
     */
    static CIS_CALLEDPARTYFRIENDLYNAME => 10

    /**
     * A comment about the call provided by the application that originated the call. The call state must be CS_IDLE when setting the comment.
     * @type {Integer (Int32)}
     */
    static CIS_COMMENT => 11

    /**
     * A displayable version of the called or calling address.
     * @type {Integer (Int32)}
     */
    static CIS_DISPLAYABLEADDRESS => 12

    /**
     * The identifier of the calling party.
     * @type {Integer (Int32)}
     */
    static CIS_CALLINGPARTYID => 13
}
