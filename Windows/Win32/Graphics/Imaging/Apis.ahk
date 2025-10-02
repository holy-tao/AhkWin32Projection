#Requires AutoHotkey v2.0.0 64-bit

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
     * @type {String}
     */
    static CLSID_WICImagingFactory => "{cacaf262-9370-4615-a13b-9f5539da4c0a}"

    /**
     * @type {String}
     */
    static CLSID_WICImagingFactory1 => "{cacaf262-9370-4615-a13b-9f5539da4c0a}"

    /**
     * @type {String}
     */
    static CLSID_WICImagingFactory2 => "{317d06e8-5f24-433d-bdf7-79ce68d8abc2}"

    /**
     * @type {Integer (UInt32)}
     */
    static WINCODEC_SDK_VERSION => 567

    /**
     * @type {String}
     */
    static GUID_VendorMicrosoft => "{f0e749ca-edef-4589-a73a-ee0e626a2a2b}"

    /**
     * @type {String}
     */
    static GUID_VendorMicrosoftBuiltIn => "{257a30fd-06b6-462b-aea4-63f70b86e533}"

    /**
     * @type {String}
     */
    static CLSID_WICPngDecoder => "{389ea17b-5078-4cde-b6ef-25c15175c751}"

    /**
     * @type {String}
     */
    static CLSID_WICPngDecoder1 => "{389ea17b-5078-4cde-b6ef-25c15175c751}"

    /**
     * @type {String}
     */
    static CLSID_WICPngDecoder2 => "{e018945b-aa86-4008-9bd4-6777a1e40c11}"

    /**
     * @type {String}
     */
    static CLSID_WICBmpDecoder => "{6b462062-7cbf-400d-9fdb-813dd10f2778}"

    /**
     * @type {String}
     */
    static CLSID_WICIcoDecoder => "{c61bfcdf-2e0f-4aad-a8d7-e06bafebcdfe}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegDecoder => "{9456a480-e88b-43ea-9e73-0b2d9b71b1ca}"

    /**
     * @type {String}
     */
    static CLSID_WICGifDecoder => "{381dda3c-9ce9-4834-a23e-1f98f8fc52be}"

    /**
     * @type {String}
     */
    static CLSID_WICTiffDecoder => "{b54e85d9-fe23-499f-8b88-6acea713752b}"

    /**
     * @type {String}
     */
    static CLSID_WICWmpDecoder => "{a26cec36-234c-4950-ae16-e34aace71d0d}"

    /**
     * @type {String}
     */
    static CLSID_WICDdsDecoder => "{9053699f-a341-429d-9e90-ee437cf80c73}"

    /**
     * @type {String}
     */
    static CLSID_WICBmpEncoder => "{69be8bb4-d66d-47c8-865a-ed1589433782}"

    /**
     * @type {String}
     */
    static CLSID_WICPngEncoder => "{27949969-876a-41d7-9447-568f6a35a4dc}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegEncoder => "{1a34f5c1-4a5a-46dc-b644-1f4567e7a676}"

    /**
     * @type {String}
     */
    static CLSID_WICGifEncoder => "{114f5598-0b22-40a0-86a1-c83ea495adbd}"

    /**
     * @type {String}
     */
    static CLSID_WICTiffEncoder => "{0131be10-2001-4c5f-a9b0-cc88fab64ce8}"

    /**
     * @type {String}
     */
    static CLSID_WICWmpEncoder => "{ac4ce3cb-e1c1-44cd-8215-5a1665509ec2}"

    /**
     * @type {String}
     */
    static CLSID_WICDdsEncoder => "{a61dde94-66ce-4ac1-881b-71680588895e}"

    /**
     * @type {String}
     */
    static CLSID_WICAdngDecoder => "{981d9411-909e-42a7-8f5d-a747ff052edb}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegQualcommPhoneEncoder => "{68ed5c62-f534-4979-b2b3-686a12b2b34c}"

    /**
     * @type {String}
     */
    static CLSID_WICHeifDecoder => "{e9a4a80a-44fe-4de4-8971-7150b10a5199}"

    /**
     * @type {String}
     */
    static CLSID_WICHeifEncoder => "{0dbecec1-9eb3-4860-9c6f-ddbe86634575}"

    /**
     * @type {String}
     */
    static CLSID_WICWebpDecoder => "{7693e886-51c9-4070-8419-9f70738ec8fa}"

    /**
     * @type {String}
     */
    static CLSID_WICRAWDecoder => "{41945702-8302-44a6-9445-ac98e8afa086}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegXLDecoder => "{fc6ceece-aef5-4a23-96ec-5984ffb486d9}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegXLEncoder => "{0e4ecd3b-1ba6-4636-8198-56c73040964a}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatBmp => "{0af1d87e-fcfe-4188-bdeb-a7906471cbe3}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatPng => "{1b7cfaf4-713f-473c-bbcd-6137425faeaf}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatIco => "{a3a860c4-338f-4c17-919a-fba4b5628f21}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatJpeg => "{19e4a5aa-5662-4fc5-a0c0-1758028e1057}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatTiff => "{163bcc30-e2e9-4f0b-961d-a3e9fdb788a3}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatGif => "{1f8a5601-7d4d-4cbd-9c82-1bc8d4eeb9a5}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatWmp => "{57a37caa-367a-4540-916b-f183c5093a4b}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatDds => "{9967cb95-2e85-4ac8-8ca2-83d7ccd425c9}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatAdng => "{f3ff6d0d-38c0-41c4-b1fe-1f3824f17b84}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatHeif => "{e1e62521-6787-405b-a339-500715b5763f}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatWebp => "{e094b0e2-67f2-45b3-b0ea-115337ca7cf3}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatRaw => "{fe99ce60-f19c-433c-a3ae-00acefa9ca21}"

    /**
     * @type {String}
     */
    static GUID_ContainerFormatJpegXL => "{fec14e3f-427a-4736-aae6-27ed84f69322}"

    /**
     * @type {String}
     */
    static CLSID_WICImagingCategories => "{fae3d380-fea4-4623-8c75-c6b61110b681}"

    /**
     * @type {String}
     */
    static CATID_WICBitmapDecoders => "{7ed96837-96f0-4812-b211-f13c24117ed3}"

    /**
     * @type {String}
     */
    static CATID_WICBitmapEncoders => "{ac757296-3522-4e11-9862-c17be5a1767e}"

    /**
     * @type {String}
     */
    static CATID_WICPixelFormats => "{2b46e70f-cda7-473e-89f6-dc9630a2390b}"

    /**
     * @type {String}
     */
    static CATID_WICFormatConverters => "{7835eae8-bf14-49d1-93ce-533a407b2248}"

    /**
     * @type {String}
     */
    static CATID_WICMetadataReader => "{05af94d8-7174-4cd2-be4a-4124b80ee4b8}"

    /**
     * @type {String}
     */
    static CATID_WICMetadataWriter => "{abe3b9a4-257d-4b97-bd1a-294af496222e}"

    /**
     * @type {String}
     */
    static CLSID_WICDefaultFormatConverter => "{1a3f11dc-b514-4b17-8c5f-2154513852f1}"

    /**
     * @type {String}
     */
    static CLSID_WICFormatConverterHighColor => "{ac75d454-9f37-48f8-b972-4e19bc856011}"

    /**
     * @type {String}
     */
    static CLSID_WICFormatConverterNChannel => "{c17cabb2-d4a3-47d7-a557-339b2efbd4f1}"

    /**
     * @type {String}
     */
    static CLSID_WICFormatConverterWMPhoto => "{9cb5172b-d600-46ba-ab77-77bb7e3a00d9}"

    /**
     * @type {String}
     */
    static CLSID_WICPlanarFormatConverter => "{184132b8-32f8-4784-9131-dd7224b23438}"

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
     * @type {String}
     */
    static GUID_WICPixelFormatDontCare => "{6fddc324-4e03-4bfe-b185-3d77768dc900}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat1bppIndexed => "{6fddc324-4e03-4bfe-b185-3d77768dc901}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat2bppIndexed => "{6fddc324-4e03-4bfe-b185-3d77768dc902}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat4bppIndexed => "{6fddc324-4e03-4bfe-b185-3d77768dc903}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat8bppIndexed => "{6fddc324-4e03-4bfe-b185-3d77768dc904}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormatBlackWhite => "{6fddc324-4e03-4bfe-b185-3d77768dc905}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat2bppGray => "{6fddc324-4e03-4bfe-b185-3d77768dc906}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat4bppGray => "{6fddc324-4e03-4bfe-b185-3d77768dc907}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat8bppGray => "{6fddc324-4e03-4bfe-b185-3d77768dc908}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat8bppAlpha => "{e6cd0116-eeba-4161-aa85-27dd9fb3a895}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat8bppDepth => "{4c9c9f45-1d89-4e31-9bc7-69343a0dca69}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat8bppGain => "{a884022a-af13-4c16-b746-619bf618b878}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppBGR555 => "{6fddc324-4e03-4bfe-b185-3d77768dc909}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppBGR565 => "{6fddc324-4e03-4bfe-b185-3d77768dc90a}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppBGRA5551 => "{05ec7c2b-f1e6-4961-ad46-e1cc810a87d2}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppGray => "{6fddc324-4e03-4bfe-b185-3d77768dc90b}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat24bppBGR => "{6fddc324-4e03-4bfe-b185-3d77768dc90c}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat24bppRGB => "{6fddc324-4e03-4bfe-b185-3d77768dc90d}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppBGR => "{6fddc324-4e03-4bfe-b185-3d77768dc90e}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppBGRA => "{6fddc324-4e03-4bfe-b185-3d77768dc90f}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppPBGRA => "{6fddc324-4e03-4bfe-b185-3d77768dc910}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppGrayFloat => "{6fddc324-4e03-4bfe-b185-3d77768dc911}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppRGB => "{d98c6b95-3efe-47d6-bb25-eb1748ab0cf1}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppRGBA => "{f5c7ad2d-6a8d-43dd-a7a8-a29935261ae9}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppPRGBA => "{3cc4a650-a527-4d37-a916-3142c7ebedba}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat48bppRGB => "{6fddc324-4e03-4bfe-b185-3d77768dc915}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat48bppBGR => "{e605a384-b468-46ce-bb2e-36f180e64313}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppRGB => "{a1182111-186d-4d42-bc6a-9c8303a8dff9}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppRGBA => "{6fddc324-4e03-4bfe-b185-3d77768dc916}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppBGRA => "{1562ff7c-d352-46f9-979e-42976b792246}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppPRGBA => "{6fddc324-4e03-4bfe-b185-3d77768dc917}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppPBGRA => "{8c518e8e-a4ec-468b-ae70-c9a35a9c5530}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppGrayFixedPoint => "{6fddc324-4e03-4bfe-b185-3d77768dc913}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppBGR101010 => "{6fddc324-4e03-4bfe-b185-3d77768dc914}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat48bppRGBFixedPoint => "{6fddc324-4e03-4bfe-b185-3d77768dc912}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat48bppBGRFixedPoint => "{49ca140e-cab6-493b-9ddf-60187c37532a}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat96bppRGBFixedPoint => "{6fddc324-4e03-4bfe-b185-3d77768dc918}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat96bppRGBFloat => "{e3fed78f-e8db-4acf-84c1-e97f6136b327}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat128bppRGBAFloat => "{6fddc324-4e03-4bfe-b185-3d77768dc919}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat128bppPRGBAFloat => "{6fddc324-4e03-4bfe-b185-3d77768dc91a}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat128bppRGBFloat => "{6fddc324-4e03-4bfe-b185-3d77768dc91b}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppCMYK => "{6fddc324-4e03-4bfe-b185-3d77768dc91c}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppRGBAFixedPoint => "{6fddc324-4e03-4bfe-b185-3d77768dc91d}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppBGRAFixedPoint => "{356de33c-54d2-4a23-bb04-9b7bf9b1d42d}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppRGBFixedPoint => "{6fddc324-4e03-4bfe-b185-3d77768dc940}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat128bppRGBAFixedPoint => "{6fddc324-4e03-4bfe-b185-3d77768dc91e}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat128bppRGBFixedPoint => "{6fddc324-4e03-4bfe-b185-3d77768dc941}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppRGBAHalf => "{6fddc324-4e03-4bfe-b185-3d77768dc93a}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppPRGBAHalf => "{58ad26c2-c623-4d9d-b320-387e49f8c442}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppRGBHalf => "{6fddc324-4e03-4bfe-b185-3d77768dc942}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat48bppRGBHalf => "{6fddc324-4e03-4bfe-b185-3d77768dc93b}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppRGBE => "{6fddc324-4e03-4bfe-b185-3d77768dc93d}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppGrayHalf => "{6fddc324-4e03-4bfe-b185-3d77768dc93e}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppGrayFixedPoint => "{6fddc324-4e03-4bfe-b185-3d77768dc93f}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppRGBA1010102 => "{25238d72-fcf9-4522-b514-5578e5ad55e0}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppRGBA1010102XR => "{00de6b9a-c101-434b-b502-d0165ee1122c}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppR10G10B10A2 => "{604e1bb5-8a3c-4b65-b11c-bc0b8dd75b7f}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bppR10G10B10A2HDR10 => "{9c215c5d-1acc-4f0e-a4bc-70fb3ae8fd28}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bppCMYK => "{6fddc324-4e03-4bfe-b185-3d77768dc91f}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat24bpp3Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc920}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bpp4Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc921}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat40bpp5Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc922}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat48bpp6Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc923}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat56bpp7Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc924}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bpp8Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc925}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat48bpp3Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc926}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bpp4Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc927}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat80bpp5Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc928}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat96bpp6Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc929}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat112bpp7Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc92a}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat128bpp8Channels => "{6fddc324-4e03-4bfe-b185-3d77768dc92b}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat40bppCMYKAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc92c}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat80bppCMYKAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc92d}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat32bpp3ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc92e}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat40bpp4ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc92f}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat48bpp5ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc930}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat56bpp6ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc931}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bpp7ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc932}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat72bpp8ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc933}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat64bpp3ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc934}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat80bpp4ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc935}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat96bpp5ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc936}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat112bpp6ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc937}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat128bpp7ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc938}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat144bpp8ChannelsAlpha => "{6fddc324-4e03-4bfe-b185-3d77768dc939}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat8bppY => "{91b4db54-2df9-42f0-b449-2909bb3df88e}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat8bppCb => "{1339f224-6bfe-4c3e-9302-e4f3a6d0ca2a}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat8bppCr => "{b8145053-2116-49f0-8835-ed844b205c51}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppCbCr => "{ff95ba6e-11e0-4263-bb45-01721f3460a4}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppYQuantizedDctCoefficients => "{a355f433-48e8-4a42-84d8-e2aa26ca80a4}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppCbQuantizedDctCoefficients => "{d2c4ff61-56a5-49c2-8b5c-4c1925964837}"

    /**
     * @type {String}
     */
    static GUID_WICPixelFormat16bppCrQuantizedDctCoefficients => "{2fe354f0-1680-42d8-9231-e73c0565bfc1}"

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
     * @type {String}
     */
    static GUID_MetadataFormatUnknown => "{a45e592f-9078-4a7c-adb5-4edc4fd61b1f}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatIfd => "{537396c6-2d8a-4bb6-9bf8-2f0a8e2a3adf}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatSubIfd => "{58a2e128-2db9-4e57-bb14-5177891ed331}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatExif => "{1c3c4f9d-b84a-467d-9493-36cfbd59ea57}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatGps => "{7134ab8a-9351-44ad-af62-448db6b502ec}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatInterop => "{ed686f8e-681f-4c8b-bd41-a8addbf6b3fc}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatApp0 => "{79007028-268d-45d6-a3c2-354e6a504bc9}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatApp1 => "{8fd3dfc3-f951-492b-817f-69c2e6d9a5b0}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatApp13 => "{326556a2-f502-4354-9cc0-8e3f48eaf6b5}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatIPTC => "{4fab0914-e129-4087-a1d1-bc812d45a7b5}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatIRB => "{16100d66-8570-4bb9-b92d-fda4b23ece67}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormat8BIMIPTC => "{0010568c-0852-4e6a-b191-5c33ac5b0430}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormat8BIMResolutionInfo => "{739f305d-81db-43cb-ac5e-55013ef9f003}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormat8BIMIPTCDigest => "{1ca32285-9ccd-4786-8bd8-79539db6a006}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatXMP => "{bb5acc38-f216-4cec-a6c5-5f6e739763a9}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatThumbnail => "{243dcee9-8703-40ee-8ef0-22a600b8058c}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunktEXt => "{568d8936-c0a9-4923-905d-df2b38238fbc}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatXMPStruct => "{22383cf1-ed17-4e2e-af17-d85b8f6b30d0}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatXMPBag => "{833cca5f-dcb7-4516-806f-6596ab26dce4}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatXMPSeq => "{63e8df02-eb6c-456c-a224-b25e794fd648}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatXMPAlt => "{7b08a675-91aa-481b-a798-4da94908613b}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatLSD => "{e256031e-6299-4929-b98d-5ac884afba92}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatIMD => "{bd2bb086-4d52-48dd-9677-db483e85ae8f}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatGCE => "{2a25cad8-deeb-4c69-a788-0ec2266dcafd}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatAPE => "{2e043dc2-c967-4e05-875e-618bf67e85c3}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatJpegChrominance => "{f73d0dcf-cec6-4f85-9b0e-1c3956b1bef7}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatJpegLuminance => "{86908007-edfc-4860-8d4b-4ee6e83e6058}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatJpegComment => "{220e5f33-afd3-474e-9d31-7d4fe730f557}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatGifComment => "{c4b6e0e0-cfb4-4ad3-ab33-9aad2355a34a}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunkgAMA => "{f00935a5-1d5d-4cd1-81b2-9324d7eca781}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunkbKGD => "{e14d3571-6b47-4dea-b60a-87ce0a78dfb7}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunkiTXt => "{c2bec729-0b68-4b77-aa0e-6295a6ac1814}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunkcHRM => "{9db3655b-2842-44b3-8067-12e9b375556a}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunkhIST => "{c59a82da-db74-48a4-bd6a-b69c4931ef95}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunkiCCP => "{eb4349ab-b685-450f-91b5-e802e892536c}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunksRGB => "{c115fd36-cc6f-4e3f-8363-524b87c6b0d9}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatChunktIME => "{6b00ae2d-e24b-460a-98b6-878bd03072fd}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatDds => "{4a064603-8c33-4e60-9c29-136231702d08}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatHeif => "{817ef3e1-1288-45f4-a852-260d9e7cce83}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatHeifHDR => "{568b8d8a-1e65-438c-8968-d60e1012beb9}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatWebpANIM => "{6dc4fda6-78e6-4102-ae35-bcfa1edcc78b}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatWebpANMF => "{43c105ee-b93b-4abb-b003-a08c0d870471}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatJpegXLAnim => "{501c2e24-7a7d-42b2-93c7-b4f45bcc92f7}"

    /**
     * @type {String}
     */
    static GUID_MetadataFormatJpegXLAnimFrame => "{958ecc2c-36cb-4af9-9ea8-0b74baccfd3e}"

    /**
     * @type {String}
     */
    static CLSID_WICUnknownMetadataReader => "{699745c2-5066-4b82-a8e3-d40478dbec8c}"

    /**
     * @type {String}
     */
    static CLSID_WICUnknownMetadataWriter => "{a09cca86-27ba-4f39-9053-121fa4dc08fc}"

    /**
     * @type {String}
     */
    static CLSID_WICApp0MetadataWriter => "{f3c633a2-46c8-498e-8fbb-cc6f721bbcde}"

    /**
     * @type {String}
     */
    static CLSID_WICApp0MetadataReader => "{43324b33-a78f-480f-9111-9638aaccc832}"

    /**
     * @type {String}
     */
    static CLSID_WICApp1MetadataWriter => "{ee366069-1832-420f-b381-0479ad066f19}"

    /**
     * @type {String}
     */
    static CLSID_WICApp1MetadataReader => "{dde33513-774e-4bcd-ae79-02f4adfe62fc}"

    /**
     * @type {String}
     */
    static CLSID_WICApp13MetadataWriter => "{7b19a919-a9d6-49e5-bd45-02c34e4e4cd5}"

    /**
     * @type {String}
     */
    static CLSID_WICApp13MetadataReader => "{aa7e3c50-864c-4604-bc04-8b0b76e637f6}"

    /**
     * @type {String}
     */
    static CLSID_WICIfdMetadataReader => "{8f914656-9d0a-4eb2-9019-0bf96d8a9ee6}"

    /**
     * @type {String}
     */
    static CLSID_WICIfdMetadataWriter => "{b1ebfc28-c9bd-47a2-8d33-b948769777a7}"

    /**
     * @type {String}
     */
    static CLSID_WICSubIfdMetadataReader => "{50d42f09-ecd1-4b41-b65d-da1fdaa75663}"

    /**
     * @type {String}
     */
    static CLSID_WICSubIfdMetadataWriter => "{8ade5386-8e9b-4f4c-acf2-f0008706b238}"

    /**
     * @type {String}
     */
    static CLSID_WICExifMetadataReader => "{d9403860-297f-4a49-bf9b-77898150a442}"

    /**
     * @type {String}
     */
    static CLSID_WICExifMetadataWriter => "{c9a14cda-c339-460b-9078-d4debcfabe91}"

    /**
     * @type {String}
     */
    static CLSID_WICGpsMetadataReader => "{3697790b-223b-484e-9925-c4869218f17a}"

    /**
     * @type {String}
     */
    static CLSID_WICGpsMetadataWriter => "{cb8c13e4-62b5-4c96-a48b-6ba6ace39c76}"

    /**
     * @type {String}
     */
    static CLSID_WICInteropMetadataReader => "{b5c8b898-0074-459f-b700-860d4651ea14}"

    /**
     * @type {String}
     */
    static CLSID_WICInteropMetadataWriter => "{122ec645-cd7e-44d8-b186-2c8c20c3b50f}"

    /**
     * @type {String}
     */
    static CLSID_WICThumbnailMetadataReader => "{fb012959-f4f6-44d7-9d09-daa087a9db57}"

    /**
     * @type {String}
     */
    static CLSID_WICThumbnailMetadataWriter => "{d049b20c-5dd0-44fe-b0b3-8f92c8e6d080}"

    /**
     * @type {String}
     */
    static CLSID_WICIPTCMetadataReader => "{03012959-f4f6-44d7-9d09-daa087a9db57}"

    /**
     * @type {String}
     */
    static CLSID_WICIPTCMetadataWriter => "{1249b20c-5dd0-44fe-b0b3-8f92c8e6d080}"

    /**
     * @type {String}
     */
    static CLSID_WICIRBMetadataReader => "{d4dcd3d7-b4c2-47d9-a6bf-b89ba396a4a3}"

    /**
     * @type {String}
     */
    static CLSID_WICIRBMetadataWriter => "{5c5c1935-0235-4434-80bc-251bc1ec39c6}"

    /**
     * @type {String}
     */
    static CLSID_WIC8BIMIPTCMetadataReader => "{0010668c-0801-4da6-a4a4-826522b6d28f}"

    /**
     * @type {String}
     */
    static CLSID_WIC8BIMIPTCMetadataWriter => "{00108226-ee41-44a2-9e9c-4be4d5b1d2cd}"

    /**
     * @type {String}
     */
    static CLSID_WIC8BIMResolutionInfoMetadataReader => "{5805137a-e348-4f7c-b3cc-6db9965a0599}"

    /**
     * @type {String}
     */
    static CLSID_WIC8BIMResolutionInfoMetadataWriter => "{4ff2fe0e-e74a-4b71-98c4-ab7dc16707ba}"

    /**
     * @type {String}
     */
    static CLSID_WIC8BIMIPTCDigestMetadataReader => "{02805f1e-d5aa-415b-82c5-61c033a988a6}"

    /**
     * @type {String}
     */
    static CLSID_WIC8BIMIPTCDigestMetadataWriter => "{2db5e62b-0d67-495f-8f9d-c2f0188647ac}"

    /**
     * @type {String}
     */
    static CLSID_WICPngTextMetadataReader => "{4b59afcc-b8c3-408a-b670-89e5fab6fda7}"

    /**
     * @type {String}
     */
    static CLSID_WICPngTextMetadataWriter => "{b5ebafb9-253e-4a72-a744-0762d2685683}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPMetadataReader => "{72b624df-ae11-4948-a65c-351eb0829419}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPMetadataWriter => "{1765e14e-1bd4-462e-b6b1-590bf1262ac6}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPStructMetadataReader => "{01b90d9a-8209-47f7-9c52-e1244bf50ced}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPStructMetadataWriter => "{22c21f93-7ddb-411c-9b17-c5b7bd064abc}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPBagMetadataReader => "{e7e79a30-4f2c-4fab-8d00-394f2d6bbebe}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPBagMetadataWriter => "{ed822c8c-d6be-4301-a631-0e1416bad28f}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPSeqMetadataReader => "{7f12e753-fc71-43d7-a51d-92f35977abb5}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPSeqMetadataWriter => "{6d68d1de-d432-4b0f-923a-091183a9bda7}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPAltMetadataReader => "{aa94dcc2-b8b0-4898-b835-000aabd74393}"

    /**
     * @type {String}
     */
    static CLSID_WICXMPAltMetadataWriter => "{076c2a6c-f78f-4c46-a723-3583e70876ea}"

    /**
     * @type {String}
     */
    static CLSID_WICLSDMetadataReader => "{41070793-59e4-479a-a1f7-954adc2ef5fc}"

    /**
     * @type {String}
     */
    static CLSID_WICLSDMetadataWriter => "{73c037e7-e5d9-4954-876a-6da81d6e5768}"

    /**
     * @type {String}
     */
    static CLSID_WICGCEMetadataReader => "{b92e345d-f52d-41f3-b562-081bc772e3b9}"

    /**
     * @type {String}
     */
    static CLSID_WICGCEMetadataWriter => "{af95dc76-16b2-47f4-b3ea-3c31796693e7}"

    /**
     * @type {String}
     */
    static CLSID_WICIMDMetadataReader => "{7447a267-0015-42c8-a8f1-fb3b94c68361}"

    /**
     * @type {String}
     */
    static CLSID_WICIMDMetadataWriter => "{8c89071f-452e-4e95-9682-9d1024627172}"

    /**
     * @type {String}
     */
    static CLSID_WICAPEMetadataReader => "{1767b93a-b021-44ea-920f-863c11f4f768}"

    /**
     * @type {String}
     */
    static CLSID_WICAPEMetadataWriter => "{bd6edfca-2890-482f-b233-8d7339a1cf8d}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegChrominanceMetadataReader => "{50b1904b-f28f-4574-93f4-0bade82c69e9}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegChrominanceMetadataWriter => "{3ff566f0-6e6b-49d4-96e6-b78886692c62}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegLuminanceMetadataReader => "{356f2f88-05a6-4728-b9a4-1bfbce04d838}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegLuminanceMetadataWriter => "{1d583abc-8a0e-4657-9982-a380ca58fb4b}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegCommentMetadataReader => "{9f66347c-60c4-4c4d-ab58-d2358685f607}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegCommentMetadataWriter => "{e573236f-55b1-4eda-81ea-9f65db0290d3}"

    /**
     * @type {String}
     */
    static CLSID_WICGifCommentMetadataReader => "{32557d3b-69dc-4f95-836e-f5972b2f6159}"

    /**
     * @type {String}
     */
    static CLSID_WICGifCommentMetadataWriter => "{a02797fc-c4ae-418c-af95-e637c7ead2a1}"

    /**
     * @type {String}
     */
    static CLSID_WICPngGamaMetadataReader => "{3692ca39-e082-4350-9e1f-3704cb083cd5}"

    /**
     * @type {String}
     */
    static CLSID_WICPngGamaMetadataWriter => "{ff036d13-5d4b-46dd-b10f-106693d9fe4f}"

    /**
     * @type {String}
     */
    static CLSID_WICPngBkgdMetadataReader => "{0ce7a4a6-03e8-4a60-9d15-282ef32ee7da}"

    /**
     * @type {String}
     */
    static CLSID_WICPngBkgdMetadataWriter => "{68e3f2fd-31ae-4441-bb6a-fd7047525f90}"

    /**
     * @type {String}
     */
    static CLSID_WICPngItxtMetadataReader => "{aabfb2fa-3e1e-4a8f-8977-5556fb94ea23}"

    /**
     * @type {String}
     */
    static CLSID_WICPngItxtMetadataWriter => "{31879719-e751-4df8-981d-68dff67704ed}"

    /**
     * @type {String}
     */
    static CLSID_WICPngChrmMetadataReader => "{f90b5f36-367b-402a-9dd1-bc0fd59d8f62}"

    /**
     * @type {String}
     */
    static CLSID_WICPngChrmMetadataWriter => "{e23ce3eb-5608-4e83-bcef-27b1987e51d7}"

    /**
     * @type {String}
     */
    static CLSID_WICPngHistMetadataReader => "{877a0bb7-a313-4491-87b5-2e6d0594f520}"

    /**
     * @type {String}
     */
    static CLSID_WICPngHistMetadataWriter => "{8a03e749-672e-446e-bf1f-2c11d233b6ff}"

    /**
     * @type {String}
     */
    static CLSID_WICPngIccpMetadataReader => "{f5d3e63b-cb0f-4628-a478-6d8244be36b1}"

    /**
     * @type {String}
     */
    static CLSID_WICPngIccpMetadataWriter => "{16671e5f-0ce6-4cc4-9768-e89fe5018ade}"

    /**
     * @type {String}
     */
    static CLSID_WICPngSrgbMetadataReader => "{fb40360c-547e-4956-a3b9-d4418859ba66}"

    /**
     * @type {String}
     */
    static CLSID_WICPngSrgbMetadataWriter => "{a6ee35c6-87ec-47df-9f22-1d5aad840c82}"

    /**
     * @type {String}
     */
    static CLSID_WICPngTimeMetadataReader => "{d94edf02-efe5-4f0d-85c8-f5a68b3000b1}"

    /**
     * @type {String}
     */
    static CLSID_WICPngTimeMetadataWriter => "{1ab78400-b5a3-4d91-8ace-33fcd1499be6}"

    /**
     * @type {String}
     */
    static CLSID_WICDdsMetadataReader => "{276c88ca-7533-4a86-b676-66b36080d484}"

    /**
     * @type {String}
     */
    static CLSID_WICDdsMetadataWriter => "{fd688bbd-31ed-4db7-a723-934927d38367}"

    /**
     * @type {String}
     */
    static CLSID_WICHeifMetadataReader => "{acddfc3f-85ec-41bc-bdef-1bc262e4db05}"

    /**
     * @type {String}
     */
    static CLSID_WICHeifMetadataWriter => "{3ae45e79-40bc-4401-ace5-dd3cb16e6afe}"

    /**
     * @type {String}
     */
    static CLSID_WICHeifHDRMetadataReader => "{2438de3d-94d9-4be8-84a8-4de95a575e75}"

    /**
     * @type {String}
     */
    static CLSID_WICHeifHDRMetadataWriter => "{b83135a2-8e7e-485e-a533-f93621dd93c8}"

    /**
     * @type {String}
     */
    static CLSID_WICWebpAnimMetadataReader => "{076f9911-a348-465c-a807-a252f3f2d3de}"

    /**
     * @type {String}
     */
    static CLSID_WICWebpAnmfMetadataReader => "{85a10b03-c9f6-439f-be5e-c0fbef67807c}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegXLAnimMetadataReader => "{bf8b6eb0-37e2-4ed8-8289-be9ae31d9f03}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegXLAnimMetadataWriter => "{39d01345-432b-44e6-afd6-f606d20a5571}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegXLAnimFrameMetadataReader => "{9cdf50a8-8770-4fe6-aef2-d06e2c01744f}"

    /**
     * @type {String}
     */
    static CLSID_WICJpegXLAnimFrameMetadataWriter => "{d1ce58a8-06e0-4b6f-8fc1-577560bd5ad9}"
;@endregion Constants

;@region Methods
    /**
     * Obtains a IWICBitmapSource in the desired pixel format from a given IWICBitmapSource.
     * @remarks
     * If the <i>pISrc</i> bitmap is already in the desired format, then <i>pISrc</i> is copied to the destination bitmap pointer and a reference is added. If it is not in the desired format however, <b>WICConvertBitmapSource</b> will instantiate a <i>dstFormat</i> format converter and initialize it with <i>pISrc</i>.
     * @param {Pointer<Guid>} dstFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">REFWICPixelFormatGUID</a></b>
     * 
     * The pixel format to convert to.
     * @param {Pointer<IWICBitmapSource>} pISrc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The source bitmap.
     * @param {Pointer<IWICBitmapSource>} ppIDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * A pointer to the <b>null</b>-initialized destination bitmap pointer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicconvertbitmapsource
     * @since windows5.1.2600
     */
    static WICConvertBitmapSource(dstFormat, pISrc, ppIDst) {
        result := DllCall("WindowsCodecs.dll\WICConvertBitmapSource", "ptr", dstFormat, "ptr", pISrc, "ptr", ppIDst, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<Void>} hSection Type: <b>HANDLE</b>
     * 
     * The section handle. This is a file mapping object handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> function.
     * @param {Integer} stride Type: <b>UINT</b>
     * 
     * The byte count of each scanline.
     * @param {Integer} offset Type: <b>UINT</b>
     * 
     * The offset into the section.
     * @param {Pointer<IWICBitmap>} ppIBitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives the bitmap.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wiccreatebitmapfromsection
     * @since windows5.1.2600
     */
    static WICCreateBitmapFromSection(width, height, pixelFormat, hSection, stride, offset, ppIBitmap) {
        result := DllCall("WindowsCodecs.dll\WICCreateBitmapFromSection", "uint", width, "uint", height, "ptr", pixelFormat, "ptr", hSection, "uint", stride, "uint", offset, "ptr", ppIBitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<Void>} hSection Type: <b>HANDLE</b>
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
     * @param {Pointer<IWICBitmap>} ppIBitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives the bitmap.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wiccreatebitmapfromsectionex
     * @since windows6.1
     */
    static WICCreateBitmapFromSectionEx(width, height, pixelFormat, hSection, stride, offset, desiredAccessLevel, ppIBitmap) {
        result := DllCall("WindowsCodecs.dll\WICCreateBitmapFromSectionEx", "uint", width, "uint", height, "ptr", pixelFormat, "ptr", hSection, "uint", stride, "uint", offset, "int", desiredAccessLevel, "ptr", ppIBitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<Char>} wzName Type: <b>WCHAR*</b>
     * 
     * A pointer that receives the short name associated with the GUID.
     * @param {Pointer<UInt32>} pcchActual Type: <b>UINT*</b>
     * 
     * The actual size needed to retrieve the entire short name associated with the GUID.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicmapguidtoshortname
     * @since windows5.1.2600
     */
    static WICMapGuidToShortName(guid, cchName, wzName, pcchActual) {
        wzName := wzName is String? StrPtr(wzName) : wzName

        result := DllCall("WindowsCodecs.dll\WICMapGuidToShortName", "ptr", guid, "uint", cchName, "ptr", wzName, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<Char>} wzName Type: <b>const WCHAR*</b>
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
        wzName := wzName is String? StrPtr(wzName) : wzName

        result := DllCall("WindowsCodecs.dll\WICMapShortNameToGuid", "ptr", wzName, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<Char>} pwzSchema Type: <b>LPWSTR</b>
     * 
     * The URI string of the schema for which the name is to be retrieved.
     * @param {Integer} cchName Type: <b>UINT</b>
     * 
     * The size of the <i>wzName</i> buffer.
     * @param {Pointer<Char>} wzName Type: <b>WCHAR*</b>
     * 
     * A pointer to a buffer that receives the schema's name.
     * 
     * To obtain the required buffer size, call <b>WICMapSchemaToName</b> with <i>cchName</i> set to 0 and <i>wzName</i> set to <b>NULL</b>.
     * @param {Pointer<UInt32>} pcchActual Type: <b>UINT</b>
     * 
     * The actual buffer size needed to retrieve the entire schema name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-wicmapschematoname
     * @since windows5.1.2600
     */
    static WICMapSchemaToName(guidMetadataFormat, pwzSchema, cchName, wzName, pcchActual) {
        pwzSchema := pwzSchema is String? StrPtr(pwzSchema) : pwzSchema
        wzName := wzName is String? StrPtr(wzName) : wzName

        result := DllCall("WindowsCodecs.dll\WICMapSchemaToName", "ptr", guidMetadataFormat, "ptr", pwzSchema, "uint", cchName, "ptr", wzName, "uint*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains a metadata format GUID for a specified container format and vendor that best matches the content within a given stream.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container format GUID.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The vendor GUID.
     * @param {Pointer<IStream>} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes metadata into a given stream.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container format GUID.
     * @param {Pointer<IWICMetadataWriter>} pIWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
     * 
     * The metadata writer to write metadata to the stream.
     * @param {Integer} dwPersistOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> options to use when writing the metadata.
     * @param {Pointer<IStream>} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the size of the metadata content contained by the specified IWICMetadataWriter. The returned size accounts for the header and the length of the metadata.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container GUID.
     * @param {Pointer<IWICMetadataWriter>} pIWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a> that contains the content.
     * @param {Pointer<UInt64>} pcbSize Type: <b>ULARGE_INTEGER*</b>
     * 
     * A pointer that receives the size of the metadata content.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-wicgetmetadatacontentsize
     * @since windows5.1.2600
     */
    static WICGetMetadataContentSize(guidContainerFormat, pIWriter, pcbSize) {
        result := DllCall("WindowsCodecs.dll\WICGetMetadataContentSize", "ptr", guidContainerFormat, "ptr", pIWriter, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
