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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(11, this, "ptr", pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * 
     * @param {Integer} cFormats 
     * @param {Pointer<Guid>} pguidPixelFormats 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getpixelformats
     */
    GetPixelFormats(cFormats, pguidPixelFormats) {
        result := ComCall(12, this, "uint", cFormats, "ptr", pguidPixelFormats, "uint*", &pcActual := 0, "HRESULT")
        return pcActual
    }

    /**
     * 
     * @param {Integer} cchColorManagementVersion 
     * @param {PWSTR} wzColorManagementVersion 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getcolormanagementversion
     */
    GetColorManagementVersion(cchColorManagementVersion, wzColorManagementVersion) {
        wzColorManagementVersion := wzColorManagementVersion is String ? StrPtr(wzColorManagementVersion) : wzColorManagementVersion

        result := ComCall(13, this, "uint", cchColorManagementVersion, "ptr", wzColorManagementVersion, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchDeviceManufacturer 
     * @param {PWSTR} wzDeviceManufacturer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getdevicemanufacturer
     */
    GetDeviceManufacturer(cchDeviceManufacturer, wzDeviceManufacturer) {
        wzDeviceManufacturer := wzDeviceManufacturer is String ? StrPtr(wzDeviceManufacturer) : wzDeviceManufacturer

        result := ComCall(14, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchDeviceModels 
     * @param {PWSTR} wzDeviceModels 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getdevicemodels
     */
    GetDeviceModels(cchDeviceModels, wzDeviceModels) {
        wzDeviceModels := wzDeviceModels is String ? StrPtr(wzDeviceModels) : wzDeviceModels

        result := ComCall(15, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchMimeTypes 
     * @param {PWSTR} wzMimeTypes 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getmimetypes
     */
    GetMimeTypes(cchMimeTypes, wzMimeTypes) {
        wzMimeTypes := wzMimeTypes is String ? StrPtr(wzMimeTypes) : wzMimeTypes

        result := ComCall(16, this, "uint", cchMimeTypes, "ptr", wzMimeTypes, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @param {Integer} cchFileExtensions 
     * @param {PWSTR} wzFileExtensions 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getfileextensions
     */
    GetFileExtensions(cchFileExtensions, wzFileExtensions) {
        wzFileExtensions := wzFileExtensions is String ? StrPtr(wzFileExtensions) : wzFileExtensions

        result := ComCall(17, this, "uint", cchFileExtensions, "ptr", wzFileExtensions, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportanimation
     */
    DoesSupportAnimation() {
        result := ComCall(18, this, "int*", &pfSupportAnimation := 0, "HRESULT")
        return pfSupportAnimation
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportchromakey
     */
    DoesSupportChromakey() {
        result := ComCall(19, this, "int*", &pfSupportChromakey := 0, "HRESULT")
        return pfSupportChromakey
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportlossless
     */
    DoesSupportLossless() {
        result := ComCall(20, this, "int*", &pfSupportLossless := 0, "HRESULT")
        return pfSupportLossless
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportmultiframe
     */
    DoesSupportMultiframe() {
        result := ComCall(21, this, "int*", &pfSupportMultiframe := 0, "HRESULT")
        return pfSupportMultiframe
    }

    /**
     * 
     * @param {PWSTR} wzMimeType 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-matchesmimetype
     */
    MatchesMimeType(wzMimeType) {
        wzMimeType := wzMimeType is String ? StrPtr(wzMimeType) : wzMimeType

        result := ComCall(22, this, "ptr", wzMimeType, "int*", &pfMatches := 0, "HRESULT")
        return pfMatches
    }
}
