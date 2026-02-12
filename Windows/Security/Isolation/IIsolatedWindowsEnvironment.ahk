#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\IsolatedWindowsEnvironmentStartProcessResult.ahk
#Include .\IsolatedWindowsEnvironmentShareFolderResult.ahk
#Include .\IsolatedWindowsEnvironmentLaunchFileResult.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironment
     * @type {Guid}
     */
    static IID => Guid("{41d24597-c328-4467-b37f-4dfc6f60b6bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "StartProcessSilentlyAsync", "StartProcessSilentlyWithTelemetryAsync", "ShareFolderAsync", "ShareFolderWithTelemetryAsync", "LaunchFileWithUIAsync", "LaunchFileWithUIAndTelemetryAsync", "TerminateAsync", "TerminateWithTelemetryAsync", "RegisterMessageReceiver", "UnregisterMessageReceiver"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} hostExePath 
     * @param {HSTRING} arguments 
     * @param {Integer} activator 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentStartProcessResult>} 
     */
    StartProcessSilentlyAsync(hostExePath, arguments, activator) {
        if(hostExePath is String) {
            pin := HSTRING.Create(hostExePath)
            hostExePath := pin.Value
        }
        hostExePath := hostExePath is Win32Handle ? NumGet(hostExePath, "ptr") : hostExePath
        if(arguments is String) {
            pin := HSTRING.Create(arguments)
            arguments := pin.Value
        }
        arguments := arguments is Win32Handle ? NumGet(arguments, "ptr") : arguments

        result := ComCall(7, this, "ptr", hostExePath, "ptr", arguments, "int", activator, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentStartProcessResult, operation)
    }

    /**
     * 
     * @param {HSTRING} hostExePath 
     * @param {HSTRING} arguments 
     * @param {Integer} activator 
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentStartProcessResult>} 
     */
    StartProcessSilentlyWithTelemetryAsync(hostExePath, arguments, activator, telemetryParameters) {
        if(hostExePath is String) {
            pin := HSTRING.Create(hostExePath)
            hostExePath := pin.Value
        }
        hostExePath := hostExePath is Win32Handle ? NumGet(hostExePath, "ptr") : hostExePath
        if(arguments is String) {
            pin := HSTRING.Create(arguments)
            arguments := pin.Value
        }
        arguments := arguments is Win32Handle ? NumGet(arguments, "ptr") : arguments

        result := ComCall(8, this, "ptr", hostExePath, "ptr", arguments, "int", activator, "ptr", telemetryParameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentStartProcessResult, operation)
    }

    /**
     * 
     * @param {HSTRING} hostFolder 
     * @param {IsolatedWindowsEnvironmentShareFolderRequestOptions} requestOptions 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentShareFolderResult>} 
     */
    ShareFolderAsync(hostFolder, requestOptions) {
        if(hostFolder is String) {
            pin := HSTRING.Create(hostFolder)
            hostFolder := pin.Value
        }
        hostFolder := hostFolder is Win32Handle ? NumGet(hostFolder, "ptr") : hostFolder

        result := ComCall(9, this, "ptr", hostFolder, "ptr", requestOptions, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentShareFolderResult, operation)
    }

    /**
     * 
     * @param {HSTRING} hostFolder 
     * @param {IsolatedWindowsEnvironmentShareFolderRequestOptions} requestOptions 
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentShareFolderResult>} 
     */
    ShareFolderWithTelemetryAsync(hostFolder, requestOptions, telemetryParameters) {
        if(hostFolder is String) {
            pin := HSTRING.Create(hostFolder)
            hostFolder := pin.Value
        }
        hostFolder := hostFolder is Win32Handle ? NumGet(hostFolder, "ptr") : hostFolder

        result := ComCall(10, this, "ptr", hostFolder, "ptr", requestOptions, "ptr", telemetryParameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentShareFolderResult, operation)
    }

    /**
     * 
     * @param {HSTRING} appExePath 
     * @param {HSTRING} argumentsTemplate 
     * @param {HSTRING} filePath 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentLaunchFileResult>} 
     */
    LaunchFileWithUIAsync(appExePath, argumentsTemplate, filePath) {
        if(appExePath is String) {
            pin := HSTRING.Create(appExePath)
            appExePath := pin.Value
        }
        appExePath := appExePath is Win32Handle ? NumGet(appExePath, "ptr") : appExePath
        if(argumentsTemplate is String) {
            pin := HSTRING.Create(argumentsTemplate)
            argumentsTemplate := pin.Value
        }
        argumentsTemplate := argumentsTemplate is Win32Handle ? NumGet(argumentsTemplate, "ptr") : argumentsTemplate
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(11, this, "ptr", appExePath, "ptr", argumentsTemplate, "ptr", filePath, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentLaunchFileResult, operation)
    }

    /**
     * 
     * @param {HSTRING} appExePath 
     * @param {HSTRING} argumentsTemplate 
     * @param {HSTRING} filePath 
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentLaunchFileResult>} 
     */
    LaunchFileWithUIAndTelemetryAsync(appExePath, argumentsTemplate, filePath, telemetryParameters) {
        if(appExePath is String) {
            pin := HSTRING.Create(appExePath)
            appExePath := pin.Value
        }
        appExePath := appExePath is Win32Handle ? NumGet(appExePath, "ptr") : appExePath
        if(argumentsTemplate is String) {
            pin := HSTRING.Create(argumentsTemplate)
            argumentsTemplate := pin.Value
        }
        argumentsTemplate := argumentsTemplate is Win32Handle ? NumGet(argumentsTemplate, "ptr") : argumentsTemplate
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(12, this, "ptr", appExePath, "ptr", argumentsTemplate, "ptr", filePath, "ptr", telemetryParameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentLaunchFileResult, operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    TerminateAsync() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncAction} 
     */
    TerminateWithTelemetryAsync(telemetryParameters) {
        result := ComCall(14, this, "ptr", telemetryParameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Guid} receiverId 
     * @param {MessageReceivedCallback} messageReceivedCallback_ 
     * @returns {HRESULT} 
     */
    RegisterMessageReceiver(receiverId, messageReceivedCallback_) {
        result := ComCall(15, this, "ptr", receiverId, "ptr", messageReceivedCallback_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} receiverId 
     * @returns {HRESULT} 
     */
    UnregisterMessageReceiver(receiverId) {
        result := ComCall(16, this, "ptr", receiverId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
