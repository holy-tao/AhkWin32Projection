#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICComponentInfo.ahk

/**
 * Exposes methods that provide basic information about the registered metadata handler.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicmetadatahandlerinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICMetadataHandlerInfo extends IWICComponentInfo{
    /**
     * The interface identifier for IWICMetadataHandlerInfo
     * @type {Guid}
     */
    static IID => Guid("{aba958bf-c672-44d1-8d61-ce6df2e682c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<Guid>} pguidMetadataFormat 
     * @returns {HRESULT} 
     */
    GetMetadataFormat(pguidMetadataFormat) {
        result := ComCall(11, this, "ptr", pguidMetadataFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cContainerFormats 
     * @param {Pointer<Guid>} pguidContainerFormats 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetContainerFormats(cContainerFormats, pguidContainerFormats, pcchActual) {
        result := ComCall(12, this, "uint", cContainerFormats, "ptr", pguidContainerFormats, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchDeviceManufacturer 
     * @param {PWSTR} wzDeviceManufacturer 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetDeviceManufacturer(cchDeviceManufacturer, wzDeviceManufacturer, pcchActual) {
        wzDeviceManufacturer := wzDeviceManufacturer is String ? StrPtr(wzDeviceManufacturer) : wzDeviceManufacturer

        result := ComCall(13, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchDeviceModels 
     * @param {PWSTR} wzDeviceModels 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetDeviceModels(cchDeviceModels, wzDeviceModels, pcchActual) {
        wzDeviceModels := wzDeviceModels is String ? StrPtr(wzDeviceModels) : wzDeviceModels

        result := ComCall(14, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfRequiresFullStream 
     * @returns {HRESULT} 
     */
    DoesRequireFullStream(pfRequiresFullStream) {
        result := ComCall(15, this, "ptr", pfRequiresFullStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportsPadding 
     * @returns {HRESULT} 
     */
    DoesSupportPadding(pfSupportsPadding) {
        result := ComCall(16, this, "ptr", pfSupportsPadding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFixedSize 
     * @returns {HRESULT} 
     */
    DoesRequireFixedSize(pfFixedSize) {
        result := ComCall(17, this, "ptr", pfFixedSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
