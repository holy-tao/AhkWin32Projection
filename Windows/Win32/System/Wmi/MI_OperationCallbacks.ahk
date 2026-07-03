#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Structure that holds all callback function pointers for carrying out operations.
 * @remarks
 * All PowerShell Semantics and streamed result callbacks are optional;  include the callbacks 
 *  you want to receive. If the associated operation callback for the operation
 * is not set, i.e. set to <b>NULL</b>, the operation will be carried out synchronously. The client must call into the appropriate MI_Operation function to receive the results. The result callbacks will continue to be called until the moreResults field is equal to MI_FALSE.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_operationcallbacks
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_OperationCallbacks {
    #StructPack 8

    /**
     * A client specific context that is passed to all the callbacks. This is used to correlate the callback to the associated operation. This value will be passed to any operation callbacks.
     */
    callbackContext : IntPtr

    /**
     * Optional callback to handle prompt user requests from the server.
     */
    promptUser : IntPtr

    /**
     * Optional callback to receive write error messages from the server.
     */
    writeError : IntPtr

    /**
     * Optional callback to receive write messages from the server.
     */
    writeMessage : IntPtr

    /**
     * Optional callback to receive progress reports from the server.
     */
    writeProgress : IntPtr

    /**
     * Optional instance callback to get asynchronous results from an operation.  If this is not specified and the operation is an instance operation, then the client will need to use the synchronous APIs to retrieve the results.
     */
    instanceResult : IntPtr

    /**
     * Optional instance callback to get indication (subscribe) results from an operation.  If this is not specified and the operation is an instance operation, then the client will need to use the synchronous APIs to retrieve the results.
     */
    indicationResult : IntPtr

    /**
     * Optional instance callback to get classes and class options from an operation.  If this is not specified and the operation is an instance operation, then the client will need to use the synchronous APIs to retrieve the results.
     */
    classResult : IntPtr

    /**
     * Optional callback to get streamed parameter results from method invocation operations.
     */
    streamedParameterResult : IntPtr

}
