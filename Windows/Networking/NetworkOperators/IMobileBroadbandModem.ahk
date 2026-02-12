#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MobileBroadbandAccount.ahk
#Include .\MobileBroadbandDeviceInformation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MobileBroadbandDeviceServiceInformation.ahk
#Include .\MobileBroadbandDeviceService.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MobileBroadbandModemConfiguration.ahk
#Include .\MobileBroadbandNetwork.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandModem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandModem
     * @type {Guid}
     */
    static IID => Guid("{d0356912-e9f9-4f67-a03d-43189a316bf1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentAccount", "get_DeviceInformation", "get_MaxDeviceServiceCommandSizeInBytes", "get_MaxDeviceServiceDataSizeInBytes", "get_DeviceServices", "GetDeviceService", "get_IsResetSupported", "ResetAsync", "GetCurrentConfigurationAsync", "get_CurrentNetwork"]

    /**
     * @type {MobileBroadbandAccount} 
     */
    CurrentAccount {
        get => this.get_CurrentAccount()
    }

    /**
     * @type {MobileBroadbandDeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * @type {Integer} 
     */
    MaxDeviceServiceCommandSizeInBytes {
        get => this.get_MaxDeviceServiceCommandSizeInBytes()
    }

    /**
     * @type {Integer} 
     */
    MaxDeviceServiceDataSizeInBytes {
        get => this.get_MaxDeviceServiceDataSizeInBytes()
    }

    /**
     * @type {IVectorView<MobileBroadbandDeviceServiceInformation>} 
     */
    DeviceServices {
        get => this.get_DeviceServices()
    }

    /**
     * @type {Boolean} 
     */
    IsResetSupported {
        get => this.get_IsResetSupported()
    }

    /**
     * @type {MobileBroadbandNetwork} 
     */
    CurrentNetwork {
        get => this.get_CurrentNetwork()
    }

    /**
     * 
     * @returns {MobileBroadbandAccount} 
     */
    get_CurrentAccount() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandAccount(value)
    }

    /**
     * 
     * @returns {MobileBroadbandDeviceInformation} 
     */
    get_DeviceInformation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandDeviceInformation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxDeviceServiceCommandSizeInBytes() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxDeviceServiceDataSizeInBytes() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandDeviceServiceInformation>} 
     */
    get_DeviceServices() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandDeviceServiceInformation, value)
    }

    /**
     * 
     * @param {Guid} deviceServiceId 
     * @returns {MobileBroadbandDeviceService} 
     */
    GetDeviceService(deviceServiceId) {
        result := ComCall(11, this, "ptr", deviceServiceId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandDeviceService(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResetSupported() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ResetAsync() {
        result := ComCall(13, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {IAsyncOperation<MobileBroadbandModemConfiguration>} 
     */
    GetCurrentConfigurationAsync() {
        result := ComCall(14, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandModemConfiguration, asyncInfo)
    }

    /**
     * 
     * @returns {MobileBroadbandNetwork} 
     */
    get_CurrentNetwork() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandNetwork(value)
    }
}
