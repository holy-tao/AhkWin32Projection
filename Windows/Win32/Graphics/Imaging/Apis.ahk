#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk
#Include .\IWICBitmap.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class Imaging {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WINCODEC_SDK_VERSION1 => 566

    /**
     * @type {Integer (UInt32)}
     */
    static WINCODEC_SDK_VERSION2 => 567

    /**
     * @type {Guid}
     */
    static CLSID_WICImagingFactory => Guid("{cacaf262-9370-4615-a13b-9f5539da4c0a}")

    /**
     * @type {Guid}
     */
    static CLSID_WICImagingFactory1 => Guid("{cacaf262-9370-4615-a13b-9f5539da4c0a}")

    /**
     * @type {Guid}
     */
    static CLSID_WICImagingFactory2 => Guid("{317d06e8-5f24-433d-bdf7-79ce68d8abc2}")

    /**
     * @type {Integer (UInt32)}
     */
    static WINCODEC_SDK_VERSION => 567

    /**
     * @type {Guid}
     */
    static GUID_VendorMicrosoft => Guid("{f0e749ca-edef-4589-a73a-ee0e626a2a2b}")

    /**
     * @type {Guid}
     */
    static GUID_VendorMicrosoftBuiltIn => Guid("{257a30fd-06b6-462b-aea4-63f70b86e533}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngDecoder => Guid("{389ea17b-5078-4cde-b6ef-25c15175c751}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngDecoder1 => Guid("{389ea17b-5078-4cde-b6ef-25c15175c751}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngDecoder2 => Guid("{e018945b-aa86-4008-9bd4-6777a1e40c11}")

    /**
     * @type {Guid}
     */
    static CLSID_WICBmpDecoder => Guid("{6b462062-7cbf-400d-9fdb-813dd10f2778}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIcoDecoder => Guid("{c61bfcdf-2e0f-4aad-a8d7-e06bafebcdfe}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegDecoder => Guid("{9456a480-e88b-43ea-9e73-0b2d9b71b1ca}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGifDecoder => Guid("{381dda3c-9ce9-4834-a23e-1f98f8fc52be}")

    /**
     * @type {Guid}
     */
    static CLSID_WICTiffDecoder => Guid("{b54e85d9-fe23-499f-8b88-6acea713752b}")

    /**
     * @type {Guid}
     */
    static CLSID_WICWmpDecoder => Guid("{a26cec36-234c-4950-ae16-e34aace71d0d}")

    /**
     * @type {Guid}
     */
    static CLSID_WICDdsDecoder => Guid("{9053699f-a341-429d-9e90-ee437cf80c73}")

    /**
     * @type {Guid}
     */
    static CLSID_WICBmpEncoder => Guid("{69be8bb4-d66d-47c8-865a-ed1589433782}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngEncoder => Guid("{27949969-876a-41d7-9447-568f6a35a4dc}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegEncoder => Guid("{1a34f5c1-4a5a-46dc-b644-1f4567e7a676}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGifEncoder => Guid("{114f5598-0b22-40a0-86a1-c83ea495adbd}")

    /**
     * @type {Guid}
     */
    static CLSID_WICTiffEncoder => Guid("{0131be10-2001-4c5f-a9b0-cc88fab64ce8}")

    /**
     * @type {Guid}
     */
    static CLSID_WICWmpEncoder => Guid("{ac4ce3cb-e1c1-44cd-8215-5a1665509ec2}")

    /**
     * @type {Guid}
     */
    static CLSID_WICDdsEncoder => Guid("{a61dde94-66ce-4ac1-881b-71680588895e}")

    /**
     * @type {Guid}
     */
    static CLSID_WICAdngDecoder => Guid("{981d9411-909e-42a7-8f5d-a747ff052edb}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegQualcommPhoneEncoder => Guid("{68ed5c62-f534-4979-b2b3-686a12b2b34c}")

    /**
     * @type {Guid}
     */
    static CLSID_WICHeifDecoder => Guid("{e9a4a80a-44fe-4de4-8971-7150b10a5199}")

    /**
     * @type {Guid}
     */
    static CLSID_WICHeifEncoder => Guid("{0dbecec1-9eb3-4860-9c6f-ddbe86634575}")

    /**
     * @type {Guid}
     */
    static CLSID_WICWebpDecoder => Guid("{7693e886-51c9-4070-8419-9f70738ec8fa}")

    /**
     * @type {Guid}
     */
    static CLSID_WICRAWDecoder => Guid("{41945702-8302-44a6-9445-ac98e8afa086}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegXLDecoder => Guid("{fc6ceece-aef5-4a23-96ec-5984ffb486d9}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegXLEncoder => Guid("{0e4ecd3b-1ba6-4636-8198-56c73040964a}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatBmp => Guid("{0af1d87e-fcfe-4188-bdeb-a7906471cbe3}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatPng => Guid("{1b7cfaf4-713f-473c-bbcd-6137425faeaf}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatIco => Guid("{a3a860c4-338f-4c17-919a-fba4b5628f21}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatJpeg => Guid("{19e4a5aa-5662-4fc5-a0c0-1758028e1057}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatTiff => Guid("{163bcc30-e2e9-4f0b-961d-a3e9fdb788a3}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatGif => Guid("{1f8a5601-7d4d-4cbd-9c82-1bc8d4eeb9a5}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatWmp => Guid("{57a37caa-367a-4540-916b-f183c5093a4b}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatDds => Guid("{9967cb95-2e85-4ac8-8ca2-83d7ccd425c9}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatAdng => Guid("{f3ff6d0d-38c0-41c4-b1fe-1f3824f17b84}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatHeif => Guid("{e1e62521-6787-405b-a339-500715b5763f}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatWebp => Guid("{e094b0e2-67f2-45b3-b0ea-115337ca7cf3}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatRaw => Guid("{fe99ce60-f19c-433c-a3ae-00acefa9ca21}")

    /**
     * @type {Guid}
     */
    static GUID_ContainerFormatJpegXL => Guid("{fec14e3f-427a-4736-aae6-27ed84f69322}")

    /**
     * @type {Guid}
     */
    static CLSID_WICImagingCategories => Guid("{fae3d380-fea4-4623-8c75-c6b61110b681}")

    /**
     * @type {Guid}
     */
    static CATID_WICBitmapDecoders => Guid("{7ed96837-96f0-4812-b211-f13c24117ed3}")

    /**
     * @type {Guid}
     */
    static CATID_WICBitmapEncoders => Guid("{ac757296-3522-4e11-9862-c17be5a1767e}")

    /**
     * @type {Guid}
     */
    static CATID_WICPixelFormats => Guid("{2b46e70f-cda7-473e-89f6-dc9630a2390b}")

    /**
     * @type {Guid}
     */
    static CATID_WICFormatConverters => Guid("{7835eae8-bf14-49d1-93ce-533a407b2248}")

    /**
     * @type {Guid}
     */
    static CATID_WICMetadataReader => Guid("{05af94d8-7174-4cd2-be4a-4124b80ee4b8}")

    /**
     * @type {Guid}
     */
    static CATID_WICMetadataWriter => Guid("{abe3b9a4-257d-4b97-bd1a-294af496222e}")

    /**
     * @type {Guid}
     */
    static CLSID_WICDefaultFormatConverter => Guid("{1a3f11dc-b514-4b17-8c5f-2154513852f1}")

    /**
     * @type {Guid}
     */
    static CLSID_WICFormatConverterHighColor => Guid("{ac75d454-9f37-48f8-b972-4e19bc856011}")

    /**
     * @type {Guid}
     */
    static CLSID_WICFormatConverterNChannel => Guid("{c17cabb2-d4a3-47d7-a557-339b2efbd4f1}")

    /**
     * @type {Guid}
     */
    static CLSID_WICFormatConverterWMPhoto => Guid("{9cb5172b-d600-46ba-ab77-77bb7e3a00d9}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPlanarFormatConverter => Guid("{184132b8-32f8-4784-9131-dd7224b23438}")

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_MAX_COMPONENT_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_MAX_TABLE_INDEX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_SAMPLE_FACTORS_ONE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_SAMPLE_FACTORS_THREE_420 => 1118498

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_SAMPLE_FACTORS_THREE_422 => 1118497

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_SAMPLE_FACTORS_THREE_440 => 1118482

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_SAMPLE_FACTORS_THREE_444 => 1118481

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_QUANTIZATION_BASELINE_ONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_QUANTIZATION_BASELINE_THREE => 65792

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_HUFFMAN_BASELINE_ONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIC_JPEG_HUFFMAN_BASELINE_THREE => 1118464

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormatDontCare => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc900}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat1bppIndexed => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc901}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat2bppIndexed => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc902}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat4bppIndexed => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc903}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat8bppIndexed => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc904}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormatBlackWhite => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc905}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat2bppGray => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc906}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat4bppGray => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc907}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat8bppGray => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc908}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat8bppAlpha => Guid("{e6cd0116-eeba-4161-aa85-27dd9fb3a895}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat8bppDepth => Guid("{4c9c9f45-1d89-4e31-9bc7-69343a0dca69}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat8bppGain => Guid("{a884022a-af13-4c16-b746-619bf618b878}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat24bppRGBGain => Guid("{a5022b24-7109-443b-9948-25b6ed8f39fd}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppBGRGain => Guid("{837d6738-208a-43e0-8995-79ab74407402}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppBGR555 => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc909}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppBGR565 => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc90a}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppBGRA5551 => Guid("{05ec7c2b-f1e6-4961-ad46-e1cc810a87d2}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppGray => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc90b}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat24bppBGR => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc90c}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat24bppRGB => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc90d}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppBGR => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc90e}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppBGRA => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc90f}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppPBGRA => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc910}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppGrayFloat => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc911}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppRGB => Guid("{d98c6b95-3efe-47d6-bb25-eb1748ab0cf1}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppRGBA => Guid("{f5c7ad2d-6a8d-43dd-a7a8-a29935261ae9}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppPRGBA => Guid("{3cc4a650-a527-4d37-a916-3142c7ebedba}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat48bppRGB => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc915}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat48bppBGR => Guid("{e605a384-b468-46ce-bb2e-36f180e64313}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppRGB => Guid("{a1182111-186d-4d42-bc6a-9c8303a8dff9}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppRGBA => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc916}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppBGRA => Guid("{1562ff7c-d352-46f9-979e-42976b792246}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppPRGBA => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc917}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppPBGRA => Guid("{8c518e8e-a4ec-468b-ae70-c9a35a9c5530}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppGrayFixedPoint => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc913}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppBGR101010 => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc914}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat48bppRGBFixedPoint => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc912}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat48bppBGRFixedPoint => Guid("{49ca140e-cab6-493b-9ddf-60187c37532a}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat96bppRGBFixedPoint => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc918}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat96bppRGBFloat => Guid("{e3fed78f-e8db-4acf-84c1-e97f6136b327}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat128bppRGBAFloat => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc919}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat128bppPRGBAFloat => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc91a}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat128bppRGBFloat => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc91b}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppCMYK => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc91c}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppRGBAFixedPoint => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc91d}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppBGRAFixedPoint => Guid("{356de33c-54d2-4a23-bb04-9b7bf9b1d42d}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppRGBFixedPoint => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc940}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat128bppRGBAFixedPoint => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc91e}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat128bppRGBFixedPoint => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc941}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppRGBAHalf => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc93a}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppPRGBAHalf => Guid("{58ad26c2-c623-4d9d-b320-387e49f8c442}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppRGBHalf => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc942}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat48bppRGBHalf => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc93b}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppRGBE => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc93d}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppGrayHalf => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc93e}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppGrayFixedPoint => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc93f}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppRGBA1010102 => Guid("{25238d72-fcf9-4522-b514-5578e5ad55e0}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppRGBA1010102XR => Guid("{00de6b9a-c101-434b-b502-d0165ee1122c}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppR10G10B10A2 => Guid("{604e1bb5-8a3c-4b65-b11c-bc0b8dd75b7f}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bppR10G10B10A2HDR10 => Guid("{9c215c5d-1acc-4f0e-a4bc-70fb3ae8fd28}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bppCMYK => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc91f}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat24bpp3Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc920}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bpp4Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc921}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat40bpp5Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc922}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat48bpp6Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc923}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat56bpp7Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc924}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bpp8Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc925}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat48bpp3Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc926}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bpp4Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc927}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat80bpp5Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc928}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat96bpp6Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc929}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat112bpp7Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc92a}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat128bpp8Channels => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc92b}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat40bppCMYKAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc92c}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat80bppCMYKAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc92d}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat32bpp3ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc92e}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat40bpp4ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc92f}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat48bpp5ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc930}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat56bpp6ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc931}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bpp7ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc932}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat72bpp8ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc933}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat64bpp3ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc934}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat80bpp4ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc935}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat96bpp5ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc936}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat112bpp6ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc937}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat128bpp7ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc938}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat144bpp8ChannelsAlpha => Guid("{6fddc324-4e03-4bfe-b185-3d77768dc939}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat8bppY => Guid("{91b4db54-2df9-42f0-b449-2909bb3df88e}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat8bppCb => Guid("{1339f224-6bfe-4c3e-9302-e4f3a6d0ca2a}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat8bppCr => Guid("{b8145053-2116-49f0-8835-ed844b205c51}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppCbCr => Guid("{ff95ba6e-11e0-4263-bb45-01721f3460a4}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppYQuantizedDctCoefficients => Guid("{a355f433-48e8-4a42-84d8-e2aa26ca80a4}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppCbQuantizedDctCoefficients => Guid("{d2c4ff61-56a5-49c2-8b5c-4c1925964837}")

    /**
     * @type {Guid}
     */
    static GUID_WICPixelFormat16bppCrQuantizedDctCoefficients => Guid("{2fe354f0-1680-42d8-9231-e73c0565bfc1}")

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WINCODEC_ERR => 2200

    /**
     * @type {Integer (UInt32)}
     */
    static WINCODEC_ERR_BASE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_GENERIC_ERROR => -2147467259

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_INVALIDPARAMETER => -2147024809

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_OUTOFMEMORY => -2147024882

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_NOTIMPLEMENTED => -2147467263

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_ABORTED => -2147467260

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_ACCESSDENIED => -2147024891

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_ExposureCompensation => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_NamedWhitePoint => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_KelvinWhitePoint => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_RGBWhitePoint => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_Contrast => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_Gamma => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_Sharpness => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_Saturation => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_Tint => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_NoiseReduction => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_DestinationColorContext => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_ToneCurve => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_Rotation => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WICRawChangeNotification_RenderMode => 8192

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatUnknown => Guid("{a45e592f-9078-4a7c-adb5-4edc4fd61b1f}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatIfd => Guid("{537396c6-2d8a-4bb6-9bf8-2f0a8e2a3adf}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatSubIfd => Guid("{58a2e128-2db9-4e57-bb14-5177891ed331}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatExif => Guid("{1c3c4f9d-b84a-467d-9493-36cfbd59ea57}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatGps => Guid("{7134ab8a-9351-44ad-af62-448db6b502ec}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatInterop => Guid("{ed686f8e-681f-4c8b-bd41-a8addbf6b3fc}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatApp0 => Guid("{79007028-268d-45d6-a3c2-354e6a504bc9}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatApp1 => Guid("{8fd3dfc3-f951-492b-817f-69c2e6d9a5b0}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatApp13 => Guid("{326556a2-f502-4354-9cc0-8e3f48eaf6b5}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatIPTC => Guid("{4fab0914-e129-4087-a1d1-bc812d45a7b5}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatIRB => Guid("{16100d66-8570-4bb9-b92d-fda4b23ece67}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormat8BIMIPTC => Guid("{0010568c-0852-4e6a-b191-5c33ac5b0430}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormat8BIMResolutionInfo => Guid("{739f305d-81db-43cb-ac5e-55013ef9f003}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormat8BIMIPTCDigest => Guid("{1ca32285-9ccd-4786-8bd8-79539db6a006}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatXMP => Guid("{bb5acc38-f216-4cec-a6c5-5f6e739763a9}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatThumbnail => Guid("{243dcee9-8703-40ee-8ef0-22a600b8058c}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunktEXt => Guid("{568d8936-c0a9-4923-905d-df2b38238fbc}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatXMPStruct => Guid("{22383cf1-ed17-4e2e-af17-d85b8f6b30d0}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatXMPBag => Guid("{833cca5f-dcb7-4516-806f-6596ab26dce4}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatXMPSeq => Guid("{63e8df02-eb6c-456c-a224-b25e794fd648}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatXMPAlt => Guid("{7b08a675-91aa-481b-a798-4da94908613b}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatLSD => Guid("{e256031e-6299-4929-b98d-5ac884afba92}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatIMD => Guid("{bd2bb086-4d52-48dd-9677-db483e85ae8f}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatGCE => Guid("{2a25cad8-deeb-4c69-a788-0ec2266dcafd}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatAPE => Guid("{2e043dc2-c967-4e05-875e-618bf67e85c3}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatJpegChrominance => Guid("{f73d0dcf-cec6-4f85-9b0e-1c3956b1bef7}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatJpegLuminance => Guid("{86908007-edfc-4860-8d4b-4ee6e83e6058}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatJpegComment => Guid("{220e5f33-afd3-474e-9d31-7d4fe730f557}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatGifComment => Guid("{c4b6e0e0-cfb4-4ad3-ab33-9aad2355a34a}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunkgAMA => Guid("{f00935a5-1d5d-4cd1-81b2-9324d7eca781}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunkbKGD => Guid("{e14d3571-6b47-4dea-b60a-87ce0a78dfb7}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunkiTXt => Guid("{c2bec729-0b68-4b77-aa0e-6295a6ac1814}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunkcHRM => Guid("{9db3655b-2842-44b3-8067-12e9b375556a}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunkhIST => Guid("{c59a82da-db74-48a4-bd6a-b69c4931ef95}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunkiCCP => Guid("{eb4349ab-b685-450f-91b5-e802e892536c}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunksRGB => Guid("{c115fd36-cc6f-4e3f-8363-524b87c6b0d9}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatChunktIME => Guid("{6b00ae2d-e24b-460a-98b6-878bd03072fd}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatDds => Guid("{4a064603-8c33-4e60-9c29-136231702d08}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatHeif => Guid("{817ef3e1-1288-45f4-a852-260d9e7cce83}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatHeifHDR => Guid("{568b8d8a-1e65-438c-8968-d60e1012beb9}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatWebpANIM => Guid("{6dc4fda6-78e6-4102-ae35-bcfa1edcc78b}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatWebpANMF => Guid("{43c105ee-b93b-4abb-b003-a08c0d870471}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatJpegXLAnim => Guid("{501c2e24-7a7d-42b2-93c7-b4f45bcc92f7}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatJpegXLAnimFrame => Guid("{958ecc2c-36cb-4af9-9ea8-0b74baccfd3e}")

    /**
     * @type {Guid}
     */
    static GUID_MetadataFormatGainMap => Guid("{568d3138-c446-4ec2-a7a8-59abb16d21e3}")

    /**
     * @type {Guid}
     */
    static CLSID_WICUnknownMetadataReader => Guid("{699745c2-5066-4b82-a8e3-d40478dbec8c}")

    /**
     * @type {Guid}
     */
    static CLSID_WICUnknownMetadataWriter => Guid("{a09cca86-27ba-4f39-9053-121fa4dc08fc}")

    /**
     * @type {Guid}
     */
    static CLSID_WICApp0MetadataWriter => Guid("{f3c633a2-46c8-498e-8fbb-cc6f721bbcde}")

    /**
     * @type {Guid}
     */
    static CLSID_WICApp0MetadataReader => Guid("{43324b33-a78f-480f-9111-9638aaccc832}")

    /**
     * @type {Guid}
     */
    static CLSID_WICApp1MetadataWriter => Guid("{ee366069-1832-420f-b381-0479ad066f19}")

    /**
     * @type {Guid}
     */
    static CLSID_WICApp1MetadataReader => Guid("{dde33513-774e-4bcd-ae79-02f4adfe62fc}")

    /**
     * @type {Guid}
     */
    static CLSID_WICApp13MetadataWriter => Guid("{7b19a919-a9d6-49e5-bd45-02c34e4e4cd5}")

    /**
     * @type {Guid}
     */
    static CLSID_WICApp13MetadataReader => Guid("{aa7e3c50-864c-4604-bc04-8b0b76e637f6}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIfdMetadataReader => Guid("{8f914656-9d0a-4eb2-9019-0bf96d8a9ee6}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIfdMetadataWriter => Guid("{b1ebfc28-c9bd-47a2-8d33-b948769777a7}")

    /**
     * @type {Guid}
     */
    static CLSID_WICSubIfdMetadataReader => Guid("{50d42f09-ecd1-4b41-b65d-da1fdaa75663}")

    /**
     * @type {Guid}
     */
    static CLSID_WICSubIfdMetadataWriter => Guid("{8ade5386-8e9b-4f4c-acf2-f0008706b238}")

    /**
     * @type {Guid}
     */
    static CLSID_WICExifMetadataReader => Guid("{d9403860-297f-4a49-bf9b-77898150a442}")

    /**
     * @type {Guid}
     */
    static CLSID_WICExifMetadataWriter => Guid("{c9a14cda-c339-460b-9078-d4debcfabe91}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGpsMetadataReader => Guid("{3697790b-223b-484e-9925-c4869218f17a}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGpsMetadataWriter => Guid("{cb8c13e4-62b5-4c96-a48b-6ba6ace39c76}")

    /**
     * @type {Guid}
     */
    static CLSID_WICInteropMetadataReader => Guid("{b5c8b898-0074-459f-b700-860d4651ea14}")

    /**
     * @type {Guid}
     */
    static CLSID_WICInteropMetadataWriter => Guid("{122ec645-cd7e-44d8-b186-2c8c20c3b50f}")

    /**
     * @type {Guid}
     */
    static CLSID_WICThumbnailMetadataReader => Guid("{fb012959-f4f6-44d7-9d09-daa087a9db57}")

    /**
     * @type {Guid}
     */
    static CLSID_WICThumbnailMetadataWriter => Guid("{d049b20c-5dd0-44fe-b0b3-8f92c8e6d080}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIPTCMetadataReader => Guid("{03012959-f4f6-44d7-9d09-daa087a9db57}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIPTCMetadataWriter => Guid("{1249b20c-5dd0-44fe-b0b3-8f92c8e6d080}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIRBMetadataReader => Guid("{d4dcd3d7-b4c2-47d9-a6bf-b89ba396a4a3}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIRBMetadataWriter => Guid("{5c5c1935-0235-4434-80bc-251bc1ec39c6}")

    /**
     * @type {Guid}
     */
    static CLSID_WIC8BIMIPTCMetadataReader => Guid("{0010668c-0801-4da6-a4a4-826522b6d28f}")

    /**
     * @type {Guid}
     */
    static CLSID_WIC8BIMIPTCMetadataWriter => Guid("{00108226-ee41-44a2-9e9c-4be4d5b1d2cd}")

    /**
     * @type {Guid}
     */
    static CLSID_WIC8BIMResolutionInfoMetadataReader => Guid("{5805137a-e348-4f7c-b3cc-6db9965a0599}")

    /**
     * @type {Guid}
     */
    static CLSID_WIC8BIMResolutionInfoMetadataWriter => Guid("{4ff2fe0e-e74a-4b71-98c4-ab7dc16707ba}")

    /**
     * @type {Guid}
     */
    static CLSID_WIC8BIMIPTCDigestMetadataReader => Guid("{02805f1e-d5aa-415b-82c5-61c033a988a6}")

    /**
     * @type {Guid}
     */
    static CLSID_WIC8BIMIPTCDigestMetadataWriter => Guid("{2db5e62b-0d67-495f-8f9d-c2f0188647ac}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngTextMetadataReader => Guid("{4b59afcc-b8c3-408a-b670-89e5fab6fda7}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngTextMetadataWriter => Guid("{b5ebafb9-253e-4a72-a744-0762d2685683}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPMetadataReader => Guid("{72b624df-ae11-4948-a65c-351eb0829419}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPMetadataWriter => Guid("{1765e14e-1bd4-462e-b6b1-590bf1262ac6}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPStructMetadataReader => Guid("{01b90d9a-8209-47f7-9c52-e1244bf50ced}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPStructMetadataWriter => Guid("{22c21f93-7ddb-411c-9b17-c5b7bd064abc}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPBagMetadataReader => Guid("{e7e79a30-4f2c-4fab-8d00-394f2d6bbebe}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPBagMetadataWriter => Guid("{ed822c8c-d6be-4301-a631-0e1416bad28f}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPSeqMetadataReader => Guid("{7f12e753-fc71-43d7-a51d-92f35977abb5}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPSeqMetadataWriter => Guid("{6d68d1de-d432-4b0f-923a-091183a9bda7}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPAltMetadataReader => Guid("{aa94dcc2-b8b0-4898-b835-000aabd74393}")

    /**
     * @type {Guid}
     */
    static CLSID_WICXMPAltMetadataWriter => Guid("{076c2a6c-f78f-4c46-a723-3583e70876ea}")

    /**
     * @type {Guid}
     */
    static CLSID_WICLSDMetadataReader => Guid("{41070793-59e4-479a-a1f7-954adc2ef5fc}")

    /**
     * @type {Guid}
     */
    static CLSID_WICLSDMetadataWriter => Guid("{73c037e7-e5d9-4954-876a-6da81d6e5768}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGCEMetadataReader => Guid("{b92e345d-f52d-41f3-b562-081bc772e3b9}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGCEMetadataWriter => Guid("{af95dc76-16b2-47f4-b3ea-3c31796693e7}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIMDMetadataReader => Guid("{7447a267-0015-42c8-a8f1-fb3b94c68361}")

    /**
     * @type {Guid}
     */
    static CLSID_WICIMDMetadataWriter => Guid("{8c89071f-452e-4e95-9682-9d1024627172}")

    /**
     * @type {Guid}
     */
    static CLSID_WICAPEMetadataReader => Guid("{1767b93a-b021-44ea-920f-863c11f4f768}")

    /**
     * @type {Guid}
     */
    static CLSID_WICAPEMetadataWriter => Guid("{bd6edfca-2890-482f-b233-8d7339a1cf8d}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegChrominanceMetadataReader => Guid("{50b1904b-f28f-4574-93f4-0bade82c69e9}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegChrominanceMetadataWriter => Guid("{3ff566f0-6e6b-49d4-96e6-b78886692c62}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegLuminanceMetadataReader => Guid("{356f2f88-05a6-4728-b9a4-1bfbce04d838}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegLuminanceMetadataWriter => Guid("{1d583abc-8a0e-4657-9982-a380ca58fb4b}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegCommentMetadataReader => Guid("{9f66347c-60c4-4c4d-ab58-d2358685f607}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegCommentMetadataWriter => Guid("{e573236f-55b1-4eda-81ea-9f65db0290d3}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGifCommentMetadataReader => Guid("{32557d3b-69dc-4f95-836e-f5972b2f6159}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGifCommentMetadataWriter => Guid("{a02797fc-c4ae-418c-af95-e637c7ead2a1}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngGamaMetadataReader => Guid("{3692ca39-e082-4350-9e1f-3704cb083cd5}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngGamaMetadataWriter => Guid("{ff036d13-5d4b-46dd-b10f-106693d9fe4f}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngBkgdMetadataReader => Guid("{0ce7a4a6-03e8-4a60-9d15-282ef32ee7da}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngBkgdMetadataWriter => Guid("{68e3f2fd-31ae-4441-bb6a-fd7047525f90}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngItxtMetadataReader => Guid("{aabfb2fa-3e1e-4a8f-8977-5556fb94ea23}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngItxtMetadataWriter => Guid("{31879719-e751-4df8-981d-68dff67704ed}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngChrmMetadataReader => Guid("{f90b5f36-367b-402a-9dd1-bc0fd59d8f62}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngChrmMetadataWriter => Guid("{e23ce3eb-5608-4e83-bcef-27b1987e51d7}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngHistMetadataReader => Guid("{877a0bb7-a313-4491-87b5-2e6d0594f520}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngHistMetadataWriter => Guid("{8a03e749-672e-446e-bf1f-2c11d233b6ff}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngIccpMetadataReader => Guid("{f5d3e63b-cb0f-4628-a478-6d8244be36b1}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngIccpMetadataWriter => Guid("{16671e5f-0ce6-4cc4-9768-e89fe5018ade}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngSrgbMetadataReader => Guid("{fb40360c-547e-4956-a3b9-d4418859ba66}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngSrgbMetadataWriter => Guid("{a6ee35c6-87ec-47df-9f22-1d5aad840c82}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngTimeMetadataReader => Guid("{d94edf02-efe5-4f0d-85c8-f5a68b3000b1}")

    /**
     * @type {Guid}
     */
    static CLSID_WICPngTimeMetadataWriter => Guid("{1ab78400-b5a3-4d91-8ace-33fcd1499be6}")

    /**
     * @type {Guid}
     */
    static CLSID_WICDdsMetadataReader => Guid("{276c88ca-7533-4a86-b676-66b36080d484}")

    /**
     * @type {Guid}
     */
    static CLSID_WICDdsMetadataWriter => Guid("{fd688bbd-31ed-4db7-a723-934927d38367}")

    /**
     * @type {Guid}
     */
    static CLSID_WICHeifMetadataReader => Guid("{acddfc3f-85ec-41bc-bdef-1bc262e4db05}")

    /**
     * @type {Guid}
     */
    static CLSID_WICHeifMetadataWriter => Guid("{3ae45e79-40bc-4401-ace5-dd3cb16e6afe}")

    /**
     * @type {Guid}
     */
    static CLSID_WICHeifHDRMetadataReader => Guid("{2438de3d-94d9-4be8-84a8-4de95a575e75}")

    /**
     * @type {Guid}
     */
    static CLSID_WICHeifHDRMetadataWriter => Guid("{b83135a2-8e7e-485e-a533-f93621dd93c8}")

    /**
     * @type {Guid}
     */
    static CLSID_WICWebpAnimMetadataReader => Guid("{076f9911-a348-465c-a807-a252f3f2d3de}")

    /**
     * @type {Guid}
     */
    static CLSID_WICWebpAnmfMetadataReader => Guid("{85a10b03-c9f6-439f-be5e-c0fbef67807c}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegXLAnimMetadataReader => Guid("{bf8b6eb0-37e2-4ed8-8289-be9ae31d9f03}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegXLAnimMetadataWriter => Guid("{39d01345-432b-44e6-afd6-f606d20a5571}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegXLAnimFrameMetadataReader => Guid("{9cdf50a8-8770-4fe6-aef2-d06e2c01744f}")

    /**
     * @type {Guid}
     */
    static CLSID_WICJpegXLAnimFrameMetadataWriter => Guid("{d1ce58a8-06e0-4b6f-8fc1-577560bd5ad9}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGainMapMetadataReader => Guid("{3ac32daf-27b9-4af5-b0ab-d1189dcf34b3}")

    /**
     * @type {Guid}
     */
    static CLSID_WICGainMapMetadataWriter => Guid("{6f845268-a92e-4a02-b002-a67c362800b2}")
;@endregion Constants

;@region Methods
    /**
     * Obtains a IWICBitmapSource in the desired pixel format from a given IWICBitmapSource.
     * @remarks
     * If the <i>pISrc</i> bitmap is already in the desired format, then <i>pISrc</i> is copied to the destination bitmap pointer and a reference is added. If it is not in the desired format however, <b>WICConvertBitmapSource</b> will instantiate a <i>dstFormat</i> format converter and initialize it with <i>pISrc</i>.
     * @param {Pointer<Guid>} dstFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">REFWICPixelFormatGUID</a></b>
     * 
     * The pixel format to convert to.
     * @param {IWICBitmapSource} pISrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The source bitmap.
     * @returns {IWICBitmapSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * A pointer to the <b>null</b>-initialized destination bitmap pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicconvertbitmapsource
     * @since windows5.1.2600
     */
    static WICConvertBitmapSource(dstFormat, pISrc) {
        result := DllCall("WindowsCodecs.dll\WICConvertBitmapSource", "ptr", dstFormat, "ptr", pISrc, "ptr*", &ppIDst := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWICBitmapSource(ppIDst)
    }

    /**
     * Returns a IWICBitmapSource that is backed by the pixels of a Windows Graphics Device Interface (GDI) section handle. (WICCreateBitmapFromSection)
     * @remarks
     * The <b>WICCreateBitmapFromSection</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-wiccreatebitmapfromsectionex">WICCreateBitmapFromSectionEx</a> function with the <i>desiredAccessLevel</i> parameter set to <b>WICSectionAccessLevelRead</b>.
     * @param {Integer} width Type: <b>UINT</b>
     * 
     * The width of the bitmap pixels.
     * @param {Integer} height Type: <b>UINT</b>
     * 
     * The height of the bitmap pixels.
     * @param {Pointer<Guid>} pixelFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">REFWICPixelFormatGUID</a></b>
     * 
     * The pixel format of the bitmap.
     * @param {HANDLE} hSection Type: <b>HANDLE</b>
     * 
     * The section handle. This is a file mapping object handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function.
     * @param {Integer} stride Type: <b>UINT</b>
     * 
     * The byte count of each scanline.
     * @param {Integer} offset Type: <b>UINT</b>
     * 
     * The offset into the section.
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives the bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wiccreatebitmapfromsection
     * @since windows5.1.2600
     */
    static WICCreateBitmapFromSection(width, height, pixelFormat, hSection, stride, offset) {
        hSection := hSection is Win32Handle ? NumGet(hSection, "ptr") : hSection

        result := DllCall("WindowsCodecs.dll\WICCreateBitmapFromSection", "uint", width, "uint", height, "ptr", pixelFormat, "ptr", hSection, "uint", stride, "uint", offset, "ptr*", &ppIBitmap := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWICBitmap(ppIBitmap)
    }

    /**
     * Returns a IWICBitmapSource that is backed by the pixels of a Windows Graphics Device Interface (GDI) section handle. (WICCreateBitmapFromSectionEx)
     * @param {Integer} width Type: <b>UINT</b>
     * 
     * The width of the bitmap pixels.
     * @param {Integer} height Type: <b>UINT</b>
     * 
     * The height of the bitmap pixels.
     * @param {Pointer<Guid>} pixelFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">REFWICPixelFormatGUID</a></b>
     * 
     * The pixel format of the bitmap.
     * @param {HANDLE} hSection Type: <b>HANDLE</b>
     * 
     * The section handle. This is a file mapping object handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function.
     * @param {Integer} stride Type: <b>UINT</b>
     * 
     * The byte count of each scanline.
     * @param {Integer} offset Type: <b>UINT</b>
     * 
     * The offset into the section.
     * @param {Integer} desiredAccessLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicsectionaccesslevel">WICSectionAccessLevel</a></b>
     * 
     * The desired access level.
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives the bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wiccreatebitmapfromsectionex
     * @since windows6.1
     */
    static WICCreateBitmapFromSectionEx(width, height, pixelFormat, hSection, stride, offset, desiredAccessLevel) {
        hSection := hSection is Win32Handle ? NumGet(hSection, "ptr") : hSection

        result := DllCall("WindowsCodecs.dll\WICCreateBitmapFromSectionEx", "uint", width, "uint", height, "ptr", pixelFormat, "ptr", hSection, "uint", stride, "uint", offset, "int", desiredAccessLevel, "ptr*", &ppIBitmap := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWICBitmap(ppIBitmap)
    }

    /**
     * Obtains the short name associated with a given GUID.
     * @remarks
     * Windows Imaging Component (WIC) short name mappings can be found within the following registry key:
     *             <pre><b>HKEY_CLASSES_ROOT</b>
     *    <b>CLSID</b>
     *       <b>{FAE3D380-FEA4-4623-8C75-C6B61110B681}</b>
     *          <b>Namespace</b>
     *             <b>...</b></pre>
     * @param {Pointer<Guid>} guid Type: <b>REFGUID</b>
     * 
     * The GUID to retrieve the short name for.
     * @param {Integer} cchName Type: <b>UINT</b>
     * 
     * The size of the <i>wzName</i> buffer.
     * @param {PWSTR} wzName Type: <b>WCHAR*</b>
     * 
     * A pointer that receives the short name associated with the GUID.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual size needed to retrieve the entire short name associated with the GUID.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicmapguidtoshortname
     * @since windows5.1.2600
     */
    static WICMapGuidToShortName(guid, cchName, wzName) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := DllCall("WindowsCodecs.dll\WICMapGuidToShortName", "ptr", guid, "uint", cchName, "ptr", wzName, "uint*", &pcchActual := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcchActual
    }

    /**
     * Obtains the GUID associated with the given short name.
     * @remarks
     * You can extend the short name mapping by adding to  the following registry key:
     * 
     * 
     * <pre><b>HKEY_CLASSES_ROOT</b>
     *    <b>CLSID</b>
     *       <b>{FAE3D380-FEA4-4623-8C75-C6B61110B681}</b>
     *          <b>Namespace</b>
     *             <b>...</b></pre>
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-howtowriteacodec">How to Write a WIC-Enabled Codec</a>.
     * @param {PWSTR} wzName Type: <b>const WCHAR*</b>
     * 
     * A pointer to the short name.
     * @param {Pointer<Guid>} pguid Type: <b>GUID*</b>
     * 
     * A pointer that receives the GUID associated with the given short name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicmapshortnametoguid
     * @since windows5.1.2600
     */
    static WICMapShortNameToGuid(wzName, pguid) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := DllCall("WindowsCodecs.dll\WICMapShortNameToGuid", "ptr", wzName, "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the name associated with a given schema.
     * @remarks
     * You can extend the schema name mapping by adding to the following registry key:
     * 
     * 
     * <pre><b>HKEY_CLASSES_ROOT</b>
     *    <b>CLSID</b>
     *       <b>{FAE3D380-FEA4-4623-8C75-C6B61110B681}</b>
     *          <b>Schemas</b>
     *             <b>BB5ACC38-F216-4CEC-A6C5-5F6E739763A9</b>
     *                <b>...</b></pre>
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-howtowriteacodec">How to Write a WIC-Enabled Codec</a>.
     * @param {Pointer<Guid>} guidMetadataFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-guids-clsids">REFGUID</a></b>
     * 
     * The metadata format GUID.
     * @param {PWSTR} pwzSchema Type: <b>LPWSTR</b>
     * 
     * The URI string of the schema for which the name is to be retrieved.
     * @param {Integer} cchName Type: <b>UINT</b>
     * 
     * The size of the <i>wzName</i> buffer.
     * @param {PWSTR} wzName Type: <b>WCHAR*</b>
     * 
     * A pointer to a buffer that receives the schema's name.
     * 
     * To obtain the required buffer size, call <b>WICMapSchemaToName</b> with <i>cchName</i> set to 0 and <i>wzName</i> set to <b>NULL</b>.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * The actual buffer size needed to retrieve the entire schema name.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicmapschematoname
     * @since windows5.1.2600
     */
    static WICMapSchemaToName(guidMetadataFormat, pwzSchema, cchName, wzName) {
        pwzSchema := pwzSchema is String ? StrPtr(pwzSchema) : pwzSchema
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := DllCall("WindowsCodecs.dll\WICMapSchemaToName", "ptr", guidMetadataFormat, "ptr", pwzSchema, "uint", cchName, "ptr", wzName, "uint*", &pcchActual := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcchActual
    }

    /**
     * Obtains a metadata format GUID for a specified container format and vendor that best matches the content within a given stream.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container format GUID.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The vendor GUID.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The content stream in which to match a metadata format.
     * @param {Pointer<Guid>} pguidMetadataFormat Type: <b>GUID*</b>
     * 
     * A pointer that receives a metadata format GUID for the given parameters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-wicmatchmetadatacontent
     * @since windows5.1.2600
     */
    static WICMatchMetadataContent(guidContainerFormat, pguidVendor, pIStream, pguidMetadataFormat) {
        result := DllCall("WindowsCodecs.dll\WICMatchMetadataContent", "ptr", guidContainerFormat, "ptr", pguidVendor, "ptr", pIStream, "ptr", pguidMetadataFormat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes metadata into a given stream.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container format GUID.
     * @param {IWICMetadataWriter} pIWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
     * 
     * The metadata writer to write metadata to the stream.
     * @param {Integer} dwPersistOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> options to use when writing the metadata.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A pointer to the stream in which to write the metadata.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-wicserializemetadatacontent
     * @since windows5.1.2600
     */
    static WICSerializeMetadataContent(guidContainerFormat, pIWriter, dwPersistOptions, pIStream) {
        result := DllCall("WindowsCodecs.dll\WICSerializeMetadataContent", "ptr", guidContainerFormat, "ptr", pIWriter, "uint", dwPersistOptions, "ptr", pIStream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the size of the metadata content contained by the specified IWICMetadataWriter. The returned size accounts for the header and the length of the metadata.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container GUID.
     * @param {IWICMetadataWriter} pIWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a> that contains the content.
     * @returns {Integer} Type: <b>ULARGE_INTEGER*</b>
     * 
     * A pointer that receives the size of the metadata content.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-wicgetmetadatacontentsize
     * @since windows5.1.2600
     */
    static WICGetMetadataContentSize(guidContainerFormat, pIWriter) {
        result := DllCall("WindowsCodecs.dll\WICGetMetadataContentSize", "ptr", guidContainerFormat, "ptr", pIWriter, "uint*", &pcbSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbSize
    }

;@endregion Methods
}
