#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SCESVC_INFO_TYPE.ahk" { SCESVC_INFO_TYPE }

/**
 * Sets or overwrites service-specific configuration and analysis information.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/nc-scesvc-pfsce_set_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct PFSCE_SET_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PFSCE_SET_INFO) {
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
     * Specifies the opaque SCE handle passed to the attachment by the Security Configuration tool set during the call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nf-scesvc-iscesvcattachmentdata-initialize">ISceSvcAttachmentData::Initialize</a>. This handle is used to set or overwrite the information.
     * @param {SCESVC_INFO_TYPE} sceType Type: <b>SCESVC_INFO_TYPE</b>
     * 
     * Specifies the type of information to be set. Specify one of the following flags.
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
     * Indicates that configuration information is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCE_SERVICE_ANALYSIS_INFO"></a><a id="sce_service_analysis_info"></a><dl>
     * <dt><b>SCE_SERVICE_ANALYSIS_INFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that analysis information is set.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpPrefix Type: <b>LPTSTR</b>
     * 
     * Specifies what information should be set or overwritten. This string can specify a specific key (see <i>bExact</i>) or a prefix for a set of keys. When a string is supplied, only information for those keys (and their corresponding values) that match the string is set. When set to <b>NULL</b>, all information for the service is set.
     * @param {BOOL} bExact Type: <b>BOOL</b>
     * 
     * Specifies whether the string provided by <i>lpPrefix</i> should be treated as a specific key or a prefix for a set of keys. This parameter is ignored if <i>lpPrefix</i> is set to <b>NULL</b>.
     * @param {Pointer<Void>} pvInfo Type: <b>PVOID</b>
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
     * @returns {Integer} Type: <b>SCESTATUS</b>
     * 
     * If the function succeeds, it returns SCESTATUS_SUCCESS; otherwise, it returns an error value which can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCESTATUS_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges to complete this action.
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
     * The format is bad.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCESTATUS_PREFIX_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more data than the buffer can hold.
     * 
     * </td>
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
     * <dt><b>SCESTATUS_NOT_ENOUGH_RESOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory.
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
     * <dt><b>SCESTATUS_RECORD_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified record was not found in the security database.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(sceHandle, sceType, lpPrefix, bExact, pvInfo) {
        sceHandleMarshal := sceHandle is VarRef ? "ptr" : "ptr"
        lpPrefixMarshal := lpPrefix is VarRef ? "char*" : "ptr"
        pvInfoMarshal := pvInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, sceHandleMarshal, sceHandle, SCESVC_INFO_TYPE, sceType, lpPrefixMarshal, lpPrefix, BOOL, bExact, pvInfoMarshal, pvInfo, UInt32)
        return result
    }

    /**
     * A PFSCE_SET_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFSCE_SET_INFO {
        /**
         * Creates a PFSCE_SET_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", SCESVC_INFO_TYPE, "char*", BOOL, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", SCESVC_INFO_TYPE, "char*", BOOL, "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
