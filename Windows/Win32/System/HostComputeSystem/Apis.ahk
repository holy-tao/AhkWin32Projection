#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\HCS_CREATE_OPTIONS.ahk" { HCS_CREATE_OPTIONS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HCS_PROCESS_INFORMATION.ahk" { HCS_PROCESS_INFORMATION }
#Import ".\HCS_SYSTEM.ahk" { HCS_SYSTEM }
#Import ".\HCS_PROCESS.ahk" { HCS_PROCESS }
#Import ".\HCS_OPERATION_OPTIONS.ahk" { HCS_OPERATION_OPTIONS }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HCS_OPERATION_TYPE.ahk" { HCS_OPERATION_TYPE }
#Import "..\..\Security\SECURITY_DESCRIPTOR.ahk" { SECURITY_DESCRIPTOR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCS_RESOURCE_TYPE.ahk" { HCS_RESOURCE_TYPE }
#Import ".\HCS_OPERATION.ahk" { HCS_OPERATION }
#Import ".\HCS_EVENT_OPTIONS.ahk" { HCS_EVENT_OPTIONS }

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */

;@region Functions
/**
 * HcsEnumerateComputeSystems
 * @param {PWSTR} query Optional JSON document of [SystemQuery](./../SchemaReference.md#SystemQuery) specifying a query for specific compute systems.
 * @param {HCS_OPERATION} operation The handle to the operation that tracks the enumerate operation.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * 
 * If the return value is `S_OK`, it means the operation started successfully. Callers are expected to get the operation's result using [`HcsWaitForOperationResult`](./HcsWaitForOperationResult.md) or [`HcsGetOperationResult`](./HcsGetOperationResult.md)
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsEnumerateComputeSystems
 */
export HcsEnumerateComputeSystems(query, operation) {
    query := query is String ? StrPtr(query) : query

    result := DllCall("computecore.dll\HcsEnumerateComputeSystems", "ptr", query, HCS_OPERATION, operation, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} idNamespace 
 * @param {PWSTR} query 
 * @param {HCS_OPERATION} operation 
 * @returns {HRESULT} 
 */
export HcsEnumerateComputeSystemsInNamespace(idNamespace, query, operation) {
    idNamespace := idNamespace is String ? StrPtr(idNamespace) : idNamespace
    query := query is String ? StrPtr(query) : query

    result := DllCall("computecore.dll\HcsEnumerateComputeSystemsInNamespace", "ptr", idNamespace, "ptr", query, HCS_OPERATION, operation, "HRESULT")
    return result
}

/**
 * HcsCreateOperation
 * @remarks
 * Refer to the async model sample code for details on how to use HCS operations.
 * @param {Pointer<Void>} _context Optional pointer to a context that is passed to the callback.
 * @param {Pointer<HCS_OPERATION_COMPLETION>} callback Optional pointer to an [`HCS_OPERATION_COMPLETION`](./HCS_OPERATION_COMPLETION.md) callback to be invoked when the operation completes.
 * @returns {HCS_OPERATION} Returns the `HCS_OPERATION` handle to the newly created operation on success, `NULL` if resources required for the operation couldn't be allocated. It is the responsibility of the caller to release the operation using [`HcsCloseOperation`](./HcsCloseOperation.md) once it is no longer used.
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCreateOperation
 */
export HcsCreateOperation(_context, callback) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("computecore.dll\HcsCreateOperation", _contextMarshal, _context, "ptr", callback, HCS_OPERATION.Owned)
    return result
}

/**
 * 
 * @param {HCS_OPERATION_OPTIONS} eventTypes 
 * @param {Pointer<Void>} _context 
 * @param {Pointer<HCS_EVENT_CALLBACK>} callback 
 * @returns {HCS_OPERATION} 
 */
export HcsCreateOperationWithNotifications(eventTypes, _context, callback) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("computecore.dll\HcsCreateOperationWithNotifications", HCS_OPERATION_OPTIONS, eventTypes, _contextMarshal, _context, "ptr", callback, HCS_OPERATION.Owned)
    return result
}

/**
 * HcsCloseOperation
 * @param {HCS_OPERATION} operation Handle to an operation.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseOperation
 */
export HcsCloseOperation(operation) {
    DllCall("computecore.dll\HcsCloseOperation", HCS_OPERATION, operation)
}

/**
 * HcsGetOperationContext
 * @param {HCS_OPERATION} operation The handle to an operation.
 * @returns {Pointer<Void>} Returns the context pointer stored in the operation as a `void*` type.
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationContext
 */
export HcsGetOperationContext(operation) {
    result := DllCall("computecore.dll\HcsGetOperationContext", HCS_OPERATION, operation, IntPtr)
    return result
}

/**
 * HcsSetOperationContext
 * @param {HCS_OPERATION} operation The handle to an active operation.
 * @param {Pointer<Void>} _context Optional pointer to a context that is passed to the callback.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetOperationContext
 */
export HcsSetOperationContext(operation, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("computecore.dll\HcsSetOperationContext", HCS_OPERATION, operation, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * HcsGetComputeSystemFromOperation
 * @param {HCS_OPERATION} operation The handle to an active operation.
 * @returns {HCS_SYSTEM} Returns the `HCS_SYSTEM` handle to the compute system used by active operation, returns `NULL` if the operation is not active.
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetComputeSystemFromOperation
 */
export HcsGetComputeSystemFromOperation(operation) {
    result := DllCall("computecore.dll\HcsGetComputeSystemFromOperation", HCS_OPERATION, operation, HCS_SYSTEM.Owned)
    return result
}

/**
 * HcsGetProcessFromOperation
 * @param {HCS_OPERATION} operation The handle to an active operation.
 * @returns {HCS_PROCESS} If the function succeeds, the return value is `HCS_PROCESS`.
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetProcessFromOperation
 */
export HcsGetProcessFromOperation(operation) {
    result := DllCall("computecore.dll\HcsGetProcessFromOperation", HCS_OPERATION, operation, HCS_PROCESS.Owned)
    return result
}

/**
 * HcsGetOperationType
 * @param {HCS_OPERATION} operation The handle to an active operation.
 * @returns {HCS_OPERATION_TYPE} If the function succeeds, the return value is [HCS_OPERATION_TYPE](./HCS_OPERATION_TYPE.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationType
 */
export HcsGetOperationType(operation) {
    result := DllCall("computecore.dll\HcsGetOperationType", HCS_OPERATION, operation, HCS_OPERATION_TYPE)
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
export HcsGetOperationId(operation) {
    result := DllCall("computecore.dll\HcsGetOperationId", HCS_OPERATION, operation, Int64)
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
export HcsGetOperationResult(operation) {
    result := DllCall("computecore.dll\HcsGetOperationResult", HCS_OPERATION, operation, PWSTR.Ptr, &resultDocument := 0, "HRESULT")
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
export HcsGetOperationResultAndProcessInfo(operation, processInformation) {
    result := DllCall("computecore.dll\HcsGetOperationResultAndProcessInfo", HCS_OPERATION, operation, HCS_PROCESS_INFORMATION.Ptr, processInformation, PWSTR.Ptr, &resultDocument := 0, "HRESULT")
    return resultDocument
}

/**
 * 
 * @param {HCS_OPERATION} operation 
 * @param {HCS_RESOURCE_TYPE} type 
 * @param {PWSTR} uri 
 * @param {HANDLE} _handle 
 * @returns {HRESULT} 
 */
export HcsAddResourceToOperation(operation, type, uri, _handle) {
    uri := uri is String ? StrPtr(uri) : uri

    result := DllCall("computecore.dll\HcsAddResourceToOperation", HCS_OPERATION, operation, HCS_RESOURCE_TYPE, type, "ptr", uri, HANDLE, _handle, "HRESULT")
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
export HcsGetProcessorCompatibilityFromSavedState(RuntimeFileName) {
    RuntimeFileName := RuntimeFileName is String ? StrPtr(RuntimeFileName) : RuntimeFileName

    result := DllCall("computecore.dll\HcsGetProcessorCompatibilityFromSavedState", "ptr", RuntimeFileName, PWSTR.Ptr, &ProcessorFeaturesString := 0, "HRESULT")
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
export HcsWaitForOperationResult(operation, timeoutMs) {
    result := DllCall("computecore.dll\HcsWaitForOperationResult", HCS_OPERATION, operation, "uint", timeoutMs, PWSTR.Ptr, &resultDocument := 0, "HRESULT")
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
export HcsWaitForOperationResultAndProcessInfo(operation, timeoutMs, processInformation) {
    result := DllCall("computecore.dll\HcsWaitForOperationResultAndProcessInfo", HCS_OPERATION, operation, "uint", timeoutMs, HCS_PROCESS_INFORMATION.Ptr, processInformation, PWSTR.Ptr, &resultDocument := 0, "HRESULT")
    return resultDocument
}

/**
 * HcsSetOperationCallback
 * @param {HCS_OPERATION} operation The handle to an active operation.
 * @param {Pointer<Void>} _context Optional pointer to a context that is passed to the callback.
 * @param {Pointer<HCS_OPERATION_COMPLETION>} callback The target [`HCS_OPERATION_COMPLETION`](./HCS_OPERATION_COMPLETION.md) callback that is invoked on completion of an operation.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetOperationCallback
 */
export HcsSetOperationCallback(operation, _context, callback) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("computecore.dll\HcsSetOperationCallback", HCS_OPERATION, operation, _contextMarshal, _context, "ptr", callback, "HRESULT")
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
export HcsCancelOperation(operation) {
    result := DllCall("computecore.dll\HcsCancelOperation", HCS_OPERATION, operation, "HRESULT")
    return result
}

/**
 * 
 * @param {HCS_OPERATION} operation 
 * @param {PWSTR} options 
 * @returns {PWSTR} 
 */
export HcsGetOperationProperties(operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsGetOperationProperties", HCS_OPERATION, operation, "ptr", options, PWSTR.Ptr, &resultDocument := 0, "HRESULT")
    return resultDocument
}

/**
 * HcsCreateComputeSystem
 * @param {PWSTR} id Unique Id identifying the compute system.
 * @param {PWSTR} configuration JSON document specifying the settings of the [compute system](./../SchemaReference.md#ComputeSystem). The compute system document is expected to have a `Container`, `VirtualMachine` or `HostedSystem` property set since they are mutually exclusive.
 * @param {HCS_OPERATION} operation The handle to the operation that tracks the create operation.
 * @param {Pointer<SECURITY_DESCRIPTOR>} _securityDescriptor Reserved for future use, must be `NULL`.
 * @returns {HCS_SYSTEM} Receives a handle to the newly created compute system. It is the responsibility of the caller to release the handle using [HcsCloseComputeSystem](./HcsCloseComputeSystem.md) once it is no longer in use.
 * @see https://learn.microsoft.com/virtualization/api/hcs/reference/HcsCreateComputeSystem
 */
export HcsCreateComputeSystem(id, configuration, operation, _securityDescriptor) {
    id := id is String ? StrPtr(id) : id
    configuration := configuration is String ? StrPtr(configuration) : configuration

    computeSystem := HCS_SYSTEM.Owned()
    result := DllCall("computecore.dll\HcsCreateComputeSystem", "ptr", id, "ptr", configuration, HCS_OPERATION, operation, SECURITY_DESCRIPTOR.Ptr, _securityDescriptor, HCS_SYSTEM.Ptr, computeSystem, "HRESULT")
    return computeSystem
}

/**
 * 
 * @param {PWSTR} idNamespace 
 * @param {PWSTR} id 
 * @param {PWSTR} configuration 
 * @param {HCS_OPERATION} operation 
 * @param {Pointer<HCS_CREATE_OPTIONS>} options 
 * @returns {HCS_SYSTEM} 
 */
export HcsCreateComputeSystemInNamespace(idNamespace, id, configuration, operation, options) {
    idNamespace := idNamespace is String ? StrPtr(idNamespace) : idNamespace
    id := id is String ? StrPtr(id) : id
    configuration := configuration is String ? StrPtr(configuration) : configuration

    optionsMarshal := options is VarRef ? "int*" : "ptr"

    computeSystem := HCS_SYSTEM.Owned()
    result := DllCall("computecore.dll\HcsCreateComputeSystemInNamespace", "ptr", idNamespace, "ptr", id, "ptr", configuration, HCS_OPERATION, operation, optionsMarshal, options, HCS_SYSTEM.Ptr, computeSystem, "HRESULT")
    return computeSystem
}

/**
 * HcsOpenComputeSystem
 * @param {PWSTR} id Unique Id identifying the compute system.
 * @param {Integer} requestedAccess Reserved for future use, must be `GENERIC_ALL`.
 * @returns {HCS_SYSTEM} Receives a handle to the compute system. It is the responsibility of the caller to release the handle using [HcsCloseComputeSystem](./HcsCloseComputeSystem.md) once it is no longer in use.
 * @see https://learn.microsoft.com/virtualization/api/hcs/reference/HcsOpenComputeSystem
 */
export HcsOpenComputeSystem(id, requestedAccess) {
    id := id is String ? StrPtr(id) : id

    computeSystem := HCS_SYSTEM.Owned()
    result := DllCall("computecore.dll\HcsOpenComputeSystem", "ptr", id, "uint", requestedAccess, HCS_SYSTEM.Ptr, computeSystem, "HRESULT")
    return computeSystem
}

/**
 * 
 * @param {PWSTR} idNamespace 
 * @param {PWSTR} id 
 * @param {Integer} requestedAccess 
 * @returns {HCS_SYSTEM} 
 */
export HcsOpenComputeSystemInNamespace(idNamespace, id, requestedAccess) {
    idNamespace := idNamespace is String ? StrPtr(idNamespace) : idNamespace
    id := id is String ? StrPtr(id) : id

    computeSystem := HCS_SYSTEM.Owned()
    result := DllCall("computecore.dll\HcsOpenComputeSystemInNamespace", "ptr", idNamespace, "ptr", id, "uint", requestedAccess, HCS_SYSTEM.Ptr, computeSystem, "HRESULT")
    return computeSystem
}

/**
 * HcsCloseComputeSystem
 * @param {HCS_SYSTEM} computeSystem The handle to the compute system.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseComputeSystem
 */
export HcsCloseComputeSystem(computeSystem) {
    DllCall("computecore.dll\HcsCloseComputeSystem", HCS_SYSTEM, computeSystem)
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
export HcsStartComputeSystem(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsStartComputeSystem", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsShutDownComputeSystem(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsShutDownComputeSystem", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsTerminateComputeSystem(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsTerminateComputeSystem", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsCrashComputeSystem(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsCrashComputeSystem", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsPauseComputeSystem(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsPauseComputeSystem", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsResumeComputeSystem(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsResumeComputeSystem", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsSaveComputeSystem(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsSaveComputeSystem", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsGetComputeSystemProperties(computeSystem, operation, propertyQuery) {
    propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery

    result := DllCall("computecore.dll\HcsGetComputeSystemProperties", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", propertyQuery, "HRESULT")
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
export HcsModifyComputeSystem(computeSystem, operation, configuration, identity) {
    configuration := configuration is String ? StrPtr(configuration) : configuration

    result := DllCall("computecore.dll\HcsModifyComputeSystem", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", configuration, HANDLE, identity, "HRESULT")
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
export HcsWaitForComputeSystemExit(computeSystem, timeoutMs) {
    result := DllCall("computecore.dll\HcsWaitForComputeSystemExit", HCS_SYSTEM, computeSystem, "uint", timeoutMs, PWSTR.Ptr, &result := 0, "HRESULT")
    return result
}

/**
 * HcsSetComputeSystemCallback
 * @param {HCS_SYSTEM} computeSystem The handle to the compute system.
 * @param {HCS_EVENT_OPTIONS} callbackOptions The option for callback, using one from [HCS_EVENT_OPTIONS](./HCS_EVENT_OPTIONS.md).
 * @param {Pointer<Void>} _context Optional pointer to a context that is passed to the callback.
 * @param {Pointer<HCS_EVENT_CALLBACK>} callback The target [`HCS_EVENT_CALLBACK`](./HCS_EVENT_CALLBACK.md) for compute system events.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetComputeSystemCallback
 */
export HcsSetComputeSystemCallback(computeSystem, callbackOptions, _context, callback) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("computecore.dll\HcsSetComputeSystemCallback", HCS_SYSTEM, computeSystem, HCS_EVENT_OPTIONS, callbackOptions, _contextMarshal, _context, "ptr", callback, "HRESULT")
    return result
}

/**
 * 
 * @param {HCS_SYSTEM} computeSystem 
 * @param {HCS_OPERATION} operation 
 * @param {PWSTR} options 
 * @returns {HRESULT} 
 */
export HcsInitializeLiveMigrationOnSource(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsInitializeLiveMigrationOnSource", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
    return result
}

/**
 * 
 * @param {HCS_SYSTEM} computeSystem 
 * @param {HCS_OPERATION} operation 
 * @param {PWSTR} options 
 * @returns {HRESULT} 
 */
export HcsStartLiveMigrationOnSource(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsStartLiveMigrationOnSource", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
    return result
}

/**
 * 
 * @param {HCS_SYSTEM} computeSystem 
 * @param {HCS_OPERATION} operation 
 * @param {PWSTR} options 
 * @returns {HRESULT} 
 */
export HcsStartLiveMigrationTransfer(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsStartLiveMigrationTransfer", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
    return result
}

/**
 * 
 * @param {HCS_SYSTEM} computeSystem 
 * @param {HCS_OPERATION} operation 
 * @param {PWSTR} options 
 * @returns {HRESULT} 
 */
export HcsFinalizeLiveMigration(computeSystem, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsFinalizeLiveMigration", HCS_SYSTEM, computeSystem, HCS_OPERATION, operation, "ptr", options, "HRESULT")
    return result
}

/**
 * HcsCreateProcess
 * @remarks
 * It is recommended for callers to use [`HcsWaitForOperationResultAndProcessInfo`](./HcsWaitForOperationResultAndProcessInfo.md) or [`HcsGetOperationResultAndProcessInfo`](./HcsGetOperationResultAndProcessInfo.md) function calls to ensure you can get a reference to the process information. This is important when the process has created standard Input/Output/Error handles. You can still get this through a call to [`HcsGetProcessInfo`](./HcsGetProcessInfo.md).
 * @param {HCS_SYSTEM} computeSystem The handle to the compute system in which to start the process.
 * @param {PWSTR} processParameters JSON document of [ProcessParameters](./../SchemaReference.md#ProcessParameters) specifying the command line and environment for the process.
 * @param {HCS_OPERATION} operation Handle to the operation that tracks the process creation operation.
 * @param {Pointer<SECURITY_DESCRIPTOR>} _securityDescriptor Reserved for future use, must be `NULL`.
 * @returns {HCS_PROCESS} Receives the `HCS_PROCESS` handle to the newly created process.
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCreateProcess
 */
export HcsCreateProcess(computeSystem, processParameters, operation, _securityDescriptor) {
    processParameters := processParameters is String ? StrPtr(processParameters) : processParameters

    process := HCS_PROCESS.Owned()
    result := DllCall("computecore.dll\HcsCreateProcess", HCS_SYSTEM, computeSystem, "ptr", processParameters, HCS_OPERATION, operation, SECURITY_DESCRIPTOR.Ptr, _securityDescriptor, HCS_PROCESS.Ptr, process, "HRESULT")
    return process
}

/**
 * HcsOpenProcess
 * @param {HCS_SYSTEM} computeSystem The handle to the compute system in which to start the process.
 * @param {Integer} processId Specifies the Id of the process to open.
 * @param {Integer} requestedAccess Specifies the required access to the compute system.
 * @returns {HCS_PROCESS} Receives the handle to the process.
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsOpenProcess
 */
export HcsOpenProcess(computeSystem, processId, requestedAccess) {
    process := HCS_PROCESS.Owned()
    result := DllCall("computecore.dll\HcsOpenProcess", HCS_SYSTEM, computeSystem, "uint", processId, "uint", requestedAccess, HCS_PROCESS.Ptr, process, "HRESULT")
    return process
}

/**
 * HcsCloseProcess
 * @param {HCS_PROCESS} process Process handle to close.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseProcess
 */
export HcsCloseProcess(process) {
    DllCall("computecore.dll\HcsCloseProcess", HCS_PROCESS, process)
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
export HcsTerminateProcess(process, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsTerminateProcess", HCS_PROCESS, process, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsSignalProcess(process, operation, options) {
    options := options is String ? StrPtr(options) : options

    result := DllCall("computecore.dll\HcsSignalProcess", HCS_PROCESS, process, HCS_OPERATION, operation, "ptr", options, "HRESULT")
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
export HcsGetProcessInfo(process, operation) {
    result := DllCall("computecore.dll\HcsGetProcessInfo", HCS_PROCESS, process, HCS_OPERATION, operation, "HRESULT")
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
export HcsGetProcessProperties(process, operation, propertyQuery) {
    propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery

    result := DllCall("computecore.dll\HcsGetProcessProperties", HCS_PROCESS, process, HCS_OPERATION, operation, "ptr", propertyQuery, "HRESULT")
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
export HcsModifyProcess(process, operation, settings) {
    settings := settings is String ? StrPtr(settings) : settings

    result := DllCall("computecore.dll\HcsModifyProcess", HCS_PROCESS, process, HCS_OPERATION, operation, "ptr", settings, "HRESULT")
    return result
}

/**
 * HcsSetProcessCallback
 * @param {HCS_PROCESS} process The handle to the process for that the callback is registered.
 * @param {HCS_EVENT_OPTIONS} callbackOptions The option for callback, using [HCS_EVENT_OPTIONS](./HCS_EVENT_OPTIONS.md).
 * @param {Pointer<Void>} _context Optional pointer to a context that is passed to the callback.
 * @param {Pointer<HCS_EVENT_CALLBACK>} callback Callback function that is invoked for events on the process.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSetProcessCallback
 */
export HcsSetProcessCallback(process, callbackOptions, _context, callback) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("computecore.dll\HcsSetProcessCallback", HCS_PROCESS, process, HCS_EVENT_OPTIONS, callbackOptions, _contextMarshal, _context, "ptr", callback, "HRESULT")
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
export HcsWaitForProcessExit(computeSystem, timeoutMs) {
    result := DllCall("computecore.dll\HcsWaitForProcessExit", HCS_PROCESS, computeSystem, "uint", timeoutMs, PWSTR.Ptr, &result := 0, "HRESULT")
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
export HcsGetServiceProperties(propertyQuery) {
    propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery

    result := DllCall("computecore.dll\HcsGetServiceProperties", "ptr", propertyQuery, PWSTR.Ptr, &result := 0, "HRESULT")
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
export HcsModifyServiceSettings(settings) {
    settings := settings is String ? StrPtr(settings) : settings

    result := DllCall("computecore.dll\HcsModifyServiceSettings", "ptr", settings, PWSTR.Ptr, &result := 0, "HRESULT")
    return result
}

/**
 * HcsSubmitWerReport
 * @param {PWSTR} settings JSON document of [CrashReport](./../SchemaReference.md#CrashReport) with the bugcheck information.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsSubmitWerReport
 */
export HcsSubmitWerReport(settings) {
    settings := settings is String ? StrPtr(settings) : settings

    result := DllCall("computecore.dll\HcsSubmitWerReport", "ptr", settings, "HRESULT")
    return result
}

/**
 * HcsCreateEmptyGuestStateFile
 * @param {PWSTR} guestStateFilePath 
 * @returns {HRESULT} 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCreateEmptyGuestStateFile
 */
export HcsCreateEmptyGuestStateFile(guestStateFilePath) {
    guestStateFilePath := guestStateFilePath is String ? StrPtr(guestStateFilePath) : guestStateFilePath

    result := DllCall("computecore.dll\HcsCreateEmptyGuestStateFile", "ptr", guestStateFilePath, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} runtimeStateFilePath 
 * @returns {HRESULT} 
 */
export HcsCreateEmptyRuntimeStateFile(runtimeStateFilePath) {
    runtimeStateFilePath := runtimeStateFilePath is String ? StrPtr(runtimeStateFilePath) : runtimeStateFilePath

    result := DllCall("computecore.dll\HcsCreateEmptyRuntimeStateFile", "ptr", runtimeStateFilePath, "HRESULT")
    return result
}

/**
 * HcsGrantVmAccess
 * @param {PWSTR} vmId Unique Id of the VM's compute system.
 * @param {PWSTR} filePath Path to the file for which to update the ACL.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGrantVmAccess
 */
export HcsGrantVmAccess(vmId, filePath) {
    vmId := vmId is String ? StrPtr(vmId) : vmId
    filePath := filePath is String ? StrPtr(filePath) : filePath

    result := DllCall("computecore.dll\HcsGrantVmAccess", "ptr", vmId, "ptr", filePath, "HRESULT")
    return result
}

/**
 * HcsRevokeVmAccess
 * @param {PWSTR} vmId Unique Id of the VM's compute system.
 * @param {PWSTR} filePath Path to teh file for which to update the ACL.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsRevokeVmAccess
 */
export HcsRevokeVmAccess(vmId, filePath) {
    vmId := vmId is String ? StrPtr(vmId) : vmId
    filePath := filePath is String ? StrPtr(filePath) : filePath

    result := DllCall("computecore.dll\HcsRevokeVmAccess", "ptr", vmId, "ptr", filePath, "HRESULT")
    return result
}

/**
 * HcsGrantVmGroupAccess
 * @param {PWSTR} filePath Path to the file for which to update the ACL.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGrantVmGroupAccess
 */
export HcsGrantVmGroupAccess(filePath) {
    filePath := filePath is String ? StrPtr(filePath) : filePath

    result := DllCall("computecore.dll\HcsGrantVmGroupAccess", "ptr", filePath, "HRESULT")
    return result
}

/**
 * HcsRevokeVmGroupAccess
 * @param {PWSTR} filePath Path to teh file for which to update the ACL.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsRevokeVmGroupAccess
 */
export HcsRevokeVmGroupAccess(filePath) {
    filePath := filePath is String ? StrPtr(filePath) : filePath

    result := DllCall("computecore.dll\HcsRevokeVmGroupAccess", "ptr", filePath, "HRESULT")
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
export HcsImportLayer(layerPath, sourceFolderPath, layerData) {
    layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
    sourceFolderPath := sourceFolderPath is String ? StrPtr(sourceFolderPath) : sourceFolderPath
    layerData := layerData is String ? StrPtr(layerData) : layerData

    result := DllCall("computestorage.dll\HcsImportLayer", "ptr", layerPath, "ptr", sourceFolderPath, "ptr", layerData, "HRESULT")
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
export HcsExportLayer(layerPath, exportFolderPath, layerData, options) {
    layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
    exportFolderPath := exportFolderPath is String ? StrPtr(exportFolderPath) : exportFolderPath
    layerData := layerData is String ? StrPtr(layerData) : layerData
    options := options is String ? StrPtr(options) : options

    result := DllCall("computestorage.dll\HcsExportLayer", "ptr", layerPath, "ptr", exportFolderPath, "ptr", layerData, "ptr", options, "HRESULT")
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
export HcsExportLegacyWritableLayer(writableLayerMountPath, writableLayerFolderPath, exportFolderPath, layerData) {
    writableLayerMountPath := writableLayerMountPath is String ? StrPtr(writableLayerMountPath) : writableLayerMountPath
    writableLayerFolderPath := writableLayerFolderPath is String ? StrPtr(writableLayerFolderPath) : writableLayerFolderPath
    exportFolderPath := exportFolderPath is String ? StrPtr(exportFolderPath) : exportFolderPath
    layerData := layerData is String ? StrPtr(layerData) : layerData

    result := DllCall("computestorage.dll\HcsExportLegacyWritableLayer", "ptr", writableLayerMountPath, "ptr", writableLayerFolderPath, "ptr", exportFolderPath, "ptr", layerData, "HRESULT")
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
export HcsDestroyLayer(layerPath) {
    layerPath := layerPath is String ? StrPtr(layerPath) : layerPath

    result := DllCall("computestorage.dll\HcsDestroyLayer", "ptr", layerPath, "HRESULT")
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
export HcsSetupBaseOSLayer(layerPath, vhdHandle, options) {
    layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
    options := options is String ? StrPtr(options) : options

    result := DllCall("computestorage.dll\HcsSetupBaseOSLayer", "ptr", layerPath, HANDLE, vhdHandle, "ptr", options, "HRESULT")
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
export HcsInitializeWritableLayer(writableLayerPath, layerData, options) {
    writableLayerPath := writableLayerPath is String ? StrPtr(writableLayerPath) : writableLayerPath
    layerData := layerData is String ? StrPtr(layerData) : layerData
    options := options is String ? StrPtr(options) : options

    result := DllCall("computestorage.dll\HcsInitializeWritableLayer", "ptr", writableLayerPath, "ptr", layerData, "ptr", options, "HRESULT")
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
export HcsInitializeLegacyWritableLayer(writableLayerMountPath, writableLayerFolderPath, layerData, options) {
    writableLayerMountPath := writableLayerMountPath is String ? StrPtr(writableLayerMountPath) : writableLayerMountPath
    writableLayerFolderPath := writableLayerFolderPath is String ? StrPtr(writableLayerFolderPath) : writableLayerFolderPath
    layerData := layerData is String ? StrPtr(layerData) : layerData
    options := options is String ? StrPtr(options) : options

    result := DllCall("computestorage.dll\HcsInitializeLegacyWritableLayer", "ptr", writableLayerMountPath, "ptr", writableLayerFolderPath, "ptr", layerData, "ptr", options, "HRESULT")
    return result
}

/**
 * HcsAttachLayerStorageFilter
 * @param {PWSTR} layerPath Full path to the root directory of the layer.
 * @param {PWSTR} layerData JSON document of [layerData](./../SchemaReference.md#LayerData) providing the locations of the antecedent layers that are used by the layer.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsAttachLayerStorageFilter
 */
export HcsAttachLayerStorageFilter(layerPath, layerData) {
    layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
    layerData := layerData is String ? StrPtr(layerData) : layerData

    result := DllCall("computestorage.dll\HcsAttachLayerStorageFilter", "ptr", layerPath, "ptr", layerData, "HRESULT")
    return result
}

/**
 * HcsDetachLayerStorageFilter
 * @param {PWSTR} layerPath Path to the root directory of the layer.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsDetachLayerStorageFilter
 */
export HcsDetachLayerStorageFilter(layerPath) {
    layerPath := layerPath is String ? StrPtr(layerPath) : layerPath

    result := DllCall("computestorage.dll\HcsDetachLayerStorageFilter", "ptr", layerPath, "HRESULT")
    return result
}

/**
 * HcsFormatWritableLayerVhd
 * @param {HANDLE} vhdHandle The handle to an unmounted virtual hard disk.
 * @returns {HRESULT} The function returns [HRESULT](./HCSHResult.md).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsFormatWritableLayerVhd
 */
export HcsFormatWritableLayerVhd(vhdHandle) {
    result := DllCall("computestorage.dll\HcsFormatWritableLayerVhd", HANDLE, vhdHandle, "HRESULT")
    return result
}

/**
 * HcsGetLayerVhdMountPath
 * @param {HANDLE} vhdHandle The handle to a mounted virtual hard disk on the host.
 * @returns {PWSTR} Receives the volume path for the layer. It is the caller's responsibility to release the returned string buffer using [`LocalFree`](/windows/win32/api/winbase/nf-winbase-localfree).
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetLayerVhdMountPath
 */
export HcsGetLayerVhdMountPath(vhdHandle) {
    result := DllCall("computestorage.dll\HcsGetLayerVhdMountPath", HANDLE, vhdHandle, PWSTR.Ptr, &mountPath := 0, "HRESULT")
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
export HcsSetupBaseOSVolume(layerPath, volumePath, options) {
    layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
    volumePath := volumePath is String ? StrPtr(volumePath) : volumePath
    options := options is String ? StrPtr(options) : options

    result := DllCall("computestorage.dll\HcsSetupBaseOSVolume", "ptr", layerPath, "ptr", volumePath, "ptr", options, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} VolumeMountPoint 
 * @param {PWSTR} LayerData 
 * @returns {HRESULT} 
 */
export HcsAttachOverlayFilter(VolumeMountPoint, LayerData) {
    VolumeMountPoint := VolumeMountPoint is String ? StrPtr(VolumeMountPoint) : VolumeMountPoint
    LayerData := LayerData is String ? StrPtr(LayerData) : LayerData

    result := DllCall("computestorage.dll\HcsAttachOverlayFilter", "ptr", VolumeMountPoint, "ptr", LayerData, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} VolumeMountPoint 
 * @param {PWSTR} LayerData 
 * @returns {HRESULT} 
 */
export HcsDetachOverlayFilter(VolumeMountPoint, LayerData) {
    VolumeMountPoint := VolumeMountPoint is String ? StrPtr(VolumeMountPoint) : VolumeMountPoint
    LayerData := LayerData is String ? StrPtr(LayerData) : LayerData

    result := DllCall("computestorage.dll\HcsDetachOverlayFilter", "ptr", VolumeMountPoint, "ptr", LayerData, "HRESULT")
    return result
}

;@endregion Functions
