#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the HDR properties of a High Efficiency Image Format (HEIF) image.
 * @remarks
 * 
 * Use [IWicMetadataReader::GetValue](/windows/desktop/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getvalue) to retrieve the value of the properties specified with this enumeration. Instantiate the **IWicMetadataReader** instance using the GUID **CLSID_WICMetadataReader**. Call [IWicMetadataReader::GetMetadataFormat](/windows/desktop/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareader-getmetadataformat) and confirm that the value is **GUID_MetadataFormatHeifHDR** to verify that the metadata format is HEIF HDR metadata. 
 * 
 * Not all HEIF HDR images will have all of these properties present in the file, so only those properties that are available will be exposed by the metadata reader. 
 * 
 * ```cpp
 * using namespace winrt;
 * 
 * std::optional<uint32_t> GetMaximumLuminanceLevelFromMetadataReader(_In_ IWICMetadataReader* metadataReader)
 * {
 *     std::optional<uint32_t> result;
 *     GUID metadataFormat;
 * 
 *     // Retrieve the format of the metadata used by this IWICMetadataReader
 *     check_hresult(metadataReader->GetMetadataFormat(&metadataFormat));
 * 
 *     // This function only handles HEIF HDR metadata
 *     if (metadataFormat != GUID_MetadataFormatHeifHDR)
 *     {
 *         throw_hresult(E_INVALIDARG);
 *     }
 * 
 *     PROPVARIANT variantId = {};
 *     PROPVARIANT variantValue = {};
 * 
 *     variantId.vt = VT_UI4;
 *     variantId.uiVal = WICHeifHdrMaximumLuminanceLevel;
 *     if (SUCCEEDED(metadataReader->GetValue(nullptr, &variantId, &variantValue)))
 *     {
 *         if (variantValue.vt == VT_UI4)
 *         {
 *             result = variantValue.uiVal;
 *         }
 *         PropVariantClear(&variantValue);
 *     }
 * 
 *     return result;
 * }
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicheifhdrproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICHeifHdrProperties extends Win32Enum{

    /**
     * [VT_UI2] Specifies the maximum luminance level of the content in Nits.
     * @type {Integer (Int32)}
     */
    static WICHeifHdrMaximumLuminanceLevel => 1

    /**
     * [VT_UI2] Specifies the maximum average per-frame luminance level of the content in Nits.
     * @type {Integer (Int32)}
     */
    static WICHeifHdrMaximumFrameAverageLuminanceLevel => 2

    /**
     * [VT_UI2] Specifies the maximum luminance of the display on which the content was authored, in Nits.
     * @type {Integer (Int32)}
     */
    static WICHeifHdrMinimumMasteringDisplayLuminanceLevel => 3

    /**
     * [VT_UI2] Specifies the maximum luminance of the display on which the content was authored, in Nits.
     * @type {Integer (Int32)}
     */
    static WICHeifHdrMaximumMasteringDisplayLuminanceLevel => 4

    /**
     * [VT_BLOB] Specifies custom color primaries for a video media type. The value of this property is a [MT_CUSTOM_VIDEO_PRIMARIES](/windows/desktop/api/mfapi/ns-mfapi-mt_custom_video_primaries)structure, returned as an array of bytes (VT_BLOB).
     * @type {Integer (Int32)}
     */
    static WICHeifHdrCustomVideoPrimaries => 5
}
