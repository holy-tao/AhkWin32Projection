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
     * 
     * @param {PWSTR} query 
     * @param {HCS_OPERATION} operation 
     * @returns {HRESULT} 
     */
    static HcsEnumerateComputeSystems(query, operation) {
        query := query is String ? StrPtr(query) : query
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsEnumerateComputeSystems", "ptr", query, "ptr", operation, "int")
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_OPERATION_COMPLETION>} callback 
     * @returns {HCS_OPERATION} 
     */
    static HcsCreateOperation(context, callback) {
        result := DllCall("computecore.dll\HcsCreateOperation", "ptr", context, "ptr", callback, "ptr")
        return HCS_OPERATION({Value: result}, True)
    }

    /**
     * 
     * @param {Integer} eventTypes 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_EVENT_CALLBACK>} callback 
     * @returns {HCS_OPERATION} 
     */
    static HcsCreateOperationWithNotifications(eventTypes, context, callback) {
        result := DllCall("computecore.dll\HcsCreateOperationWithNotifications", "int", eventTypes, "ptr", context, "ptr", callback, "ptr")
        return HCS_OPERATION({Value: result}, True)
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {String} Nothing - always returns an empty string
     */
    static HcsCloseOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        DllCall("computecore.dll\HcsCloseOperation", "ptr", operation)
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {Pointer<Void>} 
     */
    static HcsGetOperationContext(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationContext", "ptr", operation, "ptr")
        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static HcsSetOperationContext(operation, context) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsSetOperationContext", "ptr", operation, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {HCS_SYSTEM} 
     */
    static HcsGetComputeSystemFromOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetComputeSystemFromOperation", "ptr", operation, "ptr")
        return HCS_SYSTEM({Value: result}, True)
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {HCS_PROCESS} 
     */
    static HcsGetProcessFromOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetProcessFromOperation", "ptr", operation, "ptr")
        return HCS_PROCESS({Value: result}, True)
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {Integer} 
     */
    static HcsGetOperationType(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationType", "ptr", operation, "int")
        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {Integer} 
     */
    static HcsGetOperationId(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationId", "ptr", operation, "uint")
        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<PWSTR>} resultDocument 
     * @returns {HRESULT} 
     */
    static HcsGetOperationResult(operation, resultDocument) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationResult", "ptr", operation, "ptr", resultDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<HCS_PROCESS_INFORMATION>} processInformation 
     * @param {Pointer<PWSTR>} resultDocument 
     * @returns {HRESULT} 
     */
    static HcsGetOperationResultAndProcessInfo(operation, processInformation, resultDocument) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationResultAndProcessInfo", "ptr", operation, "ptr", processInformation, "ptr", resultDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
        uri := uri is String ? StrPtr(uri) : uri
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        handle := handle is Win32Handle ? NumGet(handle, "ptr") : handle

        result := DllCall("computecore.dll\HcsAddResourceToOperation", "ptr", operation, "int", type, "ptr", uri, "ptr", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} RuntimeFileName 
     * @param {Pointer<PWSTR>} ProcessorFeaturesString 
     * @returns {HRESULT} 
     */
    static HcsGetProcessorCompatibilityFromSavedState(RuntimeFileName, ProcessorFeaturesString) {
        RuntimeFileName := RuntimeFileName is String ? StrPtr(RuntimeFileName) : RuntimeFileName

        result := DllCall("computecore.dll\HcsGetProcessorCompatibilityFromSavedState", "ptr", RuntimeFileName, "ptr", ProcessorFeaturesString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Integer} timeoutMs 
     * @param {Pointer<PWSTR>} resultDocument 
     * @returns {HRESULT} 
     */
    static HcsWaitForOperationResult(operation, timeoutMs, resultDocument) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsWaitForOperationResult", "ptr", operation, "uint", timeoutMs, "ptr", resultDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Integer} timeoutMs 
     * @param {Pointer<HCS_PROCESS_INFORMATION>} processInformation 
     * @param {Pointer<PWSTR>} resultDocument 
     * @returns {HRESULT} 
     */
    static HcsWaitForOperationResultAndProcessInfo(operation, timeoutMs, processInformation, resultDocument) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsWaitForOperationResultAndProcessInfo", "ptr", operation, "uint", timeoutMs, "ptr", processInformation, "ptr", resultDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_OPERATION_COMPLETION>} callback 
     * @returns {HRESULT} 
     */
    static HcsSetOperationCallback(operation, context, callback) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsSetOperationCallback", "ptr", operation, "ptr", context, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {HRESULT} 
     */
    static HcsCancelOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsCancelOperation", "ptr", operation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @param {Pointer<PWSTR>} resultDocument 
     * @returns {HRESULT} 
     */
    static HcsGetOperationProperties(operation, options, resultDocument) {
        options := options is String ? StrPtr(options) : options
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationProperties", "ptr", operation, "ptr", options, "ptr", resultDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} id 
     * @param {PWSTR} configuration 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<SECURITY_DESCRIPTOR>} securityDescriptor 
     * @param {Pointer<HCS_SYSTEM>} computeSystem 
     * @returns {HRESULT} 
     */
    static HcsCreateComputeSystem(id, configuration, operation, securityDescriptor, computeSystem) {
        id := id is String ? StrPtr(id) : id
        configuration := configuration is String ? StrPtr(configuration) : configuration
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsCreateComputeSystem", "ptr", id, "ptr", configuration, "ptr", operation, "ptr", securityDescriptor, "ptr", computeSystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} idNamespace 
     * @param {PWSTR} id 
     * @param {PWSTR} configuration 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<Int32>} options 
     * @param {Pointer<HCS_SYSTEM>} computeSystem 
     * @returns {HRESULT} 
     */
    static HcsCreateComputeSystemInNamespace(idNamespace, id, configuration, operation, options, computeSystem) {
        idNamespace := idNamespace is String ? StrPtr(idNamespace) : idNamespace
        id := id is String ? StrPtr(id) : id
        configuration := configuration is String ? StrPtr(configuration) : configuration
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsCreateComputeSystemInNamespace", "ptr", idNamespace, "ptr", id, "ptr", configuration, "ptr", operation, "int*", options, "ptr", computeSystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} id 
     * @param {Integer} requestedAccess 
     * @param {Pointer<HCS_SYSTEM>} computeSystem 
     * @returns {HRESULT} 
     */
    static HcsOpenComputeSystem(id, requestedAccess, computeSystem) {
        id := id is String ? StrPtr(id) : id

        result := DllCall("computecore.dll\HcsOpenComputeSystem", "ptr", id, "uint", requestedAccess, "ptr", computeSystem, "int")
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @returns {String} Nothing - always returns an empty string
     */
    static HcsCloseComputeSystem(computeSystem) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        DllCall("computecore.dll\HcsCloseComputeSystem", "ptr", computeSystem)
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsStartComputeSystem(computeSystem, operation, options) {
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsStartComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsShutDownComputeSystem(computeSystem, operation, options) {
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsShutDownComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsTerminateComputeSystem(computeSystem, operation, options) {
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsTerminateComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsCrashComputeSystem(computeSystem, operation, options) {
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsCrashComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsPauseComputeSystem(computeSystem, operation, options) {
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsPauseComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsResumeComputeSystem(computeSystem, operation, options) {
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsResumeComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsSaveComputeSystem(computeSystem, operation, options) {
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsSaveComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} propertyQuery 
     * @returns {HRESULT} 
     */
    static HcsGetComputeSystemProperties(computeSystem, operation, propertyQuery) {
        propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetComputeSystemProperties", "ptr", computeSystem, "ptr", operation, "ptr", propertyQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} configuration 
     * @param {HANDLE} identity 
     * @returns {HRESULT} 
     */
    static HcsModifyComputeSystem(computeSystem, operation, configuration, identity) {
        configuration := configuration is String ? StrPtr(configuration) : configuration
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation
        identity := identity is Win32Handle ? NumGet(identity, "ptr") : identity

        result := DllCall("computecore.dll\HcsModifyComputeSystem", "ptr", computeSystem, "ptr", operation, "ptr", configuration, "ptr", identity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {Integer} timeoutMs 
     * @param {Pointer<PWSTR>} result 
     * @returns {HRESULT} 
     */
    static HcsWaitForComputeSystemExit(computeSystem, timeoutMs, result) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("computecore.dll\HcsWaitForComputeSystemExit", "ptr", computeSystem, "uint", timeoutMs, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {Integer} callbackOptions 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_EVENT_CALLBACK>} callback 
     * @returns {HRESULT} 
     */
    static HcsSetComputeSystemCallback(computeSystem, callbackOptions, context, callback) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("computecore.dll\HcsSetComputeSystemCallback", "ptr", computeSystem, "int", callbackOptions, "ptr", context, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

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
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsInitializeLiveMigrationOnSource", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

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
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsStartLiveMigrationOnSource", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

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
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsStartLiveMigrationTransfer", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

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
        options := options is String ? StrPtr(options) : options
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsFinalizeLiveMigration", "ptr", computeSystem, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {PWSTR} processParameters 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<SECURITY_DESCRIPTOR>} securityDescriptor 
     * @param {Pointer<HCS_PROCESS>} process 
     * @returns {HRESULT} 
     */
    static HcsCreateProcess(computeSystem, processParameters, operation, securityDescriptor, process) {
        processParameters := processParameters is String ? StrPtr(processParameters) : processParameters
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsCreateProcess", "ptr", computeSystem, "ptr", processParameters, "ptr", operation, "ptr", securityDescriptor, "ptr", process, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {Integer} processId 
     * @param {Integer} requestedAccess 
     * @param {Pointer<HCS_PROCESS>} process 
     * @returns {HRESULT} 
     */
    static HcsOpenProcess(computeSystem, processId, requestedAccess, process) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("computecore.dll\HcsOpenProcess", "ptr", computeSystem, "uint", processId, "uint", requestedAccess, "ptr", process, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_PROCESS} process 
     * @returns {String} Nothing - always returns an empty string
     */
    static HcsCloseProcess(process) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process

        DllCall("computecore.dll\HcsCloseProcess", "ptr", process)
    }

    /**
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsTerminateProcess(process, operation, options) {
        options := options is String ? StrPtr(options) : options
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsTerminateProcess", "ptr", process, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsSignalProcess(process, operation, options) {
        options := options is String ? StrPtr(options) : options
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsSignalProcess", "ptr", process, "ptr", operation, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @returns {HRESULT} 
     */
    static HcsGetProcessInfo(process, operation) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetProcessInfo", "ptr", process, "ptr", operation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} propertyQuery 
     * @returns {HRESULT} 
     */
    static HcsGetProcessProperties(process, operation, propertyQuery) {
        propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetProcessProperties", "ptr", process, "ptr", operation, "ptr", propertyQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} settings 
     * @returns {HRESULT} 
     */
    static HcsModifyProcess(process, operation, settings) {
        settings := settings is String ? StrPtr(settings) : settings
        process := process is Win32Handle ? NumGet(process, "ptr") : process
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsModifyProcess", "ptr", process, "ptr", operation, "ptr", settings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_PROCESS} process 
     * @param {Integer} callbackOptions 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_EVENT_CALLBACK>} callback 
     * @returns {HRESULT} 
     */
    static HcsSetProcessCallback(process, callbackOptions, context, callback) {
        process := process is Win32Handle ? NumGet(process, "ptr") : process

        result := DllCall("computecore.dll\HcsSetProcessCallback", "ptr", process, "int", callbackOptions, "ptr", context, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_PROCESS} computeSystem 
     * @param {Integer} timeoutMs 
     * @param {Pointer<PWSTR>} result 
     * @returns {HRESULT} 
     */
    static HcsWaitForProcessExit(computeSystem, timeoutMs, result) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("computecore.dll\HcsWaitForProcessExit", "ptr", computeSystem, "uint", timeoutMs, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} propertyQuery 
     * @param {Pointer<PWSTR>} result 
     * @returns {HRESULT} 
     */
    static HcsGetServiceProperties(propertyQuery, result) {
        propertyQuery := propertyQuery is String ? StrPtr(propertyQuery) : propertyQuery

        result := DllCall("computecore.dll\HcsGetServiceProperties", "ptr", propertyQuery, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} settings 
     * @param {Pointer<PWSTR>} result 
     * @returns {HRESULT} 
     */
    static HcsModifyServiceSettings(settings, result) {
        settings := settings is String ? StrPtr(settings) : settings

        result := DllCall("computecore.dll\HcsModifyServiceSettings", "ptr", settings, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} settings 
     * @returns {HRESULT} 
     */
    static HcsSubmitWerReport(settings) {
        settings := settings is String ? StrPtr(settings) : settings

        result := DllCall("computecore.dll\HcsSubmitWerReport", "ptr", settings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} guestStateFilePath 
     * @returns {HRESULT} 
     */
    static HcsCreateEmptyGuestStateFile(guestStateFilePath) {
        guestStateFilePath := guestStateFilePath is String ? StrPtr(guestStateFilePath) : guestStateFilePath

        result := DllCall("computecore.dll\HcsCreateEmptyGuestStateFile", "ptr", guestStateFilePath, "int")
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} vmId 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
     */
    static HcsGrantVmAccess(vmId, filePath) {
        vmId := vmId is String ? StrPtr(vmId) : vmId
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := DllCall("computecore.dll\HcsGrantVmAccess", "ptr", vmId, "ptr", filePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} vmId 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
     */
    static HcsRevokeVmAccess(vmId, filePath) {
        vmId := vmId is String ? StrPtr(vmId) : vmId
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := DllCall("computecore.dll\HcsRevokeVmAccess", "ptr", vmId, "ptr", filePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
     */
    static HcsGrantVmGroupAccess(filePath) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := DllCall("computecore.dll\HcsGrantVmGroupAccess", "ptr", filePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
     */
    static HcsRevokeVmGroupAccess(filePath) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := DllCall("computecore.dll\HcsRevokeVmGroupAccess", "ptr", filePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} layerPath 
     * @param {PWSTR} sourceFolderPath 
     * @param {PWSTR} layerData 
     * @returns {HRESULT} 
     */
    static HcsImportLayer(layerPath, sourceFolderPath, layerData) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        sourceFolderPath := sourceFolderPath is String ? StrPtr(sourceFolderPath) : sourceFolderPath
        layerData := layerData is String ? StrPtr(layerData) : layerData

        result := DllCall("computestorage.dll\HcsImportLayer", "ptr", layerPath, "ptr", sourceFolderPath, "ptr", layerData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} layerPath 
     * @param {PWSTR} exportFolderPath 
     * @param {PWSTR} layerData 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsExportLayer(layerPath, exportFolderPath, layerData, options) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        exportFolderPath := exportFolderPath is String ? StrPtr(exportFolderPath) : exportFolderPath
        layerData := layerData is String ? StrPtr(layerData) : layerData
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsExportLayer", "ptr", layerPath, "ptr", exportFolderPath, "ptr", layerData, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} writableLayerMountPath 
     * @param {PWSTR} writableLayerFolderPath 
     * @param {PWSTR} exportFolderPath 
     * @param {PWSTR} layerData 
     * @returns {HRESULT} 
     */
    static HcsExportLegacyWritableLayer(writableLayerMountPath, writableLayerFolderPath, exportFolderPath, layerData) {
        writableLayerMountPath := writableLayerMountPath is String ? StrPtr(writableLayerMountPath) : writableLayerMountPath
        writableLayerFolderPath := writableLayerFolderPath is String ? StrPtr(writableLayerFolderPath) : writableLayerFolderPath
        exportFolderPath := exportFolderPath is String ? StrPtr(exportFolderPath) : exportFolderPath
        layerData := layerData is String ? StrPtr(layerData) : layerData

        result := DllCall("computestorage.dll\HcsExportLegacyWritableLayer", "ptr", writableLayerMountPath, "ptr", writableLayerFolderPath, "ptr", exportFolderPath, "ptr", layerData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} layerPath 
     * @returns {HRESULT} 
     */
    static HcsDestroyLayer(layerPath) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath

        result := DllCall("computestorage.dll\HcsDestroyLayer", "ptr", layerPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} layerPath 
     * @param {HANDLE} vhdHandle 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsSetupBaseOSLayer(layerPath, vhdHandle, options) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        options := options is String ? StrPtr(options) : options
        vhdHandle := vhdHandle is Win32Handle ? NumGet(vhdHandle, "ptr") : vhdHandle

        result := DllCall("computestorage.dll\HcsSetupBaseOSLayer", "ptr", layerPath, "ptr", vhdHandle, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} writableLayerPath 
     * @param {PWSTR} layerData 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsInitializeWritableLayer(writableLayerPath, layerData, options) {
        writableLayerPath := writableLayerPath is String ? StrPtr(writableLayerPath) : writableLayerPath
        layerData := layerData is String ? StrPtr(layerData) : layerData
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsInitializeWritableLayer", "ptr", writableLayerPath, "ptr", layerData, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} writableLayerMountPath 
     * @param {PWSTR} writableLayerFolderPath 
     * @param {PWSTR} layerData 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsInitializeLegacyWritableLayer(writableLayerMountPath, writableLayerFolderPath, layerData, options) {
        writableLayerMountPath := writableLayerMountPath is String ? StrPtr(writableLayerMountPath) : writableLayerMountPath
        writableLayerFolderPath := writableLayerFolderPath is String ? StrPtr(writableLayerFolderPath) : writableLayerFolderPath
        layerData := layerData is String ? StrPtr(layerData) : layerData
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsInitializeLegacyWritableLayer", "ptr", writableLayerMountPath, "ptr", writableLayerFolderPath, "ptr", layerData, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} layerPath 
     * @param {PWSTR} layerData 
     * @returns {HRESULT} 
     */
    static HcsAttachLayerStorageFilter(layerPath, layerData) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        layerData := layerData is String ? StrPtr(layerData) : layerData

        result := DllCall("computestorage.dll\HcsAttachLayerStorageFilter", "ptr", layerPath, "ptr", layerData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} layerPath 
     * @returns {HRESULT} 
     */
    static HcsDetachLayerStorageFilter(layerPath) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath

        result := DllCall("computestorage.dll\HcsDetachLayerStorageFilter", "ptr", layerPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} vhdHandle 
     * @returns {HRESULT} 
     */
    static HcsFormatWritableLayerVhd(vhdHandle) {
        vhdHandle := vhdHandle is Win32Handle ? NumGet(vhdHandle, "ptr") : vhdHandle

        result := DllCall("computestorage.dll\HcsFormatWritableLayerVhd", "ptr", vhdHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} vhdHandle 
     * @param {Pointer<PWSTR>} mountPath 
     * @returns {HRESULT} 
     */
    static HcsGetLayerVhdMountPath(vhdHandle, mountPath) {
        vhdHandle := vhdHandle is Win32Handle ? NumGet(vhdHandle, "ptr") : vhdHandle

        result := DllCall("computestorage.dll\HcsGetLayerVhdMountPath", "ptr", vhdHandle, "ptr", mountPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} layerPath 
     * @param {PWSTR} volumePath 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
     */
    static HcsSetupBaseOSVolume(layerPath, volumePath, options) {
        layerPath := layerPath is String ? StrPtr(layerPath) : layerPath
        volumePath := volumePath is String ? StrPtr(volumePath) : volumePath
        options := options is String ? StrPtr(options) : options

        result := DllCall("computestorage.dll\HcsSetupBaseOSVolume", "ptr", layerPath, "ptr", volumePath, "ptr", options, "int")
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
