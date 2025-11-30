#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CALLINFO_LONG enum is used by ITCallInfo methods that set and get call information of type LONG.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-callinfo_long
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALLINFO_LONG extends Win32Enum{

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> available on the call.
     * @type {Integer (Int32)}
     */
    static CIL_MEDIATYPESAVAILABLE => 0

    /**
     * The bearer mode of a call is described by the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebearermode--constants">LINEBEARERMODE_ Constants</a>.
     * @type {Integer (Int32)}
     */
    static CIL_BEARERMODE => 1

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">address type</a> of the caller.
     * @type {Integer (Int32)}
     */
    static CIL_CALLERIDADDRESSTYPE => 2

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">address type</a> of the called party.
     * @type {Integer (Int32)}
     */
    static CIL_CALLEDIDADDRESSTYPE => 3

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">address type</a> of the connected party.
     * @type {Integer (Int32)}
     */
    static CIL_CONNECTEDIDADDRESSTYPE => 4

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">address type</a> of the destination to which a call has been redirected.
     * @type {Integer (Int32)}
     */
    static CIL_REDIRECTIONIDADDRESSTYPE => 5

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineaddresstype--constants">address type</a> of the location that redirected the call.
     * @type {Integer (Int32)}
     */
    static CIL_REDIRECTINGIDADDRESSTYPE => 6

    /**
     * The origin of a call is described by the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallorigin--constants">LINECALLORIGIN_ Constants</a>, such as LINECALLORIGIN_EXTERNAL.
     * @type {Integer (Int32)}
     */
    static CIL_ORIGIN => 7

    /**
     * The reason for a call is described by the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallreason--constants">LINECALLREASON_ Constants</a>, such as LINECALLREASON_FWDUNCOND.
     * @type {Integer (Int32)}
     */
    static CIL_REASON => 8

    /**
     * Application-specific information is used to pass information between applications in a multi-application environment. The information is not interpreted by the API implementation or the service provider. Only applications with owner privileges for the call can set it.
     * @type {Integer (Int32)}
     */
    static CIL_APPSPECIFIC => 9

    /**
     * Call parameter flags are described by 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallparamflags--constants">LINECALLPARAMFLAGS_ Constants</a>, such as LINECALLPARAMFLAGS_BLOCKID. These flags are normally set during the creation of an outgoing call.
     * @type {Integer (Int32)}
     */
    static CIL_CALLPARAMSFLAGS => 10

    /**
     * Call treatment identifies how a call that is on hold or unanswered gets handled, and is described by 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecalltreatment--constants">LINECALLTREATMENT_ Constants</a>, such as LINECALLTREATMENT_MUSIC.
     * @type {Integer (Int32)}
     */
    static CIL_CALLTREATMENT => 11

    /**
     * The minimum rate for a call's data stream in bps (bits per second).
     * @type {Integer (Int32)}
     */
    static CIL_MINRATE => 12

    /**
     * The maximum rate for a call's data stream in bps (bits per second).
     * @type {Integer (Int32)}
     */
    static CIL_MAXRATE => 13

    /**
     * Country or region code.
     * @type {Integer (Int32)}
     */
    static CIL_COUNTRYCODE => 14

    /**
     * Call identifier. Some service providers assign a unique code to each call.
     * @type {Integer (Int32)}
     */
    static CIL_CALLID => 15

    /**
     * Call identifier for a call related to the current call, such as on a conference.
     * @type {Integer (Int32)}
     */
    static CIL_RELATEDCALLID => 16

    /**
     * Completion identifier. The completion identifier is used to identify individual completion requests in progress. A completion identifier becomes invalid and can be reused after the request completion or after an outstanding request is canceled.
     * @type {Integer (Int32)}
     */
    static CIL_COMPLETIONID => 17

    /**
     * The number of applications having owner privileges for the current call.
     * @type {Integer (Int32)}
     */
    static CIL_NUMBEROFOWNERS => 18

    /**
     * The number of applications having monitor privileges for the current call.
     * @type {Integer (Int32)}
     */
    static CIL_NUMBEROFMONITORS => 19

    /**
     * The trunk identifier for the current call.
     * @type {Integer (Int32)}
     */
    static CIL_TRUNK => 20

    /**
     * The current rate for a call's data stream in bps (bits per second).
     * @type {Integer (Int32)}
     */
    static CIL_RATE => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CIL_GENERATEDIGITDURATION => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CIL_MONITORDIGITMODES => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CIL_MONITORMEDIAMODES => 24
}
