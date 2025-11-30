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
     * 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_OPERATION_COMPLETION>} callback 
     * @returns {HCS_OPERATION} 
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
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseOperation
     */
    static HcsCloseOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        DllCall("computecore.dll\HcsCloseOperation", "ptr", operation)
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationContext
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
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {HCS_SYSTEM} 
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetComputeSystemFromOperation
     */
    static HcsGetComputeSystemFromOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetComputeSystemFromOperation", "ptr", operation, "ptr")
        resultHandle := HCS_SYSTEM({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {HCS_PROCESS} 
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetProcessFromOperation
     */
    static HcsGetProcessFromOperation(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetProcessFromOperation", "ptr", operation, "ptr")
        resultHandle := HCS_PROCESS({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationType
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
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsGetOperationId
     */
    static HcsGetOperationId(operation) {
        operation := operation is Win32Handle ? NumGet(operation, "ptr") : operation

        result := DllCall("computecore.dll\HcsGetOperationId", "ptr", operation, "uint")
        return result
    }

    /**
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {PWSTR} 
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
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<HCS_PROCESS_INFORMATION>} processInformation 
     * @returns {PWSTR} 
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
     * 
     * @param {PWSTR} RuntimeFileName 
     * @returns {PWSTR} 
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
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Integer} timeoutMs 
     * @returns {PWSTR} 
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
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Integer} timeoutMs 
     * @param {Pointer<HCS_PROCESS_INFORMATION>} processInformation 
     * @returns {PWSTR} 
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
     * 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_OPERATION_COMPLETION>} callback 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_OPERATION} operation 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} id 
     * @param {PWSTR} configuration 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<SECURITY_DESCRIPTOR>} securityDescriptor 
     * @param {Pointer<HCS_SYSTEM>} computeSystem 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} id 
     * @param {Integer} requestedAccess 
     * @param {Pointer<HCS_SYSTEM>} computeSystem 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseComputeSystem
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} propertyQuery 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} configuration 
     * @param {HANDLE} identity 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {Integer} timeoutMs 
     * @returns {PWSTR} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {Integer} callbackOptions 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_EVENT_CALLBACK>} callback 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {PWSTR} processParameters 
     * @param {HCS_OPERATION} operation 
     * @param {Pointer<SECURITY_DESCRIPTOR>} securityDescriptor 
     * @param {Pointer<HCS_PROCESS>} process 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {Integer} processId 
     * @param {Integer} requestedAccess 
     * @param {Pointer<HCS_PROCESS>} process 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_PROCESS} process 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HcsCloseProcess
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
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} propertyQuery 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_PROCESS} process 
     * @param {HCS_OPERATION} operation 
     * @param {PWSTR} settings 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_PROCESS} process 
     * @param {Integer} callbackOptions 
     * @param {Pointer<Void>} context 
     * @param {Pointer<HCS_EVENT_CALLBACK>} callback 
     * @returns {HRESULT} 
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
     * 
     * @param {HCS_PROCESS} computeSystem 
     * @param {Integer} timeoutMs 
     * @returns {PWSTR} 
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
     * 
     * @param {PWSTR} propertyQuery 
     * @returns {PWSTR} 
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
     * 
     * @param {PWSTR} settings 
     * @returns {PWSTR} 
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
     * 
     * @param {PWSTR} settings 
     * @returns {HRESULT} 
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
     * 
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
     * 
     * @param {PWSTR} vmId 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} vmId 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} filePath 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} layerPath 
     * @param {PWSTR} sourceFolderPath 
     * @param {PWSTR} layerData 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} layerPath 
     * @param {PWSTR} exportFolderPath 
     * @param {PWSTR} layerData 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} writableLayerMountPath 
     * @param {PWSTR} writableLayerFolderPath 
     * @param {PWSTR} exportFolderPath 
     * @param {PWSTR} layerData 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} layerPath 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} layerPath 
     * @param {HANDLE} vhdHandle 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} writableLayerPath 
     * @param {PWSTR} layerData 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} writableLayerMountPath 
     * @param {PWSTR} writableLayerFolderPath 
     * @param {PWSTR} layerData 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} layerPath 
     * @param {PWSTR} layerData 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} layerPath 
     * @returns {HRESULT} 
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
     * 
     * @param {HANDLE} vhdHandle 
     * @returns {HRESULT} 
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
     * 
     * @param {HANDLE} vhdHandle 
     * @returns {PWSTR} 
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
     * 
     * @param {PWSTR} layerPath 
     * @param {PWSTR} volumePath 
     * @param {PWSTR} options 
     * @returns {HRESULT} 
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
