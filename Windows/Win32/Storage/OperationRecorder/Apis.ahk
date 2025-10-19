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
     * @param {Pointer<OPERATION_START_PARAMETERS>} OperationStartParams An <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-operation_start_parameters">_OPERATION_START_PARAMETERS</a> structure that specifies <b>VERSION</b>, <b>OPERATION_ID</b> and <b>FLAGS</b>.
     * @returns {BOOL} <b>TRUE</b> for all valid parameters and <b>FALSE</b> otherwise.  To get extended error information, call <b>GetLastError</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-operationstart
     * @since windows8.0
     */
    static OperationStart(OperationStartParams) {
        result := DllCall("ADVAPI32.dll\OperationStart", "ptr", OperationStartParams, "int")
        return result
    }

    /**
     * Notifies the system that the application is about to end an operation.
     * @param {Pointer<OPERATION_END_PARAMETERS>} OperationEndParams An <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-operation_end_parameters">_OPERATION_END_PARAMETERS</a> structure that specifies <b>VERSION</b>, <b>OPERATION_ID</b> and <b>FLAGS</b>.
     * @returns {BOOL} <b>TRUE</b> for all valid parameters and <b>FALSE</b> otherwise.  To get extended error information, call <b>GetLastError</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-operationend
     * @since windows8.0
     */
    static OperationEnd(OperationEndParams) {
        result := DllCall("ADVAPI32.dll\OperationEnd", "ptr", OperationEndParams, "int")
        return result
    }

;@endregion Methods
}
