#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DevicePairingResult.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceInformationCustomPairing extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceInformationCustomPairing
     * @type {Guid}
     */
    static IID => Guid("{85138c02-4ee6-4914-8370-107a39144c0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PairAsync", "PairWithProtectionLevelAsync", "PairWithProtectionLevelAndSettingsAsync", "add_PairingRequested", "remove_PairingRequested"]

    /**
     * 
     * @param {Integer} pairingKindsSupported 
     * @returns {IAsyncOperation<DevicePairingResult>} 
     */
    PairAsync(pairingKindsSupported) {
        result := ComCall(6, this, "uint", pairingKindsSupported, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DevicePairingResult, result_)
    }

    /**
     * 
     * @param {Integer} pairingKindsSupported 
     * @param {Integer} minProtectionLevel 
     * @returns {IAsyncOperation<DevicePairingResult>} 
     */
    PairWithProtectionLevelAsync(pairingKindsSupported, minProtectionLevel) {
        result := ComCall(7, this, "uint", pairingKindsSupported, "int", minProtectionLevel, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DevicePairingResult, result_)
    }

    /**
     * 
     * @param {Integer} pairingKindsSupported 
     * @param {Integer} minProtectionLevel 
     * @param {IDevicePairingSettings} devicePairingSettings 
     * @returns {IAsyncOperation<DevicePairingResult>} 
     */
    PairWithProtectionLevelAndSettingsAsync(pairingKindsSupported, minProtectionLevel, devicePairingSettings) {
        result := ComCall(8, this, "uint", pairingKindsSupported, "int", minProtectionLevel, "ptr", devicePairingSettings, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DevicePairingResult, result_)
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceInformationCustomPairing, DevicePairingRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PairingRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PairingRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
