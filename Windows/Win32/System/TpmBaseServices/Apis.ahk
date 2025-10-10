#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 * @version v4.0.30319
 */
class TpmBaseServices {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_CONTEXT_VERSION_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_OWNERAUTH_TYPE_FULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_OWNERAUTH_TYPE_ADMIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_OWNERAUTH_TYPE_USER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_OWNERAUTH_TYPE_ENDORSEMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_OWNERAUTH_TYPE_ENDORSEMENT_20 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_OWNERAUTH_TYPE_STORAGE_20 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_CONTEXT_VERSION_TWO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_WNF_INFO_CLEAR_SUCCESSFUL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_WNF_INFO_OWNERSHIP_SUCCESSFUL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_WNF_INFO_NO_REBOOT_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERSION_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERSION_12 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERSION_20 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_IFTYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_IFTYPE_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_IFTYPE_TRUSTZONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_IFTYPE_HW => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_IFTYPE_EMULATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_IFTYPE_SPB => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_TCGLOG_SRTM_CURRENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_TCGLOG_DRTM_CURRENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_TCGLOG_SRTM_BOOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_TCGLOG_SRTM_RESUME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_TCGLOG_DRTM_BOOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_TCGLOG_DRTM_RESUME => 5
;@endregion Constants

;@region Methods
    /**
     * Creates a context handle that can be used to pass commands to TBS.
     * @param {Pointer<UInt32>} pContextParams A parameter to a [TBS_CONTEXT_PARAMS](./ns-tbs-tbs_context_params.md) structure that contains the parameters associated with the context.
     * @param {Pointer<Void>} phContext A pointer to a location to store the new context handle.
     * @returns {Integer} If the function succeeds, the function returns TBS_SUCCESS.
     * 
     * If the function fails, it returns a TBS return code that indicates the error.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_BAD_PARAMETER</b></dt>
     * <dt>2150121474 (0x80284002)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameter values are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INTERNAL_ERROR</b></dt>
     * <dt>2150121473 (0x80284001)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal software error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_CONTEXT_PARAM</b></dt>
     * <dt>2150121479 (0x80284007)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A context parameter that is not valid was passed when attempting to create a TBS context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_OUTPUT_POINTER</b></dt>
     * <dt>2150121475 (0x80284003)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified output pointer is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_SERVICE_DISABLED</b></dt>
     * <dt>2150121488 (0x80284010)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TBS service has been disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_SERVICE_NOT_RUNNING</b></dt>
     * <dt>2150121480 (0x80284008)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TBS service is not running and could not be started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_SERVICE_START_PENDING</b></dt>
     * <dt>2150121483 (0x8028400B)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TBS service has been started but is not yet running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_TOO_MANY_TBS_CONTEXTS</b></dt>
     * <dt>2150121481 (0x80284009)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new context could not be created because there are too many open contexts.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_TPM_NOT_FOUND</b></dt>
     * <dt>2150121487 (0x8028400F)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A compatible Trusted Platform Module (TPM) Security Device cannot be found on this computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsi_context_create
     * @since windows6.0.6000
     */
    static Tbsi_Context_Create(pContextParams, phContext) {
        result := DllCall("tbs.dll\Tbsi_Context_Create", "uint*", pContextParams, "ptr", phContext, "uint")
        return result
    }

    /**
     * Closes a context handle, which releases resources associated with the context in TBS and closes the binding handle used to communicate with TBS.
     * @param {Pointer<Void>} hContext A handle of the context to be closed.
     * @returns {Integer} If the function succeeds, the function returns TBS_SUCCESS.
     * 
     * If the function fails, it returns a TBS return code that indicates the error.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INTERNAL_ERROR</b></dt>
     * <dt>2150121473 (0x80284001)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal software error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_CONTEXT</b></dt>
     * <dt>2150121476 (0x80284004)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified context handle does not refer to a valid context.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsip_context_close
     * @since windows6.0.6000
     */
    static Tbsip_Context_Close(hContext) {
        result := DllCall("tbs.dll\Tbsip_Context_Close", "ptr", hContext, "uint")
        return result
    }

    /**
     * Submits a Trusted Platform Module (TPM) command to TPM Base Services (TBS) for processing.
     * @param {Pointer<Void>} hContext The handle of the context that is submitting the command.
     * @param {Integer} Locality 
     * @param {Integer} Priority 
     * @param {Pointer} pabCommand A pointer to a buffer that contains the TPM command to process.
     * @param {Integer} cbCommand The length, in bytes, of the command.
     * @param {Pointer} pabResult A pointer to a buffer to receive the result of the TPM command.  This buffer can be the same as <i>pabCommand</i>.
     * @param {Pointer<UInt32>} pcbResult An integer that, on input, specifies the size, in bytes, of the result buffer.  This value is set when the submit command returns.  If the supplied buffer is too small, this parameter, on output, is set to the required size, in bytes, for the result.
     * @returns {Integer} If the function succeeds, the function returns TBS_SUCCESS.
     * 
     * A command can be submitted successfully and still fail at the TPM. In this case, the failure code is returned as a standard TPM error in the result buffer.
     * 
     * If the function fails, it returns a TBS return code that indicates the error.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_BAD_PARAMETER</b></dt>
     * <dt>2150121474 (0x80284002)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameter values are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_BUFFER_TOO_LARGE</b></dt>
     * <dt>2150121486 (0x8028400E)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input or output buffer is too large.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INTERNAL_ERROR</b></dt>
     * <dt>2150121473 (0x80284001)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal software error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INSUFFICIENT_BUFFER</b></dt>
     * <dt>2150121477 (0x80284005)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified output buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_CONTEXT</b></dt>
     * <dt>2150121476 (0x80284004)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified context handle does not refer to a valid context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_OUTPUT_POINTER</b></dt>
     * <dt>2150121475 (0x80284003)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified output pointer is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_IOERROR</b></dt>
     * <dt>2150121478 (0x80284006)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while communicating with the TPM.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsip_submit_command
     * @since windows6.0.6000
     */
    static Tbsip_Submit_Command(hContext, Locality, Priority, pabCommand, cbCommand, pabResult, pcbResult) {
        result := DllCall("tbs.dll\Tbsip_Submit_Command", "ptr", hContext, "uint", Locality, "uint", Priority, "ptr", pabCommand, "uint", cbCommand, "ptr", pabResult, "uint*", pcbResult, "uint")
        return result
    }

    /**
     * Cancels all outstanding commands for the specified context.
     * @param {Pointer<Void>} hContext A TBS handle to the context whose commands are to be canceled and that was obtained from previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/tbs/nf-tbs-tbsi_context_create">Tbsi_Context_Create</a> function.
     * @returns {Integer} If the function succeeds, the function returns TBS_SUCCESS.
     * 
     * If the function fails, it returns a TBS return code that indicates the error.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INTERNAL_ERROR</b></dt>
     * <dt>2150121473 (0x80284001)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal software error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_CONTEXT</b></dt>
     * <dt>2150121476 (0x80284004)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified context handle does not refer to a valid context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_IOERROR</b></dt>
     * <dt>2150121478 (0x80284006)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while communicating with the TPM.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsip_cancel_commands
     * @since windows6.0.6000
     */
    static Tbsip_Cancel_Commands(hContext) {
        result := DllCall("tbs.dll\Tbsip_Cancel_Commands", "ptr", hContext, "uint")
        return result
    }

    /**
     * Passes a physical presence ACPI command through TBS to the driver.
     * @param {Pointer<Void>} hContext The context of the ACPI command.
     * @param {Pointer} pabInput A pointer to a buffer that contains the input to the ACPI command.
     * 
     * 
     * The input to the ACPI command is defined in the <a href="https://trustedcomputinggroup.org/specs/PCClient/Physical_Presence_Interface_1-0_1-0_Final.pdf">TCG Physical Presence Interface Specification</a> at https://www.trustedcomputinggroup.org/specs/PCClient. The buffer should contain <i>Arg2</i> and <i>Arg3</i> values as defined in this document. The values for <i>Arg0</i> and <i>Arg1</i> are static and automatically added. For example, if this method is used for Get Physical Presence Interface Version, then <i>Arg2</i> is the integer value 1 and <i>Arg3</i> is empty, so the buffer should just contain an integer value of 1. If this method is used for "Submit TPM Operation Request to Pre-OS Environment", then <i>Arg2</i> is the integer value 2 and <i>Arg3</i> will be the integer for the specified operation, such as 1 for enable or 2 for disable.
     * @param {Integer} cbInput The length, in bytes, of the input buffer.
     * @param {Pointer} pabOutput A pointer to a buffer to contain the output of the ACPI command.
     * 
     * 
     * The buffer will contain the return value from the  command as defined in the <a href="https://trustedcomputinggroup.org/specs/PCClient/Physical_Presence_Interface_1-0_1-0_Final.pdf">TCG Physical Presence Interface Specification</a>.
     * @param {Pointer<UInt32>} pcbOutput A pointer to an unsigned long integer that, on input, specifies the size, in bytes, of the output buffer. If the function succeeds, this parameter, on output, receives the size, in bytes, of the data pointed to by <i>pabOutput</i>. If the function fails, this parameter does not receive a value.
     * @returns {Integer} If the function succeeds, the function returns TBS_SUCCESS.
     * 
     * If the function fails, it returns a TBS return code that indicates the error.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_BAD_PARAMETER</b></dt>
     * <dt>2150121474 (0x80284002)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameter values are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INTERNAL_ERROR</b></dt>
     * <dt>2150121473 (0x80284001)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal software error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_CONTEXT_PARAM</b></dt>
     * <dt>2150121479 (0x80284007)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A context parameter that is not valid was passed when attempting to create a TBS context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_OUTPUT_POINTER</b></dt>
     * <dt>2150121475 (0x80284003)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified output pointer is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsi_physical_presence_command
     * @since windows6.0.6000
     */
    static Tbsi_Physical_Presence_Command(hContext, pabInput, cbInput, pabOutput, pcbOutput) {
        result := DllCall("tbs.dll\Tbsi_Physical_Presence_Command", "ptr", hContext, "ptr", pabInput, "uint", cbInput, "ptr", pabOutput, "uint*", pcbOutput, "uint")
        return result
    }

    /**
     * Retrieves the most recent Windows Boot Configuration Log (WBCL), also referred to as a TCG log.
     * @param {Pointer<Void>} hContext The TBS handle of the context that is retrieving the log. You get this parameter from a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/tbs/nf-tbs-tbsi_context_create">Tbsi_Context_Create</a> function.
     * @param {Pointer} pOutputBuf A pointer to a buffer to receive  and store the WBCL. This parameter may be NULL to estimate the required buffer when the location pointed to by <i>pcbOutput</i> is also 0 on input.
     * @param {Pointer<UInt32>} pOutputBufLen A pointer to an unsigned long integer that, on input, specifies the size, in bytes, of the output buffer.  If the function succeeds, this parameter, on output, receives the size, in bytes, of the data pointed to by <i>pOutputBuf</i>. If the function fails, this parameter does not receive a value.
     * 
     * Calling the <b>Tbsi_Get_TCG_Log</b> function with a zero length buffer will return the size of the buffer required. <b>Windows Vista with SP1 and Windows Server 2008:  </b>This functionality is not available.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INTERNAL_ERROR</b></dt>
     * <dt>2150121473 (0x80284001)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal software error occurred. 
     * 
     * <div class="alert"><b>Note</b>  If TBS_E_INTERNAL_ERROR is returned, the system event log may contain event ID 16385 from the TBS event source with error code 0x80070032.  This may indicate that the hardware platform does not provide a TCG event log to the operating system.  Sometimes this can be resolved by installing a BIOS upgrade from the platform manufacturer.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_OUTPUT_POINTER</b></dt>
     * <dt>2150121475 (0x80284003)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified output pointer is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_CONTEXT</b></dt>
     * <dt>2150121476 (0x80284004)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified context handle does not refer to a valid context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INSUFFICIENT_BUFFER</b></dt>
     * <dt>2150121477 (0x80284005)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_BUFFER_TOO_LARGE</b></dt>
     * <dt>2150121486 (0x8028400E)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer is too large.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_TPM_NOT_FOUND</b></dt>
     * <dt>2150121487 (0x8028400F)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A compatible Trusted Platform Module (TPM) Security Device cannot be found on this computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_DEACTIVATED</b></dt>
     * <dt>2150121494 (0x80284016)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Trusted Platform Module (TPM) Security Device is deactivated.
     * 
     * <b>Windows Vista with SP1 and Windows Server 2008:  </b>This return value is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsi_get_tcg_log
     * @since windows6.0.6000
     */
    static Tbsi_Get_TCG_Log(hContext, pOutputBuf, pOutputBufLen) {
        result := DllCall("tbs.dll\Tbsi_Get_TCG_Log", "ptr", hContext, "ptr", pOutputBuf, "uint*", pOutputBufLen, "uint")
        return result
    }

    /**
     * Obtains the version of the TPM on the computer.
     * @param {Integer} Size Size of the memory location.
     * @param {Pointer} Info A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/tbs/ns-tbs-tpm_device_info">TPM_DEVICE_INFO</a> structure is returned containing the version information about the TPM. The location must be large enough to hold four 32-bit values.
     * @returns {Integer} If the function succeeds, the function returns TBS_SUCCESS.
     * 
     * If the function fails, it returns a TBS return code that indicates the error.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_BAD_PARAMETER</b></dt>
     * <dt>2150121474 (0x80284002)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameter values are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_TPM_NOT_FOUND</b></dt>
     * <dt>2150121487 (0x8028400F)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A compatible Trusted Platform Module (TPM) Security Device cannot be found on this computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsi_getdeviceinfo
     * @since windows8.0
     */
    static Tbsi_GetDeviceInfo(Size, Info) {
        result := DllCall("tbs.dll\Tbsi_GetDeviceInfo", "uint", Size, "ptr", Info, "uint")
        return result
    }

    /**
     * Retrieves the owner authorization of the TPM if the information is available in the local registry.
     * @param {Pointer<Void>} hContext TBS handle obtained from a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/tbs/nf-tbs-tbsi_context_create">Tbsi_Context_Create</a> function.
     * @param {Integer} ownerauthType Unsigned 32-bit integer indicating the type of owner authentication.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_OWNERAUTH_TYPE_FULL"></a><a id="tbs_ownerauth_type_full"></a><dl>
     * <dt><b>TBS_OWNERAUTH_TYPE_FULL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 	The owner authorization is full.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_OWNERAUTH_TYPE_ADMIN"></a><a id="tbs_ownerauth_type_admin"></a><dl>
     * <dt><b>TBS_OWNERAUTH_TYPE_ADMIN</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Note</b>  TPM 1.2 only
     * 
     * The owner authorization is an administrator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_OWNERAUTH_TYPE_USER"></a><a id="tbs_ownerauth_type_user"></a><dl>
     * <dt><b>TBS_OWNERAUTH_TYPE_USER</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Note</b>  TPM 1.2 only
     * 
     * The owner authorization is a user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_OWNERAUTH_TYPE_ENDORSEMENT"></a><a id="tbs_ownerauth_type_endorsement"></a><dl>
     * <dt><b>TBS_OWNERAUTH_TYPE_ENDORSEMENT</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Note</b>  TPM 1.2 only
     * 
     * The owner authorization is an endorsement authorization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_OWNERAUTH_TYPE_ENDORSEMENT_20_"></a><a id="tbs_ownerauth_type_endorsement_20_"></a><dl>
     * <dt><b>TBS_OWNERAUTH_TYPE_ENDORSEMENT_20 </b></dt>
     * <dt>12</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Note</b>  TPM 2.0 and later
     * 
     * The owner authorization is an endorsement authorization. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_OWNERAUTH_TYPE_STORAGE_20_"></a><a id="tbs_ownerauth_type_storage_20_"></a><dl>
     * <dt><b>TBS_OWNERAUTH_TYPE_STORAGE_20 </b></dt>
     * <dt>13</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Note</b>  TPM 2.0 and later
     * 
     * The owner authorization is an administrator.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pOutputBuf A pointer to a buffer to receive the TPM owner authorization information.
     * @param {Pointer<UInt32>} pOutputBufLen An integer that, on input, specifies the size, in bytes, of the output buffer. On successful return, this value is set to the actual size of the TPM ownerAuth, in bytes.
     * @returns {Integer} If the function succeeds, the function returns <b>TBS_SUCCESS</b>.
     * 
     * If the function fails, it returns a TBS return code that indicates the error.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_OWNERAUTH_NOT_FOUND</b></dt>
     * <dt>2150121493 (0x80284015)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested TPM ownerAuth value was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_BAD_PARAMETER</b></dt>
     * <dt>2150121474 (0x80284002)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested TPM ownerAuth value does not match the TPM version.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsi_get_ownerauth
     * @since windows8.0
     */
    static Tbsi_Get_OwnerAuth(hContext, ownerauthType, pOutputBuf, pOutputBufLen) {
        result := DllCall("tbs.dll\Tbsi_Get_OwnerAuth", "ptr", hContext, "uint", ownerauthType, "ptr", pOutputBuf, "uint*", pOutputBufLen, "uint")
        return result
    }

    /**
     * Invalidates the PCRs if the ELAM driver detects a policy-violation (a rootkit, for example).
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INTERNAL_ERROR</b></dt>
     * <dt>2150121473 (0x80284001)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal software error occurred. 
     * 
     * <div class="alert"><b>Note</b>  If TBS_E_INTERNAL_ERROR is returned, the system event log may contain event ID 16385 from the TBS event source with error code 0x80070032.  This may indicate that the hardware platform does not provide a TCG event log to the operating system.  Sometimes this can be resolved by installing a BIOS upgrade from the platform manufacturer.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsi_revoke_attestation
     * @since windows8.0
     */
    static Tbsi_Revoke_Attestation() {
        result := DllCall("tbs.dll\Tbsi_Revoke_Attestation", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} pbWindowsAIK 
     * @param {Integer} cbWindowsAIK 
     * @param {Pointer<UInt32>} pcbResult 
     * @param {Pointer<Int32>} pfProtectedByTPM 
     * @returns {HRESULT} 
     */
    static GetDeviceID(pbWindowsAIK, cbWindowsAIK, pcbResult, pfProtectedByTPM) {
        result := DllCall("tbs.dll\GetDeviceID", "ptr", pbWindowsAIK, "uint", cbWindowsAIK, "uint*", pcbResult, "int*", pfProtectedByTPM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} pszWindowsAIK 
     * @param {Integer} cchWindowsAIK 
     * @param {Pointer<UInt32>} pcchResult 
     * @param {Pointer<Int32>} pfProtectedByTPM 
     * @returns {HRESULT} 
     */
    static GetDeviceIDString(pszWindowsAIK, cchWindowsAIK, pcchResult, pfProtectedByTPM) {
        pszWindowsAIK := pszWindowsAIK is String? StrPtr(pszWindowsAIK) : pszWindowsAIK

        result := DllCall("tbs.dll\GetDeviceIDString", "ptr", pszWindowsAIK, "uint", cchWindowsAIK, "uint*", pcchResult, "int*", pfProtectedByTPM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} keyHandle 
     * @returns {Integer} 
     */
    static Tbsi_Create_Windows_Key(keyHandle) {
        result := DllCall("tbs.dll\Tbsi_Create_Windows_Key", "uint", keyHandle, "uint")
        return result
    }

    /**
     * Gets the Windows Boot Configuration Log (WBCL), also referred to as the TCG log, of the specified type.
     * @param {Integer} logType The type of log to retrieve.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_TCGLOG_SRTM_CURRENT"></a><a id="tbs_tcglog_srtm_current"></a><dl>
     * <dt><b>TBS_TCGLOG_SRTM_CURRENT</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The log associated with PCRs 0-15 for the current session (boot or resume).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_TCGLOG_DRTM_CURRENT"></a><a id="tbs_tcglog_drtm_current"></a><dl>
     * <dt><b>TBS_TCGLOG_DRTM_CURRENT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The log associated with PCRs 17-22 for the current session (boot or resume).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_TCGLOG_SRTM_BOOT"></a><a id="tbs_tcglog_srtm_boot"></a><dl>
     * <dt><b>TBS_TCGLOG_SRTM_BOOT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The log associated with PCRs 0-15 for the most recent clean boot session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TBS_TCGLOG_SRTM_RESUME"></a><a id="tbs_tcglog_srtm_resume"></a><dl>
     * <dt><b>TBS_TCGLOG_SRTM_RESUME</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The log associated with PCRs 0-15 for the most recent resume from hibernation.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pbOutput Pointer to a buffer that receives and stores the WBCL. Set to <b>NULL</b> to estimate the required buffer when the location pointed to by <i>pcbOutput</i> is also 0 on input.
     * @param {Pointer<UInt32>} pcbOutput Pointer to an unsigned long integer that specifies the size, in bytes, of the output buffer. On success, contains the size, in bytes, of the data pointed to by <i>pOutput</i>. On failure, does not contain a value.
     * 
     * <b>Note</b>  If <i>pbOutput</i> is <b>NULL</b> and the location pointed to by <i>pcbOutput</i> is 0, the function returns <b>TBS_E_BUFFER_TOO_SMALL</b>. In that case, <i>pcbOutput</i> will point to the required size of <i>pbOutput</i>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_NO_EVENT_LOG</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>TBS_TCGLOG_DRTM_CURRENT</b> was requested but DRTM was not enabled on the system when the system booted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INTERNAL_ERROR</b></dt>
     * <dt>2150121473 (0x80284001)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal software error occurred. 
     * 
     * <div class="alert"><b>Note</b>  If <b>TBS_E_INTERNAL_ERROR</b> is returned, the system event log may contain event ID 16385 from the TBS event source with error code 0x80070032.  This may indicate that the hardware platform does not provide a TCG event log to the operating system.  Sometimes this can be resolved by installing a BIOS upgrade from the platform manufacturer.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INVALID_OUTPUT_POINTER</b></dt>
     * <dt>2150121475 (0x80284003)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified output pointer is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_INSUFFICIENT_BUFFER</b></dt>
     * <dt>2150121477 (0x80284005)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_BUFFER_TOO_LARGE</b></dt>
     * <dt>2150121486 (0x8028400E)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer is too large.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_TPM_NOT_FOUND</b></dt>
     * <dt>2150121487 (0x8028400F)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A compatible Trusted Platform Module (TPM) Security Device cannot be found on this computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TBS_E_DEACTIVATED</b></dt>
     * <dt>2150121494 (0x80284016)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Trusted Platform Module (TPM) Security Device is deactivated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tbs/nf-tbs-tbsi_get_tcg_log_ex
     * @since windows10.0.17134
     */
    static Tbsi_Get_TCG_Log_Ex(logType, pbOutput, pcbOutput) {
        result := DllCall("tbs.dll\Tbsi_Get_TCG_Log_Ex", "uint", logType, "ptr", pbOutput, "uint*", pcbOutput, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static Tbsi_Is_Tpm_Present() {
        result := DllCall("tbs.dll\Tbsi_Is_Tpm_Present", "int")
        return result
    }

;@endregion Methods
}
