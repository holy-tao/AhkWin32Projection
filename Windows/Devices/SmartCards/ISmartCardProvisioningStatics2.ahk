#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SmartCardProvisioning.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardProvisioningStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardProvisioningStatics2
     * @type {Guid}
     */
    static IID => Guid("{3447c6a8-c9a0-4bd6-b50d-251f4e8d3a62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAttestedVirtualSmartCardCreationAsync", "RequestAttestedVirtualSmartCardCreationAsyncWithCardId"]

    /**
     * 
     * @param {HSTRING} friendlyName 
     * @param {IBuffer} administrativeKey 
     * @param {SmartCardPinPolicy} pinPolicy 
     * @returns {IAsyncOperation<SmartCardProvisioning>} 
     */
    RequestAttestedVirtualSmartCardCreationAsync(friendlyName, administrativeKey, pinPolicy) {
        if(friendlyName is String) {
            pin := HSTRING.Create(friendlyName)
            friendlyName := pin.Value
        }
        friendlyName := friendlyName is Win32Handle ? NumGet(friendlyName, "ptr") : friendlyName

        result := ComCall(6, this, "ptr", friendlyName, "ptr", administrativeKey, "ptr", pinPolicy, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardProvisioning, result_)
    }

    /**
     * 
     * @param {HSTRING} friendlyName 
     * @param {IBuffer} administrativeKey 
     * @param {SmartCardPinPolicy} pinPolicy 
     * @param {Guid} cardId 
     * @returns {IAsyncOperation<SmartCardProvisioning>} 
     */
    RequestAttestedVirtualSmartCardCreationAsyncWithCardId(friendlyName, administrativeKey, pinPolicy, cardId) {
        if(friendlyName is String) {
            pin := HSTRING.Create(friendlyName)
            friendlyName := pin.Value
        }
        friendlyName := friendlyName is Win32Handle ? NumGet(friendlyName, "ptr") : friendlyName

        result := ComCall(7, this, "ptr", friendlyName, "ptr", administrativeKey, "ptr", pinPolicy, "ptr", cardId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardProvisioning, result_)
    }
}
