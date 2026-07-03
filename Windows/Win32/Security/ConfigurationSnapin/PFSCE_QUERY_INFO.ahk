#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SCESVC_INFO_TYPE.ahk" { SCESVC_INFO_TYPE }

/**
 * Queries service-specific information from the Security Configuration file or analysis database.
 * @remarks
 * The Security Configuration tool set allocates buffers when <i>PFSCE_QUERY_INFO</i> is called. To free these buffers call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_free_info">PFSCE_FREE_INFO</a> after the returned information is no longer needed.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/nc-scesvc-pfsce_query_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct PFSCE_QUERY_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PFSCE_QUERY_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} sceHandle Type: <b>SCE_HANDLE</b>
     * 
     * Specifies the opaque handle passed to the attachment by the Security Configuration tool set during the call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nf-scesvc-iscesvcattachmentdata-initialize">ISceSvcAttachmentData::Initialize</a>. This handle is used to store the queried information.
     * @param {SCESVC_INFO_TYPE} sceType Type: <b>SCESVC_INFO_TYPE</b>
     * 
     * Specifies the type of information to be queried. Specify one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCE_SERVICE_CONFIGURATION_INFO"></a><a id="sce_service_configuration_info"></a><dl>
     * <dt><b>SCE_SERVICE_CONFIGURATION_INFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requests configuration information from the database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCE_SERVICE_ANALYSIS_INFO"></a><a id="sce_service_analysis_info"></a><dl>
     * <dt><b>SCE_SERVICE_ANALYSIS_INFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requests analysis information from the database.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpPrefix Type: <b>LPTSTR</b>
     * 
     * Specifies a prefix or key (see <i>bExact</i>) for limiting the query. When a string is supplied, only those keys (and their corresponding values) that match the string are returned. When set to <b>NULL</b>, all keys are returned.
     * @param {BOOL} bExact Type: <b>BOOL</b>
     * @param {Pointer<Pointer<Void>>} ppvInfo Type: <b>PVOID*</b>
     * 
     * Returns a pointer to one of the following structures. The Security Configuration tool set (not the attachment) allocates the buffer for the information; therefore, this pointer must point to <b>NULL</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCESVC_CONFIGURATION_INFO"></a><a id="scesvc_configuration_info"></a><dl>
     * <dt><b>SCESVC_CONFIGURATION_INFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When <i>sceType</i> is set to SCE_SERVICE_CONFIGURATION_INFO.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCESVC_ANALYSIS_INFO"></a><a id="scesvc_analysis_info"></a><dl>
     * <dt><b>SCESVC_ANALYSIS_INFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When <i>sceType</i> is set to SCE_SERVICE_ANALYSIS_INFO.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} psceEnumHandle Type: <b>PSCE_ENUMERATION_CONTEXT</b>
     * 
     * Returns a handle that can be used in successive calls to this function. Due to the large number of keys that may be present, not all keys are returned in a single call. The maximum number of keys that may be returned in a single call is 256.
     * @returns {Integer} Type: <b>SCESTATUS</b>
     * 
     * An <b>SCESTATUS</b> value that indicates the result of the function call. If the function succeeds, it returns SCESTATUS_SUCCESS; otherwise, it returns an error value, which can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCESTATUS_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters passed into the function was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCESTATUS_RECORD_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified record was not found in the security database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCESTATUS_BAD_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCESTATUS_OTHER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCESTATUS_NOT_ENOUGH_RESOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(sceHandle, sceType, lpPrefix, bExact, ppvInfo, psceEnumHandle) {
        sceHandleMarshal := sceHandle is VarRef ? "ptr" : "ptr"
        lpPrefixMarshal := lpPrefix is VarRef ? "char*" : "ptr"
        ppvInfoMarshal := ppvInfo is VarRef ? "ptr*" : "ptr"
        psceEnumHandleMarshal := psceEnumHandle is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, sceHandleMarshal, sceHandle, SCESVC_INFO_TYPE, sceType, lpPrefixMarshal, lpPrefix, BOOL, bExact, ppvInfoMarshal, ppvInfo, psceEnumHandleMarshal, psceEnumHandle, UInt32)
        return result
    }

    /**
     * A PFSCE_QUERY_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFSCE_QUERY_INFO {
        /**
         * Creates a PFSCE_QUERY_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", SCESVC_INFO_TYPE, "char*", BOOL, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", SCESVC_INFO_TYPE, "char*", BOOL, "ptr*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
