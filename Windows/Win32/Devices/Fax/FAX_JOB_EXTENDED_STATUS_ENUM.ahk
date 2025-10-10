#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FAX_JOB_EXTENDED_STATUS_ENUM enumeration defines the extended status values for a fax job.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/ne-faxcomex-fax_job_extended_status_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_JOB_EXTENDED_STATUS_ENUM{

    /**
     * No extended status value.
     * @type {Integer (Int32)}
     */
    static fjesNONE => 0

    /**
     * The sender or the caller disconnected the fax call.
     * @type {Integer (Int32)}
     */
    static fjesDISCONNECTED => 1

    /**
     * The device is initializing a call.
     * @type {Integer (Int32)}
     */
    static fjesINITIALIZING => 2

    /**
     * The device is dialing a fax number.
     * @type {Integer (Int32)}
     */
    static fjesDIALING => 3

    /**
     * The device is sending a fax.
     * @type {Integer (Int32)}
     */
    static fjesTRANSMITTING => 4

    /**
     * The device answered a new call.
     * @type {Integer (Int32)}
     */
    static fjesANSWERED => 5

    /**
     * The device is receiving a fax.
     * @type {Integer (Int32)}
     */
    static fjesRECEIVING => 6

    /**
     * The device is not available because it is in use by another application.
     * @type {Integer (Int32)}
     */
    static fjesLINE_UNAVAILABLE => 7

    /**
     * The device encountered a busy signal.
     * @type {Integer (Int32)}
     */
    static fjesBUSY => 8

    /**
     * The receiving device did not answer the call.
     * @type {Integer (Int32)}
     */
    static fjesNO_ANSWER => 9

    /**
     * The device dialed an invalid fax number.
     * @type {Integer (Int32)}
     */
    static fjesBAD_ADDRESS => 10

    /**
     * The sending device cannot complete the call because it does not detect a dial tone.
     * @type {Integer (Int32)}
     */
    static fjesNO_DIAL_TONE => 11

    /**
     * The device has encountered a fatal protocol error.
     * @type {Integer (Int32)}
     */
    static fjesFATAL_ERROR => 12

    /**
     * The device delayed a fax call because the sending device received a busy signal multiple times. The device cannot retry the call because dialing restrictions exist. (Some countries/regions restrict the number of retry attempts when a number is busy.)
     * @type {Integer (Int32)}
     */
    static fjesCALL_DELAYED => 13

    /**
     * The device could not complete a call because the telephone number was blocked or reserved; emergency numbers such as 911 are blocked.
     * @type {Integer (Int32)}
     */
    static fjesCALL_BLACKLISTED => 14

    /**
     * The device received a call that was a data call or a voice call.
     * @type {Integer (Int32)}
     */
    static fjesNOT_FAX_CALL => 15

    /**
     * The incoming fax was partially received. Some (but not all) of the pages are available.
     * @type {Integer (Int32)}
     */
    static fjesPARTIALLY_RECEIVED => 16

    /**
     * The fax service processed the outbound fax; the fax service provider will transmit the fax.
     * @type {Integer (Int32)}
     */
    static fjesHANDLED => 17

    /**
     * The call was completed.
     * @type {Integer (Int32)}
     */
    static fjesCALL_COMPLETED => 18

    /**
     * The call was aborted.
     * @type {Integer (Int32)}
     */
    static fjesCALL_ABORTED => 19

    /**
     * Obsolete. For information about proprietary extended status codes, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob-extendedstatuscode-vb">IFaxOutgoingJob::get_ExtendedStatusCode</a>.
     * @type {Integer (Int32)}
     */
    static fjesPROPRIETARY => 16777216
}
