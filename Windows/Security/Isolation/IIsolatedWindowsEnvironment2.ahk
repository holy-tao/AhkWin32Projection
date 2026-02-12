#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\IsolatedWindowsEnvironmentPostMessageResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironment2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironment2
     * @type {Guid}
     */
    static IID => Guid("{2d365f39-88bd-4ab4-93cf-7e2bcef337c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PostMessageToReceiverAsync", "PostMessageToReceiverWithTelemetryAsync"]

    /**
     * 
     * @param {Guid} receiverId 
     * @param {IIterable<IInspectable>} message 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentPostMessageResult>} 
     */
    PostMessageToReceiverAsync(receiverId, message) {
        result := ComCall(6, this, "ptr", receiverId, "ptr", message, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentPostMessageResult, operation)
    }

    /**
     * 
     * @param {Guid} receiverId 
     * @param {IIterable<IInspectable>} message 
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentPostMessageResult>} 
     */
    PostMessageToReceiverWithTelemetryAsync(receiverId, message, telemetryParameters) {
        result := ComCall(7, this, "ptr", receiverId, "ptr", message, "ptr", telemetryParameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentPostMessageResult, operation)
    }
}
