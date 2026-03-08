#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICComponentInfo.ahk

/**
 * Exposes methods that provide information about a particular codec.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapcodecinfo
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
     * Retrieves the container GUID associated with the codec.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Receives the container GUID.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(11, this, "ptr", pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * Retrieves the pixel formats the codec supports.
     * @remarks
     * The usage pattern for this method is a two call process.
     *             The first call retrieves the array size needed to retrieve all the supported pixel formats by calling it with <i>cFormats</i> set to <c>0</code> and <i>pguidPixelFormats</i> set to <code>NULL</c>.
     *             This call sets <i>pcActual</i> to the array size needed.
     *             Once the needed array size is determined, a second <b>GetPixelFormats</b> call with <i>pguidPixelFormats</i> set to an array of the appropriate size will retrieve the pixel formats.
     * @param {Integer} cFormats Type: <b>UINT</b>
     * 
     * The size of the <i>pguidPixelFormats</i> array. Use <c>0</c> on first call to determine the needed array size.
     * @param {Pointer<Guid>} pguidPixelFormats Type: <b>GUID*</b>
     * 
     * Receives the supported pixel formats. Use <c>NULL</c> on first call to determine needed array size.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The array size needed to retrieve all supported pixel formats.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getpixelformats
     */
    GetPixelFormats(cFormats, pguidPixelFormats) {
        result := ComCall(12, this, "uint", cFormats, "ptr", pguidPixelFormats, "uint*", &pcActual := 0, "HRESULT")
        return pcActual
    }

    /**
     * Retrieves the color management version number the codec supports.
     * @remarks
     * The usage pattern for this method is a two call process.
     *             The first call retrieves the buffer size needed to retrieve the full color management version number by calling it with <i>cchColorManagementVersion</i> set to <c>0</code> and <i>wzColorManagementVersion</i> set to <code>NULL</c>.
     *             This call sets <i>pcchActual</i> to the buffer size needed.
     *             Once the needed buffer size is determined, a second <b>GetColorManagementVersion</b> call with <i>cchColorManagementVersion</i> set to the buffer size and <i>wzColorManagementVersion</i> set to a buffer of the appropriate size will retrieve the pixel formats.
     * @param {Integer} cchColorManagementVersion Type: <b>UINT</b>
     * 
     * The size of the version buffer. Use <c>0</c> on first call to determine needed buffer size.
     * @param {PWSTR} wzColorManagementVersion Type: <b>WCHAR*</b>
     * 
     * Receives the color management version number. Use <c>NULL</c> on first call to determine needed buffer size.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual buffer size needed to retrieve the full color management version number.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getcolormanagementversion
     */
    GetColorManagementVersion(cchColorManagementVersion, wzColorManagementVersion) {
        wzColorManagementVersion := wzColorManagementVersion is String ? StrPtr(wzColorManagementVersion) : wzColorManagementVersion

        result := ComCall(13, this, "uint", cchColorManagementVersion, "ptr", wzColorManagementVersion, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves the name of the device manufacture associated with the codec.
     * @remarks
     * The usage pattern for this method is a two call process.
     *             The first call retrieves the buffer size needed to retrieve the full color management version number by calling it with <i>cchDeviceManufacturer</i> set to <c>0</code> and <i>wzDeviceManufacturer</i> set to <code>NULL</c>.
     *             This call sets <i>pcchActual</i> to the buffer size needed.
     *             Once the needed buffer size is determined, a second <b>GetDeviceManufacturer</b> call with <i>cchDeviceManufacturer</i> set to the buffer size and <i>wzDeviceManufacturer</i> set to a buffer of the appropriate size will retrieve the pixel formats.
     * @param {Integer} cchDeviceManufacturer Type: <b>UINT</b>
     * 
     * The size of the device manufacture's name. Use <c>0</c> on first call to determine needed buffer size.
     * @param {PWSTR} wzDeviceManufacturer Type: <b>WCHAR*</b>
     * 
     * Receives the device manufacture's name. Use <c>NULL</c> on first call to determine needed buffer size.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual buffer size needed to retrieve the device manufacture's name.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getdevicemanufacturer
     */
    GetDeviceManufacturer(cchDeviceManufacturer, wzDeviceManufacturer) {
        wzDeviceManufacturer := wzDeviceManufacturer is String ? StrPtr(wzDeviceManufacturer) : wzDeviceManufacturer

        result := ComCall(14, this, "uint", cchDeviceManufacturer, "ptr", wzDeviceManufacturer, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves a comma delimited list of device models associated with the codec.
     * @remarks
     * The usage pattern for this method is a two call process.
     *             The first call retrieves the buffer size needed to retrieve the full color management version number by calling it with <i>cchDeviceModels</i> set to <c>0</code> and <i>wzDeviceModels</i> set to <code>NULL</c>.
     *             This call sets <i>pcchActual</i> to the buffer size needed.
     *             Once the needed buffer size is determined, a second <b>GetDeviceModels</b> call with <i>cchDeviceModels</i> set to the buffer size and <i>wzDeviceModels</i> set to a buffer of the appropriate size will retrieve the pixel formats.
     * @param {Integer} cchDeviceModels Type: <b>UINT</b>
     * 
     * The size of the device models buffer. Use <c>0</c> on first call to determine needed buffer size.
     * @param {PWSTR} wzDeviceModels Type: <b>WCHAR*</b>
     * 
     * Receives a comma delimited list of device model names associated with the codec. Use <c>NULL</c> on first call to determine needed buffer size.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual buffer size needed to retrieve all of the device model names.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getdevicemodels
     */
    GetDeviceModels(cchDeviceModels, wzDeviceModels) {
        wzDeviceModels := wzDeviceModels is String ? StrPtr(wzDeviceModels) : wzDeviceModels

        result := ComCall(15, this, "uint", cchDeviceModels, "ptr", wzDeviceModels, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves a comma delimited sequence of mime types associated with the codec.
     * @remarks
     * The usage pattern for this method is a two call process.
     *             The first call retrieves the buffer size needed to retrieve the full color management version number by calling it with <i>cchMimeTypes</i> set to <c>0</code> and <i>wzMimeTypes</i> set to <code>NULL</c>.
     *             This call sets <i>pcchActual</i> to the buffer size needed.
     *             Once the needed buffer size is determined, a second <b>GetMimeTypes</b> call with <i>cchMimeTypes</i> set to the buffer size and <i>wzMimeTypes</i> set to a buffer of the appropriate size will retrieve the pixel formats.
     * @param {Integer} cchMimeTypes Type: <b>UINT</b>
     * 
     * The size of the mime types buffer.  Use <c>0</c> on first call to determine needed buffer size.
     * @param {PWSTR} wzMimeTypes Type: <b>WCHAR*</b>
     * 
     * Receives the mime types associated with the codec. Use <c>NULL</c> on first call to determine needed buffer size.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual buffer size needed to retrieve all mime types associated with the codec.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getmimetypes
     */
    GetMimeTypes(cchMimeTypes, wzMimeTypes) {
        wzMimeTypes := wzMimeTypes is String ? StrPtr(wzMimeTypes) : wzMimeTypes

        result := ComCall(16, this, "uint", cchMimeTypes, "ptr", wzMimeTypes, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves a comma delimited list of the file name extensions associated with the codec.
     * @remarks
     * The default extension for an image encoder is the first item in the list of returned extensions.
     * 
     * The usage pattern for this method is a two call process.
     *                The first call retrieves the buffer size needed to retrieve the full color management version number by calling it with <i>cchFileExtensions</i> set to <c>0</code> and <i>wzFileExtensions</i> set to <code>NULL</c>.
     *                This call sets <i>pcchActual</i> to the buffer size needed.
     *                Once the needed buffer size is determined, a second <b>GetFileExtensions</b> call with <i>cchFileExtensions</i> set to the buffer size and <i>wzFileExtensions</i> set to a buffer of the appropriate size will retrieve the pixel formats.
     * @param {Integer} cchFileExtensions Type: <b>UINT</b>
     * 
     * The size of the file name extension buffer. Use <c>0</c> on first call to determine needed buffer size.
     * @param {PWSTR} wzFileExtensions Type: <b>WCHAR*</b>
     * 
     * Receives a comma delimited list  of file name extensions associated with the codec. Use <c>NULL</c> on first call to determine needed buffer size.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual buffer size needed to retrieve all file name extensions associated with the codec.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-getfileextensions
     */
    GetFileExtensions(cchFileExtensions, wzFileExtensions) {
        wzFileExtensions := wzFileExtensions is String ? StrPtr(wzFileExtensions) : wzFileExtensions

        result := ComCall(17, this, "uint", cchFileExtensions, "ptr", wzFileExtensions, "uint*", &pcchActual := 0, "HRESULT")
        return pcchActual
    }

    /**
     * Retrieves a value indicating whether the codec supports animation.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives <b>TRUE</b> if the codec supports images with timing information; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportanimation
     */
    DoesSupportAnimation() {
        result := ComCall(18, this, "int*", &pfSupportAnimation := 0, "HRESULT")
        return pfSupportAnimation
    }

    /**
     * Retrieves a value indicating whether the codec supports chromakeys.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives <b>TRUE</b> if the codec supports chromakeys; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportchromakey
     */
    DoesSupportChromakey() {
        result := ComCall(19, this, "int*", &pfSupportChromakey := 0, "HRESULT")
        return pfSupportChromakey
    }

    /**
     * Retrieves a value indicating whether the codec supports lossless formats.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives <b>TRUE</b> if the codec supports lossless formats; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportlossless
     */
    DoesSupportLossless() {
        result := ComCall(20, this, "int*", &pfSupportLossless := 0, "HRESULT")
        return pfSupportLossless
    }

    /**
     * Retrieves a value indicating whether the codec supports multi frame images.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives <b>TRUE</b> if the codec supports multi frame images; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-doessupportmultiframe
     */
    DoesSupportMultiframe() {
        result := ComCall(21, this, "int*", &pfSupportMultiframe := 0, "HRESULT")
        return pfSupportMultiframe
    }

    /**
     * Retrieves a value indicating whether the given mime type matches the mime type of the codec.
     * @remarks
     * <div class="alert"><b>Note</b>  The Windows provided codecs do not implement this method and return E_NOTIMPL.</div>
     * <div> </div>
     * @param {PWSTR} wzMimeType Type: <b>LPCWSTR</b>
     * 
     * The mime type to compare.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives <b>TRUE</b> if the mime types match; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecinfo-matchesmimetype
     */
    MatchesMimeType(wzMimeType) {
        wzMimeType := wzMimeType is String ? StrPtr(wzMimeType) : wzMimeType

        result := ComCall(22, this, "ptr", wzMimeType, "int*", &pfMatches := 0, "HRESULT")
        return pfMatches
    }
}
