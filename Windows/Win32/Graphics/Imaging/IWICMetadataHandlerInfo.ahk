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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadataFormat", "GetContainerFormats", "GetDeviceManufacturer", "GetDeviceModels", "DoesRequireFullStream", "DoesSupportPadding", "DoesRequireFixedSize"]

    /**
     * 
     * @param {Pointer<Guid>} pguidMetadataFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getmetadataformat
     */
    GetMetadataFormat(pguidMetadataFormat) {
        result := ComCall(11, this, "ptr", pguidMetadataFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cContainerFormats 
     * @param {Pointer<Guid>} pguidContainerFormats 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getcontainerformats
     */
    GetContainerFormats(cContainerFormats, pguidContainerFormats, pcchActual) {
        pcchActualMarshal := pcchActual is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", cContainerFormats, "ptr", pguidContainerFormats, pcchActualMarshal, pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchDeviceManufacturer 
     * @param {PWSTR} wzDeviceManufacturer 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getdevicemanufacturer
     */
    GetDeviceManufacturer(cchDeviceManufacturer, wzDeviceManufacturer, pcchActual) {
        wzDeviceManufacturer := wzDeviceManufacturer is String ? StrPtr(wzDeviceManufacturer) : wzDeviceManufacturer

        pcchActualMarshal := pcchActual is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, pcchActualMarshal, pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchDeviceModels 
     * @param {PWSTR} wzDeviceModels 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getdevicemodels
     */
    GetDeviceModels(cchDeviceModels, wzDeviceModels, pcchActual) {
        wzDeviceModels := wzDeviceModels is String ? StrPtr(wzDeviceModels) : wzDeviceModels

        pcchActualMarshal := pcchActual is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, pcchActualMarshal, pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfRequiresFullStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doesrequirefullstream
     */
    DoesRequireFullStream(pfRequiresFullStream) {
        result := ComCall(15, this, "ptr", pfRequiresFullStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportsPadding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doessupportpadding
     */
    DoesSupportPadding(pfSupportsPadding) {
        result := ComCall(16, this, "ptr", pfSupportsPadding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFixedSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doesrequirefixedsize
     */
    DoesRequireFixedSize(pfFixedSize) {
        result := ComCall(17, this, "ptr", pfFixedSize, "HRESULT")
        return result
    }
}
