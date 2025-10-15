#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
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
    static WER_DUMP_AUX_PROMOTE => 4

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
     * @param {PWSTR} pwzEventType A pointer to a Unicode string that specifies the name of the event.
     * @param {Integer} repType 
     * @param {Pointer<WER_REPORT_INFORMATION>} pReportInformation A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_report_information">WER_REPORT_INFORMATION</a> structure that specifies information for the report.
     * @param {Pointer<HREPORT>} phReportHandle A handle to the report. If the function fails, this handle is <b>NULL</b>.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werreportcreate
     * @since windows6.0.6000
     */
    static WerReportCreate(pwzEventType, repType, pReportInformation, phReportHandle) {
        pwzEventType := pwzEventType is String ? StrPtr(pwzEventType) : pwzEventType

        result := DllCall("wer.dll\WerReportCreate", "ptr", pwzEventType, "int", repType, "ptr", pReportInformation, "ptr", phReportHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the parameters that uniquely identify an event for the specified report.
     * @param {HREPORT} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {Integer} dwparamID 
     * @param {PWSTR} pwzName A pointer to a Unicode string that contains the name of the parameter. If this parameter is <b>NULL</b>, the default name is P<i>x</i>, where <i>x</i> matches the integer portion of the value specified in <i>dwparamID</i>.
     * @param {PWSTR} pwzValue The parameter value.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werreportsetparameter
     * @since windows6.0.6000
     */
    static WerReportSetParameter(hReportHandle, dwparamID, pwzName, pwzValue) {
        pwzName := pwzName is String ? StrPtr(pwzName) : pwzName
        pwzValue := pwzValue is String ? StrPtr(pwzValue) : pwzValue
        hReportHandle := hReportHandle is Win32Handle ? NumGet(hReportHandle, "ptr") : hReportHandle

        result := DllCall("wer.dll\WerReportSetParameter", "ptr", hReportHandle, "uint", dwparamID, "ptr", pwzName, "ptr", pwzValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a file to the specified report.
     * @param {HREPORT} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {PWSTR} pwzPath A pointer to a Unicode string that contains the full path to the file to be added. This path can use environment variables. The maximum length of this path is MAX_PATH characters.
     * @param {Integer} repFileType 
     * @param {Integer} dwFileFlags 
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werreportaddfile
     * @since windows6.0.6000
     */
    static WerReportAddFile(hReportHandle, pwzPath, repFileType, dwFileFlags) {
        pwzPath := pwzPath is String ? StrPtr(pwzPath) : pwzPath
        hReportHandle := hReportHandle is Win32Handle ? NumGet(hReportHandle, "ptr") : hReportHandle

        result := DllCall("wer.dll\WerReportAddFile", "ptr", hReportHandle, "ptr", pwzPath, "int", repFileType, "uint", dwFileFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the user interface options for the specified report.
     * @param {HREPORT} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {Integer} repUITypeID 
     * @param {PWSTR} pwzValue A pointer to a Unicode string that specifies the custom text. For more information, see the description of <i>repUITypeID</i>.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werreportsetuioption
     * @since windows6.0.6000
     */
    static WerReportSetUIOption(hReportHandle, repUITypeID, pwzValue) {
        pwzValue := pwzValue is String ? StrPtr(pwzValue) : pwzValue
        hReportHandle := hReportHandle is Win32Handle ? NumGet(hReportHandle, "ptr") : hReportHandle

        result := DllCall("wer.dll\WerReportSetUIOption", "ptr", hReportHandle, "int", repUITypeID, "ptr", pwzValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Submits the specified report.
     * @param {HREPORT} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {Integer} consent 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} pSubmitResult 
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werreportsubmit
     * @since windows6.0.6000
     */
    static WerReportSubmit(hReportHandle, consent, dwFlags, pSubmitResult) {
        hReportHandle := hReportHandle is Win32Handle ? NumGet(hReportHandle, "ptr") : hReportHandle

        result := DllCall("wer.dll\WerReportSubmit", "ptr", hReportHandle, "int", consent, "uint", dwFlags, "int*", pSubmitResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a dump of the specified type to the specified report.
     * @param {HREPORT} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @param {HANDLE} hProcess A handle to the process for which the report is being generated. This handle must have the STANDARD_RIGHTS_READ and PROCESS_QUERY_INFORMATION access rights.
     * @param {HANDLE} hThread A handle to the thread of <i>hProcess</i> for which the report is being generated. If <i>dumpType</i> is WerDumpTypeMicro, this parameter is required. For other dump types, this parameter may be <b>NULL</b>.
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
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werreportadddump
     * @since windows6.0.6000
     */
    static WerReportAddDump(hReportHandle, hProcess, hThread, dumpType, pExceptionParam, pDumpCustomOptions, dwFlags) {
        hReportHandle := hReportHandle is Win32Handle ? NumGet(hReportHandle, "ptr") : hReportHandle
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        result := DllCall("wer.dll\WerReportAddDump", "ptr", hReportHandle, "ptr", hProcess, "ptr", hThread, "int", dumpType, "ptr", pExceptionParam, "ptr", pDumpCustomOptions, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes the specified report.
     * @param {HREPORT} hReportHandle A handle to the report. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a> function.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werreportclosehandle
     * @since windows6.0.6000
     */
    static WerReportCloseHandle(hReportHandle) {
        hReportHandle := hReportHandle is Win32Handle ? NumGet(hReportHandle, "ptr") : hReportHandle

        result := DllCall("wer.dll\WerReportCloseHandle", "ptr", hReportHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a file to be collected when WER creates an error report.
     * @param {PWSTR} pwzFile The full path to the file. The maximum length of this path is MAX_PATH characters.
     * @param {Integer} regFileType 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werregisterfile
     * @since windows6.0.6000
     */
    static WerRegisterFile(pwzFile, regFileType, dwFlags) {
        pwzFile := pwzFile is String ? StrPtr(pwzFile) : pwzFile

        result := DllCall("KERNEL32.dll\WerRegisterFile", "ptr", pwzFile, "int", regFileType, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes a file from the list of files to be added to reports generated for the current process.
     * @param {PWSTR} pwzFilePath The full path to the file. This file must have been registered using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregisterfile">WerRegisterFile</a> function.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werunregisterfile
     * @since windows6.0.6000
     */
    static WerUnregisterFile(pwzFilePath) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := DllCall("KERNEL32.dll\WerUnregisterFile", "ptr", pwzFilePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a memory block to be collected when WER creates an error report.
     * @param {Pointer<Void>} pvAddress The starting address of the memory block.
     * @param {Integer} dwSize The size of the memory block, in bytes. The maximum value for this parameter is WER_MAX_MEM_BLOCK_SIZE bytes.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werregistermemoryblock
     * @since windows6.0.6000
     */
    static WerRegisterMemoryBlock(pvAddress, dwSize) {
        result := DllCall("KERNEL32.dll\WerRegisterMemoryBlock", "ptr", pvAddress, "uint", dwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes a memory block from the list of data to be collected during error reporting for the application.
     * @param {Pointer<Void>} pvAddress The starting address of the memory block. This memory block must have been registered using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregistermemoryblock">WerRegisterMemoryBlock</a> function.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werunregistermemoryblock
     * @since windows6.0.6000
     */
    static WerUnregisterMemoryBlock(pvAddress) {
        result := DllCall("KERNEL32.dll\WerUnregisterMemoryBlock", "ptr", pvAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Marks a memory block (that is normally included by default in error reports) to be excluded from the error report.
     * @param {Pointer<Void>} address The starting address of the memory block.
     * @param {Integer} size The size of the memory block, in bytes.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werregisterexcludedmemoryblock
     * @since windows10.0.15063
     */
    static WerRegisterExcludedMemoryBlock(address, size) {
        result := DllCall("KERNEL32.dll\WerRegisterExcludedMemoryBlock", "ptr", address, "uint", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes a memory block that was previously marked as excluded (it will again be included in error reports).
     * @param {Pointer<Void>} address The starting address of the memory block. This memory block must have been registered using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregisterexcludedmemoryblock">WerRegisterExcludedMemoryBlock</a> function.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werunregisterexcludedmemoryblock
     * @since windows10.0.15063
     */
    static WerUnregisterExcludedMemoryBlock(address) {
        result := DllCall("KERNEL32.dll\WerUnregisterExcludedMemoryBlock", "ptr", address, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers app-specific metadata to be collected (in the form of key/value strings) when WER creates an error report.
     * @param {PWSTR} key The "key" string for the metadata element being registered.
     * @param {PWSTR} value The value string for the metadata element being registered.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
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
     * Strings were <b>NULL</b>, key length was greater than 64 characters or was an invalid xml element name, or<i>value</i> length was greater than 128 characters or contained characters that were not ASCII printable characters.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werregistercustommetadata
     * @since windows10.0.15063
     */
    static WerRegisterCustomMetadata(key, value) {
        key := key is String ? StrPtr(key) : key
        value := value is String ? StrPtr(value) : value

        result := DllCall("KERNEL32.dll\WerRegisterCustomMetadata", "ptr", key, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     * @since windows10.0.15063
     */
    static WerUnregisterCustomMetadata(key) {
        key := key is String ? StrPtr(key) : key

        result := DllCall("KERNEL32.dll\WerUnregisterCustomMetadata", "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a process to be included in the error report along with the main application process. Optionally specifies a thread within that registered process to get additional data from.
     * @param {Integer} processId The Id of the process to register.
     * @param {Integer} captureExtraInfoForThreadId The Id of a thread within the registered process from which more information is requested.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werregisteradditionalprocess
     * @since windows10.0.15063
     */
    static WerRegisterAdditionalProcess(processId, captureExtraInfoForThreadId) {
        result := DllCall("KERNEL32.dll\WerRegisterAdditionalProcess", "uint", processId, "uint", captureExtraInfoForThreadId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes a process from the list of additional processes to be included in the error report.
     * @param {Integer} processId The Id of the process to remove. It must have been previously registered with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregisteradditionalprocess">WerRegisterAdditionalProcess</a>.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werunregisteradditionalprocess
     * @since windows10.0.15063
     */
    static WerUnregisterAdditionalProcess(processId) {
        result := DllCall("KERNEL32.dll\WerUnregisterAdditionalProcess", "uint", processId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a path relative to the local app store for the calling application where Windows Error Reporting (WER) should save a copy of the diagnostic memory dump that WER collects when one of the processes for the application stops responding.
     * @param {PWSTR} localAppDataRelativePath The path relative to the local app store for the calling application where WER should save a copy of the diagnostic memory dump that WER collects when one of the processes for the application stops responding. The maximum length for this relative path in characters is **WER_MAX_LOCAL_DUMP_SUBPATH_LENGTH**, which has a value of 64. This maximum length includes the null-termination character.
     * @returns {HRESULT} This function returns **S_OK** on success or an error code on failure, including the following error codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werregisterapplocaldump
     * @since windows10.0.16299
     */
    static WerRegisterAppLocalDump(localAppDataRelativePath) {
        localAppDataRelativePath := localAppDataRelativePath is String ? StrPtr(localAppDataRelativePath) : localAppDataRelativePath

        result := DllCall("KERNEL32.dll\WerRegisterAppLocalDump", "ptr", localAppDataRelativePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels the registration that was made by calling the WerRegisterAppLocalDump function to specify that Windows Error Reporting (WER) should save a copy of the diagnostic memory dump that WER collects when one of the processes for the application stops responding.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werunregisterapplocaldump
     * @since windows10.0.16299
     */
    static WerUnregisterAppLocalDump() {
        result := DllCall("KERNEL32.dll\WerUnregisterAppLocalDump", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the fault reporting settings for the current process.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-wersetflags
     * @since windows6.0.6000
     */
    static WerSetFlags(dwFlags) {
        result := DllCall("KERNEL32.dll\WerSetFlags", "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the fault reporting settings for the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the PROCESS_VM_READ or PROCESS_QUERY_INFORMATION access right.
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-wergetflags
     * @since windows6.0.6000
     */
    static WerGetFlags(hProcess, pdwFlags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := DllCall("KERNEL32.dll\WerGetFlags", "ptr", hProcess, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds the specified application to the list of applications that are to be excluded from error reporting.
     * @param {PWSTR} pwzExeName A pointer to a Unicode string that specifies the name of the executable file for the application, including the file name extension. The maximum length of this path is MAX_PATH characters.
     * @param {BOOL} bAllUsers If this parameter is <b>TRUE</b>, the application name is added to the list of excluded applications for all users. Otherwise, it is only added to the list of excluded applications for the current user.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-weraddexcludedapplication
     * @since windows6.0.6000
     */
    static WerAddExcludedApplication(pwzExeName, bAllUsers) {
        pwzExeName := pwzExeName is String ? StrPtr(pwzExeName) : pwzExeName

        result := DllCall("wer.dll\WerAddExcludedApplication", "ptr", pwzExeName, "ptr", bAllUsers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes the specified application from the list of applications that are to be excluded from error reporting.
     * @param {PWSTR} pwzExeName A pointer to a Unicode string that specifies the name of the executable file for the application, including the file name extension. The maximum length of this path is MAX_PATH characters.
     * 
     * This file must have been excluded using the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-weraddexcludedapplication">WerAddExcludedApplication</a> function or <b>WerRemoveExcludedApplication</b> fails.
     * @param {BOOL} bAllUsers If this parameter is <b>TRUE</b>, the application name is removed from the list of excluded applications for all users. Otherwise, it is only removed from the list of excluded applications for the current user.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werremoveexcludedapplication
     * @since windows6.0.6000
     */
    static WerRemoveExcludedApplication(pwzExeName, bAllUsers) {
        pwzExeName := pwzExeName is String ? StrPtr(pwzExeName) : pwzExeName

        result := DllCall("wer.dll\WerRemoveExcludedApplication", "ptr", pwzExeName, "ptr", bAllUsers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a custom runtime exception handler that is used to provide custom error reporting for crashes.
     * @param {PWSTR} pwszOutOfProcessCallbackDll The name of the exception handler DLL to register.
     * @param {Pointer<Void>} pContext A pointer to arbitrary context information that is passed to the handler's callback functions.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error codes.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werregisterruntimeexceptionmodule
     * @since windows6.1
     */
    static WerRegisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll, pContext) {
        pwszOutOfProcessCallbackDll := pwszOutOfProcessCallbackDll is String ? StrPtr(pwszOutOfProcessCallbackDll) : pwszOutOfProcessCallbackDll

        result := DllCall("KERNEL32.dll\WerRegisterRuntimeExceptionModule", "ptr", pwszOutOfProcessCallbackDll, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes the registration of your WER exception handler.
     * @param {PWSTR} pwszOutOfProcessCallbackDll The name of the exception handler DLL whose registration you want to remove.
     * @param {Pointer<Void>} pContext A pointer to arbitrary context information that was passed to the callback.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * The process state is not valid. For example, the process is in <a href="/windows/desktop/wsw/portal">application recovery mode</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werunregisterruntimeexceptionmodule
     * @since windows6.1
     */
    static WerUnregisterRuntimeExceptionModule(pwszOutOfProcessCallbackDll, pContext) {
        pwszOutOfProcessCallbackDll := pwszOutOfProcessCallbackDll is String ? StrPtr(pwszOutOfProcessCallbackDll) : pwszOutOfProcessCallbackDll

        result := DllCall("KERNEL32.dll\WerUnregisterRuntimeExceptionModule", "ptr", pwszOutOfProcessCallbackDll, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens the collection of stored error reports.
     * @param {Integer} repStoreType The type of report store to open. See Remarks for details.
     * @param {Pointer<HREPORTSTORE>} phReportStore A pointer to a report store. On a successful call, this will point to the retrieved report store.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werstoreopen
     * @since windows10.0.15063
     */
    static WerStoreOpen(repStoreType, phReportStore) {
        result := DllCall("wer.dll\WerStoreOpen", "int", repStoreType, "ptr", phReportStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes the collection of stored reports.
     * @param {HREPORTSTORE} hReportStore The error report store to close (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoreopen">WerStoreOpen</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werstoreclose
     * @since windows10.0.15063
     */
    static WerStoreClose(hReportStore) {
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        DllCall("wer.dll\WerStoreClose", "ptr", hReportStore)
    }

    /**
     * Gets a reference to the first report in the report store.
     * @param {HREPORTSTORE} hReportStore The error report store (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoreopen">WerStoreOpen</a>).
     * @param {Pointer<PWSTR>} ppszReportKey A pointer to the report key string. On a successful call, this will point to the retrieved report key.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werstoregetfirstreportkey
     * @since windows10.0.15063
     */
    static WerStoreGetFirstReportKey(hReportStore, ppszReportKey) {
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        result := DllCall("wer.dll\WerStoreGetFirstReportKey", "ptr", hReportStore, "ptr", ppszReportKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a reference to the next report in the error report store.
     * @param {HREPORTSTORE} hReportStore The error report store (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoreopen">WerStoreOpen</a>).
     * @param {Pointer<PWSTR>} ppszReportKey A pointer to the report key string. On a successful call, this will point to the retrieved report key.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werstoregetnextreportkey
     * @since windows10.0.15063
     */
    static WerStoreGetNextReportKey(hReportStore, ppszReportKey) {
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        result := DllCall("wer.dll\WerStoreGetNextReportKey", "ptr", hReportStore, "ptr", ppszReportKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves metadata about a report in the store.
     * @param {HREPORTSTORE} hReportStore The error report store (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoreopen">WerStoreOpen</a>).
     * @param {PWSTR} pszReportKey The string identifying which report is being queried (previously retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoregetfirstreportkey">WerStoreGetFirstReportKey</a> or <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werstoregetnextreportkey">WerStoreGetNextReportKey</a>).
     * @param {Pointer<WER_REPORT_METADATA_V2>} pReportMetadata A pointer to the report store metadata in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_report_metadata_v2">WER_REPORT_METADATA_V2</a> structure. The field <b>SizeOfFileNames</b> should be set to 0 during the first call. The function updates this field with the required size to hold the file names associated with the report. The field <b>FileNames</b> should then be allocated with <b>SizeOfFileNames</b> bytes and the function should be called again to get all of the file names.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or an error code on failure, including the following error code.
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
     * There is not enough memory available to retrieve the metadata. In this case, the caller should allocate memory of size <b>SizeOfFileNames</b> for the <b>FileNames</b> field, found in the <a href="/windows/desktop/api/werapi/ns-werapi-wer_report_metadata_v2">WER_REPORT_METADATA_V2</a> structure, and call the function again. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werstorequeryreportmetadatav2
     * @since windows10.0.15063
     */
    static WerStoreQueryReportMetadataV2(hReportStore, pszReportKey, pReportMetadata) {
        pszReportKey := pszReportKey is String ? StrPtr(pszReportKey) : pszReportKey
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        result := DllCall("wer.dll\WerStoreQueryReportMetadataV2", "ptr", hReportStore, "ptr", pszReportKey, "ptr", pReportMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HREPORTSTORE} hReportStore 
     * @param {PWSTR} pszReportKey 
     * @param {Pointer<WER_REPORT_METADATA_V3>} pReportMetadata 
     * @returns {HRESULT} 
     */
    static WerStoreQueryReportMetadataV3(hReportStore, pszReportKey, pReportMetadata) {
        pszReportKey := pszReportKey is String ? StrPtr(pszReportKey) : pszReportKey
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        result := DllCall("wer.dll\WerStoreQueryReportMetadataV3", "ptr", hReportStore, "ptr", pszReportKey, "ptr", pReportMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees up the memory used to store a report key string. This should be called after each successive call to WerStoreGetFirstReportKey or WerStoreGetNextReportKey, once the particular report key string has been used and is no longer needed.
     * @param {PWSTR} pwszStr The string to be freed (value set to <b>NULL</b>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//werapi/nf-werapi-werfreestring
     * @since windows10.0.15063
     */
    static WerFreeString(pwszStr) {
        pwszStr := pwszStr is String ? StrPtr(pwszStr) : pwszStr

        DllCall("wer.dll\WerFreeString", "ptr", pwszStr)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    static WerStorePurge() {
        result := DllCall("wer.dll\WerStorePurge", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HREPORTSTORE} hReportStore 
     * @param {Pointer<UInt32>} pdwReportCount 
     * @returns {HRESULT} 
     */
    static WerStoreGetReportCount(hReportStore, pdwReportCount) {
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        result := DllCall("wer.dll\WerStoreGetReportCount", "ptr", hReportStore, "uint*", pdwReportCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HREPORTSTORE} hReportStore 
     * @param {Pointer<UInt64>} pqwSizeInBytes 
     * @returns {HRESULT} 
     */
    static WerStoreGetSizeOnDisk(hReportStore, pqwSizeInBytes) {
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        result := DllCall("wer.dll\WerStoreGetSizeOnDisk", "ptr", hReportStore, "uint*", pqwSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HREPORTSTORE} hReportStore 
     * @param {PWSTR} pszReportKey 
     * @param {Pointer<WER_REPORT_METADATA_V1>} pReportMetadata 
     * @returns {HRESULT} 
     */
    static WerStoreQueryReportMetadataV1(hReportStore, pszReportKey, pReportMetadata) {
        pszReportKey := pszReportKey is String ? StrPtr(pszReportKey) : pszReportKey
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        result := DllCall("wer.dll\WerStoreQueryReportMetadataV1", "ptr", hReportStore, "ptr", pszReportKey, "ptr", pReportMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HREPORTSTORE} hReportStore 
     * @param {PWSTR} pszReportKey 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} pSubmitResult 
     * @returns {HRESULT} 
     */
    static WerStoreUploadReport(hReportStore, pszReportKey, dwFlags, pSubmitResult) {
        pszReportKey := pszReportKey is String ? StrPtr(pszReportKey) : pszReportKey
        hReportStore := hReportStore is Win32Handle ? NumGet(hReportStore, "ptr") : hReportStore

        result := DllCall("wer.dll\WerStoreUploadReport", "ptr", hReportStore, "ptr", pszReportKey, "uint", dwFlags, "int*", pSubmitResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables an application that performs its own exception handling to report faults to Microsoft.
     * @param {Pointer<EXCEPTION_POINTERS>} pep A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> structure.
     * @param {Integer} dwOpt This parameter is reserved for system use and should be set to zero.
     * @returns {Integer} This function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>frrvErr</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function failed but the error reporting client was launched.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>frrvErrNoDW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The error reporting client was unable to launch. The system will perform its default actions, such as displaying the standard exception dialog box and launching the debugger.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>frrvErrTimeout</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>frrvLaunchDebugger</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded and the user launched the debugger.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>frrvOk</b></dt>
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
     * <dt><b>frrvOkHeadless</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded and the error reporting client was launched in silent reporting mode (no UI is used).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>frrvOkManifest</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded and the error reporting client was launched in manifest reporting mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>frrvOkQueued</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded and the fault report was queued for later reporting.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * These return values indicate whether the reporting application was successfully launched. A successful return value does not necessarily indicate that the fault was successfully reported.
     * @see https://docs.microsoft.com/windows/win32/api//errorrep/nf-errorrep-reportfault
     * @since windows5.1.2600
     */
    static ReportFault(pep, dwOpt) {
        result := DllCall("faultrep.dll\ReportFault", "ptr", pep, "uint", dwOpt, "int")
        return result
    }

    /**
     * Excludes the specified application from error reporting.
     * @param {PSTR} szApplication The name of the executable file for the application, including the file name extension. The name cannot contain path information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, see 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//errorrep/nf-errorrep-adderexcludedapplicationa
     * @since windows5.1.2600
     */
    static AddERExcludedApplicationA(szApplication) {
        szApplication := szApplication is String ? StrPtr(szApplication) : szApplication

        A_LastError := 0

        result := DllCall("faultrep.dll\AddERExcludedApplicationA", "ptr", szApplication, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Excludes the specified application from error reporting.
     * @param {PWSTR} wszApplication The name of the executable file for the application, including the file name extension. The name cannot contain path information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, see <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//errorrep/nf-errorrep-adderexcludedapplicationw
     * @since windows5.1.2600
     */
    static AddERExcludedApplicationW(wszApplication) {
        wszApplication := wszApplication is String ? StrPtr(wszApplication) : wszApplication

        A_LastError := 0

        result := DllCall("faultrep.dll\AddERExcludedApplicationW", "ptr", wszApplication, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initiates &quot;no response&quot; reporting on the specified window.
     * @param {HWND} hwndHungApp Handle to the window that is not responding.
     * @param {PWSTR} pwzHungApplicationName The name of the not-responding application to be shown in the Hang Reporting UI. The name is limited to 128 characters including the <b>NULL</b> terminator. If <b>NULL</b>, WER tries to get the name from the target image resources. If it cannot get the name from the image, the image name will be used.
     * @returns {HRESULT} Returns S_OK if the function was able to initiate the reporting or an error code on failure. Note that S_OK does not necessarily mean that "no response" reporting has completed successfully, only that it was initiated.
     * @see https://docs.microsoft.com/windows/win32/api//errorrep/nf-errorrep-werreporthang
     * @since windows6.0.6000
     */
    static WerReportHang(hwndHungApp, pwzHungApplicationName) {
        pwzHungApplicationName := pwzHungApplicationName is String ? StrPtr(pwzHungApplicationName) : pwzHungApplicationName
        hwndHungApp := hwndHungApp is Win32Handle ? NumGet(hwndHungApp, "ptr") : hwndHungApp

        result := DllCall("faultrep.dll\WerReportHang", "ptr", hwndHungApp, "ptr", pwzHungApplicationName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
