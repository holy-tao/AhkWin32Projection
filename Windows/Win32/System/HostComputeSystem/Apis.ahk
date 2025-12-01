#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HCS_OPERATION.ahk
#Include .\HCS_SYSTEM.ahk
#Include .\HCS_PROCESS.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HostComputeSystem {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * HcsEnumerateComputeSystems
     * @param {PWSTR} query Optional JSON document of [SystemQuery](./../SchemaReference.md#SystemQuery) specifying a query for specific compute systems.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the enumerate operation.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md)
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsEnumerateComputeSystems
     */
    static HcsEnumerateComputeSystems(query, operation) {
        query := query is String ? StrPtr(query) : query
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsEnumerateComputeSystems", "ptr", query, "ptr", operation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} idNamespace 
     * @param {PWSTR} query 
     * @param {HCS_OPERATION} operation 
     * @returns {HRESULT} 
     */
    static HcsEnumerateComputeSystemsInNamespace(idNamespace, query, operation) {
        idNamespace := idNamespace is String ? StrPtr(idNamespace) : idNamespace
        query := query is String ? StrPtr(query) : query
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsEnumerateComputeSystemsInNamespace", "ptr", idNamespace, "ptr", query, "ptr", operation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsCreateOperation
     * @remarks
     * Refer to the async model sample code for details on how to use HCS operations.
     * @param {Pointer<Void>} context Optional pointer to a context that is passed to the callback.
     * @param {Pointer<HCS_OPERATION_COMPLETION>} callback Optional pointer to an [`HCS_OPERATION_COMPLETION`](./HCS_OPERATION_COMPLETION.md) callback to be invoked when the operation completes.
     * @returns {HCS_OPERATION} Returns the `HCS_OPERATION` handle to the newly created operation on success, `NULL` if resources required for the operation couldn't be allocated. It is the responsibility of the caller to release the operation using [`HcsCloseOperation`](./HcsCloseOperation.md) once it is no longer used.
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCreateOperation
     */
    static HcsCreateOperation(context, callback) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("computecore.dll\HcsCreateOperation", contextMarshal, context, "ptr", callback, "ptr")
        resultHandle := HCS_OPERATION({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {Integer} eventTypes 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_EVENT_CALLBACK>} callback 
     * @returns {HCS_OPERATION} 
     */
    static HcsCreateOperationWithNotifications(eventTypes, context, callback) {
        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("computecore.dll\HcsCreateOperationWithNotifications", "int", eventTypes, contextMarshal, context, "ptr", callback, "ptr")
        resultHandle := HCS_OPERATION({Value: result}, True)
        return resultHandle
    }

    /**
     * HcsCloseOperation
     * @param {HCS_OPERATION} operation Handle to an operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseOperation
     */
    static HcsCloseOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        DllCall("computecore.dll\HcsCloseOperation", "ptr", operation)
    }

    /**
     * HcsGetOperationContext
     * @param {HCS_OPERATION} operation The handle to an operation.
     * @returns {Pointer<Void>} Returns the context pointer stored in the operation as a `void*` type.
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationContext
     */
    static HcsGetOperationContext(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationContext", "ptr", operation, "ptr")
        return result
    }

    /**
     * HcsSetOperationContext
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @param {Pointer<Void>} context Optional pointer to a context that is passed to the callback.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetOperationContext
     */
    static HcsSetOperationContext(operation, context) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("computecore.dll\HcsSetOperationContext", "ptr", operation, contextMarshal, context, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGetComputeSystemFromOperation
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @returns {HCS_SYSTEM} Returns the `HCS_SYSTEM` handle to the compute system used by active operation, returns `NULL` if the operation is not active.
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetComputeSystemFromOperation
     */
    static HcsGetComputeSystemFromOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetComputeSystemFromOperation", "ptr", operation, "ptr")
        resultHandle := HCS_SYSTEM({Value: result}, True)
        return resultHandle
    }

    /**
     * HcsGetProcessFromOperation
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @returns {HCS_PROCESS} If the function succeeds, the return value is `HCS_PROCESS`.
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetProcessFromOperation
     */
    static HcsGetProcessFromOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetProcessFromOperation", "ptr", operation, "ptr")
        resultHandle := HCS_PROCESS({Value: result}, True)
        return resultHandle
    }

    /**
     * HcsGetOperationType
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @returns {Integer} If the function succeeds, the return value is [HCS_OPERATION_TYPE](./HCS_OPERATION_TYPE.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationType
     */
    static HcsGetOperationType(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationType", "ptr", operation, "int")
        return result
    }

    /**
     * HcsGetOperationId
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @returns {Integer} If the function succeeds, the return value is the operation's Id.
     * 
     * If the operation is invalid, the return value is `HCS_INVALID_OPERATION_ID`.
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationId
     */
    static HcsGetOperationId(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationId", "ptr", operation, "uint")
        return result
    }

    /**
     * HcsGetOperationResult
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @returns {PWSTR} If the operation finished, regardless of success or failure, receives the result document of the operation. The returned result document's JSON document is dependent on the HCS function that was being tracked by this operation. Not all functions that are tracked with operations return a result document. Refer to the remarks on the documentation for the HCS functions that use hcs operations for asynchronous tracking.
     * 
     * 
     * On failure, it can optionally receive an error JSON document represented by a [ResultError](./../SchemaReference.md#ResultError); it's not guaranteed to be always returned and depends on the function call the operation was tracking.
     * 
     * 
     * The caller is responsible for releasing the returned string using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationResult
     */
    static HcsGetOperationResult(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationResult", "ptr", operation, "ptr*", &resultDocument := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return resultDocument
    }

    /**
     * HcsGetOperationResultAndProcessInfo
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @param {Pointer<HCS_PROCESS_INFORMATION>} processInformation If the return value is `S_OK` and this parameter has been provided a valid pointer by the caller, it returns the [HCS_PROCESS_INFORMATION](./HCS_PROCESS_INFORMATION.md) associated to the HCS process created with [`HcsCreateProcess`](./HcsCreateProcess.md).
     * @returns {PWSTR} If the operation finished, regardless of success or failure, receives the result document of the operation. The returned result document's JSON document is dependent on the HCS function that was being tracked by this operation. Not all functions that are tracked with operations return a result document. Refer to the remarks on the documentation for the HCS functions that use hcs operations for asynchronous tracking.
     * 
     * 
     * On failure, it can optionally receive an error JSON document represented by a [ResultError](./../SchemaReference.md#ResultError); it's not guaranteed to be always returned and depends on the function call the operation was tracking.
     * 
     * 
     * The caller is responsible for releasing the returned string using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationResultAndProcessInfo
     */
    static HcsGetOperationResultAndProcessInfo(operation, processInformation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationResultAndProcessInfo", "ptr", operation, "ptr", processInformation, "ptr*", &resultDocument := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return resultDocument
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Integer} type 
     * @param {PWSTR} uri 
     * @param {HANDLE} handle 
     * @returns {HRESULT} 
     */
    static HcsAddResourceToOperation(operation, type, uri, handle) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        uri := uri is String ? StrPtr(uri) : uri
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := DllCall("computecore.dll\HcsAddResourceToOperation", "ptr", operation, "int", type, "ptr", uri, "ptr", handle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGetProcessorCompatibilityFromSavedState
     * @param {PWSTR} RuntimeFileName The path to the vmrs file.
     * @returns {PWSTR} JSON document of the processor compatibilities as [VmProcessorRequirements](./../SchemaReference.md#VmProcessorRequirements).
     * 
     * The caller is responsible for releasing the returned string using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetProcessorCompatibilityFromSavedState
     */
    static HcsGetProcessorCompatibilityFromSavedState(RuntimeFileName) {
        RuntimeFileName := RuntimeFileName is String ? StrPtr(RuntimeFileName) : RuntimeFileName

        result := DllCall("computecore.dll\HcsGetProcessorCompatibilityFromSavedState", "ptr", RuntimeFileName, "ptr*", &ProcessorFeaturesString := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessorFeaturesString
    }

    /**
     * HcsWaitForOperationResult
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @param {Integer} timeoutMs Time to wait in milliseconds for the operation to complete.
     * @returns {PWSTR} If the operation finished, regardless of success or failure, receives the result document of the operation. The returned result document's JSON document is dependent on the HCS function that was being tracked by this operation. Not all functions that are tracked with operations return a result document. Refer to the remarks on the documentation for the HCS functions that use hcs operations for asynchronous tracking.
     * 
     * 
     * On failure, it can optionally receive an error JSON document represented by a [ResultError](./../SchemaReference.md#ResultError); it's not guaranteed to be always returned and depends on the function call the operation was tracking.
     * 
     * 
     * The caller is responsible for releasing the returned string using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsWaitForOperationResult
     */
    static HcsWaitForOperationResult(operation, timeoutMs) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsWaitForOperationResult", "ptr", operation, "uint", timeoutMs, "ptr*", &resultDocument := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return resultDocument
    }

    /**
     * HcsWaitForOperationResultAndProcessInfo
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @param {Integer} timeoutMs Time to wait in milliseconds for the operation to complete.
     * @param {Pointer<HCS_PROCESS_INFORMATION>} processInformation If the return value is `S_OK` and this parameter has been provided a valid pointer by the caller, it returns the [HCS_PROCESS_INFORMATION](./HCS_PROCESS_INFORMATION.md) associated to the HCS process created with [`HcsCreateProcess`](./HcsCreateProcess.md).
     * @returns {PWSTR} If the operation finished, regardless of success or failure, receives the result document of the operation. The returned result document's JSON document is dependent on the HCS function that was being tracked by this operation. Not all functions that are tracked with operations return a result document. Refer to the remarks on the documentation for the HCS functions that use hcs operations for asynchronous tracking.
     * 
     * 
     * On failure, it can optionally receive an error JSON document represented by a [ResultError](./../SchemaReference.md#ResultError); it's not guaranteed to be always returned and depends on the function call the operation was tracking.
     * 
     * 
     * The caller is responsible for releasing the returned string using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsWaitForOperationResultAndProcessInfo
     */
    static HcsWaitForOperationResultAndProcessInfo(operation, timeoutMs, processInformation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsWaitForOperationResultAndProcessInfo", "ptr", operation, "uint", timeoutMs, "ptr", processInformation, "ptr*", &resultDocument := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return resultDocument
    }

    /**
     * HcsSetOperationCallback
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @param {Pointer<Void>} context Optional pointer to a context that is passed to the callback.
     * @param {Pointer<HCS_OPERATION_COMPLETION>} callback The target [`HCS_OPERATION_COMPLETION`](./HCS_OPERATION_COMPLETION.md) callback that is invoked on completion of an operation.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetOperationCallback
     */
    static HcsSetOperationCallback(operation, context, callback) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("computecore.dll\HcsSetOperationCallback", "ptr", operation, contextMarshal, context, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsCancelOperation
     * @remarks
     * This function is not currently implemented and will always return an `E_NOTIMPL` HRESULT value.
     * @param {HCS_OPERATION} operation The handle to an active operation.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCancelOperation
     */
    static HcsCancelOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsCancelOperation", "ptr", operation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {PWSTR} 
     */
    static HcsGetOperationProperties(operation, options) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsGetOperationProperties", "ptr", operation, "ptr", options, "ptr*", &resultDocument := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return resultDocument
    }

    /**
     * HcsCreateComputeSystem
     * @param {PWSTR} id Unique Id identifying the compute system.
     * @param {PWSTR} configuration JSON document specifying the settings of the [compute system](./../SchemaReference.md#ComputeSystem). The compute system document is expected to have a `Container`, `VirtualMachine` or `HostedSystem` property set since they are mutually exclusive.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the create operation.
     * @param {Pointer<SECURITY_DESCRIPTOR>} securityDescriptor Reserved for future use, must be `NULL`.
     * @param {Pointer<HCS_SYSTEM>} computeSystem Receives a handle to the newly created compute system. It is the responsibility of the caller to release the handle using [HcsCloseComputeSystem](./HcsCloseComputeSystem.md) once it is no longer in use.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/reference/HcsCreateComputeSystem
     */
    static HcsCreateComputeSystem(id, configuration, operation, securityDescriptor, computeSystem) {
        id := id is String ? StrPtr(id) : id
        configuration := configuration is String ? StrPtr(configuration) : configuration
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsCreateComputeSystem", "ptr", id, "ptr", configuration, "ptr", operation, "ptr", securityDescriptor, "ptr", computeSystem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} idNamespace 
     * @param {PWSTR} id 
     * @param {PWSTR} configuration 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<Integer>} options 
     * @param {Pointer<HCS_SYSTEM>} computeSystem 
     * @returns {HRESULT} 
     */
    static HcsCreateComputeSystemInNamespace(idNamespace, id, configuration, operation, options, computeSystem) {
        idNamespace := idNamespace is String ? StrPtr(idNamespace) : idNamespace
        id := id is String ? StrPtr(id) : id
        configuration := configuration is String ? StrPtr(configuration) : configuration
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        optionsMarshal := options is VarRef ? "int*" : "ptr"

        result := DllCall("computecore.dll\HcsCreateComputeSystemInNamespace", "ptr", idNamespace, "ptr", id, "ptr", configuration, "ptr", operation, optionsMarshal, options, "ptr", computeSystem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsOpenComputeSystem
     * @param {PWSTR} id Unique Id identifying the compute system.
     * @param {Integer} requestedAccess Reserved for future use, must be `GENERIC_ALL`.
     * @param {Pointer<HCS_SYSTEM>} computeSystem Receives a handle to the compute system. It is the responsibility of the caller to release the handle using [HcsCloseComputeSystem](./HcsCloseComputeSystem.md) once it is no longer in use.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/reference/HcsOpenComputeSystem
     */
    static HcsOpenComputeSystem(id, requestedAccess, computeSystem) {
        id := id is String ? StrPtr(id) : id

        result := DllCall("computecore.dll\HcsOpenComputeSystem", "ptr", id, "uint", requestedAccess, "ptr", computeSystem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} idNamespace 
     * @param {PWSTR} id 
     * @param {Integer} requestedAccess 
     * @param {Pointer<HCS_SYSTEM>} computeSystem 
     * @returns {HRESULT} 
     */
    static HcsOpenComputeSystemInNamespace(idNamespace, id, requestedAccess, computeSystem) {
        idNamespace := idNamespace is String ? StrPtr(idNamespace) : idNamespace
        id := id is String ? StrPtr(id) : id

        result := DllCall("computecore.dll\HcsOpenComputeSystemInNamespace", "ptr", idNamespace, "ptr", id, "uint", requestedAccess, "ptr", computeSystem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsCloseComputeSystem
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseComputeSystem
     */
    static HcsCloseComputeSystem(computeSystem) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        DllCall("computecore.dll\HcsCloseComputeSystem", "ptr", computeSystem)
    }

    /**
     * HcsStartComputeSystem
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to start.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the start operation.
     * @param {PWSTR} options Reserved for future use. Must be `NULL`.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsStartComputeSystem
     */
    static HcsStartComputeSystem(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsStartComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsShutDownComputeSystem
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to shut down.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the shutdown operation.
     * @param {PWSTR} options Reserved for future use. Must be `NULL`.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsShutDownComputeSystem
     */
    static HcsShutDownComputeSystem(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsShutDownComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsTerminateComputeSystem
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to terminate.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the terminate operation.
     * @param {PWSTR} options Reserved for future use. Must be `NULL`.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsTerminateComputeSystem
     */
    static HcsTerminateComputeSystem(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsTerminateComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsCrashComputeSystem
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to crash.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the crash system operation.
     * @param {PWSTR} options Optional JSON document [CrashOptions](./../SchemaReference.md#CrashOptions) specifying terminate options.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCrashComputeSystem
     */
    static HcsCrashComputeSystem(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsCrashComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsPauseComputeSystem
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to pause.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the pause operation.
     * @param {PWSTR} options Optional JSON document of [PauseOptions](./../SchemaReference.md#PauseOptions) specifying pause options.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md), refer to hcs operation async model.
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsPauseComputeSystem
     */
    static HcsPauseComputeSystem(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsPauseComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsResumeComputeSystem
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to resume.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the resume operation.
     * @param {PWSTR} options Reserved for future use. Must be `NULL`.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsResumeComputeSystem
     */
    static HcsResumeComputeSystem(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsResumeComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsSaveComputeSystem
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to save.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the save operation.
     * @param {PWSTR} options Optional JSON document of [SaveOptions](./../SchemaReference.md#SaveOptions) specifying save options.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSaveComputeSystem
     */
    static HcsSaveComputeSystem(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsSaveComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGetComputeSystemProperties
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to query.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the query operation.
     * @param {PWSTR} propertyQuery Optional JSON document of [System_PropertyQuery](./../SchemaReference.md#System_PropertyQuery) specifying the properties to query.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md)
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetComputeSystemProperties
     */
    static HcsGetComputeSystemProperties(computeSystem, operation, propertyQuery) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery

        result := DllCall("computecore.dll\HcsGetComputeSystemProperties", "ptr", computeSystem, "ptr", operation, "ptr", propertyQuery, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsModifyComputeSystem
     * @remarks
     * The [ModifySettingRequest](./../SchemaReference.md#ModifySettingRequest) JSON document has a property called `"Settings"` of type `Any`. In JSON, `Any` means an arbitrary object with no restrictions. Refer to the following table to know what JSON type HCS expects for each `"ResourcePath"`.
     * 
     * |`"ResourcePath"`|`"Settings"` Type|Valid `"RequestType"` in [ModifyRequestType](./../SchemaReference.md#ModifyRequestType)|
     * |---|---|---|
     * |L"VirtualMachine/ComputeTopology/Processor/CpuGroup"|[CpuGroup](./../SchemaReference.md#CpuGroup)|No Limit|
     * |L"VirtualMachine/ComputeTopology/Processor/IdledProcessors"|[IdleProcessorsRequest](./../SchemaReference.md#CpuGroup)|Only "Update"|
     * |L"VirtualMachine/ComputeTopology/Processor/CpuFrequencyPowerCap"|ULONG|No Limit|
     * |L"VirtualMachine/Devices/FlexibleIov/`<Identifier>`"<br>`Identifier` is expected as uniq name to represent the flexible IOV device|[FlexibleIoDevice](./../SchemaReference.md#FlexibleIoDevice)|Only "Add"|
     * |L"VirtualMachine/ComputeTopology/Gpu"|[GpuConfiguration](./../SchemaReference.md#GpuConfiguration)|Only "Update"|
     * |L"VirtualMachine/Devices/MappedPipes/`<Identifier>`"<br>`Identifier` is expected as uniq name to represent the host named pipe to be mapped|`Settings` should be empty|"Add" or "Remove"|
     * |L"VirtualMachine/ComputeTopology/Memory/SizeInMB"|UINT64, meaning new memory size in MB|No Limit|
     * |L"VirtualMachine/Devices/NetworkAdapters/`<Identifier`>"<br>`Identifier` is expected as uniq name to represent the network adapter|[NetworkAdapter](./../SchemaReference.md#CpuGroup)|No Limit|
     * |L"VirtualMachine/Devices/Plan9/Shares"|[Plan9Share](./../SchemaReference.md#Plan9Share)|No Limit|
     * |L"VirtualMachine/Devices/Scsi/`<Identifier>`/Attachments/`<UnsignedInt>`"<br>`Identifier` is expected as uniq name to represent the scsi device; `UnsignedInt` is expected as the unsigned int value to represent the lun of the disk|[Attachment](./../SchemaReference.md#Attachment)|No Limit<br>`Settings` is ignored when type is "Remove"|
     * |L"VirtualMachine/Devices/ComPorts/`<UnsignedInt>`"<br>`UnsignedInt` is expected to represent the serial ID which is not larger than 1|[comPort](./../SchemaReference.md#ComPort)|No Limit(check c_SerialResourceRegex???)|
     * |L"VirtualMachine/Devices/SharedMemory/Regions"|[SharedMemoryRegion](./../SchemaReference.md#SharedMemoryRegion)|No Limit|
     * |L"VirtualMachine/Devices/VirtualPMem/Devices/`<UnsignedInt>`"<br>`UnsignedInt` is expected to represent the number identifier of the VPMEM device|[VirtualPMemDevice](./../SchemaReference.md#VirtualPMemDevice)|"Add" or "Remove"<br>`Settings` is ignored when type is "Remove"|
     * |L"VirtualMachine/Devices/VirtualPMem/Devices/`<UnsignedInt>`/Mappings/`<UnsignedInt>`"<br>First `UnsignedInt` is expected to represent the number identifier of the VPMEM device; Second `UnsignedInt` is expected to represent the offset indicating which Mapping to modify|[VirtualPMemMapping](./../SchemaReference.md#VirtualPMemMapping)|"Add" or "Remove"<br>`Settings` is ignored when type is "Remove"|
     * |L"VirtualMachine/Devices/VirtualSmb/Shares"|[VirtualSmbShare](./../SchemaReference.md#VirtualSmbShare)|No Limit|
     * |L"VirtualMachine/Devices/VirtualPci/" + c_Identifier|[VirtualPciDevice](./../SchemaReference.md#VirtualSmbShare)|"Add" or "Remove"<br>`Settings` is ignored when type is "Remove"|
     * @param {HCS_SYSTEM} computeSystem Handle the compute system to modify.
     * @param {HCS_OPERATION} operation Handle to the operation that tracks the modify operation.
     * @param {PWSTR} configuration JSON document of [ModifySettingRequest](./../SchemaReference.md#ModifySettingRequest) specifying the settings to modify.
     * @param {HANDLE} identity Optional handle to an access token that is used when applying the settings.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsModifyComputeSystem
     */
    static HcsModifyComputeSystem(computeSystem, operation, configuration, identity) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        configuration := configuration is String ? StrPtr(configuration) : configuration
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := DllCall("computecore.dll\HcsModifyComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", configuration, "ptr", identity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsWaitForComputeSystemExit
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system to exit.
     * @param {Integer} timeoutMs Time to wait in milliseconds for the compute system to exit.
     * @returns {PWSTR} JSON document of [SystemExitStatus](./../SchemaReference.md#SystemExitStatus).
     * 
     * The caller is responsible for releasing the returned string using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsWaitForComputeSystemExit
     */
    static HcsWaitForComputeSystemExit(computeSystem, timeoutMs) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("computecore.dll\HcsWaitForComputeSystemExit", "ptr", computeSystem, "uint", timeoutMs, "ptr*", &result := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsSetComputeSystemCallback
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system.
     * @param {Integer} callbackOptions The option for callback, using one from [HCS_EVENT_OPTIONS](./HCS_EVENT_OPTIONS.md).
     * @param {Pointer<Void>} context Optional pointer to a context that is passed to the callback.
     * @param {Pointer<HCS_EVENT_CALLBACK>} callback The target [`HCS_EVENT_CALLBACK`](./HCS_EVENT_CALLBACK.md) for compute system events.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetComputeSystemCallback
     */
    static HcsSetComputeSystemCallback(computeSystem, callbackOptions, context, callback) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("computecore.dll\HcsSetComputeSystemCallback", "ptr", computeSystem, "int", callbackOptions, contextMarshal, context, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsInitializeLiveMigrationOnSource(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsInitializeLiveMigrationOnSource", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsStartLiveMigrationOnSource(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsStartLiveMigrationOnSource", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsStartLiveMigrationTransfer(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsStartLiveMigrationTransfer", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsFinalizeLiveMigration(computeSystem, operation, options) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsFinalizeLiveMigration", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsCreateProcess
     * @remarks
     * It is recommended for callers to use [`HcsWaitForOperationResultAndProcessInfo`](./HcsWaitForOperationResultAndProcessInfo.md) or [`HcsGetOperationResultAndProcessInfo`](./HcsGetOperationResultAndProcessInfo.md) function calls to ensure you can get a reference to the process information. This is important when the process has created standard Input/Output/Error handles. You can still get this through a call to [`HcsGetProcessInfo`](./HcsGetProcessInfo.md).
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system in which to start the process.
     * @param {PWSTR} processParameters JSON document of [ProcessParameters](./../SchemaReference.md#ProcessParameters) specifying the command line and environment for the process.
     * @param {HCS_OPERATION} operation Handle to the operation that tracks the process creation operation.
     * @param {Pointer<SECURITY_DESCRIPTOR>} securityDescriptor Reserved for future use, must be `NULL`.
     * @param {Pointer<HCS_PROCESS>} process Receives the `HCS_PROCESS` handle to the newly created process.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResultAndProcessInfo`](./HcsWaitForOperationResultAndProcessInfo.md) or [`HcsGetOperationResultAndProcessInfo`](./HcsGetOperationResultAndProcessInfo.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCreateProcess
     */
    static HcsCreateProcess(computeSystem, processParameters, operation, securityDescriptor, process) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        processParameters := processParameters is String ? StrPtr(processParameters) : processParameters
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsCreateProcess", "ptr", computeSystem, "ptr", processParameters, "ptr", operation, "ptr", securityDescriptor, "ptr", process, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsOpenProcess
     * @param {HCS_SYSTEM} computeSystem The handle to the compute system in which to start the process.
     * @param {Integer} processId Specifies the Id of the process to open.
     * @param {Integer} requestedAccess Specifies the required access to the compute system.
     * @param {Pointer<HCS_PROCESS>} process Receives the handle to the process.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsOpenProcess
     */
    static HcsOpenProcess(computeSystem, processId, requestedAccess, process) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("computecore.dll\HcsOpenProcess", "ptr", computeSystem, "uint", processId, "uint", requestedAccess, "ptr", process, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsCloseProcess
     * @param {HCS_PROCESS} process Process handle to close.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseProcess
     */
    static HcsCloseProcess(process) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process

        DllCall("computecore.dll\HcsCloseProcess", "ptr", process)
    }

    /**
     * HcsTerminateProcess
     * @param {HCS_PROCESS} process The handle to the process to terminate.
     * @param {HCS_OPERATION} operation The handle to the operation tracking the terminate operation.
     * @param {PWSTR} options Reserved for future use. Must be `NULL`.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResultAndProcessInfo`](./HcsWaitForOperationResultAndProcessInfo.md) or [`HcsGetOperationResultAndProcessInfo`](./HcsGetOperationResultAndProcessInfo.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsTerminateProcess
     */
    static HcsTerminateProcess(process, operation, options) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsTerminateProcess", "ptr", process, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsSignalProcess
     * @param {HCS_PROCESS} process The handle to the process to send the signal to.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the signal.
     * @param {PWSTR} options Optional JSON document of [SignalProcessOptions](./../SchemaReference.md#SignalProcessOptions) specifying the detailed signal.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResultAndProcessInfo`](./HcsWaitForOperationResultAndProcessInfo.md) or [`HcsGetOperationResultAndProcessInfo`](./HcsGetOperationResultAndProcessInfo.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSignalProcess
     */
    static HcsSignalProcess(process, operation, options) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        options := options is String ? StrPtr(options) : options

        result := DllCall("computecore.dll\HcsSignalProcess", "ptr", process, "ptr", operation, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGetProcessInfo
     * @param {HCS_PROCESS} process The handle to the process to query.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the process.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResultAndProcessInfo`](./HcsWaitForOperationResultAndProcessInfo.md) or [`HcsGetOperationResultAndProcessInfo`](./HcsGetOperationResultAndProcessInfo.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetProcessInfo
     */
    static HcsGetProcessInfo(process, operation) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetProcessInfo", "ptr", process, "ptr", operation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGetProcessProperties
     * @param {HCS_PROCESS} process The handle to the process to query.
     * @param {HCS_OPERATION} operation The handle to the operation that tracks the process.
     * @param {PWSTR} propertyQuery Optional JSON document of [ProcessStatus](./../SchemaReference.md#ProcessStatus) specifying the properties to query.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResultAndProcessInfo`](./HcsWaitForOperationResultAndProcessInfo.md) or [`HcsGetOperationResultAndProcessInfo`](./HcsGetOperationResultAndProcessInfo.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetProcessProperties
     */
    static HcsGetProcessProperties(process, operation, propertyQuery) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery

        result := DllCall("computecore.dll\HcsGetProcessProperties", "ptr", process, "ptr", operation, "ptr", propertyQuery, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsModifyProcess
     * @param {HCS_PROCESS} process Handle to the process to modify.
     * @param {HCS_OPERATION} operation Handle to the operation that tracks the process.
     * @param {PWSTR} settings JSON document of [ProcessModifyRequest](./../SchemaReference.md#ProcessModifyRequest) specifying the settings of process to modify.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * 
     * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResultAndProcessInfo`](./HcsWaitForOperationResultAndProcessInfo.md) or [`HcsGetOperationResultAndProcessInfo`](./HcsGetOperationResultAndProcessInfo.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsModifyProcess
     */
    static HcsModifyProcess(process, operation, settings) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        settings := settings is String ? StrPtr(settings) : settings

        result := DllCall("computecore.dll\HcsModifyProcess", "ptr", process, "ptr", operation, "ptr", settings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsSetProcessCallback
     * @param {HCS_PROCESS} process The handle to the process for that the callback is registered.
     * @param {Integer} callbackOptions The option for callback, using [HCS_EVENT_OPTIONS](./HCS_EVENT_OPTIONS.md).
     * @param {Pointer<Void>} context Optional pointer to a context that is passed to the callback.
     * @param {Pointer<HCS_EVENT_CALLBACK>} callback Callback function that is invoked for events on the process.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetProcessCallback
     */
    static HcsSetProcessCallback(process, callbackOptions, context, callback) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := DllCall("computecore.dll\HcsSetProcessCallback", "ptr", process, "int", callbackOptions, contextMarshal, context, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsWaitForProcessExit
     * @param {HCS_PROCESS} computeSystem 
     * @param {Integer} timeoutMs Time to wait in milliseconds for the process to exit.
     * @returns {PWSTR} JSON document of [ProcessStatus](./../SchemaReference.md#ProcessStatus).
     * 
     * The caller is responsible for releasing the returned string using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsWaitForProcessExit
     */
    static HcsWaitForProcessExit(computeSystem, timeoutMs) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("computecore.dll\HcsWaitForProcessExit", "ptr", computeSystem, "uint", timeoutMs, "ptr*", &result := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGetServiceProperties
     * @remarks
     * On success, the result as [ServiceProperties](./../SchemaReference.md#ServiceProperties) JSON document is an array of `"Properties"` of type `Any`. In JSON, `Any` means an arbitrary object with no restrictions. Refer to the following table to know what JSON type HCS expects for each [GetPropertyType](./../SchemaReference.md#GetPropertyType).
     * 
     * |`GetPropertyType`|Property type for `result`|
     * |---|---|
     * |`"Basic"`|[BasicInformation](./../SchemaReference.md#BasicInformation)|
     * |`"CpuGroup"`|[CpuGroupConfigurations](./../SchemaReference.md#CpuGroupConfigurations)|
     * |`"ProcessorTopology"`|[processorTopology](./../SchemaReference.md#ProcessorTopology)|
     * |`"ContainerCredentialGuard"`|[ContainerCredentialGuardSystemInfo](./../SchemaReference.md#ContainerCredentialGuardSystemInfo)|
     * |`"QoSCapabilities"`|[QoSCapabilities](./../SchemaReference.md#QoSCapabilities)|
     * @param {PWSTR} propertyQuery Optional JSON document of [Service_PropertyQuery](./../SchemaReference.md#Service_PropertyQuery) specifying the properties to query.
     * @returns {PWSTR} On success, receives a JSON document of [ServiceProperties](./../SchemaReference.md#ServiceProperties) with the requested properties.
     * 
     * On failure, it can optionally receive an error JSON document represented by a [ResultError](./../SchemaReference.md#ResultError).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetServiceProperties
     */
    static HcsGetServiceProperties(propertyQuery) {
        propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery

        result := DllCall("computecore.dll\HcsGetServiceProperties", "ptr", propertyQuery, "ptr*", &result := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsModifyServiceSettings
     * @remarks
     * The [ModificationRequest](./../SchemaReference.md#ModificationRequest) JSON document has a property called `"Settings"` of type `Any`. In JSON, `Any` means an arbitrary object with no restrictions. Refer to the following table to know what JSON type HCS expects for each [ModifyPropertyType](./../SchemaReference.md#ModifyPropertyType).
     * 
     * |`ModifyPropertyType`|`"Setting"` JSON Type|
     * |---|---|
     * |`"CpuGroup"`|[HostProcessorModificationRequest](./../SchemaReference.md#HostProcessorModificationRequest)|
     * |`"ContainerCredentialGuard"`|[ContainerCredentialGuardOperationRequest](./../SchemaReference.md#ContainerCredentialGuardOperationRequest)|
     * @param {PWSTR} settings JSON document of [ModificationRequest](./../SchemaReference.md#ModificationRequest) specifying the settings to modify.
     * @returns {PWSTR} On failure, it can optionally receive an error JSON document represented by a [ResultError](./../SchemaReference.md#ResultError); it's not guaranteed to be always returned and depends on the property type that is being modified.
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsModifyServiceSettings
     */
    static HcsModifyServiceSettings(settings) {
        settings := settings is String ? StrPtr(settings) : settings

        result := DllCall("computecore.dll\HcsModifyServiceSettings", "ptr", settings, "ptr*", &result := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsSubmitWerReport
     * @param {PWSTR} settings JSON document of [CrashReport](./../SchemaReference.md#CrashReport) with the bugcheck information.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSubmitWerReport
     */
    static HcsSubmitWerReport(settings) {
        settings := settings is String ? StrPtr(settings) : settings

        result := DllCall("computecore.dll\HcsSubmitWerReport", "ptr", settings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsCreateEmptyGuestStateFile
     * @param {PWSTR} guestStateFilePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCreateEmptyGuestStateFile
     */
    static HcsCreateEmptyGuestStateFile(guestStateFilePath) {
        guestStateFilePath := guestStateFilePath is String ? StrPtr(guestStateFilePath) : guestStateFilePath

        result := DllCall("computecore.dll\HcsCreateEmptyGuestStateFile", "ptr", guestStateFilePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} runtimeStateFilePath 
     * @returns {HRESULT} 
     */
    static HcsCreateEmptyRuntimeStateFile(runtimeStateFilePath) {
        runtimeStateFilePath := runtimeStateFilePath is String ? StrPtr(runtimeStateFilePath) : runtimeStateFilePath

        result := DllCall("computecore.dll\HcsCreateEmptyRuntimeStateFile", "ptr", runtimeStateFilePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGrantVmAccess
     * @param {PWSTR} vmId Unique Id of the VM's compute system.
     * @param {PWSTR} filePath Path to the file for which to update the ACL.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGrantVmAccess
     */
    static HcsGrantVmAccess(vmId, filePath) {
        vmId := vmId is String ? StrPtr(vmId) : vmId
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := DllCall("computecore.dll\HcsGrantVmAccess", "ptr", vmId, "ptr", filePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsRevokeVmAccess
     * @param {PWSTR} vmId Unique Id of the VM's compute system.
     * @param {PWSTR} filePath Path to teh file for which to update the ACL.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsRevokeVmAccess
     */
    static HcsRevokeVmAccess(vmId, filePath) {
        vmId := vmId is String ? StrPtr(vmId) : vmId
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := DllCall("computecore.dll\HcsRevokeVmAccess", "ptr", vmId, "ptr", filePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGrantVmGroupAccess
     * @param {PWSTR} filePath Path to the file for which to update the ACL.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGrantVmGroupAccess
     */
    static HcsGrantVmGroupAccess(filePath) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := DllCall("computecore.dll\HcsGrantVmGroupAccess", "ptr", filePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsRevokeVmGroupAccess
     * @param {PWSTR} filePath Path to teh file for which to update the ACL.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsRevokeVmGroupAccess
     */
    static HcsRevokeVmGroupAccess(filePath) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := DllCall("computecore.dll\HcsRevokeVmGroupAccess", "ptr", filePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsImportLayer
     * @param {PWSTR} layerPath Destination path for the container layer.
     * @param {PWSTR} sourceFolderPath Source path that contains the downloaded layer files.
     * @param {PWSTR} layerData JSON document of [layerData](./../SchemaReference.md#LayerData) providing the locations of the antecedent layers that are used by the imported layer.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsImportLayer
     */
    static HcsImportLayer(layerPath, sourceFolderPath, layerData) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        sourceFolderPath := sourceFolderPath is String ? StrPtr(sourceFolderPath) : sourceFolderPath
        layerData := layerData is String ? StrPtr(layerData) : layerData

        result := DllCall("computestorage.dll\HcsImportLayer", "ptr", layerPath, "ptr", sourceFolderPath, "ptr", layerData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsExportLayer
     * @param {PWSTR} layerPath Path of the layer to export.
     * @param {PWSTR} exportFolderPath Destination folder for the exported layer.
     * @param {PWSTR} layerData JSON document of [layerData](./../SchemaReference.md#LayerData) providing the locations of the antecedent layers that are used by the exported layer.
     * @param {PWSTR} options JSON document of [ExportLayerOptions](./../SchemaReference.md#ExportLayerOptions) describing the layer to export.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsExportLayer
     */
    static HcsExportLayer(layerPath, exportFolderPath, layerData, options) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        exportFolderPath := exportFolderPath is String ? StrPtr(exportFolderPath) : exportFolderPath
        layerData := layerData is String ? StrPtr(layerData) : layerData
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsExportLayer", "ptr", layerPath, "ptr", exportFolderPath, "ptr", layerData, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsExportLegacyWritableLayer
     * @param {PWSTR} writableLayerMountPath Path of the writable layer to export.
     * @param {PWSTR} writableLayerFolderPath Folder of the writable layer to export.
     * @param {PWSTR} exportFolderPath Destination folder for the exported layer.
     * @param {PWSTR} layerData JSON document of [layerData](./../SchemaReference.md#LayerData) providing the locations of the antecedent layers that are used by the exported layer.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsExportLegacyWritableLayer
     */
    static HcsExportLegacyWritableLayer(writableLayerMountPath, writableLayerFolderPath, exportFolderPath, layerData) {
        writableLayerMountPath := writableLayerMountPath is String ? StrPtr(writableLayerMountPath) : writableLayerMountPath
        writableLayerFolderPath := writableLayerFolderPath is String ? StrPtr(writableLayerFolderPath) : writableLayerFolderPath
        exportFolderPath := exportFolderPath is String ? StrPtr(exportFolderPath) : exportFolderPath
        layerData := layerData is String ? StrPtr(layerData) : layerData

        result := DllCall("computestorage.dll\HcsExportLegacyWritableLayer", "ptr", writableLayerMountPath, "ptr", writableLayerFolderPath, "ptr", exportFolderPath, "ptr", layerData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsDestroyLayer
     * @remarks
     * **Be careful when using this API, it deletes directories using high privilege rights.**
     * This function deletes a layer from the host.
     * @param {PWSTR} layerPath Path of the layer to delete.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsDestroyLayer
     */
    static HcsDestroyLayer(layerPath) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath

        result := DllCall("computestorage.dll\HcsDestroyLayer", "ptr", layerPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsSetupBaseOSLayer
     * @param {PWSTR} layerPath Path to the root of the base OS layer.
     * @param {HANDLE} vhdHandle The handle to a VHD.
     * @param {PWSTR} options Optional JSON document  of [OsLayerOptions](./../SchemaReference.md#OsLayerOptions) describing options for setting up the layer.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetupBaseOSLayer
     */
    static HcsSetupBaseOSLayer(layerPath, vhdHandle, options) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        vhdHandle := vhdHandle is Win32Handle ? NumGet(vhdHandle, "ptr") : vhdHandle
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsSetupBaseOSLayer", "ptr", layerPath, "ptr", vhdHandle, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsInitializeWritableLayer
     * @param {PWSTR} writableLayerPath Full path to the root directory of the writable layer.
     * @param {PWSTR} layerData JSON document providing the locations of the antecedent layers that are used by teh writable layer.
     * @param {PWSTR} options Reserved for future use. Must be `NULL`.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsInitializeWritableLayer
     */
    static HcsInitializeWritableLayer(writableLayerPath, layerData, options) {
        writableLayerPath := writableLayerPath is String ? StrPtr(writableLayerPath) : writableLayerPath
        layerData := layerData is String ? StrPtr(layerData) : layerData
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsInitializeWritableLayer", "ptr", writableLayerPath, "ptr", layerData, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsInitializeLegacyWritableLayer
     * @param {PWSTR} writableLayerMountPath Full path to the root directory of the writable layer.
     * @param {PWSTR} writableLayerFolderPath The legacy hive folder with the writable layer.
     * @param {PWSTR} layerData JSON document of [layerData](./../SchemaReference.md#LayerData) providing the locations of the antecedent layers that are used by teh writable layer.
     * @param {PWSTR} options Optional JSON document specifying the options for how to initialize the sandbox (e.g. which filesystem paths should be pre-expanded in the sandbox).
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsInitializeLegacyWritableLayer
     */
    static HcsInitializeLegacyWritableLayer(writableLayerMountPath, writableLayerFolderPath, layerData, options) {
        writableLayerMountPath := writableLayerMountPath is String ? StrPtr(writableLayerMountPath) : writableLayerMountPath
        writableLayerFolderPath := writableLayerFolderPath is String ? StrPtr(writableLayerFolderPath) : writableLayerFolderPath
        layerData := layerData is String ? StrPtr(layerData) : layerData
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsInitializeLegacyWritableLayer", "ptr", writableLayerMountPath, "ptr", writableLayerFolderPath, "ptr", layerData, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsAttachLayerStorageFilter
     * @param {PWSTR} layerPath Full path to the root directory of the layer.
     * @param {PWSTR} layerData JSON document of [layerData](./../SchemaReference.md#LayerData) providing the locations of the antecedent layers that are used by the layer.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsAttachLayerStorageFilter
     */
    static HcsAttachLayerStorageFilter(layerPath, layerData) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        layerData := layerData is String ? StrPtr(layerData) : layerData

        result := DllCall("computestorage.dll\HcsAttachLayerStorageFilter", "ptr", layerPath, "ptr", layerData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsDetachLayerStorageFilter
     * @param {PWSTR} layerPath Path to the root directory of the layer.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsDetachLayerStorageFilter
     */
    static HcsDetachLayerStorageFilter(layerPath) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath

        result := DllCall("computestorage.dll\HcsDetachLayerStorageFilter", "ptr", layerPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsFormatWritableLayerVhd
     * @param {HANDLE} vhdHandle The handle to an unmounted virtual hard disk.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsFormatWritableLayerVhd
     */
    static HcsFormatWritableLayerVhd(vhdHandle) {
        vhdHandle := vhdHandle is Win32Handle ? NumGet(vhdHandle, "ptr") : vhdHandle

        result := DllCall("computestorage.dll\HcsFormatWritableLayerVhd", "ptr", vhdHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * HcsGetLayerVhdMountPath
     * @param {HANDLE} vhdHandle The handle to a mounted virtual hard disk on the host.
     * @returns {PWSTR} Receives the volume path for the layer. It is the caller's responsibility to release the returned string buffer using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetLayerVhdMountPath
     */
    static HcsGetLayerVhdMountPath(vhdHandle) {
        vhdHandle := vhdHandle is Win32Handle ? NumGet(vhdHandle, "ptr") : vhdHandle

        result := DllCall("computestorage.dll\HcsGetLayerVhdMountPath", "ptr", vhdHandle, "ptr*", &mountPath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mountPath
    }

    /**
     * HcsSetupBaseOSVolume
     * @param {PWSTR} layerPath Path to the root of the base OS layer.
     * @param {PWSTR} volumePath 
     * @param {PWSTR} options Optional JSON document  of [OsLayerOptions](./../SchemaReference.md#OsLayerOptions) describing options for setting up the layer.
     * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetupBaseOSVolume
     */
    static HcsSetupBaseOSVolume(layerPath, volumePath, options) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        volumePath := volumePath is String ? StrPtr(volumePath) : volumePath
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsSetupBaseOSVolume", "ptr", layerPath, "ptr", volumePath, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} VolumeMountPoint 
     * @param {PWSTR} LayerData 
     * @returns {HRESULT} 
     */
    static HcsAttachOverlayFilter(VolumeMountPoint, LayerData) {
        VolumeMountPoint := VolumeMountPoint is String ? StrPtr(VolumeMountPoint) : VolumeMountPoint
        LayerData := LayerData is String ? StrPtr(LayerData) : LayerData

        result := DllCall("computestorage.dll\HcsAttachOverlayFilter", "ptr", VolumeMountPoint, "ptr", LayerData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} VolumeMountPoint 
     * @param {PWSTR} LayerData 
     * @returns {HRESULT} 
     */
    static HcsDetachOverlayFilter(VolumeMountPoint, LayerData) {
        VolumeMountPoint := VolumeMountPoint is String ? StrPtr(VolumeMountPoint) : VolumeMountPoint
        LayerData := LayerData is String ? StrPtr(LayerData) : LayerData

        result := DllCall("computestorage.dll\HcsDetachOverlayFilter", "ptr", VolumeMountPoint, "ptr", LayerData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
