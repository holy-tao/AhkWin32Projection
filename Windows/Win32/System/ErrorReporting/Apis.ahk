#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class ErrorReporting {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_NO_UI => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_FLAG_NO_HEAP_ON_QUEUE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_DISABLE_SNAPSHOT_CRASH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_DISABLE_SNAPSHOT_HANG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_CRITICAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_DURABLE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_TOTAL_PARAM_LENGTH => 1720

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_PREFERRED_MODULES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_PREFERRED_MODULES_BUFFER => 256

    /**
     * @type {String}
     */
    static APPCRASH_EVENT => "APPCRASH"

    /**
     * @type {String}
     */
    static PACKAGED_APPCRASH_EVENT => "MoAppCrash"

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WER_P9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FILE_COMPRESSED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_BYPASS_POWER_THROTTLING => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static WER_SUBMIT_BYPASS_NETWORK_COST_THROTTLING => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WER_DUMP_MASK_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WER_DUMP_NOHEAP_ONQUEUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WER_DUMP_AUXILIARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_REGISTERED_ENTRIES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_REGISTERED_METADATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_REGISTERED_DUMPCOLLECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WER_METADATA_KEY_MAX_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WER_METADATA_VALUE_MAX_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_SIGNATURE_NAME_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_EVENT_NAME_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_PARAM_LENGTH => 260

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_PARAM_COUNT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_FRIENDLY_EVENT_NAME_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_APPLICATION_NAME_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_DESCRIPTION_LENGTH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_BUCKET_ID_STRING_LENGTH => 260

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_LOCAL_DUMP_SUBPATH_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WER_MAX_REGISTERED_RUNTIME_EXCEPTION_MODULES => 16

    /**
     * @type {String}
     */
    static WER_RUNTIME_EXCEPTION_EVENT_FUNCTION => "OutOfProcessExceptionEventCallback"

    /**
     * @type {String}
     */
    static WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE_FUNCTION => "OutOfProcessExceptionEventSignatureCallback"

    /**
     * @type {String}
     */
    static WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH => "OutOfProcessExceptionEventDebuggerLaunchCallback"
;@endregion Constants

;@region Methods
    /**
     * Creates a problem report that describes an application event.
     * @remarks
     * Use the following functions to specify additional information to be submitted:
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportadddump">WerReportAddDump</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportaddfile">WerReportAddFile</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportsetparameter">WerReportSetParameter</a>
     * To submit the information, call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportsubmit">WerReportSubmit</a> function. When you have finished with the report handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportclosehandle">WerReportCloseHandle</a> function.
     * 
     * Applications can also indicate that they would like the opportunity to recover data or restart on failure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">Application Recovery and Restart</a>.
     * 
     * To view the reports submitted by your application, go to Windows Quality Online Services.
     * @param {Pointer<PWSTR>} pwzEventType A pointer to a Unicode string that specifies the name of the event.
     * @param {Integer} repType 
     * @param {Pointer<WER_REPORT_INFORMATION>} pReportInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_report_information">WER_REPORT_INFORMATION</a> structure that specifies information for the report.
     * @param {Pointer<HREPORT>} phReportHandle A handle to the report. If the function fails, this handle is <b>NULL</b>.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werreportcreate
     * @since windows6.0.6000
     */
    static WerReportCreate(pwzEventType, repType, pReportInformation, phReportHandle) {
        result := DllCall("wer.dll\WerReportCreate", "ptr", pwzEventType, "int", repType, "ptr", pReportInformation, "ptr", phReportHandle, "int")
        return result
    }

    /**
     * Sets the parameters that uniquely identify an event for the specified report.
     * @remarks
     * Each report supports parameters P0 through P9. This function sets one parameter at a time. If parameter P<i>x</i> is set, then all parameters from P0 and P<i>x</i> must be set.
     * @param {Pointer<HREPORT>} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {Integer} dwparamID 
     * @param {Pointer<PWSTR>} pwzName A pointer to a Unicode string that contains the name of the parameter. If this parameter is <b>NULL</b>, the default name is P<i>x</i>, where <i>x</i> matches the integer portion of the value specified in <i>dwparamID</i>.
     * @param {Pointer<PWSTR>} pwzValue The parameter value.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_LENGTH_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length of one or more string arguments has exceeded its limit.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werreportsetparameter
     * @since windows6.0.6000
     */
    static WerReportSetParameter(hReportHandle, dwparamID, pwzName, pwzValue) {
        result := DllCall("wer.dll\WerReportSetParameter", "ptr", hReportHandle, "uint", dwparamID, "ptr", pwzName, "ptr", pwzValue, "int")
        return result
    }

    /**
     * Adds a file to the specified report.
     * @remarks
     * Although this function can also be used to add memory dumps (using specific flags) to the error report, the preferred function to use for adding memory dumps is <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportadddump">WerReportAddDump</a>. You should use this function only if you want to collect the dump yourself and then add it to the report.
     * @param {Pointer<HREPORT>} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {Pointer<PWSTR>} pwzPath A pointer to a Unicode string that contains the full path to the file to be added. This path can use environment variables. The maximum length of this path is MAX_PATH characters.
     * @param {Integer} repFileType 
     * @param {Integer} dwFileFlags 
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified file does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified file is a user-document and is stored on an encrypted file-system; this combination is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werreportaddfile
     * @since windows6.0.6000
     */
    static WerReportAddFile(hReportHandle, pwzPath, repFileType, dwFileFlags) {
        result := DllCall("wer.dll\WerReportAddFile", "ptr", hReportHandle, "ptr", pwzPath, "int", repFileType, "uint", dwFileFlags, "int")
        return result
    }

    /**
     * Sets the user interface options for the specified report.
     * @param {Pointer<HREPORT>} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {Integer} repUITypeID 
     * @param {Pointer<PWSTR>} pwzValue A pointer to a Unicode string that specifies the custom text. For more information, see the description of <i>repUITypeID</i>.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werreportsetuioption
     * @since windows6.0.6000
     */
    static WerReportSetUIOption(hReportHandle, repUITypeID, pwzValue) {
        result := DllCall("wer.dll\WerReportSetUIOption", "ptr", hReportHandle, "int", repUITypeID, "ptr", pwzValue, "int")
        return result
    }

    /**
     * Submits the specified report.
     * @remarks
     * After the application calls this function, WER collects the specified data. If the <i>consent</i> parameter is WerConsentApproved, it submits the report to Microsoft. If <i>consent</i> is WerConsentNotAsked, WER displays the consent dialog box. To determine the submission status, check the <i>pSubmitResult</i> parameter.
     * 
     * In the event of a critical application event, applications that have <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerapplicationrestart">registered for restart</a> will be restarted.
     * 
     * The computer identifier is sent with the report when
     * 
     * <ul>
     * <li>The consent used to send the report does not come from the application. For example, the report was submitted with consent status set to WerConsentNotAsked.</li>
     * <li>The report was submitted with the WER_SUBMIT_REPORT_MACHINE_ID flag set.</li>
     * </ul>
     * To view the reports submitted by your application, go to Windows Quality Online Services.
     * @param {Pointer<HREPORT>} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {Integer} consent 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} pSubmitResult 
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werreportsubmit
     * @since windows6.0.6000
     */
    static WerReportSubmit(hReportHandle, consent, dwFlags, pSubmitResult) {
        result := DllCall("wer.dll\WerReportSubmit", "ptr", hReportHandle, "int", consent, "uint", dwFlags, "ptr", pSubmitResult, "int")
        return result
    }

    /**
     * Adds a dump of the specified type to the specified report.
     * @remarks
     * Use this function only for generic reporting—it has no effect on operating system crash or no-response reporting.
     * 
     * If the server asks for a mini dump and you specify <b>WerDumpTypeHeapDump</b> for the <i>dumpType</i> parameter, WER will not send the heap dump to the Watson server. However, if the server asks for a heap dump and the <i>dumpType</i> is <b>WerDumpTypeMiniDump</b>, WER will send the mini dump to the server. Thus, it is recommended that you set <i>dumpType</i> to <b>WerDumpTypeMiniDump</b>.
     * @param {Pointer<HREPORT>} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {Pointer<HANDLE>} hProcess A handle to the process for which the report is being generated. This handle must have the STANDARD_RIGHTS_READ and PROCESS_QUERY_INFORMATION access rights.
     * @param {Pointer<HANDLE>} hThread A handle to the thread of <i>hProcess</i> for which the report is being generated. If <i>dumpType</i> is WerDumpTypeMicro, this parameter is required. For other dump types, this parameter may be <b>NULL</b>.
     * @param {Integer} dumpType 
     * @param {Pointer<WER_EXCEPTION_INFORMATION>} pExceptionParam A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_exception_information">WER_EXCEPTION_INFORMATION</a> structure that specifies exception information.
     * @param {Pointer<WER_DUMP_CUSTOM_OPTIONS>} pDumpCustomOptions A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_dump_custom_options">WER_DUMP_CUSTOM_OPTIONS</a> structure that specifies custom minidump options. If this parameter is <b>NULL</b>, the standard minidump information is collected.
     * @param {Integer} dwFlags This parameter can be 0 or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WER_DUMP_NOHEAP_ONQUEUE"></a><a id="wer_dump_noheap_onqueue"></a><dl>
     * <dt><b>WER_DUMP_NOHEAP_ONQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the report is being queued, do not include a heap dump. Using this flag saves disk space.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werreportadddump
     * @since windows6.0.6000
     */
    static WerReportAddDump(hReportHandle, hProcess, hThread, dumpType, pExceptionParam, pDumpCustomOptions, dwFlags) {
        result := DllCall("wer.dll\WerReportAddDump", "ptr", hReportHandle, "ptr", hProcess, "ptr", hThread, "int", dumpType, "ptr", pExceptionParam, "ptr", pDumpCustomOptions, "uint", dwFlags, "int")
        return result
    }

    /**
     * Closes the specified report.
     * @param {Pointer<HREPORT>} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werreportclosehandle
     * @since windows6.0.6000
     */
    static WerReportCloseHandle(hReportHandle) {
        result := DllCall("wer.dll\WerReportCloseHandle", "ptr", hReportHandle, "int")
        return result
    }

    /**
     * Registers a file to be collected when WER creates an error report.
     * @remarks
     * The registered file is added to the report only when additional data is requested by the server.
     * 
     * For crashes and non-responses, the operating system automatically provides error reporting (you do not need to provide any error reporting code in your application). If you use this function to register a file, the operating system will add the file to the error report created at the time of a crash or non-response (this file is added in addition to the files the operating system already collects).
     * 
     * 
     * For generic event reporting, the application has to use the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportaddfile">WerReportAddFile</a> function instead. Alternatively, calling the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportsubmit">WerReportSubmit</a> function with the  WER_SUBMIT_ADD_REGISTERED_DATA flag will include the files that the <b>WerRegisterFile</b> function added.
     * 
     * 
     * To remove the file from the list, call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werunregisterfile">WerUnregisterFile</a> function.
     * @param {Pointer<PWSTR>} pwzFile The full path to the file. The maximum length of this path is MAX_PATH characters.
     * @param {Integer} regFileType 
     * @param {Integer} dwFlags 
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of registered memory blocks and files exceeds the limit.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werregisterfile
     * @since windows6.0.6000
     */
    static WerRegisterFile(pwzFile, regFileType, dwFlags) {
        result := DllCall("KERNEL32.dll\WerRegisterFile", "ptr", pwzFile, "int", regFileType, "uint", dwFlags, "int")
        return result
    }

    /**
     * Removes a file from the list of files to be added to reports generated for the current process.
     * @param {Pointer<PWSTR>} pwzFilePath The full path to the file. This file must have been registered using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregisterfile">WerRegisterFile</a> function.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The list of registered files does not contain the specified file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werunregisterfile
     * @since windows6.0.6000
     */
    static WerUnregisterFile(pwzFilePath) {
        result := DllCall("KERNEL32.dll\WerUnregisterFile", "ptr", pwzFilePath, "int")
        return result
    }

    /**
     * Registers a memory block to be collected when WER creates an error report.
     * @remarks
     * Memory registered with this function is only added to heap or larger dump files. This memory is never added to mini dumps or smaller dump files.
     * 
     * For crashes and no response, the operating system automatically provides error reporting (you do not need to provide any error reporting code in your application). If you use this function to register a memory block, the operating system will add the memory block information to the dump file at the time of the crash or non-response. The memory block is added to the dump file for the report only when additional data is requested by the server.
     * 
     * For generic event reporting, the application has to call the WER generic event reporting functions directly. To add the memory block to a generic report, call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportadddump">WerReportAddDump</a> function and then call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportsubmit">WerReportSubmit</a> function and specify the  WER_SUBMIT_ADD_REGISTERED_DATA flag.
     * 
     * 
     * To remove the block from this list, call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werunregistermemoryblock">WerUnregisterMemoryBlock</a> function.
     * @param {Pointer<Void>} pvAddress The starting address of the memory block.
     * @param {Integer} dwSize The size of the memory block, in bytes. The maximum value for this parameter is WER_MAX_MEM_BLOCK_SIZE bytes.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of registered memory blocks and files exceeds the limit.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werregistermemoryblock
     * @since windows6.0.6000
     */
    static WerRegisterMemoryBlock(pvAddress, dwSize) {
        result := DllCall("KERNEL32.dll\WerRegisterMemoryBlock", "ptr", pvAddress, "uint", dwSize, "int")
        return result
    }

    /**
     * Removes a memory block from the list of data to be collected during error reporting for the application.
     * @param {Pointer<Void>} pvAddress The starting address of the memory block. This memory block must have been registered using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregistermemoryblock">WerRegisterMemoryBlock</a> function.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The list of registered memory blocks does not contain the specified memory block.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werunregistermemoryblock
     * @since windows6.0.6000
     */
    static WerUnregisterMemoryBlock(pvAddress) {
        result := DllCall("KERNEL32.dll\WerUnregisterMemoryBlock", "ptr", pvAddress, "int")
        return result
    }

    /**
     * Marks a memory block (that is normally included by default in error reports) to be excluded from the error report.
     * @remarks
     * This mechanism is intended for applications that hold large amounts of data in memory that aren't useful for root cause debugging and increase the size of the dump file unnecessarily.  For example, some Xbox One games hold large amounts of texture data in memory that is included in error dumps by default.
     * @param {Pointer<Void>} address The starting address of the memory block.
     * @param {Integer} size The size of the memory block, in bytes.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>address</i> is <b>NULL</b> or <i>size</i> is 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * WER could not allocate a large enough heap for the data
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of registered entries exceeds the limit (<b>WER_MAX_REGISTERED_ENTRIES</b>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werregisterexcludedmemoryblock
     * @since windows10.0.15063
     */
    static WerRegisterExcludedMemoryBlock(address, size) {
        result := DllCall("KERNEL32.dll\WerRegisterExcludedMemoryBlock", "ptr", address, "uint", size, "int")
        return result
    }

    /**
     * Removes a memory block that was previously marked as excluded (it will again be included in error reports).
     * @param {Pointer<Void>} address The starting address of the memory block. This memory block must have been registered using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregisterexcludedmemoryblock">WerRegisterExcludedMemoryBlock</a> function.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werunregisterexcludedmemoryblock
     * @since windows10.0.15063
     */
    static WerUnregisterExcludedMemoryBlock(address) {
        result := DllCall("KERNEL32.dll\WerUnregisterExcludedMemoryBlock", "ptr", address, "int")
        return result
    }

    /**
     * Registers app-specific metadata to be collected (in the form of key/value strings) when WER creates an error report.
     * @remarks
     * This API allows apps to integrate their own app-level telemetry with system-level telemetry (WER) by associating app metadata with crash reports corresponding to their processes.
     * @param {Pointer<PWSTR>} key The "key" string for the metadata element being registered.
     * @param {Pointer<PWSTR>} value The value string for the metadata element being registered.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Strings were <b>NULL</b>, key length was greater than 64 characters or was an invalid xml element name, or <i>value</i> length was greater than 128 characters or contained characters that were not ASCII printable characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * WER could not allocate a large enough heap for the data
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum number of registered entries (<b>WER_MAX_REGISTERED_ENTRIES</b>) or  maximum amount of registered metadata (<b>WER_MAX_REGISTERED_METADATA</b>) has been reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werregistercustommetadata
     * @since windows10.0.15063
     */
    static WerRegisterCustomMetadata(key, value) {
        result := DllCall("KERNEL32.dll\WerRegisterCustomMetadata", "ptr", key, "ptr", value, "int")
        return result
    }

    /**
     * Removes an item of app-specific metadata being collected during error reporting for the application.
     * @param {Pointer<PWSTR>} key The "key" string for the metadata element being removed. It must have been previously registered with the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregistercustommetadata">WerRegisterCustomMetadata</a> function.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * WER could not find the metadata item to remove.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werunregistercustommetadata
     * @since windows10.0.15063
     */
    static WerUnregisterCustomMetadata(key) {
        result := DllCall("KERNEL32.dll\WerUnregisterCustomMetadata", "ptr", key, "int")
        return result
    }

    /**
     * Registers a process to be included in the error report along with the main application process. Optionally specifies a thread within that registered process to get additional data from.
     * @remarks
     * This API is for applications that have multiple processes interacting with each other. An application's main process would register the Id of another process. When the registering process crashes, WER will add an additional triage dump of the registered process to the resulting diagnostics. Optionally, the registering process can provide a thread Id as well to get more data for that specific thread.
     * @param {Integer} processId The Id of the process to register.
     * @param {Integer} captureExtraInfoForThreadId The Id of a thread within the registered process from which more information is requested.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>processId</i> is 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * WER could not allocate a large enough heap for the data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of WER registered entries (memory blocks, metadata, files) exceeds max (<b>WER_MAX_REGISTERED_ENTRIES</b>) or number of processes exceeds max (<b>WER_MAX_REGISTERED_DUMPCOLLECTION</b>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werregisteradditionalprocess
     * @since windows10.0.15063
     */
    static WerRegisterAdditionalProcess(processId, captureExtraInfoForThreadId) {
        result := DllCall("KERNEL32.dll\WerRegisterAdditionalProcess", "uint", processId, "uint", captureExtraInfoForThreadId, "int")
        return result
    }

    /**
     * Removes a process from the list of additional processes to be included in the error report.
     * @param {Integer} processId The Id of the process to remove. It must have been previously registered with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregisteradditionalprocess">WerRegisterAdditionalProcess</a>.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The list of registered processes does not contain the specified process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werunregisteradditionalprocess
     * @since windows10.0.15063
     */
    static WerUnregisterAdditionalProcess(processId) {
        result := DllCall("KERNEL32.dll\WerUnregisterAdditionalProcess", "uint", processId, "int")
        return result
    }

    /**
     * Registers a path relative to the local app store for the calling application where Windows Error Reporting (WER) should save a copy of the diagnostic memory dump that WER collects when one of the processes for the application stops responding.
     * @remarks
     * A packaged application calls **WerRegisterAppLocalDump** when the application launches to request a copy of the diagnostic memory dump that WER collects  if or when one of the processes  for the application stops responding.
     * 
     * WER does not manage storage at the location that the relative path specifies or the number of memory dumps that are collected for the application.
     * @param {Pointer<PWSTR>} localAppDataRelativePath The path relative to the local app store for the calling application where WER should save a copy of the diagnostic memory dump that WER collects when one of the processes for the application stops responding. The maximum length for this relative path in characters is **WER_MAX_LOCAL_DUMP_SUBPATH_LENGTH**, which has a value of 64. This maximum length includes the null-termination character.
     * @returns {Integer} This function returns **S_OK** on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>**WER_E_INVALID_STATE**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process cannot store the memory dump, or WER cannot create a location to store the memory dump.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>**E_INVALIDARG**</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>localAppDataRelativePath</i> parameter is NULL or is longer than 64 characters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werregisterapplocaldump
     * @since windows10.0.16299
     */
    static WerRegisterAppLocalDump(localAppDataRelativePath) {
        result := DllCall("KERNEL32.dll\WerRegisterAppLocalDump", "ptr", localAppDataRelativePath, "int")
        return result
    }

    /**
     * Cancels the registration that was made by calling the WerRegisterAppLocalDump function to specify that Windows Error Reporting (WER) should save a copy of the diagnostic memory dump that WER collects when one of the processes for the application stops responding.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werunregisterapplocaldump
     * @since windows10.0.16299
     */
    static WerUnregisterAppLocalDump() {
        result := DllCall("KERNEL32.dll\WerUnregisterAppLocalDump", "int")
        return result
    }

    /**
     * Sets the fault reporting settings for the current process.
     * @param {Integer} dwFlags 
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-wersetflags
     * @since windows6.0.6000
     */
    static WerSetFlags(dwFlags) {
        result := DllCall("KERNEL32.dll\WerSetFlags", "uint", dwFlags, "int")
        return result
    }

    /**
     * Retrieves the fault reporting settings for the specified process.
     * @param {Pointer<HANDLE>} hProcess A handle to the process. This handle must have the PROCESS_VM_READ or PROCESS_QUERY_INFORMATION access right.
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-wergetflags
     * @since windows6.0.6000
     */
    static WerGetFlags(hProcess, pdwFlags) {
        result := DllCall("KERNEL32.dll\WerGetFlags", "ptr", hProcess, "ptr", pdwFlags, "int")
        return result
    }

    /**
     * Adds the specified application to the list of applications that are to be excluded from error reporting.
     * @remarks
     * If <i>bAllUsers</i> is <b>TRUE</b>, the list of excluded applications is stored under the HKEY_LOCAL_MACHINE registry hive. The calling process must have permissions to write to the HKLM registry hive.
     * If <i>bAllUsers</i> is <b>FALSE</b>, the list of excluded applications is stored under the HKEY_CURRENT_USER registry hive.
     * 
     * To remove the application from the list of excluded applications, call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werremoveexcludedapplication">WerRemoveExcludedApplication</a> function.
     * @param {Pointer<PWSTR>} pwzExeName A pointer to a Unicode string that specifies the name of the executable file for the application, including the file name extension. The maximum length of this path is MAX_PATH characters.
     * @param {Integer} bAllUsers If this parameter is <b>TRUE</b>, the application name is added to the list of excluded applications for all users. Otherwise, it is only added to the list of excluded applications for the current user.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process does not have permissions to update the list in the registry. See the Remarks section for additional information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-weraddexcludedapplication
     * @since windows6.0.6000
     */
    static WerAddExcludedApplication(pwzExeName, bAllUsers) {
        result := DllCall("wer.dll\WerAddExcludedApplication", "ptr", pwzExeName, "int", bAllUsers, "int")
        return result
    }

    /**
     * Removes the specified application from the list of applications that are to be excluded from error reporting.
     * @remarks
     * This function removes applications that were added to the excluded applications list using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-weraddexcludedapplication">WerAddExcludedApplication</a> function.
     * 
     * If <i>bAllUsers</i> is <b>TRUE</b>, the list of excluded applications is stored under the HKEY_LOCAL_MACHINE registry hive. The calling process must have permissions to write to HKLM registry hive.
     * If <i>bAllUsers</i> is <b>FALSE</b>, the list of excluded applications is stored under the HKEY_CURRENT_USER registry hive.
     * @param {Pointer<PWSTR>} pwzExeName A pointer to a Unicode string that specifies the name of the executable file for the application, including the file name extension. The maximum length of this path is MAX_PATH characters.
     * 
     * This file must have been excluded using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-weraddexcludedapplication">WerAddExcludedApplication</a> function or <b>WerRemoveExcludedApplication</b> fails.
     * @param {Integer} bAllUsers If this parameter is <b>TRUE</b>, the application name is removed from the list of excluded applications for all users. Otherwise, it is only removed from the list of excluded applications for the current user.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process does not have access to update the list in the registry. See the Remarks section for additional information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werremoveexcludedapplication
     * @since windows6.0.6000
     */
    static WerRemoveExcludedApplication(pwzExeName, bAllUsers) {
        result := DllCall("wer.dll\WerRemoveExcludedApplication", "ptr", pwzExeName, "int", bAllUsers, "int")
        return result
    }

    /**
     * Registers a custom runtime exception handler that is used to provide custom error reporting for crashes.
     * @remarks
     * The exception handler is an out-of-process DLL that the WER service loads when a crash or unhandled exception occurs. The DLL must implement and export the following functions:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event">OutOfProcessExceptionEventCallback</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event_signature">OutOfProcessExceptionEventSignatureCallback</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_debugger_launch">OutOfProcessExceptionEventDebuggerLaunchCallback</a>
     * </li>
     * </ul>
     * (The DLL must also include the <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> entry point.)
     * 
     * Using an exception handler is more secure and reliable for reporting crash information than the current, in-process event reporting feature. Also, the current generic event reporting feature is suited only for reporting non-fatal errors.
     * 
     * This function requires that the <i>pwszOutOfProcessCallbackDll</i> DLL be included in the <a href="https://docs.microsoft.com/windows/desktop/wer/wer-settings">WER exception handler module list</a> in the registry. After registering an exception handler, if the process crashes or raises an unhandled exception, the WER service loads your exception handler and calls the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event">OutOfProcessExceptionEventCallback</a> callback function., which you use to state your claim on the crash and provide the event name and report parameters count. Note that if the process registers more than one exception handler, the service calls each handler until one of the handlers claims the crash. If no handlers claim the crash, WER defaults to native crash reporting.
     * 
     * If an exception handler claims the exception, the WER service calls the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event_signature">OutOfProcessExceptionEventSignatureCallback</a> callback function, which provides the reporting parameters that uniquely define the problem. Then, the WER service calls the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_debugger_launch">OutOfProcessExceptionEventDebuggerLaunchCallback</a> callback to determine whether to offer the user the option of launching  a debugger or launching the debugger automatically. The handler can also specify a custom debugger launch string, which will override the default string (the default is the debugger specified in the AeDebug registry key).
     * 
     * After the handler has provided the event name, reporting parameters and debugger launch settings, the rest of the error reporting flow continues in the usual way.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werunregisterruntimeexceptionmodule">WerUnregisterRuntimeExceptionModule</a> function to remove the registration before your process exits. A process can register up to WER_MAX_REGISTERED_RUNTIME_EXCEPTION_MODULES handlers.
     * @param {Pointer<PWSTR>} pwszOutOfProcessCallbackDll The name of the exception handler DLL to register.
     * @param {Pointer<Void>} pContext A pointer to arbitrary context information that is passed to the handler's callback functions.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of registered runtime exception modules exceeds the limit. A process can register up to WER_MAX_REGISTERED_RUNTIME_EXCEPTION_MODULES handlers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werregisterruntimeexceptionmodule
     * @since windows6.1
     */
    static WerRegisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll, pContext) {
        result := DllCall("KERNEL32.dll\WerRegisterRuntimeExceptionModule", "ptr", pwszOutOfProcessCallbackDll, "ptr", pContext, "int")
        return result
    }

    /**
     * Removes the registration of your WER exception handler.
     * @remarks
     * To register your runtime exception handler, call the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregisterruntimeexceptionmodule">WerRegisterRuntimeExceptionModule</a> function.
     * @param {Pointer<PWSTR>} pwszOutOfProcessCallbackDll The name of the exception handler DLL whose registration you want to remove.
     * @param {Pointer<Void>} pContext A pointer to arbitrary context information that was passed to the callback.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process state is not valid. For example, the process is in <a href="https://docs.microsoft.com/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The list of registered runtime exception handlers does not contain the specified exception handler.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werunregisterruntimeexceptionmodule
     * @since windows6.1
     */
    static WerUnregisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll, pContext) {
        result := DllCall("KERNEL32.dll\WerUnregisterRuntimeExceptionModule", "ptr", pwszOutOfProcessCallbackDll, "ptr", pContext, "int")
        return result
    }

    /**
     * Opens the collection of stored error reports.
     * @remarks
     * A <i>storeType</i> value of <b>E_STORE_MACHINE_QUEUE</b> opens the queue of all error reports on the machine that have not yet been sent to Microsoft. A value of  <b>E_STORE_MACHINE_ARCHIVE</b> opens the store of error reports that have already been sent.
     * 
     * The Windows Error Report (WER) Store is the queue of error reports that have been marked to be sent to Microsoft but have not yet been uploaded. The upload of an error report can be postponed under a number of circumstances. The WerStore functions allow developers to access the stored reports and query the status of each one.
     * @param {Integer} repStoreType The type of report store to open. See Remarks for details.
     * @param {Pointer<HREPORTSTORE>} phReportStore A pointer to a report store. On a successful call, this will point to the retrieved report store.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not a valid value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werstoreopen
     * @since windows10.0.15063
     */
    static WerStoreOpen(repStoreType, phReportStore) {
        result := DllCall("wer.dll\WerStoreOpen", "int", repStoreType, "ptr", phReportStore, "int")
        return result
    }

    /**
     * Closes the collection of stored reports.
     * @param {Pointer<HREPORTSTORE>} hReportStore The error report store to close (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoreopen">WerStoreOpen</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werstoreclose
     * @since windows10.0.15063
     */
    static WerStoreClose(hReportStore) {
        DllCall("wer.dll\WerStoreClose", "ptr", hReportStore)
    }

    /**
     * Gets a reference to the first report in the report store.
     * @param {Pointer<HREPORTSTORE>} hReportStore The error report store (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoreopen">WerStoreOpen</a>).
     * @param {Pointer<PWSTR>} ppszReportKey A pointer to the report key string. On a successful call, this will point to the retrieved report key.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no error reports in the store.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werstoregetfirstreportkey
     * @since windows10.0.15063
     */
    static WerStoreGetFirstReportKey(hReportStore, ppszReportKey) {
        result := DllCall("wer.dll\WerStoreGetFirstReportKey", "ptr", hReportStore, "ptr", ppszReportKey, "int")
        return result
    }

    /**
     * Gets a reference to the next report in the error report store.
     * @param {Pointer<HREPORTSTORE>} hReportStore The error report store (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoreopen">WerStoreOpen</a>).
     * @param {Pointer<PWSTR>} ppszReportKey A pointer to the report key string. On a successful call, this will point to the retrieved report key.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more error reports in the store.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werstoregetnextreportkey
     * @since windows10.0.15063
     */
    static WerStoreGetNextReportKey(hReportStore, ppszReportKey) {
        result := DllCall("wer.dll\WerStoreGetNextReportKey", "ptr", hReportStore, "ptr", ppszReportKey, "int")
        return result
    }

    /**
     * Retrieves metadata about a report in the store.
     * @param {Pointer<HREPORTSTORE>} hReportStore The error report store (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoreopen">WerStoreOpen</a>).
     * @param {Pointer<PWSTR>} pszReportKey The string identifying which report is being queried (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoregetfirstreportkey">WerStoreGetFirstReportKey</a> or <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoregetnextreportkey">WerStoreGetNextReportKey</a>).
     * @param {Pointer<WER_REPORT_METADATA_V2>} pReportMetadata A pointer to the report store metadata in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_report_metadata_v2">WER_REPORT_METADATA_V2</a> structure. The field <b>SizeOfFileNames</b> should be set to 0 during the first call. The function updates this field with the required size to hold the file names associated with the report. The field <b>FileNames</b> should then be allocated with <b>SizeOfFileNames</b> bytes and the function should be called again to get all of the file names.
     * @returns {Integer} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALID_ARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments is not a valid value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to retrieve the metadata. In this case, the caller should allocate memory of size <b>SizeOfFileNames</b> for the <b>FileNames</b> field, found in the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_report_metadata_v2">WER_REPORT_METADATA_V2</a> structure, and call the function again. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werstorequeryreportmetadatav2
     * @since windows10.0.15063
     */
    static WerStoreQueryReportMetadataV2(hReportStore, pszReportKey, pReportMetadata) {
        result := DllCall("wer.dll\WerStoreQueryReportMetadataV2", "ptr", hReportStore, "ptr", pszReportKey, "ptr", pReportMetadata, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HREPORTSTORE>} hReportStore 
     * @param {Pointer<PWSTR>} pszReportKey 
     * @param {Pointer<WER_REPORT_METADATA_V3>} pReportMetadata 
     * @returns {Integer} 
     */
    static WerStoreQueryReportMetadataV3(hReportStore, pszReportKey, pReportMetadata) {
        result := DllCall("wer.dll\WerStoreQueryReportMetadataV3", "ptr", hReportStore, "ptr", pszReportKey, "ptr", pReportMetadata, "int")
        return result
    }

    /**
     * Frees up the memory used to store a report key string. This should be called after each successive call to WerStoreGetFirstReportKey or WerStoreGetNextReportKey, once the particular report key string has been used and is no longer needed.
     * @param {Pointer<PWSTR>} pwszStr The string to be freed (value set to <b>NULL</b>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/werapi/nf-werapi-werfreestring
     * @since windows10.0.15063
     */
    static WerFreeString(pwszStr) {
        DllCall("wer.dll\WerFreeString", "ptr", pwszStr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static WerStorePurge() {
        result := DllCall("wer.dll\WerStorePurge", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HREPORTSTORE>} hReportStore 
     * @param {Pointer<UInt32>} pdwReportCount 
     * @returns {Integer} 
     */
    static WerStoreGetReportCount(hReportStore, pdwReportCount) {
        result := DllCall("wer.dll\WerStoreGetReportCount", "ptr", hReportStore, "ptr", pdwReportCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HREPORTSTORE>} hReportStore 
     * @param {Pointer<UInt64>} pqwSizeInBytes 
     * @returns {Integer} 
     */
    static WerStoreGetSizeOnDisk(hReportStore, pqwSizeInBytes) {
        result := DllCall("wer.dll\WerStoreGetSizeOnDisk", "ptr", hReportStore, "ptr", pqwSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HREPORTSTORE>} hReportStore 
     * @param {Pointer<PWSTR>} pszReportKey 
     * @param {Pointer<WER_REPORT_METADATA_V1>} pReportMetadata 
     * @returns {Integer} 
     */
    static WerStoreQueryReportMetadataV1(hReportStore, pszReportKey, pReportMetadata) {
        result := DllCall("wer.dll\WerStoreQueryReportMetadataV1", "ptr", hReportStore, "ptr", pszReportKey, "ptr", pReportMetadata, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HREPORTSTORE>} hReportStore 
     * @param {Pointer<PWSTR>} pszReportKey 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} pSubmitResult 
     * @returns {Integer} 
     */
    static WerStoreUploadReport(hReportStore, pszReportKey, dwFlags, pSubmitResult) {
        result := DllCall("wer.dll\WerStoreUploadReport", "ptr", hReportStore, "ptr", pszReportKey, "uint", dwFlags, "ptr", pSubmitResult, "int")
        return result
    }

    /**
     * Enables an application that performs its own exception handling to report faults to Microsoft.
     * @remarks
     * The exact result of calling this function depends on how the user or system administrator has configured the error reporting system.
     * @param {Pointer<EXCEPTION_POINTERS>} pep A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> structure.
     * @param {Integer} dwOpt This parameter is reserved for system use and should be set to zero.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/errorrep/nf-errorrep-reportfault
     * @since windows5.1.2600
     */
    static ReportFault(pep, dwOpt) {
        DllCall("faultrep.dll\ReportFault", "ptr", pep, "uint", dwOpt)
    }

    /**
     * Excludes the specified application from error reporting. (ANSI)
     * @remarks
     * This function stores the excluded application list under the <b>HKEY_LOCAL_MACHINE</b> hive. The calling process must have permissions to write to this registry hive.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The errorrep.h header defines AddERExcludedApplication as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} szApplication The name of the executable file for the application, including the file name extension. The name cannot contain path information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/errorrep/nf-errorrep-adderexcludedapplicationa
     * @since windows5.1.2600
     */
    static AddERExcludedApplicationA(szApplication) {
        A_LastError := 0

        result := DllCall("faultrep.dll\AddERExcludedApplicationA", "ptr", szApplication, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Excludes the specified application from error reporting. (Unicode)
     * @remarks
     * This function stores the excluded application list under the **HKEY_LOCAL_MACHINE** hive. The calling process must have permissions to write to this registry hive.
     * 
     * > [!NOTE]
     * > The errorrep.h header defines AddERExcludedApplication as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} wszApplication The name of the executable file for the application, including the file name extension. The name cannot contain path information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, see <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/errorrep/nf-errorrep-adderexcludedapplicationw
     * @since windows5.1.2600
     */
    static AddERExcludedApplicationW(wszApplication) {
        A_LastError := 0

        result := DllCall("faultrep.dll\AddERExcludedApplicationW", "ptr", wszApplication, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initiates &quot;no response&quot; reporting on the specified window.
     * @remarks
     * <div class="alert"><b>Caution</b>  Applications should not use this API to report no response from top-level windows; no-response detection and reporting is available to all top-level windows on Windows XP and later by default. You should only use this function to report no response from child windows. Typically, you would use this function only when the top-level window and its child windows are owned by different processes and a non-response is detected in a child window.</div>
     * <div> </div>
     * This function will initiate no-response reporting which will then terminate the process that created the window. The caller is responsible for determining when a child window is not responding and should prompt the user for consent before reporting the non-response. A typical way to detect a window that is not responding is to check that it replies to window messages in a timely manner. You can use the <b>SendMessageTimeout</b> function to detect this condition.
     * 
     * This function is asynchronous; it does not wait for no-response reporting to complete. There is no way to cancel no-response reporting after it is started.
     * 
     * If you use this function, it is important that you adhere to the following requirements:
     * 
     * <ul>
     * <li>Ensure that child windows are created by a separate process. After no-response reporting has completed, it will terminate the process that created the window.</li>
     * <li>Provide visual clues in the child window that it is not responding; no-response reporting will not dim the child window, it will only show the reporting dialog box.</li>
     * <li>Confirm that the user wants to terminate the child window that is not responding before calling this function.</li>
     * <li>To have the no-response reporting UI appear in front of the window that is not responding, the application should call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-allowsetforegroundwindow">AllowSetForegroundWindow</a> (passing ASFW_ANY for the process identifier) function from the top-level window's process.</li>
     * </ul>
     * @param {Pointer<HWND>} hwndHungApp Handle to the window that is not responding.
     * @param {Pointer<PWSTR>} pwzHungApplicationName The name of the not-responding application to be shown in the Hang Reporting UI. The name is limited to 128 characters including the <b>NULL</b> terminator. If <b>NULL</b>, WER tries to get the name from the target image resources. If it cannot get the name from the image, the image name will be used.
     * @returns {Integer} Returns S_OK if the function was able to initiate the reporting or an error code on failure. Note that S_OK does not necessarily mean that "no response" reporting has completed successfully, only that it was initiated.
     * @see https://learn.microsoft.com/windows/win32/api/errorrep/nf-errorrep-werreporthang
     * @since windows6.0.6000
     */
    static WerReportHang(hwndHungApp, pwzHungApplicationName) {
        result := DllCall("faultrep.dll\WerReportHang", "ptr", hwndHungApp, "ptr", pwzHungApplicationName, "int")
        return result
    }

;@endregion Methods
}
