#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GetEntitlementResult.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallManager4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallManager4
     * @type {Guid}
     */
    static IID => Guid("{260a2a16-5a9e-4ebd-b944-f2ba75c31159}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFreeUserEntitlementAsync", "GetFreeUserEntitlementForUserAsync", "GetFreeDeviceEntitlementAsync"]

    /**
     * 
     * @param {HSTRING} storeId 
     * @param {HSTRING} campaignId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<GetEntitlementResult>} 
     */
    GetFreeUserEntitlementAsync(storeId, campaignId, correlationVector) {
        if(storeId is String) {
            pin := HSTRING.Create(storeId)
            storeId := pin.Value
        }
        storeId := storeId is Win32Handle ? NumGet(storeId, "ptr") : storeId
        if(campaignId is String) {
            pin := HSTRING.Create(campaignId)
            campaignId := pin.Value
        }
        campaignId := campaignId is Win32Handle ? NumGet(campaignId, "ptr") : campaignId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(6, this, "ptr", storeId, "ptr", campaignId, "ptr", correlationVector, "ptr*", &ppAsyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GetEntitlementResult, ppAsyncOperation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} storeId 
     * @param {HSTRING} campaignId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<GetEntitlementResult>} 
     */
    GetFreeUserEntitlementForUserAsync(user_, storeId, campaignId, correlationVector) {
        if(storeId is String) {
            pin := HSTRING.Create(storeId)
            storeId := pin.Value
        }
        storeId := storeId is Win32Handle ? NumGet(storeId, "ptr") : storeId
        if(campaignId is String) {
            pin := HSTRING.Create(campaignId)
            campaignId := pin.Value
        }
        campaignId := campaignId is Win32Handle ? NumGet(campaignId, "ptr") : campaignId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(7, this, "ptr", user_, "ptr", storeId, "ptr", campaignId, "ptr", correlationVector, "ptr*", &ppAsyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GetEntitlementResult, ppAsyncOperation)
    }

    /**
     * 
     * @param {HSTRING} storeId 
     * @param {HSTRING} campaignId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<GetEntitlementResult>} 
     */
    GetFreeDeviceEntitlementAsync(storeId, campaignId, correlationVector) {
        if(storeId is String) {
            pin := HSTRING.Create(storeId)
            storeId := pin.Value
        }
        storeId := storeId is Win32Handle ? NumGet(storeId, "ptr") : storeId
        if(campaignId is String) {
            pin := HSTRING.Create(campaignId)
            campaignId := pin.Value
        }
        campaignId := campaignId is Win32Handle ? NumGet(campaignId, "ptr") : campaignId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(8, this, "ptr", storeId, "ptr", campaignId, "ptr", correlationVector, "ptr*", &ppAsyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GetEntitlementResult, ppAsyncOperation)
    }
}
