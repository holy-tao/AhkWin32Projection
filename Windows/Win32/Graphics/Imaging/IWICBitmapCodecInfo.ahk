#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICComponentInfo.ahk

/**
 * Exposes methods that provide information about a particular codec.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapcodecinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapCodecInfo extends IWICComponentInfo{
    /**
     * The interface identifier for IWICBitmapCodecInfo
     * @type {Guid}
     */
    static IID => Guid("{e87a44c4-b76e-4c47-8b09-298eb12a2714}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<Guid>} pguidContainerFormat 
     * @returns {HRESULT} 
     */
    GetContainerFormat(pguidContainerFormat) {
        result := ComCall(11, this, "ptr", pguidContainerFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cFormats 
     * @param {Pointer<Guid>} pguidPixelFormats 
     * @param {Pointer<UInt32>} pcActual 
     * @returns {HRESULT} 
     */
    GetPixelFormats(cFormats, pguidPixelFormats, pcActual) {
        result := ComCall(12, this, "uint", cFormats, "ptr", pguidPixelFormats, "uint*", pcActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchColorManagementVersion 
     * @param {PWSTR} wzColorManagementVersion 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetColorManagementVersion(cchColorManagementVersion, wzColorManagementVersion, pcchActual) {
        wzColorManagementVersion := wzColorManagementVersion is String ? StrPtr(wzColorManagementVersion) : wzColorManagementVersion

        result := ComCall(13, this, "uint", cchColorManagementVersion, "ptr", wzColorManagementVersion, "uint*", pcchActual, "int")
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

        result := ComCall(14, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, "uint*", pcchActual, "int")
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

        result := ComCall(15, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchMimeTypes 
     * @param {PWSTR} wzMimeTypes 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetMimeTypes(cchMimeTypes, wzMimeTypes, pcchActual) {
        wzMimeTypes := wzMimeTypes is String ? StrPtr(wzMimeTypes) : wzMimeTypes

        result := ComCall(16, this, "uint", cchMimeTypes, "ptr", wzMimeTypes, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchFileExtensions 
     * @param {PWSTR} wzFileExtensions 
     * @param {Pointer<UInt32>} pcchActual 
     * @returns {HRESULT} 
     */
    GetFileExtensions(cchFileExtensions, wzFileExtensions, pcchActual) {
        wzFileExtensions := wzFileExtensions is String ? StrPtr(wzFileExtensions) : wzFileExtensions

        result := ComCall(17, this, "uint", cchFileExtensions, "ptr", wzFileExtensions, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportAnimation 
     * @returns {HRESULT} 
     */
    DoesSupportAnimation(pfSupportAnimation) {
        result := ComCall(18, this, "ptr", pfSupportAnimation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportChromakey 
     * @returns {HRESULT} 
     */
    DoesSupportChromakey(pfSupportChromakey) {
        result := ComCall(19, this, "ptr", pfSupportChromakey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportLossless 
     * @returns {HRESULT} 
     */
    DoesSupportLossless(pfSupportLossless) {
        result := ComCall(20, this, "ptr", pfSupportLossless, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportMultiframe 
     * @returns {HRESULT} 
     */
    DoesSupportMultiframe(pfSupportMultiframe) {
        result := ComCall(21, this, "ptr", pfSupportMultiframe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wzMimeType 
     * @param {Pointer<BOOL>} pfMatches 
     * @returns {HRESULT} 
     */
    MatchesMimeType(wzMimeType, pfMatches) {
        wzMimeType := wzMimeType is String ? StrPtr(wzMimeType) : wzMimeType

        result := ComCall(22, this, "ptr", wzMimeType, "ptr", pfMatches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
