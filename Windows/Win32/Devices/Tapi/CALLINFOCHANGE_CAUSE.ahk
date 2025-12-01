#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CALLINFOCHANGE_CAUSE enum is used by the ITCallInfoChangeEvent::get_Cause method to return a description of the type of call information that has changed.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-callinfochange_cause
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALLINFOCHANGE_CAUSE extends Win32Enum{

    /**
     * Unspecified call information has changed.
     * @type {Integer (Int32)}
     */
    static CIC_OTHER => 0

    /**
     * Call information specific to a device has changed.
     * @type {Integer (Int32)}
     */
    static CIC_DEVSPECIFIC => 1

    /**
     * The bearer mode for the call has changed.
     * @type {Integer (Int32)}
     */
    static CIC_BEARERMODE => 2

    /**
     * The rate has changed.
     * @type {Integer (Int32)}
     */
    static CIC_RATE => 3

    /**
     * Call information specific to an application has changed. Application-specific information is used to pass information between applications in a multi-application environment. The information is not interpreted by the API implementation or the service provider. Only applications with owner privileges for the call can set it
     * @type {Integer (Int32)}
     */
    static CIC_APPSPECIFIC => 4

    /**
     * The call identifier has changed.
     * @type {Integer (Int32)}
     */
    static CIC_CALLID => 5

    /**
     * The related call identifier has changed.
     * @type {Integer (Int32)}
     */
    static CIC_RELATEDCALLID => 6

    /**
     * The call origin has changed.
     * @type {Integer (Int32)}
     */
    static CIC_ORIGIN => 7

    /**
     * The call reason has changed.
     * @type {Integer (Int32)}
     */
    static CIC_REASON => 8

    /**
     * The completion identifier has changed.
     * @type {Integer (Int32)}
     */
    static CIC_COMPLETIONID => 9

    /**
     * The number of owners has increased.
     * @type {Integer (Int32)}
     */
    static CIC_NUMOWNERINCR => 10

    /**
     * The number of owners has decreased.
     * @type {Integer (Int32)}
     */
    static CIC_NUMOWNERDECR => 11

    /**
     * The number of call monitors has changed.
     * @type {Integer (Int32)}
     */
    static CIC_NUMMONITORS => 12

    /**
     * Trunk used on call has changed.
     * @type {Integer (Int32)}
     */
    static CIC_TRUNK => 13

    /**
     * The caller identifier has changed.
     * @type {Integer (Int32)}
     */
    static CIC_CALLERID => 14

    /**
     * The called identifier has changed.
     * @type {Integer (Int32)}
     */
    static CIC_CALLEDID => 15

    /**
     * The connected identifier has changed.
     * @type {Integer (Int32)}
     */
    static CIC_CONNECTEDID => 16

    /**
     * The redirection identifier has changed.
     * @type {Integer (Int32)}
     */
    static CIC_REDIRECTIONID => 17

    /**
     * The redirecting identifier has changed.
     * @type {Integer (Int32)}
     */
    static CIC_REDIRECTINGID => 18

    /**
     * The user-user information buffer has changed.
     * @type {Integer (Int32)}
     */
    static CIC_USERUSERINFO => 19

    /**
     * The high-level compatibility information has changed (ISDN Q.931).
     * @type {Integer (Int32)}
     */
    static CIC_HIGHLEVELCOMP => 20

    /**
     * The low-level compatibility information has changed (ISDN Q.931).
     * @type {Integer (Int32)}
     */
    static CIC_LOWLEVELCOMP => 21

    /**
     * The call's charging information has changed.
     * @type {Integer (Int32)}
     */
    static CIC_CHARGINGINFO => 22

    /**
     * Treatment of calls on hold has changed.
     * @type {Integer (Int32)}
     */
    static CIC_TREATMENT => 23

    /**
     * The call data buffer has changed.
     * @type {Integer (Int32)}
     */
    static CIC_CALLDATA => 24

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallprivilege--constants">Call privilege</a> has changed.
     * @type {Integer (Int32)}
     */
    static CIC_PRIVILEGE => 25

    /**
     * The call 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a> has changed.
     * @type {Integer (Int32)}
     */
    static CIC_MEDIATYPE => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CIC_LASTITEM => 26
}
