#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MobileBroadbandDeviceServiceCommandResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandDeviceServiceCommandSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandDeviceServiceCommandSession
     * @type {Guid}
     */
    static IID => Guid("{fc098a45-913b-4914-b6c3-ae6304593e75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendQueryCommandAsync", "SendSetCommandAsync", "CloseSession"]

    /**
     * 
     * @param {Integer} commandId 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<MobileBroadbandDeviceServiceCommandResult>} 
     */
    SendQueryCommandAsync(commandId, data) {
        result := ComCall(6, this, "uint", commandId, "ptr", data, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandDeviceServiceCommandResult, asyncInfo)
    }

    /**
     * 
     * @param {Integer} commandId 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<MobileBroadbandDeviceServiceCommandResult>} 
     */
    SendSetCommandAsync(commandId, data) {
        result := ComCall(7, this, "uint", commandId, "ptr", data, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandDeviceServiceCommandResult, asyncInfo)
    }

    /**
     * 
     * @returns {HRESULT} **xlHpcRetSuccess** if the session closed; **xlHpcRetInvalidSessionId** if the _SessionId_ argument is invalid; **xlHpcRetCallFailed** on other failures.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/excel/closesession
     */
    CloseSession() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
