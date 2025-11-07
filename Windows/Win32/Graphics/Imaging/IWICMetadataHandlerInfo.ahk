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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getmetadataformat
     */
    GetMetadataFormat() {
        pguidMetadataFormat := Guid()
        result := ComCall(11, this, "ptr", pguidMetadataFormat, "HRESULT")
        return pguidMetadataFormat
    }

    /**
     * 
     * @param {Integer} cContainerFormats 
     * @param {Pointer<Guid>} pguidContainerFormats 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getcontainerformats
     */
    GetContainerFormats(cContainerFormats, pguidContainerFormats) {
        result := ComCall(12, this, "uint", cContainerFormats, "ptr", pguidContainerFormats, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchDeviceManufacturer 
     * @param {PWSTR} wzDeviceManufacturer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getdevicemanufacturer
     */
    GetDeviceManufacturer(cchDeviceManufacturer, wzDeviceManufacturer) {
        wzDeviceManufacturer := wzDeviceManufacturer is String ? StrPtr(wzDeviceManufacturer) : wzDeviceManufacturer

        result := ComCall(13, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchDeviceModels 
     * @param {PWSTR} wzDeviceModels 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getdevicemodels
     */
    GetDeviceModels(cchDeviceModels, wzDeviceModels) {
        wzDeviceModels := wzDeviceModels is String ? StrPtr(wzDeviceModels) : wzDeviceModels

        result := ComCall(14, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doesrequirefullstream
     */
    DoesRequireFullStream() {
        result := ComCall(15, this, "int*", &pfRequiresFullStream := 0, "HRESULT")
        return pfRequiresFullStream
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doessupportpadding
     */
    DoesSupportPadding() {
        result := ComCall(16, this, "int*", &pfSupportsPadding := 0, "HRESULT")
        return pfSupportsPadding
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doesrequirefixedsize
     */
    DoesRequireFixedSize() {
        result := ComCall(17, this, "int*", &pfFixedSize := 0, "HRESULT")
        return pfFixedSize
    }
}
