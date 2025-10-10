#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides values for the COM unmarshaling policy global option.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-globalopt_unmarshaling_policy_values
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class GLOBALOPT_UNMARSHALING_POLICY_VALUES{

    /**
     * Unmarshaling behavior is the same as versions older than Windows 8. <b>EOAC_NO_CUSTOM_MARSHAL</b> restrictions apply if this flag is set in <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>. Otherwise, there are no restrictions. This is the default for processes that aren't in the app container.
     * @type {Integer (Int32)}
     */
    static COMGLB_UNMARSHALING_POLICY_NORMAL => 0

    /**
     * Unmarshaling allows only a system-trusted list of hardened unmarshalers and unmarshalers allowed per-process by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coallowunmarshalerclsid">CoAllowUnmarshalerCLSID</a> function. This is the default for processes in the app container.
     * @type {Integer (Int32)}
     */
    static COMGLB_UNMARSHALING_POLICY_STRONG => 1

    /**
     * Unmarshaling data whose source is app container allows only a system-trusted list of hardened unmarshalers and unmarshalers allowed per-process by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coallowunmarshalerclsid">CoAllowUnmarshalerCLSID</a> function. Unmarshaling behavior for data with a source that's not app container is unchanged from previous versions.
     * @type {Integer (Int32)}
     */
    static COMGLB_UNMARSHALING_POLICY_HYBRID => 2
}
