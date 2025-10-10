#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TAPI_GATHERTERM enum is used to describe the reasons why the TAPI Server terminated the gathering of digits on the call.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-tapi_gatherterm
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TAPI_GATHERTERM{

    /**
     * The requested number of digits has been gathered. The buffer is full.
     * @type {Integer (Int32)}
     */
    static TGT_BUFFERFULL => 1

    /**
     * One of the termination digits matched a received digit. The matched termination digit is the last digit in the buffer.
     * @type {Integer (Int32)}
     */
    static TGT_TERMDIGIT => 2

    /**
     * The first digit timeout expired. The buffer contains no digits.
     * @type {Integer (Int32)}
     */
    static TGT_FIRSTTIMEOUT => 4

    /**
     * The interdigit timeout expired. The buffer contains at least one digit.
     * @type {Integer (Int32)}
     */
    static TGT_INTERTIMEOUT => 8

    /**
     * The request was canceled by this application, by another application, or because the call terminated.
     * @type {Integer (Int32)}
     */
    static TGT_CANCEL => 16
}
