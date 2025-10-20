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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContainerFormat", "GetPixelFormats", "GetColorManagementVersion", "GetDeviceManufacturer", "GetDeviceModels", "GetMimeTypes", "GetFileExtensions", "DoesSupportAnimation", "DoesSupportChromakey", "DoesSupportLossless", "DoesSupportMultiframe", "MatchesMimeType"]

    /**
     * 
     * @param {Pointer<Guid>} pguidContainerFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getcontainerformat
     */
    GetContainerFormat(pguidContainerFormat) {
        result := ComCall(11, this, "ptr", pguidContainerFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cFormats 
     * @param {Pointer<Guid>} pguidPixelFormats 
     * @param {Pointer<Integer>} pcActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getpixelformats
     */
    GetPixelFormats(cFormats, pguidPixelFormats, pcActual) {
        result := ComCall(12, this, "uint", cFormats, "ptr", pguidPixelFormats, "uint*", pcActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchColorManagementVersion 
     * @param {PWSTR} wzColorManagementVersion 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getcolormanagementversion
     */
    GetColorManagementVersion(cchColorManagementVersion, wzColorManagementVersion, pcchActual) {
        wzColorManagementVersion := wzColorManagementVersion is String ? StrPtr(wzColorManagementVersion) : wzColorManagementVersion

        result := ComCall(13, this, "uint", cchColorManagementVersion, "ptr", wzColorManagementVersion, "uint*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchDeviceManufacturer 
     * @param {PWSTR} wzDeviceManufacturer 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getdevicemanufacturer
     */
    GetDeviceManufacturer(cchDeviceManufacturer, wzDeviceManufacturer, pcchActual) {
        wzDeviceManufacturer := wzDeviceManufacturer is String ? StrPtr(wzDeviceManufacturer) : wzDeviceManufacturer

        result := ComCall(14, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, "uint*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchDeviceModels 
     * @param {PWSTR} wzDeviceModels 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getdevicemodels
     */
    GetDeviceModels(cchDeviceModels, wzDeviceModels, pcchActual) {
        wzDeviceModels := wzDeviceModels is String ? StrPtr(wzDeviceModels) : wzDeviceModels

        result := ComCall(15, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, "uint*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchMimeTypes 
     * @param {PWSTR} wzMimeTypes 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getmimetypes
     */
    GetMimeTypes(cchMimeTypes, wzMimeTypes, pcchActual) {
        wzMimeTypes := wzMimeTypes is String ? StrPtr(wzMimeTypes) : wzMimeTypes

        result := ComCall(16, this, "uint", cchMimeTypes, "ptr", wzMimeTypes, "uint*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchFileExtensions 
     * @param {PWSTR} wzFileExtensions 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getfileextensions
     */
    GetFileExtensions(cchFileExtensions, wzFileExtensions, pcchActual) {
        wzFileExtensions := wzFileExtensions is String ? StrPtr(wzFileExtensions) : wzFileExtensions

        result := ComCall(17, this, "uint", cchFileExtensions, "ptr", wzFileExtensions, "uint*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportAnimation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportanimation
     */
    DoesSupportAnimation(pfSupportAnimation) {
        result := ComCall(18, this, "ptr", pfSupportAnimation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportChromakey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportchromakey
     */
    DoesSupportChromakey(pfSupportChromakey) {
        result := ComCall(19, this, "ptr", pfSupportChromakey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportLossless 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportlossless
     */
    DoesSupportLossless(pfSupportLossless) {
        result := ComCall(20, this, "ptr", pfSupportLossless, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfSupportMultiframe 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportmultiframe
     */
    DoesSupportMultiframe(pfSupportMultiframe) {
        result := ComCall(21, this, "ptr", pfSupportMultiframe, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wzMimeType 
     * @param {Pointer<BOOL>} pfMatches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-matchesmimetype
     */
    MatchesMimeType(wzMimeType, pfMatches) {
        wzMimeType := wzMimeType is String ? StrPtr(wzMimeType) : wzMimeType

        result := ComCall(22, this, "ptr", wzMimeType, "ptr", pfMatches, "HRESULT")
        return result
    }
}
