#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Storage.OperationRecorder
 * @version v4.0.30319
 */
class OperationRecorder {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Notifies the system that the application is about to start an operation.
     * @remarks
     * The version of the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-operation_start_parameters">_OPERATION_START_PARAMETERS</a> structure is defined as <b>OPERATION_API_VERSION</b> in the Windows SDK. 
     * 
     * Because the <b>OperationStart</b> function is synchronous, it can take several seconds to return. This should be avoided in UI threads for the best responsiveness.
     * 
     * There is a single instance of the operation recorder in a process. Although the operation  recorder APIs can be called from multiple threads within the process, all calls act on the single instance.
     * 
     * Application launch tracing lasts for the first 10 second of the process lifetime.  <b>OperationStart</b> should be called after the end of application launch tracing by the system. 
     * 
     * Every call to <b>OperationStart</b> must be followed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-operationend">OperationEnd</a>. Otherwise, the operation trace will be discarded after about 10s.
     * 
     * The maximum number of operations that can be recorded on a given system is configurable. If this maximum is exceeded, the least recently used prefetch files are replaced. 
     * 
     * On Windows 8, this functionality requires the Superfetch service to be enabled. Windows 8 will have the service enabled by default. 
     * For Windows Server 2012, this prefetching functionality needs to be enabled and disabled as required. This can be done using CIM based PowerShell cmdlets.  The prefetcher functionality can be exposed using the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/cimclas">CIM class</a>  of the <b>CIM_PrefetcherService</b>.
     * @param {Pointer<OPERATION_START_PARAMETERS>} OperationStartParams An <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-operation_start_parameters">_OPERATION_START_PARAMETERS</a> structure that specifies <b>VERSION</b>, <b>OPERATION_ID</b> and <b>FLAGS</b>.
     * @returns {BOOL} <b>TRUE</b> for all valid parameters and <b>FALSE</b> otherwise.  To get extended error information, call <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-operationstart
     * @since windows8.0
     */
    static OperationStart(OperationStartParams) {
        result := DllCall("ADVAPI32.dll\OperationStart", "ptr", OperationStartParams, "int")
        return result
    }

    /**
     * Notifies the system that the application is about to end an operation.
     * @remarks
     * The version of the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-operation_end_parameters">_OPERATION_END_PARAMETERS</a> structure is defined as <b>OPERATION_API_VERSION</b> in the Windows SDK. 
     * 
     * The  <b>OperationEnd</b> function is safe to call on any thread.
     * @param {Pointer<OPERATION_END_PARAMETERS>} OperationEndParams An <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-operation_end_parameters">_OPERATION_END_PARAMETERS</a> structure that specifies <b>VERSION</b>, <b>OPERATION_ID</b> and <b>FLAGS</b>.
     * @returns {BOOL} <b>TRUE</b> for all valid parameters and <b>FALSE</b> otherwise.  To get extended error information, call <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-operationend
     * @since windows8.0
     */
    static OperationEnd(OperationEndParams) {
        result := DllCall("ADVAPI32.dll\OperationEnd", "ptr", OperationEndParams, "int")
        return result
    }

;@endregion Methods
}
