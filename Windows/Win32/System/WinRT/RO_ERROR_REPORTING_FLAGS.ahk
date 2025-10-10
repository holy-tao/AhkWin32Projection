#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the behavior of the RoOriginateError and RoTransformError functions.
 * @remarks
 * 
  * 
  * 
  * Use the <b>RO_ERROR_REPORTING_FLAGS</b> enumeration with the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-roseterrorreportingflags">RoSetErrorReportingFlags</a> function to specify the behavior of the  <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rooriginateerror">RoOriginateError</a>, <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rooriginateerrorw">RoOriginateErrorW</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rotransformerror">RoTransformError</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-rotransformerrorw">RoTransformErrorW</a> functions.
  * 
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//roerrorapi/ne-roerrorapi-ro_error_reporting_flags
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class RO_ERROR_REPORTING_FLAGS{

    /**
     * Error functions raise structured exceptions when a debugger is attached.
     * @type {Integer (Int32)}
     */
    static RO_ERROR_REPORTING_NONE => 0

    /**
     * Error functions do not raise structured exceptions, even when a debugger is present.  Override the behavior of this flag by setting the <b>ForceExceptions</b> flag.
     * @type {Integer (Int32)}
     */
    static RO_ERROR_REPORTING_SUPPRESSEXCEPTIONS => 1

    /**
     * Error functions raise structured exceptions, even if no debugger is present.  This flag supercedes the <b>RO_ERROR_REPORTING_SUPPRESSEXCEPTIONS</b> flag.  If this flag is set, structured exceptions are raised even if the <b>RO_ERROR_REPORTING_SUPPRESSEXCEPTIONS</b> flag is set.
     * @type {Integer (Int32)}
     */
    static RO_ERROR_REPORTING_FORCEEXCEPTIONS => 2

    /**
     * Error functions report error strings through a COM object that is attached to the COM channel through the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-setrestrictederrorinfo">SetRestrictedErrorInfo</a> infrastructure. For the <b>SetRestrictedErrorInfo</b> call to succeed, the thread must be initialized into COM.
     * @type {Integer (Int32)}
     */
    static RO_ERROR_REPORTING_USESETERRORINFO => 4

    /**
     * Error functions do not report error strings through a COM object that is attached to the COM channel through the <a href="https://docs.microsoft.com/windows/desktop/api/roerrorapi/nf-roerrorapi-setrestrictederrorinfo">SetRestrictedErrorInfo</a> infrastructure.
     * @type {Integer (Int32)}
     */
    static RO_ERROR_REPORTING_SUPPRESSSETERRORINFO => 8
}
