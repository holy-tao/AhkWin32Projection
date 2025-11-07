#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Structure that holds all callback function pointers for carrying out operations.
 * @remarks
 * 
 * All PowerShell Semantics and streamed result callbacks are optional;  include the callbacks 
 *  you want to receive. If the associated operation callback for the operation
 * is not set, i.e. set to <b>NULL</b>, the operation will be carried out synchronously. The client must call into the appropriate MI_Operation function to receive the results. The result callbacks will continue to be called until the moreResults field is equal to MI_FALSE.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_operationcallbacks
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_OperationCallbacks extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A client specific context that is passed to all the callbacks. This is used to correlate the callback to the associated operation. This value will be passed to any operation callbacks.
     * @type {Pointer<Void>}
     */
    callbackContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Optional callback to handle prompt user requests from the server.
     * @type {Pointer<MI_OperationCallback_PromptUser>}
     */
    promptUser {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional callback to receive write error messages from the server.
     * @type {Pointer<MI_OperationCallback_WriteError>}
     */
    writeError {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional callback to receive write messages from the server.
     * @type {Pointer<MI_OperationCallback_WriteMessage>}
     */
    writeMessage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Optional callback to receive progress reports from the server.
     * @type {Pointer<MI_OperationCallback_WriteProgress>}
     */
    writeProgress {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Optional instance callback to get asynchronous results from an operation.  If this is not specified and the operation is an instance operation, then the client will need to use the synchronous APIs to retrieve the results.
     * @type {Pointer<MI_OperationCallback_Instance>}
     */
    instanceResult {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Optional instance callback to get indication (subscribe) results from an operation.  If this is not specified and the operation is an instance operation, then the client will need to use the synchronous APIs to retrieve the results.
     * @type {Pointer<MI_OperationCallback_Indication>}
     */
    indicationResult {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Optional instance callback to get classes and class options from an operation.  If this is not specified and the operation is an instance operation, then the client will need to use the synchronous APIs to retrieve the results.
     * @type {Pointer<MI_OperationCallback_Class>}
     */
    classResult {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Optional callback to get streamed parameter results from method invocation operations.
     * @type {Pointer<MI_OperationCallback_StreamedParameter>}
     */
    streamedParameterResult {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
