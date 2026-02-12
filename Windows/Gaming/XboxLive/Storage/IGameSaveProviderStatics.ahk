#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GameSaveProviderGetResult.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class IGameSaveProviderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameSaveProviderStatics
     * @type {Guid}
     */
    static IID => Guid("{d01d3ed0-7b03-449d-8cbd-3402842a1048}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForUserAsync", "GetSyncOnDemandForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} serviceConfigId 
     * @returns {IAsyncOperation<GameSaveProviderGetResult>} 
     */
    GetForUserAsync(user_, serviceConfigId) {
        if(serviceConfigId is String) {
            pin := HSTRING.Create(serviceConfigId)
            serviceConfigId := pin.Value
        }
        serviceConfigId := serviceConfigId is Win32Handle ? NumGet(serviceConfigId, "ptr") : serviceConfigId

        result := ComCall(6, this, "ptr", user_, "ptr", serviceConfigId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveProviderGetResult, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} serviceConfigId 
     * @returns {IAsyncOperation<GameSaveProviderGetResult>} 
     */
    GetSyncOnDemandForUserAsync(user_, serviceConfigId) {
        if(serviceConfigId is String) {
            pin := HSTRING.Create(serviceConfigId)
            serviceConfigId := pin.Value
        }
        serviceConfigId := serviceConfigId is Win32Handle ? NumGet(serviceConfigId, "ptr") : serviceConfigId

        result := ComCall(7, this, "ptr", user_, "ptr", serviceConfigId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveProviderGetResult, operation)
    }
}
