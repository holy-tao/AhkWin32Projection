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
     * Retrieves the metadata format of the metadata handler.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the metadata format GUID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getmetadataformat
     */
    GetMetadataFormat() {
        pguidMetadataFormat := Guid()
        result := ComCall(11, this, "ptr", pguidMetadataFormat, "HRESULT")
        return pguidMetadataFormat
    }

    /**
     * Retrieves the container formats supported by the metadata handler.
     * @param {Integer} cContainerFormats Type: <b>UINT</b>
     * 
     * The size of the <i>pguidContainerFormats</i> array.
     * @param {Pointer<Guid>} pguidContainerFormats Type: <b>GUID*</b>
     * 
     * Pointer to an array that receives the container formats supported by the metadata handler.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual number of GUIDs added to the array.
     *                
     * 
     * To obtain the number of supported container formats, pass <c>NULL</c> to <i>pguidContainerFormats</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getcontainerformats
     */
    GetContainerFormats(cContainerFormats, pguidContainerFormats) {
        result := ComCall(12, this, "uint", cContainerFormats, "ptr", pguidContainerFormats, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the device manufacturer of the metadata handler.
     * @param {Integer} cchDeviceManufacturer Type: <b>UINT</b>
     * 
     * The size of the <i>wzDeviceManufacturer</i> buffer.
     * @param {PWSTR} wzDeviceManufacturer Type: <b>WCHAR*</b>
     * 
     * Pointer to the buffer that receives the name of the device manufacturer.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual string buffer length needed to obtain the entire name of the device manufacturer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getdevicemanufacturer
     */
    GetDeviceManufacturer(cchDeviceManufacturer, wzDeviceManufacturer) {
        wzDeviceManufacturer := wzDeviceManufacturer is String ? StrPtr(wzDeviceManufacturer) : wzDeviceManufacturer

        result := ComCall(13, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the device models that support the metadata handler.
     * @param {Integer} cchDeviceModels Type: <b>UINT</b>
     * 
     * The length of the <i>wzDeviceModels</i> buffer.
     * @param {PWSTR} wzDeviceModels Type: <b>WCHAR*</b>
     * 
     * Pointer that receives the device models supported by the metadata handler.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual length needed to retrieve the device models.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-getdevicemodels
     */
    GetDeviceModels(cchDeviceModels, wzDeviceModels) {
        wzDeviceModels := wzDeviceModels is String ? StrPtr(wzDeviceModels) : wzDeviceModels

        result := ComCall(14, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Determines if the handler requires a full stream.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <b>TRUE</b> if a full stream is required; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doesrequirefullstream
     */
    DoesRequireFullStream() {
        result := ComCall(15, this, "int*", &pfRequiresFullStream := 0, "HRESULT")
        return pfRequiresFullStream
    }

    /**
     * Determines if the metadata handler supports padding.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <b>TRUE</b> if padding is supported; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doessupportpadding
     */
    DoesSupportPadding() {
        result := ComCall(16, this, "int*", &pfSupportsPadding := 0, "HRESULT")
        return pfSupportsPadding
    }

    /**
     * Determines if the metadata handler requires a fixed size.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <b>TRUE</b> if a fixed size is required; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicmetadatahandlerinfo-doesrequirefixedsize
     */
    DoesRequireFixedSize() {
        result := ComCall(17, this, "int*", &pfFixedSize := 0, "HRESULT")
        return pfFixedSize
    }
}
