#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StoreHardwareManufacturerInfo.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStoreConfigurationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreConfigurationStatics
     * @type {Guid}
     */
    static IID => Guid("{728f7fc0-8628-42ec-84a2-07780eb44d8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSystemConfiguration", "SetMobileOperatorConfiguration", "SetStoreWebAccountId", "IsStoreWebAccountId", "get_HardwareManufacturerInfo", "FilterUnsupportedSystemFeaturesAsync"]

    /**
     * @type {StoreHardwareManufacturerInfo} 
     */
    HardwareManufacturerInfo {
        get => this.get_HardwareManufacturerInfo()
    }

    /**
     * 
     * @param {HSTRING} catalogHardwareManufacturerId 
     * @param {HSTRING} catalogStoreContentModifierId 
     * @param {DateTime} systemConfigurationExpiration 
     * @param {HSTRING} catalogHardwareDescriptor 
     * @returns {HRESULT} 
     */
    SetSystemConfiguration(catalogHardwareManufacturerId, catalogStoreContentModifierId, systemConfigurationExpiration, catalogHardwareDescriptor) {
        if(catalogHardwareManufacturerId is String) {
            pin := HSTRING.Create(catalogHardwareManufacturerId)
            catalogHardwareManufacturerId := pin.Value
        }
        catalogHardwareManufacturerId := catalogHardwareManufacturerId is Win32Handle ? NumGet(catalogHardwareManufacturerId, "ptr") : catalogHardwareManufacturerId
        if(catalogStoreContentModifierId is String) {
            pin := HSTRING.Create(catalogStoreContentModifierId)
            catalogStoreContentModifierId := pin.Value
        }
        catalogStoreContentModifierId := catalogStoreContentModifierId is Win32Handle ? NumGet(catalogStoreContentModifierId, "ptr") : catalogStoreContentModifierId
        if(catalogHardwareDescriptor is String) {
            pin := HSTRING.Create(catalogHardwareDescriptor)
            catalogHardwareDescriptor := pin.Value
        }
        catalogHardwareDescriptor := catalogHardwareDescriptor is Win32Handle ? NumGet(catalogHardwareDescriptor, "ptr") : catalogHardwareDescriptor

        result := ComCall(6, this, "ptr", catalogHardwareManufacturerId, "ptr", catalogStoreContentModifierId, "ptr", systemConfigurationExpiration, "ptr", catalogHardwareDescriptor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} mobileOperatorId 
     * @param {Integer} appDownloadLimitInMegabytes 
     * @param {Integer} updateDownloadLimitInMegabytes 
     * @returns {HRESULT} 
     */
    SetMobileOperatorConfiguration(mobileOperatorId, appDownloadLimitInMegabytes, updateDownloadLimitInMegabytes) {
        if(mobileOperatorId is String) {
            pin := HSTRING.Create(mobileOperatorId)
            mobileOperatorId := pin.Value
        }
        mobileOperatorId := mobileOperatorId is Win32Handle ? NumGet(mobileOperatorId, "ptr") : mobileOperatorId

        result := ComCall(7, this, "ptr", mobileOperatorId, "uint", appDownloadLimitInMegabytes, "uint", updateDownloadLimitInMegabytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} webAccountId 
     * @returns {HRESULT} 
     */
    SetStoreWebAccountId(webAccountId) {
        if(webAccountId is String) {
            pin := HSTRING.Create(webAccountId)
            webAccountId := pin.Value
        }
        webAccountId := webAccountId is Win32Handle ? NumGet(webAccountId, "ptr") : webAccountId

        result := ComCall(8, this, "ptr", webAccountId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} webAccountId 
     * @returns {Boolean} 
     */
    IsStoreWebAccountId(webAccountId) {
        if(webAccountId is String) {
            pin := HSTRING.Create(webAccountId)
            webAccountId := pin.Value
        }
        webAccountId := webAccountId is Win32Handle ? NumGet(webAccountId, "ptr") : webAccountId

        result := ComCall(9, this, "ptr", webAccountId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {StoreHardwareManufacturerInfo} 
     */
    get_HardwareManufacturerInfo() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StoreHardwareManufacturerInfo(value)
    }

    /**
     * 
     * @param {IIterable<Integer>} systemFeatures 
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     */
    FilterUnsupportedSystemFeaturesAsync(systemFeatures) {
        result := ComCall(11, this, "ptr", systemFeatures, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => IPropertyValue(ptr).GetInt32()), operation)
    }
}
