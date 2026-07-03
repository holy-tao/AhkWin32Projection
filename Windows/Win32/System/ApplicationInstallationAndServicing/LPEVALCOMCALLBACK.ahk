#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\STATUSTYPES.ahk" { STATUSTYPES }

/**
 * The LPEVALCOMCALLBACK specification defines a callback function prototype. The IValidate::SetStatus method enables an authoring tool to receive information about the progress of validation through the registered callback function.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/evalcom2/nf-evalcom2-ivalidate-setstatus">SetStatus</a> method and <b>LPEVALCOMCALLBACK</b> can be used to provide progress information.  For example, the <b>ieStatusICECount</b> message can provide the overall tick count for a progress bar.  For each <b>ieStatusRunICE</b> message received, the caller can increment the progress bar one tick.
 * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nc-evalcom2-lpevalcomcallback
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct LPEVALCOMCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPEVALCOMCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {STATUSTYPES} iStatus Specifies the status message sent by evalcom2. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of this param
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusICECount"></a><a id="iestatusicecount"></a><a id="IESTATUSICECOUNT"></a><dl>
     * <dt><b>ieStatusICECount</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of ICEs that are being run.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusMerge"></a><a id="iestatusmerge"></a><a id="IESTATUSMERGE"></a><dl>
     * <dt><b>ieStatusMerge</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merging the package or merge module with the .cub file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusSummaryInfo"></a><a id="iestatussummaryinfo"></a><a id="IESTATUSSUMMARYINFO"></a><dl>
     * <dt><b>ieStatusSummaryInfo</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merging summary information streams.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusCreateEngine"></a><a id="iestatuscreateengine"></a><a id="IESTATUSCREATEENGINE"></a><dl>
     * <dt><b>ieStatusCreateEngine</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Preparing to run the ICEs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusRunICE"></a><a id="iestatusrunice"></a><a id="IESTATUSRUNICE"></a><dl>
     * <dt><b>ieStatusRunICE</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Running an individual ICE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusStarting"></a><a id="iestatusstarting"></a><a id="IESTATUSSTARTING"></a><dl>
     * <dt><b>ieStatusStarting</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Starting validation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusShutdown"></a><a id="iestatusshutdown"></a><a id="IESTATUSSHUTDOWN"></a><dl>
     * <dt><b>ieStatusShutdown</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Finish running the ICEs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusSuccess"></a><a id="iestatussuccess"></a><a id="IESTATUSSUCCESS"></a><dl>
     * <dt><b>ieStatusSuccess</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Validation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusFail"></a><a id="iestatusfail"></a><a id="IESTATUSFAIL"></a><dl>
     * <dt><b>ieStatusFail</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Validation failed. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ieStatusCancel"></a><a id="iestatuscancel"></a><a id="IESTATUSCANCEL"></a><dl>
     * <dt><b>ieStatusCancel</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Validation was canceled.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} szData A string value containing information appropriate to the status. The value of <i>szwData</i> should be the number of ICEs that are being run if <i>iStatus</i> is <b>ieStatusICECount</b>. The value of <i>szwData</i> should be the name of the ICE being run if <i>iStatus</i> is <b>ieStatusRunICE</b>. Otherwise, the value of <i>szwData</i> should be <b>NULL</b>. The callback function should accept <b>NULL</b> as a possible value for this parameter.
     * @param {Pointer<Void>} pContext Pointer to an application context passed to the <a href="https://docs.microsoft.com/windows/desktop/api/evalcom2/nf-evalcom2-ivalidate-setstatus">SetStatus</a> method. This parameter can be used for error checking.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>TRUE</b></b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Validation procedure should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>FALSE</b></b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Validation was canceled. The callback function return <b>FALSE</b> to stop validation.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(iStatus, szData, pContext) {
        szData := szData is String ? StrPtr(szData) : szData

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, STATUSTYPES, iStatus, "ptr", szData, pContextMarshal, pContext, BOOL)
        return result
    }

    /**
     * A LPEVALCOMCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPEVALCOMCALLBACK {
        /**
         * Creates a LPEVALCOMCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(STATUSTYPES, PWSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [STATUSTYPES, PWSTR, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
