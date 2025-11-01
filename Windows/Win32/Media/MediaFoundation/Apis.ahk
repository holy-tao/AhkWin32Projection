#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MediaFoundation {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MF_VERSION => 131184

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_None => "{e436eb8e-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIATYPE_Video => "{73646976-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_Audio => "{73647561-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_Text => "{73747874-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_Midi => "{7364696d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_Stream => "{e436eb83-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIATYPE_Interleaved => "{73766169-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_File => "{656c6966-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_ScriptCommand => "{73636d64-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_AUXLine21Data => "{670aea80-3a82-11d0-b79b-00aa003767a7}"

    /**
     * @type {String}
     */
    static MEDIATYPE_AUXTeletextPage => "{11264acb-37de-4eba-8c35-7f04a1a68332}"

    /**
     * @type {String}
     */
    static MEDIATYPE_CC_CONTAINER => "{aeb312e9-3357-43ca-b701-97ec198e2b62}"

    /**
     * @type {String}
     */
    static MEDIATYPE_DTVCCData => "{fb77e152-53b2-499c-b46b-509fc33edfd7}"

    /**
     * @type {String}
     */
    static MEDIATYPE_MSTVCaption => "{b88b8a89-b049-4c80-adcf-5898985e22c1}"

    /**
     * @type {String}
     */
    static MEDIATYPE_VBI => "{f72a76e1-eb0a-11d0-ace4-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVB_SUBTITLES => "{34ffcbc3-d5b3-4171-9002-d4c60301697f}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ISDB_CAPTIONS => "{059dd67d-2e55-4d41-8d1b-01f5e4f50607}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ISDB_SUPERIMPOSE => "{36dc6d28-f1a6-4216-9048-9cfcefeb5eba}"

    /**
     * @type {String}
     */
    static MEDIATYPE_Timecode => "{0482dee3-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIATYPE_LMRT => "{74726c6d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_URL_STREAM => "{736c7275-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_CLPL => "{4c504c43-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_YUYV => "{56595559-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IYUV => "{56555949-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_YVU9 => "{39555659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Y411 => "{31313459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Y41P => "{50313459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_YUY2 => "{32595559-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_YVYU => "{55595659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_UYVY => "{59565955-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Y211 => "{31313259-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_CLJR => "{524a4c43-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IF09 => "{39304649-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_CPLA => "{414c5043-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MJPG => "{47504a4d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_TVMJ => "{4a4d5654-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WAKE => "{454b4157-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_CFCC => "{43434643-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IJPG => "{47504a49-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Plum => "{6d756c50-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVCS => "{53435644-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_H264 => "{34363248-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVSD => "{44535644-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MDVF => "{4656444d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB1 => "{e436eb78-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB4 => "{e436eb79-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB8 => "{e436eb7a-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB565 => "{e436eb7b-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB555 => "{e436eb7c-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB24 => "{e436eb7d-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB32 => "{e436eb7e-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB1555 => "{297c55af-e209-4cb3-b757-c76d6b9c88a8}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB4444 => "{6e6415e6-5c24-425f-93cd-80102b3d1cca}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB32 => "{773c9ac0-3274-11d0-b724-00aa006c1a01}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_A2R10G10B10 => "{2f8bb76d-b644-4550-acf3-d30caa65d5c5}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_A2B10G10R10 => "{576f7893-bdf6-48c4-875f-ae7b81834567}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AYUV => "{56555941-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AI44 => "{34344941-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IA44 => "{34344149-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB32_D3D_DX7_RT => "{32335237-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB16_D3D_DX7_RT => "{36315237-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB32_D3D_DX7_RT => "{38384137-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB4444_D3D_DX7_RT => "{34344137-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB1555_D3D_DX7_RT => "{35314137-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB32_D3D_DX9_RT => "{32335239-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RGB16_D3D_DX9_RT => "{36315239-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB32_D3D_DX9_RT => "{38384139-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB4444_D3D_DX9_RT => "{34344139-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_ARGB1555_D3D_DX9_RT => "{35314139-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_YV12 => "{32315659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_NV12 => "{3231564e-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_NV11 => "{3131564e-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_P208 => "{38303250-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_P210 => "{30313250-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_P216 => "{36313250-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_P010 => "{30313050-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_P016 => "{36313050-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Y210 => "{30313259-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Y216 => "{36313259-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_P408 => "{38303450-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_NV24 => "{3432564e-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_420O => "{4f303234-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IMC1 => "{31434d49-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IMC2 => "{32434d49-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IMC3 => "{33434d49-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IMC4 => "{34434d49-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_S340 => "{30343353-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_S342 => "{32343353-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Overlay => "{e436eb7f-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG1Packet => "{e436eb80-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG1Payload => "{e436eb81-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG1AudioPayload => "{00000050-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIATYPE_MPEG1SystemStream => "{e436eb82-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG1System => "{e436eb84-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG1VideoCD => "{e436eb85-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG1Video => "{e436eb86-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG1Audio => "{e436eb87-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Avi => "{e436eb88-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Asf => "{3db80f90-9412-11d1-aded-0000f8754b99}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_QTMovie => "{e436eb89-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_QTRpza => "{617a7072-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_QTSmc => "{20636d73-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_QTRle => "{20656c72-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_QTJpeg => "{6765706a-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_PCMAudio_Obsolete => "{e436eb8a-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_PCM => "{00000001-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WAVE => "{e436eb8b-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AU => "{e436eb8c-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AIFF => "{e436eb8d-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_dvhd => "{64687664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_dvsl => "{6c737664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_dv25 => "{35327664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_dv50 => "{30357664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_dvh1 => "{31687664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Line21_BytePair => "{6e8d4a22-310c-11d0-b79a-00aa003767a7}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Line21_GOPPacket => "{6e8d4a23-310c-11d0-b79a-00aa003767a7}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Line21_VBIRawData => "{6e8d4a24-310c-11d0-b79a-00aa003767a7}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_708_608Data => "{0af414bc-4ed2-445e-9839-8f095568ab3c}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DtvCcData => "{f52addaa-36f0-43f5-95ea-6d866484262a}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_CC_CONTAINER => "{7ea626db-54da-437b-be9f-f73073adfa3c}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_TELETEXT => "{f72a76e3-eb0a-11d0-ace4-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_VBI => "{663da43c-03e8-4e9a-9cd5-bf11ed0def76}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WSS => "{2791d576-8e7a-466f-9e90-5d3f3083738b}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_XDS => "{01ca73e3-dce6-4575-afe1-2bf1c902caf3}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_VPS => "{a1b3f620-9792-4d8d-81a4-86af25772090}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DRM_Audio => "{00000009-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_IEEE_FLOAT => "{00000003-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DOLBY_AC3_SPDIF => "{00000092-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RAW_SPORT => "{00000240-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_SPDIF_TAG_241h => "{00000241-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DssVideo => "{a0af4f81-e163-11d0-bad9-00609744111a}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DssAudio => "{a0af4f82-e163-11d0-bad9-00609744111a}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_VPVideo => "{5a9b6a40-1a22-11d1-bad9-00609744111a}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_VPVBI => "{5a9b6a41-1a22-11d1-bad9-00609744111a}"

    /**
     * @type {String}
     */
    static CLSID_CaptureGraphBuilder => "{bf87b6e0-8c27-11d0-b3f0-00aa003761c5}"

    /**
     * @type {String}
     */
    static CLSID_CaptureGraphBuilder2 => "{bf87b6e1-8c27-11d0-b3f0-00aa003761c5}"

    /**
     * @type {String}
     */
    static CLSID_ProtoFilterGraph => "{e436ebb0-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_SystemClock => "{e436ebb1-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_FilterMapper => "{e436ebb2-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_FilterGraph => "{e436ebb3-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_FilterGraphNoThread => "{e436ebb8-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_FilterGraphPrivateThread => "{a3ecbc41-581a-4476-b693-a63340462d8b}"

    /**
     * @type {String}
     */
    static CLSID_MPEG1Doc => "{e4bbd160-4269-11ce-838d-00aa0055595a}"

    /**
     * @type {String}
     */
    static CLSID_FileSource => "{701722e0-8ae3-11ce-a85c-00aa002feab5}"

    /**
     * @type {String}
     */
    static CLSID_MPEG1PacketPlayer => "{26c25940-4ca9-11ce-a828-00aa002feab5}"

    /**
     * @type {String}
     */
    static CLSID_MPEG1Splitter => "{336475d0-942a-11ce-a870-00aa002feab5}"

    /**
     * @type {String}
     */
    static CLSID_CMpegVideoCodec => "{feb50740-7bef-11ce-9bd9-0000e202599c}"

    /**
     * @type {String}
     */
    static CLSID_CMpegAudioCodec => "{4a2286e0-7bef-11ce-9bd9-0000e202599c}"

    /**
     * @type {String}
     */
    static CLSID_TextRender => "{e30629d3-27e5-11ce-875d-00608cb78066}"

    /**
     * @type {String}
     */
    static CLSID_InfTee => "{f8388a40-d5bb-11d0-be5a-0080c706568e}"

    /**
     * @type {String}
     */
    static CLSID_AviSplitter => "{1b544c20-fd0b-11ce-8c63-00aa0044b51e}"

    /**
     * @type {String}
     */
    static CLSID_AviReader => "{1b544c21-fd0b-11ce-8c63-00aa0044b51e}"

    /**
     * @type {String}
     */
    static CLSID_VfwCapture => "{1b544c22-fd0b-11ce-8c63-00aa0044b51e}"

    /**
     * @type {String}
     */
    static CLSID_CaptureProperties => "{1b544c22-fd0b-11ce-8c63-00aa0044b51f}"

    /**
     * @type {String}
     */
    static CLSID_FGControl => "{e436ebb4-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_MOVReader => "{44584800-f8ee-11ce-b2d4-00dd01101b85}"

    /**
     * @type {String}
     */
    static CLSID_QuickTimeParser => "{d51bd5a0-7548-11cf-a520-0080c77ef58a}"

    /**
     * @type {String}
     */
    static CLSID_QTDec => "{fdfe9681-74a3-11d0-afa7-00aa00b67a42}"

    /**
     * @type {String}
     */
    static CLSID_AVIDoc => "{d3588ab0-0781-11ce-b03a-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_VideoRenderer => "{70e102b0-5556-11ce-97c0-00aa0055595a}"

    /**
     * @type {String}
     */
    static CLSID_Colour => "{1643e180-90f5-11ce-97d5-00aa0055595a}"

    /**
     * @type {String}
     */
    static CLSID_Dither => "{1da08500-9edc-11cf-bc10-00aa00ac74f6}"

    /**
     * @type {String}
     */
    static CLSID_ModexRenderer => "{07167665-5011-11cf-bf33-00aa0055595a}"

    /**
     * @type {String}
     */
    static CLSID_AudioRender => "{e30629d1-27e5-11ce-875d-00608cb78066}"

    /**
     * @type {String}
     */
    static CLSID_AudioProperties => "{05589faf-c356-11ce-bf01-00aa0055595a}"

    /**
     * @type {String}
     */
    static CLSID_DSoundRender => "{79376820-07d0-11cf-a24d-0020afd79767}"

    /**
     * @type {String}
     */
    static CLSID_AudioRecord => "{e30629d2-27e5-11ce-875d-00608cb78066}"

    /**
     * @type {String}
     */
    static CLSID_AudioInputMixerProperties => "{2ca8ca52-3c3f-11d2-b73d-00c04fb6bd3d}"

    /**
     * @type {String}
     */
    static CLSID_AVIDec => "{cf49d4e0-1115-11ce-b03a-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_AVIDraw => "{a888df60-1e90-11cf-ac98-00aa004c0fa9}"

    /**
     * @type {String}
     */
    static CLSID_ACMWrapper => "{6a08cf80-0e18-11cf-a24d-0020afd79767}"

    /**
     * @type {String}
     */
    static CLSID_AsyncReader => "{e436ebb5-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_URLReader => "{e436ebb6-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_PersistMonikerPID => "{e436ebb7-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static CLSID_AVICo => "{d76e2820-1563-11cf-ac98-00aa004c0fa9}"

    /**
     * @type {String}
     */
    static CLSID_FileWriter => "{8596e5f0-0da5-11d0-bd21-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_AviDest => "{e2510970-f137-11ce-8b67-00aa00a3f1a6}"

    /**
     * @type {String}
     */
    static CLSID_AviMuxProptyPage => "{c647b5c0-157c-11d0-bd23-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_AviMuxProptyPage1 => "{0a9ae910-85c0-11d0-bd42-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_AVIMIDIRender => "{07b65360-c445-11ce-afde-00aa006c14f4}"

    /**
     * @type {String}
     */
    static CLSID_WMAsfReader => "{187463a0-5bb7-11d3-acbe-0080c75e246e}"

    /**
     * @type {String}
     */
    static CLSID_WMAsfWriter => "{7c23220e-55bb-11d3-8b16-00c04fb6bd3d}"

    /**
     * @type {String}
     */
    static CLSID_MPEG2Demultiplexer => "{afb6c280-2c41-11d3-8a60-0000f81e0e4a}"

    /**
     * @type {String}
     */
    static CLSID_MPEG2Demultiplexer_NoClock => "{687d3367-3644-467a-adfe-6cd7a85c4a2c}"

    /**
     * @type {String}
     */
    static CLSID_MMSPLITTER => "{3ae86b20-7be8-11d1-abe6-00a0c905f375}"

    /**
     * @type {String}
     */
    static CLSID_StreamBufferSink => "{2db47ae5-cf39-43c2-b4d6-0cd8d90946f4}"

    /**
     * @type {String}
     */
    static CLSID_SBE2Sink => "{e2448508-95da-4205-9a27-7ec81e723b1a}"

    /**
     * @type {String}
     */
    static CLSID_StreamBufferSource => "{c9f5fe02-f851-4eb5-99ee-ad602af1e619}"

    /**
     * @type {String}
     */
    static CLSID_StreamBufferConfig => "{fa8a68b2-c864-4ba2-ad53-d3876a87494b}"

    /**
     * @type {String}
     */
    static CLSID_StreamBufferPropertyHandler => "{e37a73f8-fb01-43dc-914e-aaee76095ab9}"

    /**
     * @type {String}
     */
    static CLSID_StreamBufferThumbnailHandler => "{713790ee-5ee1-45ba-8070-a1337d2762fa}"

    /**
     * @type {String}
     */
    static CLSID_Mpeg2VideoStreamAnalyzer => "{6cfad761-735d-4aa5-8afc-af91a7d61eba}"

    /**
     * @type {String}
     */
    static CLSID_StreamBufferRecordingAttributes => "{ccaa63ac-1057-4778-ae92-1206ab9acee6}"

    /**
     * @type {String}
     */
    static CLSID_StreamBufferComposeRecording => "{d682c4ba-a90a-42fe-b9e1-03109849c423}"

    /**
     * @type {String}
     */
    static CLSID_SBE2File => "{93a094d7-51e8-485b-904a-8d6b97dc6b39}"

    /**
     * @type {String}
     */
    static CLSID_DVVideoCodec => "{b1b77c00-c3e4-11cf-af79-00aa00b67a42}"

    /**
     * @type {String}
     */
    static CLSID_DVVideoEnc => "{13aa3650-bb6f-11d0-afb9-00aa00b67a42}"

    /**
     * @type {String}
     */
    static CLSID_DVSplitter => "{4eb31670-9fc6-11cf-af6e-00aa00b67a42}"

    /**
     * @type {String}
     */
    static CLSID_DVMux => "{129d7e40-c10d-11d0-afb9-00aa00b67a42}"

    /**
     * @type {String}
     */
    static CLSID_SeekingPassThru => "{060af76c-68dd-11d0-8fc1-00c04fd9189d}"

    /**
     * @type {String}
     */
    static CLSID_Line21Decoder => "{6e8d4a20-310c-11d0-b79a-00aa003767a7}"

    /**
     * @type {String}
     */
    static CLSID_Line21Decoder2 => "{e4206432-01a1-4bee-b3e1-3702c8edc574}"

    /**
     * @type {String}
     */
    static CLSID_CCAFilter => "{3d07a539-35ca-447c-9b05-8d85ce924f9e}"

    /**
     * @type {String}
     */
    static CLSID_OverlayMixer => "{cd8743a1-3736-11d0-9e69-00c04fd7c15b}"

    /**
     * @type {String}
     */
    static CLSID_VBISurfaces => "{814b9800-1c88-11d1-bad9-00609744111a}"

    /**
     * @type {String}
     */
    static CLSID_WSTDecoder => "{70bc06e0-5666-11d3-a184-00105aef9f33}"

    /**
     * @type {String}
     */
    static CLSID_MjpegDec => "{301056d0-6dff-11d2-9eeb-006008039e37}"

    /**
     * @type {String}
     */
    static CLSID_MJPGEnc => "{b80ab0a0-7416-11d2-9eeb-006008039e37}"

    /**
     * @type {String}
     */
    static CLSID_SystemDeviceEnum => "{62be5d10-60eb-11d0-bd3b-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_CDeviceMoniker => "{4315d437-5b8c-11d0-bd3b-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_VideoInputDeviceCategory => "{860bb310-5d01-11d0-bd3b-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_CVidCapClassManager => "{860bb310-5d01-11d0-bd3b-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_LegacyAmFilterCategory => "{083863f1-70de-11d0-bd40-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_CQzFilterClassManager => "{083863f1-70de-11d0-bd40-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_VideoCompressorCategory => "{33d9a760-90c8-11d0-bd43-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_CIcmCoClassManager => "{33d9a760-90c8-11d0-bd43-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_AudioCompressorCategory => "{33d9a761-90c8-11d0-bd43-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_CAcmCoClassManager => "{33d9a761-90c8-11d0-bd43-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_AudioInputDeviceCategory => "{33d9a762-90c8-11d0-bd43-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_CWaveinClassManager => "{33d9a762-90c8-11d0-bd43-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_AudioRendererCategory => "{e0f158e1-cb04-11d0-bd4e-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_CWaveOutClassManager => "{e0f158e1-cb04-11d0-bd4e-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_MidiRendererCategory => "{4efe2452-168a-11d1-bc76-00c04fb9453b}"

    /**
     * @type {String}
     */
    static CLSID_CMidiOutClassManager => "{4efe2452-168a-11d1-bc76-00c04fb9453b}"

    /**
     * @type {String}
     */
    static CLSID_TransmitCategory => "{cc7bfb41-f175-11d1-a392-00e0291f3959}"

    /**
     * @type {String}
     */
    static CLSID_DeviceControlCategory => "{cc7bfb46-f175-11d1-a392-00e0291f3959}"

    /**
     * @type {String}
     */
    static CLSID_ActiveMovieCategories => "{da4e3da0-d07d-11d0-bd50-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_DVDHWDecodersCategory => "{2721ae20-7e70-11d0-a5d6-28db04c10000}"

    /**
     * @type {String}
     */
    static CLSID_MediaEncoderCategory => "{7d22e920-5ca9-4787-8c2b-a6779bd11781}"

    /**
     * @type {String}
     */
    static CLSID_MediaMultiplexerCategory => "{236c9559-adce-4736-bf72-bab34e392196}"

    /**
     * @type {String}
     */
    static CLSID_FilterMapper2 => "{cda42200-bd88-11d0-bd4e-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_MemoryAllocator => "{1e651cc0-b199-11d0-8212-00c04fc32c45}"

    /**
     * @type {String}
     */
    static CLSID_MediaPropertyBag => "{cdbd8d00-c193-11d0-bd4e-00a0c911ce86}"

    /**
     * @type {String}
     */
    static CLSID_DvdGraphBuilder => "{fcc152b7-f372-11d0-8e00-00c04fd7c08b}"

    /**
     * @type {String}
     */
    static CLSID_DVDNavigator => "{9b8c4620-2c1a-11d0-8493-00a02438ad48}"

    /**
     * @type {String}
     */
    static CLSID_DVDState => "{f963c5cf-a659-4a93-9638-caf3cd277d13}"

    /**
     * @type {String}
     */
    static CLSID_SmartTee => "{cc58e280-8aa1-11d1-b3f1-00aa003761c5}"

    /**
     * @type {String}
     */
    static CLSID_DtvCcFilter => "{fb056ba0-2502-45b9-8e86-2b40de84ad29}"

    /**
     * @type {String}
     */
    static CLSID_CaptionsFilter => "{2f7ee4b6-6ff5-4eb4-b24a-2bfc41117171}"

    /**
     * @type {String}
     */
    static CLSID_SubtitlesFilter => "{9f22cfea-ce07-41ab-8ba0-c7364af90af9}"

    /**
     * @type {String}
     */
    static CLSID_DirectShowPluginControl => "{8670c736-f614-427b-8ada-bbadc587194b}"

    /**
     * @type {String}
     */
    static FORMAT_None => "{0f6417d6-c318-11d0-a43f-00a0c9223196}"

    /**
     * @type {String}
     */
    static FORMAT_VideoInfo => "{05589f80-c356-11ce-bf01-00aa0055595a}"

    /**
     * @type {String}
     */
    static FORMAT_VideoInfo2 => "{f72a76a0-eb0a-11d0-ace4-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static FORMAT_WaveFormatEx => "{05589f81-c356-11ce-bf01-00aa0055595a}"

    /**
     * @type {String}
     */
    static FORMAT_MPEGVideo => "{05589f82-c356-11ce-bf01-00aa0055595a}"

    /**
     * @type {String}
     */
    static FORMAT_MPEGStreams => "{05589f83-c356-11ce-bf01-00aa0055595a}"

    /**
     * @type {String}
     */
    static FORMAT_DvInfo => "{05589f84-c356-11ce-bf01-00aa0055595a}"

    /**
     * @type {String}
     */
    static FORMAT_525WSS => "{c7ecf04d-4582-4869-9abb-bfb523b62edf}"

    /**
     * @type {String}
     */
    static CLSID_DirectDrawProperties => "{944d4c00-dd52-11ce-bf0e-00aa0055595a}"

    /**
     * @type {String}
     */
    static CLSID_PerformanceProperties => "{59ce6880-acf8-11cf-b56e-0080c7c4b68a}"

    /**
     * @type {String}
     */
    static CLSID_QualityProperties => "{418afb70-f8b8-11ce-aac6-0020af0b99a3}"

    /**
     * @type {String}
     */
    static CLSID_VPObject => "{ce292861-fc88-11d0-9e69-00c04fd7c15b}"

    /**
     * @type {String}
     */
    static CLSID_VPVBIObject => "{814b9801-1c88-11d1-bad9-00609744111a}"

    /**
     * @type {String}
     */
    static CLSID_DVDecPropertiesPage => "{101193c0-0bfe-11d0-af91-00aa00b67a42}"

    /**
     * @type {String}
     */
    static CLSID_DVEncPropertiesPage => "{4150f050-bb6f-11d0-afb9-00aa00b67a42}"

    /**
     * @type {String}
     */
    static CLSID_DVMuxPropertyPage => "{4db880e0-c10d-11d0-afb9-00aa00b67a42}"

    /**
     * @type {String}
     */
    static CLSID_WstDecoderPropertyPage => "{04e27f80-91e4-11d3-a184-00105aef9f33}"

    /**
     * @type {String}
     */
    static FORMAT_AnalogVideo => "{0482dde0-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIATYPE_AnalogVideo => "{0482dde1-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_NTSC_M => "{0482dde2-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_PAL_B => "{0482dde5-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_PAL_D => "{0482dde6-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_PAL_G => "{0482dde7-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_PAL_H => "{0482dde8-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_PAL_I => "{0482dde9-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_PAL_M => "{0482ddea-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_PAL_N => "{0482ddeb-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_PAL_N_COMBO => "{0482ddec-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_SECAM_B => "{0482ddf0-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_SECAM_D => "{0482ddf1-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_SECAM_G => "{0482ddf2-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_SECAM_H => "{0482ddf3-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_SECAM_K => "{0482ddf4-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_SECAM_K1 => "{0482ddf5-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AnalogVideo_SECAM_L => "{0482ddf6-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static MEDIATYPE_AnalogAudio => "{0482dee1-7817-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static FORMAT_CAPTIONED_H264VIDEO => "{a4efc024-873e-4da3-898b-474ddbd79fd0}"

    /**
     * @type {String}
     */
    static FORMAT_CC_CONTAINER => "{50997a4a-e508-4054-a2b2-10ff0ac1a69a}"

    /**
     * @type {String}
     */
    static CAPTION_FORMAT_ATSC => "{3ed9cb31-fd10-4ade-bccc-fb9105d2f3ef}"

    /**
     * @type {String}
     */
    static CAPTION_FORMAT_DVB => "{12230db4-ff2a-447e-bb88-6841c416d068}"

    /**
     * @type {String}
     */
    static CAPTION_FORMAT_DIRECTV => "{e9ca1ce7-915e-47be-9bb9-bf1d8a13a5ec}"

    /**
     * @type {String}
     */
    static CAPTION_FORMAT_ECHOSTAR => "{ebb1a262-1158-4b99-ae80-92ac776952c4}"

    /**
     * @type {String}
     */
    static FORMAT_CAPTIONED_MPEG2VIDEO => "{7ab2ada2-81b6-4f14-b3c8-d0c486393b67}"

    /**
     * @type {String}
     */
    static TIME_FORMAT_NONE => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static TIME_FORMAT_FRAME => "{7b785570-8c82-11cf-bc0c-00aa00ac74f6}"

    /**
     * @type {String}
     */
    static TIME_FORMAT_BYTE => "{7b785571-8c82-11cf-bc0c-00aa00ac74f6}"

    /**
     * @type {String}
     */
    static TIME_FORMAT_SAMPLE => "{7b785572-8c82-11cf-bc0c-00aa00ac74f6}"

    /**
     * @type {String}
     */
    static TIME_FORMAT_FIELD => "{7b785573-8c82-11cf-bc0c-00aa00ac74f6}"

    /**
     * @type {String}
     */
    static TIME_FORMAT_MEDIA_TIME => "{7b785574-8c82-11cf-bc0c-00aa00ac74f6}"

    /**
     * @type {String}
     */
    static AMPROPSETID_Pin => "{9b00f101-1567-11d1-b3f1-00aa003761c5}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_CAPTURE => "{fb6c4281-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_PREVIEW => "{fb6c4282-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_ANALOGVIDEOIN => "{fb6c4283-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_VBI => "{fb6c4284-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_VIDEOPORT => "{fb6c4285-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_NABTS => "{fb6c4286-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_EDS => "{fb6c4287-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_TELETEXT => "{fb6c4288-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_CC => "{fb6c4289-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_STILL => "{fb6c428a-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_TIMECODE => "{fb6c428b-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static PIN_CATEGORY_VIDEOPORT_VBI => "{fb6c428c-0353-11d1-905f-0000c0cc16ba}"

    /**
     * @type {String}
     */
    static LOOK_UPSTREAM_ONLY => "{ac798be0-98e3-11d1-b3f1-00aa003761c5}"

    /**
     * @type {String}
     */
    static LOOK_DOWNSTREAM_ONLY => "{ac798be1-98e3-11d1-b3f1-00aa003761c5}"

    /**
     * @type {String}
     */
    static CLSID_TVTunerFilterPropertyPage => "{266eee41-6c63-11cf-8a03-00aa006ecb65}"

    /**
     * @type {String}
     */
    static CLSID_CrossbarFilterPropertyPage => "{71f96461-78f3-11d0-a18c-00a0c9118956}"

    /**
     * @type {String}
     */
    static CLSID_TVAudioFilterPropertyPage => "{71f96463-78f3-11d0-a18c-00a0c9118956}"

    /**
     * @type {String}
     */
    static CLSID_VideoProcAmpPropertyPage => "{71f96464-78f3-11d0-a18c-00a0c9118956}"

    /**
     * @type {String}
     */
    static CLSID_CameraControlPropertyPage => "{71f96465-78f3-11d0-a18c-00a0c9118956}"

    /**
     * @type {String}
     */
    static CLSID_AnalogVideoDecoderPropertyPage => "{71f96466-78f3-11d0-a18c-00a0c9118956}"

    /**
     * @type {String}
     */
    static CLSID_VideoStreamConfigPropertyPage => "{71f96467-78f3-11d0-a18c-00a0c9118956}"

    /**
     * @type {String}
     */
    static CLSID_AudioRendererAdvancedProperties => "{37e92a92-d9aa-11d2-bf84-8ef2b1555aed}"

    /**
     * @type {String}
     */
    static CLSID_VideoMixingRenderer => "{b87beb7b-8d29-423f-ae4d-6582c10175ac}"

    /**
     * @type {String}
     */
    static CLSID_VideoRendererDefault => "{6bc1cffa-8fc1-4261-ac22-cfb4cc38db50}"

    /**
     * @type {String}
     */
    static CLSID_AllocPresenter => "{99d54f63-1a69-41ae-aa4d-c976eb3f0713}"

    /**
     * @type {String}
     */
    static CLSID_AllocPresenterDDXclMode => "{4444ac9e-242e-471b-a3c7-45dcd46352bc}"

    /**
     * @type {String}
     */
    static CLSID_VideoPortManager => "{6f26a6cd-967b-47fd-874a-7aed2c9d25a2}"

    /**
     * @type {String}
     */
    static CLSID_VideoMixingRenderer9 => "{51b4abf3-748f-4e3b-a276-c828330e926a}"

    /**
     * @type {String}
     */
    static CLSID_EnhancedVideoRenderer => "{fa10746c-9b63-4b6c-bc49-fc300ea5f256}"

    /**
     * @type {String}
     */
    static CLSID_MFVideoMixer9 => "{e474e05a-ab65-4f6a-827c-218b1baaf31f}"

    /**
     * @type {String}
     */
    static CLSID_MFVideoPresenter9 => "{98455561-5136-4d28-ab08-4cee40ea2781}"

    /**
     * @type {String}
     */
    static CLSID_EVRTearlessWindowPresenter9 => "{a0a7a57b-59b2-4919-a694-add0a526c373}"

    /**
     * @type {String}
     */
    static CLSID_EVRPlaybackPipelineOptimizer => "{62079164-233b-41f8-a80f-f01705f514a8}"

    /**
     * @type {String}
     */
    static EVRConfig_ForceBob => "{e447df01-10ca-4d17-b17e-6a840f8a3a4c}"

    /**
     * @type {String}
     */
    static EVRConfig_ForceThrottle => "{e447df03-10ca-4d17-b17e-6a840f8a3a4c}"

    /**
     * @type {String}
     */
    static EVRConfig_ForceHalfInterlace => "{e447df05-10ca-4d17-b17e-6a840f8a3a4c}"

    /**
     * @type {String}
     */
    static EVRConfig_ForceScaling => "{e447df07-10ca-4d17-b17e-6a840f8a3a4c}"

    /**
     * @type {String}
     */
    static EVRConfig_ForceBatching => "{e447df09-10ca-4d17-b17e-6a840f8a3a4c}"

    /**
     * @type {String}
     */
    static CLSID_NetworkProvider => "{b2f3a67c-29da-4c78-8831-091ed509a475}"

    /**
     * @type {String}
     */
    static CLSID_ATSCNetworkProvider => "{0dad2fdd-5fd7-11d3-8f50-00c04f7971e2}"

    /**
     * @type {String}
     */
    static CLSID_ATSCNetworkPropertyPage => "{e3444d16-5ac4-4386-88df-13fd230e1dda}"

    /**
     * @type {String}
     */
    static CLSID_DVBSNetworkProvider => "{fa4b375a-45b4-4d45-8440-263957b11623}"

    /**
     * @type {String}
     */
    static CLSID_DVBTNetworkProvider => "{216c62df-6d7f-4e9a-8571-05f14edb766a}"

    /**
     * @type {String}
     */
    static CLSID_DVBCNetworkProvider => "{dc0c0fe7-0485-4266-b93f-68fbf80ed834}"

    /**
     * @type {String}
     */
    static DSATTRIB_UDCRTag => "{eb7836ca-14ff-4919-bce7-3af12319e50c}"

    /**
     * @type {String}
     */
    static DSATTRIB_PicSampleSeq => "{2f5bae02-7b8f-4f60-82d6-e4ea2f1f4c99}"

    /**
     * @type {String}
     */
    static DSATTRIB_OptionalVideoAttributes => "{5a5f08ca-55c2-4033-92ab-55db8f781226}"

    /**
     * @type {String}
     */
    static DSATTRIB_CC_CONTAINER_INFO => "{e7e050fb-dd5d-40dd-9915-35dcb81bdc8a}"

    /**
     * @type {String}
     */
    static DSATTRIB_TRANSPORT_PROPERTIES => "{b622f612-47ad-4671-ad6c-05a98e65de3a}"

    /**
     * @type {String}
     */
    static DSATTRIB_PBDATAG_ATTRIBUTE => "{e0b56679-12b9-43cc-b7df-578caa5a7b63}"

    /**
     * @type {String}
     */
    static DSATTRIB_CAPTURE_STREAMTIME => "{0c1a5614-30cd-4f40-bcbf-d03e52306207}"

    /**
     * @type {String}
     */
    static DSATTRIB_DSHOW_STREAM_DESC => "{5fb5673b-0a2a-4565-827b-6853fd75e611}"

    /**
     * @type {String}
     */
    static DSATTRIB_SAMPLE_LIVE_STREAM_TIME => "{892cd111-72f3-411d-8b91-a9e9123ac29a}"

    /**
     * @type {String}
     */
    static UUID_UdriTagTables => "{e1b98d74-9778-4878-b664-eb2020364d88}"

    /**
     * @type {String}
     */
    static UUID_WMDRMTagTables => "{5dcd1101-9263-45bb-a4d5-c415ab8c589c}"

    /**
     * @type {String}
     */
    static CLSID_DShowTVEFilter => "{05500280-faa5-4df9-8246-bfc23ac5cea8}"

    /**
     * @type {String}
     */
    static CLSID_TVEFilterTuneProperties => "{05500281-faa5-4df9-8246-bfc23ac5cea8}"

    /**
     * @type {String}
     */
    static CLSID_TVEFilterCCProperties => "{05500282-faa5-4df9-8246-bfc23ac5cea8}"

    /**
     * @type {String}
     */
    static CLSID_TVEFilterStatsProperties => "{05500283-faa5-4df9-8246-bfc23ac5cea8}"

    /**
     * @type {String}
     */
    static CLSID_IVideoEncoderProxy => "{b43c4eec-8c32-4791-9102-508ada5ee8e7}"

    /**
     * @type {String}
     */
    static CLSID_ICodecAPIProxy => "{7ff0997a-1999-4286-a73c-622b8814e7eb}"

    /**
     * @type {String}
     */
    static CLSID_IVideoEncoderCodecAPIProxy => "{b05dabd9-56e5-4fdc-afa4-8a47e91f1c9c}"

    /**
     * @type {String}
     */
    static ENCAPIPARAM_BITRATE => "{49cc4c43-ca83-4ad4-a9af-f3696af666df}"

    /**
     * @type {String}
     */
    static ENCAPIPARAM_PEAK_BITRATE => "{703f16a9-3d48-44a1-b077-018dff915d19}"

    /**
     * @type {String}
     */
    static ENCAPIPARAM_BITRATE_MODE => "{ee5fb25c-c713-40d1-9d58-c0d7241e250f}"

    /**
     * @type {String}
     */
    static ENCAPIPARAM_SAP_MODE => "{0c0171db-fefc-4af7-9991-a5657c191cd1}"

    /**
     * @type {String}
     */
    static CODECAPI_CHANGELISTS => "{62b12acf-f6b0-47d9-9456-96f22c4e0b9d}"

    /**
     * @type {String}
     */
    static CODECAPI_VIDEO_ENCODER => "{7112e8e1-3d03-47ef-8e60-03f1cf537301}"

    /**
     * @type {String}
     */
    static CODECAPI_AUDIO_ENCODER => "{b9d19a3e-f897-429c-bc46-8138b7272b2d}"

    /**
     * @type {String}
     */
    static CODECAPI_SETALLDEFAULTS => "{6c5e6a7c-acf8-4f55-a999-1a628109051b}"

    /**
     * @type {String}
     */
    static CODECAPI_ALLSETTINGS => "{6a577e92-83e1-4113-adc2-4fcec32f83a1}"

    /**
     * @type {String}
     */
    static CODECAPI_SUPPORTSEVENTS => "{0581af97-7693-4dbd-9dca-3f9ebd6585a1}"

    /**
     * @type {String}
     */
    static CODECAPI_CURRENTCHANGELIST => "{1cb14e83-7d72-4657-83fd-47a2c5b9d13d}"

    /**
     * @type {String}
     */
    static CLSID_SBE2MediaTypeProfile => "{1f26a602-2b5c-4b63-b8e8-9ea5c1a7dc2e}"

    /**
     * @type {String}
     */
    static CLSID_SBE2FileScan => "{3e458037-0ca6-41aa-a594-2aa6c02d709b}"

    /**
     * @type {String}
     */
    static CODECAPI_AVDecMmcssClass => "{e0ad4828-df66-4893-9f33-788aa4ec4082}"

    /**
     * @type {Integer (UInt32)}
     */
    static AVENC_H263V_LEVELCOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AVENC_H264V_LEVELCOUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AVENC_H264V_MAX_MBBITS => 3200

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_MPEG2 => "{ee27417f-5e28-4e65-beea-1d26b508adc9}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_MPEG1_AND_MPEG2 => "{86695f12-340e-4f04-9fd3-9253dd327460}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_H264 => "{1b81be68-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_H264_STEREO_PROGRESSIVE => "{d79be8da-0cf1-4c81-b82a-69a4e236f43d}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_H264_STEREO => "{f9aaccbb-c2b6-4cfc-8779-5707b1760552}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_H264_MULTIVIEW => "{705b9d82-76cf-49d6-b7e6-ac8872db013c}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_VC1 => "{1b81bea3-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_VC1_D2010 => "{1b81bea4-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_MPEG4PT2_SIMPLE => "{efd64d74-c9e8-41d7-a5e9-e9b0e39fa319}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_MPEG4PT2_ADVSIMPLE_NOGMC => "{ed418a9f-010d-4eda-9ae3-9a65358d8d2e}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN => "{5b11d51b-2f4c-4452-bcc3-09f2a1160cc0}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN10 => "{107af0e0-ef1a-4d19-aba8-67a163073d13}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MONOCHROME => "{0685b993-3d8c-43a0-8b28-d74c2d6899a4}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MONOCHROME10 => "{142a1d0f-69dd-4ec9-8591-b12ffcb91a29}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN12 => "{1a72925f-0c2c-4f15-96fb-b17d1473603f}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN10_422 => "{0bac4fe5-1532-4429-a854-f84de04953db}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN12_422 => "{55bcac81-f311-4093-a7d0-1cbc0b849bee}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN_444 => "{4008018f-f537-4b36-98cf-61af8a2c1a33}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN10_EXT => "{9cc55490-e37c-4932-8684-4920f9f6409c}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN10_444 => "{0dabeffa-4458-4602-bc03-0795659d617c}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN12_444 => "{9798634d-fe9d-48e5-b4da-dbec45b3df01}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_HEVC_MAIN16 => "{a4fbdbb0-a113-482b-a232-635cc0697f6d}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_VP9 => "{463707f8-a1d0-4585-876d-83aa6d60b89e}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_VP9_10BIT_PROFILE2 => "{a4c749ef-6ecf-48aa-8448-50a7a1165ff7}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_VP8 => "{90b899ea-3a62-4705-88b3-8df04b2744e7}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_AV1_PROFILE0 => "{b8be4ccb-cf53-46ba-8d59-d6b8a6da5d2a}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_AV1_PROFILE1 => "{6936ff0f-45b1-4163-9cc1-646ef6946108}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_AV1_PROFILE2 => "{0c5f2aa1-e541-4089-bb7b-98110a19d7c8}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_AV1_12BIT_PROFILE2 => "{17127009-a00f-4ce1-994e-bf4081f6f3f0}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_AV1_12BIT_PROFILE2_420 => "{2d80bed6-9cac-4835-9e91-327bbc4f9ee8}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_MJPEG_VLD_420 => "{725cb506-0c29-43c4-9440-8e9397903a04}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_MJPEG_VLD_422 => "{5b77b9cd-1a35-4c30-9fd8-ef4b60c035dd}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_MJPEG_VLD_444 => "{d95161f9-0d44-47e6-bcf5-1bfbfb268f97}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_MJPEG_VLD_4444 => "{c91748d5-fd18-4aca-9db3-3a6634ab547d}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_JPEG_VLD_420 => "{cf782c83-bef5-4a2c-87cb-6019e7b175ac}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_JPEG_VLD_422 => "{f04df417-eee2-4067-a778-f35c15ab9721}"

    /**
     * @type {String}
     */
    static D3D12_VIDEO_DECODE_PROFILE_JPEG_VLD_444 => "{4cd00e17-89ba-48ef-b9f9-edcb82713f65}"

    /**
     * @type {String}
     */
    static DXVA2_ModeMPEG2_MoComp => "{e6a9f44b-61b0-4563-9ea4-63d2a3c6fe66}"

    /**
     * @type {String}
     */
    static DXVA2_ModeMPEG2_IDCT => "{bf22ad00-03ea-4690-8077-473346209b7e}"

    /**
     * @type {String}
     */
    static DXVA2_ModeMPEG2_VLD => "{ee27417f-5e28-4e65-beea-1d26b508adc9}"

    /**
     * @type {String}
     */
    static DXVA2_ModeMPEG1_VLD => "{6f3ec719-3735-42cc-8063-65cc3cb36616}"

    /**
     * @type {String}
     */
    static DXVA2_ModeMPEG2and1_VLD => "{86695f12-340e-4f04-9fd3-9253dd327460}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_A => "{1b81be64-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_B => "{1b81be65-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_C => "{1b81be66-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_D => "{1b81be67-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_E => "{1b81be68-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_F => "{1b81be69-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_VLD_WithFMOASO_NoFGT => "{d5f04ff9-3418-45d8-9561-32a76aae2ddd}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_VLD_Stereo_Progressive_NoFGT => "{d79be8da-0cf1-4c81-b82a-69a4e236f43d}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_VLD_Stereo_NoFGT => "{f9aaccbb-c2b6-4cfc-8779-5707b1760552}"

    /**
     * @type {String}
     */
    static DXVA2_ModeH264_VLD_Multiview_NoFGT => "{705b9d82-76cf-49d6-b7e6-ac8872db013c}"

    /**
     * @type {String}
     */
    static DXVA2_ModeWMV8_A => "{1b81be80-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeWMV8_B => "{1b81be81-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeWMV9_A => "{1b81be90-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeWMV9_B => "{1b81be91-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeWMV9_C => "{1b81be94-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeVC1_A => "{1b81bea0-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeVC1_B => "{1b81bea1-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeVC1_C => "{1b81bea2-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeVC1_D => "{1b81bea3-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_ModeVC1_D2010 => "{1b81bea4-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_NoEncrypt => "{1b81bed0-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVA2_VideoProcProgressiveDevice => "{5a54a0c9-c7ec-4bd9-8ede-f3c75dc4393b}"

    /**
     * @type {String}
     */
    static DXVA2_VideoProcBobDevice => "{335aa36e-7884-43a4-9c91-7f87faf3e37e}"

    /**
     * @type {String}
     */
    static DXVA2_VideoProcSoftwareDevice => "{4553d47f-ee7e-4e3f-9475-dbf1376c4810}"

    /**
     * @type {String}
     */
    static DXVA2_ModeMPEG4pt2_VLD_Simple => "{efd64d74-c9e8-41d7-a5e9-e9b0e39fa319}"

    /**
     * @type {String}
     */
    static DXVA2_ModeMPEG4pt2_VLD_AdvSimple_NoGMC => "{ed418a9f-010d-4eda-9ae3-9a65358d8d2e}"

    /**
     * @type {String}
     */
    static DXVA2_ModeMPEG4pt2_VLD_AdvSimple_GMC => "{ab998b5b-4258-44a9-9feb-94e597a6baae}"

    /**
     * @type {String}
     */
    static DXVA2_ModeHEVC_VLD_Main => "{5b11d51b-2f4c-4452-bcc3-09f2a1160cc0}"

    /**
     * @type {String}
     */
    static DXVA2_ModeHEVC_VLD_Main10 => "{107af0e0-ef1a-4d19-aba8-67a163073d13}"

    /**
     * @type {String}
     */
    static DXVA2_ModeVP9_VLD_Profile0 => "{463707f8-a1d0-4585-876d-83aa6d60b89e}"

    /**
     * @type {String}
     */
    static DXVA2_ModeVP9_VLD_10bit_Profile2 => "{a4c749ef-6ecf-48aa-8448-50a7a1165ff7}"

    /**
     * @type {String}
     */
    static DXVA2_ModeVP8_VLD => "{90b899ea-3a62-4705-88b3-8df04b2744e7}"

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_E_NOT_INITIALIZED => -2147217408

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_E_NEW_VIDEO_DEVICE => -2147217407

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_E_VIDEO_DEVICE_LOCKED => -2147217406

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_E_NOT_AVAILABLE => -2147217405

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SUBSTREAMS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA2_DECODE_GET_DRIVER_HANDLE => 1829

    /**
     * @type {Integer (UInt32)}
     */
    static DXVA2_DECODE_SPECIFY_ENCRYPTED_BLOCKS => 1828

    /**
     * @type {String}
     */
    static DXVAp_ModeMPEG2_A => "{1b81be0a-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVAp_ModeMPEG2_C => "{1b81be0c-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVAp_NoEncrypt => "{1b81bed0-a0c7-11d3-b984-00c04f2e73c5}"

    /**
     * @type {String}
     */
    static DXVAp_DeinterlaceBobDevice => "{335aa36e-7884-43a4-9c91-7f87faf3e37e}"

    /**
     * @type {String}
     */
    static DXVAp_DeinterlaceContainerDevice => "{0e85cb93-3046-4ff0-aecc-d58cb5f035fd}"

    /**
     * @type {String}
     */
    static DXVAHD_STREAM_STATE_PRIVATE_IVTC => "{9c601e3c-0f33-414c-a739-99540ee42da5}"

    /**
     * @type {String}
     */
    static DXVAHDControlGuid => "{a0386e75-f70c-464c-a9ce-33c44e091623}"

    /**
     * @type {String}
     */
    static DXVAHDETWGUID_CREATEVIDEOPROCESSOR => "{681e3d1e-5674-4fb3-a503-2f2055e91f60}"

    /**
     * @type {String}
     */
    static DXVAHDETWGUID_VIDEOPROCESSBLTSTATE => "{76c94b5a-193f-4692-9484-a4d999da81a8}"

    /**
     * @type {String}
     */
    static DXVAHDETWGUID_VIDEOPROCESSSTREAMSTATE => "{262c0b02-209d-47ed-94d8-82ae02b84aa7}"

    /**
     * @type {String}
     */
    static DXVAHDETWGUID_VIDEOPROCESSBLTHD => "{bef3d435-78c7-4de3-9707-cd1b083b160a}"

    /**
     * @type {String}
     */
    static DXVAHDETWGUID_VIDEOPROCESSBLTHD_STREAM => "{27ae473e-a5fc-4be5-b4e3-f24994d3c495}"

    /**
     * @type {String}
     */
    static DXVAHDETWGUID_DESTROYVIDEOPROCESSOR => "{f943f0a0-3f16-43e0-8093-105a986aa5f1}"

    /**
     * @type {String}
     */
    static MR_VIDEO_RENDER_SERVICE => "{1092a86c-ab1a-459a-a336-831fbc4d11ff}"

    /**
     * @type {String}
     */
    static MR_VIDEO_MIXER_SERVICE => "{073cd2fc-6cf4-40b7-8859-e89552c841f8}"

    /**
     * @type {String}
     */
    static MR_VIDEO_ACCELERATION_SERVICE => "{efef5175-5c7d-4ce2-bbbd-34ff8bca6554}"

    /**
     * @type {String}
     */
    static MR_BUFFER_SERVICE => "{a562248c-9ac6-4ffc-9fba-3af8f8ad1a4d}"

    /**
     * @type {String}
     */
    static VIDEO_ZOOM_RECT => "{7aaa1638-1b7f-4c93-bd89-5b9c9fb6fcf0}"

    /**
     * @type {Integer (UInt32)}
     */
    static MFEVRDLL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_SDK_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MF_API_VERSION => 112

    /**
     * @type {Integer (UInt32)}
     */
    static MFSTARTUP_NOSOCKET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MFSTARTUP_LITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MFSTARTUP_FULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DXGI_DEVICE_NOT_INITIALIZED => -2147217408

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DXGI_NEW_VIDEO_DEVICE => -2147217407

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DXGI_VIDEO_DEVICE_LOCKED => -2147217406

    /**
     * @type {Integer (UInt32)}
     */
    static MF_1_BYTE_ALIGNMENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_2_BYTE_ALIGNMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_4_BYTE_ALIGNMENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MF_8_BYTE_ALIGNMENT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MF_16_BYTE_ALIGNMENT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MF_32_BYTE_ALIGNMENT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MF_64_BYTE_ALIGNMENT => 63

    /**
     * @type {Integer (UInt32)}
     */
    static MF_128_BYTE_ALIGNMENT => 127

    /**
     * @type {Integer (UInt32)}
     */
    static MF_256_BYTE_ALIGNMENT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MF_512_BYTE_ALIGNMENT => 511

    /**
     * @type {Integer (UInt32)}
     */
    static MF_1024_BYTE_ALIGNMENT => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static MF_2048_BYTE_ALIGNMENT => 2047

    /**
     * @type {Integer (UInt32)}
     */
    static MF_4096_BYTE_ALIGNMENT => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static MF_8192_BYTE_ALIGNMENT => 8191

    /**
     * @type {String}
     */
    static MF_EVENT_SESSIONCAPS => "{7e5ebcd0-11b8-4abe-afad-10f6599a7f42}"

    /**
     * @type {String}
     */
    static MF_EVENT_SESSIONCAPS_DELTA => "{7e5ebcd1-11b8-4abe-afad-10f6599a7f42}"

    /**
     * @type {Integer (UInt32)}
     */
    static MFSESSIONCAP_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MFSESSIONCAP_SEEK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MFSESSIONCAP_PAUSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MFSESSIONCAP_RATE_FORWARD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MFSESSIONCAP_RATE_REVERSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MFSESSIONCAP_DOES_NOT_USE_NETWORK => 64

    /**
     * @type {String}
     */
    static MF_EVENT_TOPOLOGY_STATUS => "{30c5018d-9a53-454b-ad9e-6d5f8fa7c43b}"

    /**
     * @type {String}
     */
    static MF_EVENT_START_PRESENTATION_TIME => "{5ad914d0-9b45-4a8d-a2c0-81d1e50bfb07}"

    /**
     * @type {String}
     */
    static MF_EVENT_PRESENTATION_TIME_OFFSET => "{5ad914d1-9b45-4a8d-a2c0-81d1e50bfb07}"

    /**
     * @type {String}
     */
    static MF_EVENT_START_PRESENTATION_TIME_AT_OUTPUT => "{5ad914d2-9b45-4a8d-a2c0-81d1e50bfb07}"

    /**
     * @type {String}
     */
    static MF_EVENT_SOURCE_FAKE_START => "{a8cc55a7-6b31-419f-845d-ffb351a2434b}"

    /**
     * @type {String}
     */
    static MF_EVENT_SOURCE_PROJECTSTART => "{a8cc55a8-6b31-419f-845d-ffb351a2434b}"

    /**
     * @type {String}
     */
    static MF_EVENT_SOURCE_ACTUAL_START => "{a8cc55a9-6b31-419f-845d-ffb351a2434b}"

    /**
     * @type {String}
     */
    static MF_EVENT_SOURCE_TOPOLOGY_CANCELED => "{db62f650-9a5e-4704-acf3-563bc6a73364}"

    /**
     * @type {String}
     */
    static MF_EVENT_SOURCE_CHARACTERISTICS => "{47db8490-8b22-4f52-afda-9ce1b2d3cfa8}"

    /**
     * @type {String}
     */
    static MF_EVENT_SOURCE_CHARACTERISTICS_OLD => "{47db8491-8b22-4f52-afda-9ce1b2d3cfa8}"

    /**
     * @type {String}
     */
    static MF_EVENT_DO_THINNING => "{321ea6fb-dad9-46e4-b31d-d2eae7090e30}"

    /**
     * @type {String}
     */
    static MF_EVENT_SCRUBSAMPLE_TIME => "{9ac712b3-dcb8-44d5-8d0c-37455a2782e3}"

    /**
     * @type {String}
     */
    static MF_EVENT_OUTPUT_NODE => "{830f1a8b-c060-46dd-a801-1c95dec9b107}"

    /**
     * @type {String}
     */
    static MF_EVENT_MFT_INPUT_STREAM_ID => "{f29c2cca-7ae6-42d2-b284-bf837cc874e2}"

    /**
     * @type {String}
     */
    static MF_EVENT_MFT_CONTEXT => "{b7cd31f1-899e-4b41-80c9-26a896d32977}"

    /**
     * @type {String}
     */
    static MF_EVENT_STREAM_METADATA_KEYDATA => "{cd59a4a1-4a3b-4bbd-8665-72a40fbea776}"

    /**
     * @type {String}
     */
    static MF_EVENT_STREAM_METADATA_CONTENT_KEYIDS => "{5063449d-cc29-4fc6-a75a-d247b35af85c}"

    /**
     * @type {String}
     */
    static MF_EVENT_STREAM_METADATA_SYSTEMID => "{1ea2ef64-ba16-4a36-8719-fe7560ba32ad}"

    /**
     * @type {String}
     */
    static MFSampleExtension_MaxDecodeFrameSize => "{d3cc654f-f9f3-4a13-889f-f04eb2b5b957}"

    /**
     * @type {String}
     */
    static MFSampleExtension_AccumulatedNonRefPicPercent => "{79ea74df-a740-445b-bc98-c9ed1f260eee}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_ProtectionScheme => "{d054d096-28bb-45da-87ec-74f351871406}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_CryptByteBlock => "{9d84289b-0c7f-4713-ab95-108ab42ad801}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_SkipByteBlock => "{0d550548-8317-4ab1-845f-d06306e293e3}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_SubSample_Mapping => "{8444f27a-69a1-48da-bd08-11cef36830d2}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_ClearSliceHeaderData => "{5509a4f4-320d-4e6c-8d1a-94c66dd20cb0}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_HardwareProtection_KeyInfoID => "{8cbfcceb-94a5-4de1-8231-a85e47cf81e7}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_HardwareProtection_KeyInfo => "{b2372080-455b-4dd7-9989-1a955784b754}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_HardwareProtection_VideoDecryptorContext => "{693470c8-e837-47a0-88cb-535b905e3582}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_Opaque_Data => "{224d77e5-1391-4ffb-9f41-b432f68c611d}"

    /**
     * @type {String}
     */
    static MFSampleExtension_NALULengthInfo => "{19124e7c-ad4b-465f-bb18-20186287b6af}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_ResumeVideoOutput => "{a435aba5-afde-4cf5-bc1c-f6acaf13949d}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_NALUTypes => "{b0f067c7-714c-416c-8d59-5f4ddf8913b6}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_SPSPPSData => "{aede0fa2-0e0c-453c-b7f3-de8693364d11}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_SEIData => "{3cf0e972-4542-4687-9999-585f565fba7d}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_HardwareProtection => "{9a2b2d2b-8270-43e3-8448-994f426e8886}"

    /**
     * @type {String}
     */
    static MFSampleExtension_CleanPoint => "{9cdf01d8-a0f0-43ba-b077-eaa06cbd728a}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Discontinuity => "{9cdf01d9-a0f0-43ba-b077-eaa06cbd728a}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Token => "{8294da66-f328-4805-b551-00deb4c57a61}"

    /**
     * @type {String}
     */
    static MFSampleExtension_ClosedCaption_CEA708 => "{26f09068-e744-47dc-aa03-dbf20403bde6}"

    /**
     * @type {Integer (UInt32)}
     */
    static MFSampleExtension_ClosedCaption_CEA708_MAX_SIZE => 256

    /**
     * @type {String}
     */
    static MFSampleExtension_DecodeTimestamp => "{73a954d4-09e2-4861-befc-94bd97c08e6e}"

    /**
     * @type {String}
     */
    static MFSampleExtension_VideoEncodeQP => "{b2efe478-f979-4c66-b95e-ee2b82c82f36}"

    /**
     * @type {String}
     */
    static MFSampleExtension_VideoEncodePictureType => "{973704e6-cd14-483c-8f20-c9fc0928bad5}"

    /**
     * @type {String}
     */
    static MFSampleExtension_FrameCorruption => "{b4dd4a8c-0beb-44c4-8b75-b02b913b04f0}"

    /**
     * @type {String}
     */
    static MFSampleExtension_DirtyRects => "{9ba70225-b342-4e97-9126-0b566ab7ea7e}"

    /**
     * @type {String}
     */
    static MFSampleExtension_MoveRegions => "{e2a6c693-3a8b-4b8d-95d0-f60281a12fb7}"

    /**
     * @type {String}
     */
    static MFSampleExtension_HDCP_OptionalHeader => "{9a2e7390-121f-455f-8376-c97428e0b540}"

    /**
     * @type {String}
     */
    static MFSampleExtension_HDCP_FrameCounter => "{9d389c60-f507-4aa6-a40a-71027a02f3de}"

    /**
     * @type {String}
     */
    static MFSampleExtension_HDCP_StreamID => "{177e5d74-c370-4a7a-95a2-36833c01d0af}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Timestamp => "{1e436999-69be-4c7a-9369-70068c0260cb}"

    /**
     * @type {String}
     */
    static MFSampleExtension_RepeatFrame => "{88be738f-0711-4f42-b458-344aed42ec2f}"

    /**
     * @type {String}
     */
    static MFT_ENCODER_ERROR => "{c8d1eda4-98e4-41d5-9297-44f53852f90e}"

    /**
     * @type {String}
     */
    static MFT_GFX_DRIVER_VERSION_ID_Attribute => "{f34b9093-05e0-4b16-993d-3e2a2cde6ad3}"

    /**
     * @type {String}
     */
    static MFSampleExtension_DescrambleData => "{43483be6-4903-4314-b032-2951365936fc}"

    /**
     * @type {String}
     */
    static MFSampleExtension_SampleKeyID => "{9ed713c8-9b87-4b26-8297-a93b0c5a8acc}"

    /**
     * @type {String}
     */
    static MFSampleExtension_GenKeyFunc => "{441ca1ee-6b1f-4501-903a-de87df42f6ed}"

    /**
     * @type {String}
     */
    static MFSampleExtension_GenKeyCtx => "{188120cb-d7da-4b59-9b3e-9252fd37301c}"

    /**
     * @type {String}
     */
    static MFSampleExtension_PacketCrossOffsets => "{2789671d-389f-40bb-90d9-c282f77f9abd}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_SampleID => "{6698b84e-0afa-4330-aeb2-1c0a98d7a44d}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_KeyID => "{76376591-795f-4da1-86ed-9d46eca109a9}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Content_KeyID => "{c6c7f5b0-acca-415b-87d9-10441469efc6}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Encryption_SubSampleMappingSplit => "{fe0254b9-2aa5-4edc-99f7-17e89dbf9174}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Interlaced => "{b1d5830a-deb8-40e3-90fa-389943716461}"

    /**
     * @type {String}
     */
    static MFSampleExtension_BottomFieldFirst => "{941ce0a3-6ae3-4dda-9a08-a64298340617}"

    /**
     * @type {String}
     */
    static MFSampleExtension_RepeatFirstField => "{304d257c-7493-4fbd-b149-9228de8d9a99}"

    /**
     * @type {String}
     */
    static MFSampleExtension_SingleField => "{9d85f816-658b-455a-bde0-9fa7e15ab8f9}"

    /**
     * @type {String}
     */
    static MFSampleExtension_DerivedFromTopField => "{6852465a-ae1c-4553-8e9b-c3420fcb1637}"

    /**
     * @type {String}
     */
    static MFSampleExtension_MeanAbsoluteDifference => "{1cdbde11-08b4-4311-a6dd-0f9f371907aa}"

    /**
     * @type {String}
     */
    static MFSampleExtension_LongTermReferenceFrameInfo => "{9154733f-e1bd-41bf-81d3-fcd918f71332}"

    /**
     * @type {String}
     */
    static MFSampleExtension_ROIRectangle => "{3414a438-4998-4d2c-be82-be3ca0b24d43}"

    /**
     * @type {String}
     */
    static MFSampleExtension_LastSlice => "{2b5d5457-5547-4f07-b8c8-b4a3a9a1daac}"

    /**
     * @type {Integer (UInt32)}
     */
    static MACROBLOCK_FLAG_SKIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MACROBLOCK_FLAG_DIRTY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MACROBLOCK_FLAG_MOTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MACROBLOCK_FLAG_VIDEO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MACROBLOCK_FLAG_HAS_MOTION_VECTOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MACROBLOCK_FLAG_HAS_QP => 32

    /**
     * @type {String}
     */
    static MFSampleExtension_FeatureMap => "{a032d165-46fc-400a-b449-49de53e62a6e}"

    /**
     * @type {String}
     */
    static MFSampleExtension_ChromaOnly => "{1eb9179c-a01f-4845-8c04-0e65a26eb04f}"

    /**
     * @type {String}
     */
    static MFSampleExtension_SpatialLayerId => "{b7aabc7b-2396-457a-879e-623bfab6e0ac}"

    /**
     * @type {String}
     */
    static MFSampleExtension_TemporalLayerId => "{b3c1fcd2-b331-4376-b974-ad647769b2b0}"

    /**
     * @type {String}
     */
    static MFSampleExtension_PhotoThumbnail => "{74bbc85c-c8bb-42dc-b586-da17ffd35dcc}"

    /**
     * @type {String}
     */
    static MFSampleExtension_PhotoThumbnailMediaType => "{61ad5420-ebf8-4143-89af-6bf25f672def}"

    /**
     * @type {String}
     */
    static MFSampleExtension_CaptureMetadata => "{2ebe23a8-faf5-444a-a6a2-eb810880ab5d}"

    /**
     * @type {String}
     */
    static MFSampleExtension_MDLCacheCookie => "{5f002af9-d8f9-41a3-b6c3-a2ad43f647ad}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_PHOTO_FRAME_FLASH => "{0f9dd6c6-6003-45d8-bd59-f1f53e3d04e8}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FRAME_RAWSTREAM => "{9252077b-2680-49b9-ae02-b19075973b70}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FOCUSSTATE => "{a87ee154-997f-465d-b91f-29d53b982b88}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_REQUESTED_FRAME_SETTING_ID => "{bb3716d9-8a61-47a4-8197-459c7ff174d5}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_EXPOSURE_TIME => "{16b9ae99-cd84-4063-879d-a28c7633729e}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_EXPOSURE_COMPENSATION => "{d198aa75-4b62-4345-abf3-3c31fa12c299}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_ISO_SPEED => "{e528a68f-b2e3-44fe-8b65-07bf4b5a13ff}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_LENS_POSITION => "{b5fc8e86-11d1-4e70-819b-723a89fa4520}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_SCENE_MODE => "{9cc3b54d-5ed3-4bae-b388-7670aef59e13}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FLASH => "{4a51520b-fb36-446c-9df2-68171b9a0389}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FLASH_POWER => "{9c0e0d49-0205-491a-bc9d-2d6e1f4d5684}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_WHITEBALANCE => "{c736fd77-0fb9-4e2e-97a2-fcd490739ee9}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_ZOOMFACTOR => "{e50b0b81-e501-42c2-abf2-857ecb13fa5c}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FACEROIS => "{864f25a6-349f-46b1-a30e-54cc22928a47}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FACEROITIMESTAMPS => "{e94d50cc-3da0-44d4-bb34-83198a741868}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FACEROICHARACTERIZATIONS => "{b927a1a8-18ef-46d3-b3af-69372f94d9b2}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_ISO_GAINS => "{05802ac9-0e1d-41c7-a8c8-7e7369f84e1e}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_SENSORFRAMERATE => "{db51357e-9d3d-4962-b06d-07ce650d9a0a}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_WHITEBALANCE_GAINS => "{e7570c8f-2dcb-4c7c-aace-22ece7cce647}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_HISTOGRAM => "{85358432-2ef6-4ba9-a3fb-06d82974b895}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_EXIF => "{2e9575b8-8c31-4a02-8575-42b197b71592}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FRAME_ILLUMINATION => "{6d688ffc-63d3-46fe-bada-5b947db0d080}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_UVC_PAYLOADHEADER => "{f9f88a87-e1dd-441e-95cb-42e21a64f1d9}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Depth_MinReliableDepth => "{5f8582b2-e36b-47c8-9b87-fee1ca72c5b0}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Depth_MaxReliableDepth => "{e45545d1-1f0f-4a32-a8a7-6101a24ea8be}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FIRST_SCANLINE_START_TIME_QPC => "{6a2c49f1-e052-46b6-b2d9-73c1558709af}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_LAST_SCANLINE_END_TIME_QPC => "{dccadecb-c4d4-400d-b418-10e88525e1f6}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_SCANLINE_TIME_QPC_ACCURACY => "{4cd79c51-f765-4b09-b1e1-27d1f7ebea09}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_SCANLINE_DIRECTION => "{6496a3ba-1907-49e6-b0c3-123795f380a9}"

    /**
     * @type {Integer (UInt32)}
     */
    static MFCAPTURE_METADATA_SCAN_RIGHT_LEFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MFCAPTURE_METADATA_SCAN_BOTTOM_TOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MFCAPTURE_METADATA_SCANLINE_VERTICAL => 4

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_DIGITALWINDOW => "{276f72a2-59c8-4f69-97b4-068b8c0ec044}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_METADATA_FRAME_BACKGROUND_MASK => "{03f14dd3-75dd-433a-a8e2-1e3f5f2a50a0}"

    /**
     * @type {Integer (UInt32)}
     */
    static MF_METADATAFACIALEXPRESSION_SMILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_METADATATIMESTAMPS_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_METADATATIMESTAMPS_PRESENTATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HISTOGRAM_CHANNEL_Y => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HISTOGRAM_CHANNEL_R => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HISTOGRAM_CHANNEL_G => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HISTOGRAM_CHANNEL_B => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HISTOGRAM_CHANNEL_Cb => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HISTOGRAM_CHANNEL_Cr => 32

    /**
     * @type {String}
     */
    static MFT_CATEGORY_VIDEO_DECODER => "{d6c02d4b-6833-45b4-971a-05a4b04bab91}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_VIDEO_ENCODER => "{f79eac7d-e545-4387-bdee-d647d7bde42a}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_VIDEO_EFFECT => "{12e17c21-532c-4a6e-8a1c-40825a736397}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_MULTIPLEXER => "{059c561e-05ae-4b61-b69d-55b61ee54a7b}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_DEMULTIPLEXER => "{a8700a7a-939b-44c5-99d7-76226b23b3f1}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_AUDIO_DECODER => "{9ea73fb4-ef7a-4559-8d5d-719d8f0426c7}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_AUDIO_ENCODER => "{91c64bd0-f91e-4d8c-9276-db248279d975}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_AUDIO_EFFECT => "{11064c48-3648-4ed0-932e-05ce8ac811b7}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_VIDEO_PROCESSOR => "{302ea3fc-aa5f-47f9-9f7a-c2188bb16302}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_OTHER => "{90175d57-b7ea-4901-aeb3-933a8747756f}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_ENCRYPTOR => "{b0c687be-01cd-44b5-b8b2-7c1d7e058b1f}"

    /**
     * @type {String}
     */
    static MFT_CATEGORY_VIDEO_RENDERER_EFFECT => "{145cd8b4-92f4-4b23-8ae7-e0df06c2da95}"

    /**
     * @type {String}
     */
    static MFT_ENUM_VIDEO_RENDERER_EXTENSION_PROFILE => "{62c56928-9a4e-443b-b9dc-cac830c24100}"

    /**
     * @type {String}
     */
    static MFT_ENUM_ADAPTER_LUID => "{1d39518c-e220-4da8-a07f-ba172552d6b1}"

    /**
     * @type {String}
     */
    static MFT_SUPPORT_DYNAMIC_FORMAT_CHANGE => "{53476a11-3f13-49fb-ac42-ee2733c96741}"

    /**
     * @type {Integer (UInt32)}
     */
    static LOCAL_D3DFMT_DEFINES => 1

    /**
     * @type {String}
     */
    static MFVideoFormat_Base => "{00000000-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_RGB32 => "{00000016-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_ARGB32 => "{00000015-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_RGB24 => "{00000014-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_RGB555 => "{00000018-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_RGB565 => "{00000017-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_RGB8 => "{00000029-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_L8 => "{00000032-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_L16 => "{00000051-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_D16 => "{00000050-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_AI44 => "{34344941-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_AYUV => "{56555941-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_YUY2 => "{32595559-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_YVYU => "{55595659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_YVU9 => "{39555659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_UYVY => "{59565955-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_NV11 => "{3131564e-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_NV12 => "{3231564e-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_NV21 => "{3132564e-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_YV12 => "{32315659-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_I420 => "{30323449-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_IYUV => "{56555949-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Y210 => "{30313259-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Y216 => "{36313259-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Y410 => "{30313459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Y416 => "{36313459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Y41P => "{50313459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Y41T => "{54313459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Y42T => "{54323459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_P210 => "{30313250-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_P216 => "{36313250-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_P010 => "{30313050-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_P016 => "{36313050-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_v210 => "{30313276-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_v216 => "{36313276-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_v410 => "{30313476-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_MP43 => "{3334504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_MP4S => "{5334504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_M4S2 => "{3253344d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_MP4V => "{5634504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_WMV1 => "{31564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_WMV2 => "{32564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_WMV3 => "{33564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_WVC1 => "{31435657-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_MSS1 => "{3153534d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_MSS2 => "{3253534d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_MPG1 => "{3147504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_DVSL => "{6c737664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_DVSD => "{64737664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_DVHD => "{64687664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_DV25 => "{35327664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_DV50 => "{30357664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_DVH1 => "{31687664-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_H264 => "{34363248-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_H265 => "{35363248-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_MJPG => "{47504a4d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_420O => "{4f303234-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_HEVC => "{43564548-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_HEVC_ES => "{53564548-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_VP80 => "{30385056-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_VP90 => "{30395056-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_ORAW => "{5741524f-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_H263 => "{33363248-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_A2R10G10B10 => "{0000001f-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_A16B16G16R16F => "{00000071-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_VP10 => "{30315056-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_AV1 => "{31305641-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Theora => "{6f656874-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFVideoFormat_H264_ES => "{3f40f4f0-5622-4ff8-b6d8-a17a584bee5e}"

    /**
     * @type {String}
     */
    static MFVideoFormat_MPEG2 => "{e06d8026-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Base => "{00000000-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_PCM => "{00000001-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Float => "{00000003-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_DTS => "{00000008-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_AC3_SPDIF => "{00000092-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_DRM => "{00000009-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_WMAudioV8 => "{00000161-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_WMAudioV9 => "{00000162-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_WMAudio_Lossless => "{00000163-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_WMASPDIF => "{00000164-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_MSP1 => "{0000000a-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_MP3 => "{00000055-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_MPEG => "{00000050-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_AAC => "{00001610-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_ADTS => "{00001600-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_AMR_NB => "{00007361-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_AMR_WB => "{00007362-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_AMR_WP => "{00007363-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_FLAC => "{0000f1ac-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_ALAC => "{00006c61-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Opus => "{0000704f-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_AC4 => "{0000ac40-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_AC3 => "{e06d802c-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_DDPlus => "{a7fb87af-2d02-42fb-a4d4-05cd93843bdd}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_AC4_V1 => "{36b7927c-3d87-4a2a-9196-a21ad9e935e6}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_AC4_V2 => "{7998b2a0-17dd-49b6-8dfa-9b278552a2ac}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_AC4_V1_ES => "{9d8dccc6-d156-4fb8-979c-a85be7d21dfa}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_AC4_V2_ES => "{7e58c9f9-b070-45f4-8ccd-a99a0417c1ac}"

    /**
     * @type {String}
     */
    static MFAudioFormat_MPEGH => "{7c13c441-ebf8-4931-b678-800b19242236}"

    /**
     * @type {String}
     */
    static MFAudioFormat_MPEGH_ES => "{19ee97fe-1be0-4255-a876-e99f53a42ae3}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Vorbis => "{8d2fd10b-5841-4a6b-8905-588fec1aded9}"

    /**
     * @type {String}
     */
    static MFAudioFormat_DTS_RAW => "{e06d8033-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MFAudioFormat_DTS_HD => "{a2e58eb7-0fa9-48bb-a40c-fa0e156d0645}"

    /**
     * @type {String}
     */
    static MFAudioFormat_DTS_XLL => "{45b37c1b-8c70-4e59-a7be-a1e42c81c80d}"

    /**
     * @type {String}
     */
    static MFAudioFormat_DTS_LBR => "{c2fe6f0a-4e3c-4df1-9b60-50863091e4b9}"

    /**
     * @type {String}
     */
    static MFAudioFormat_DTS_UHD => "{87020117-ace3-42de-b73e-c656706263f8}"

    /**
     * @type {String}
     */
    static MFAudioFormat_DTS_UHDY => "{9b9cca00-91b9-4ccc-883a-8f787ac3cc86}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Float_SpatialObjects => "{fa39cd94-bc64-4ab1-9b71-dcd09d5a7e7a}"

    /**
     * @type {String}
     */
    static MFAudioFormat_LPCM => "{e06d8032-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MFAudioFormat_PCM_HDCP => "{a5e7ff01-8411-4acc-a865-5f4941288d80}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Dolby_AC3_HDCP => "{97663a80-8ffb-4445-a6ba-792d908f497f}"

    /**
     * @type {String}
     */
    static MFAudioFormat_AAC_HDCP => "{419bce76-8b72-400f-adeb-84b57d63484d}"

    /**
     * @type {String}
     */
    static MFAudioFormat_ADTS_HDCP => "{da4963a3-14d8-4dcf-92b7-193eb84363db}"

    /**
     * @type {String}
     */
    static MFAudioFormat_Base_HDCP => "{3884b5bc-e277-43fd-983d-038aa8d9b605}"

    /**
     * @type {String}
     */
    static MFVideoFormat_H264_HDCP => "{5d0ce9dd-9817-49da-bdfd-f5f5b98f18a6}"

    /**
     * @type {String}
     */
    static MFVideoFormat_HEVC_HDCP => "{3cfe0fe6-05c4-47dc-9d70-4bdb2959720f}"

    /**
     * @type {String}
     */
    static MFVideoFormat_Base_HDCP => "{eac3b9d5-bd14-4237-8f1f-bab428e49312}"

    /**
     * @type {String}
     */
    static MFMPEG4Format_Base => "{00000000-767a-494d-b478-f29d25dc9037}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_XML => "{2006f94f-29ca-4195-b8db-00ded8ff0c97}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_TTML => "{73e73992-9a10-4356-9557-7194e91e3e54}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_ATSC => "{7fa7faa3-feae-4e16-aedf-36b9acfbb099}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_WebVTT => "{c886d215-f485-40bb-8db6-fadbc619a45d}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_SRT => "{5e467f2e-77ca-4ca5-8391-d142ed4b76c8}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_SSA => "{57176a1b-1a9e-4eea-abef-c61760198ac4}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_CustomUserData => "{1bb3d849-6614-4d80-8882-ed24aa82da92}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_PGS => "{71f40e4a-1278-4442-b30d-39dd1d7722bc}"

    /**
     * @type {String}
     */
    static MFSubtitleFormat_VobSub => "{6b8e40f4-8d2c-4ced-ad91-5960e45b4433}"

    /**
     * @type {String}
     */
    static MF_MT_MAJOR_TYPE => "{48eba18e-f8c9-4687-bf11-0a74c9f96a8f}"

    /**
     * @type {String}
     */
    static MF_MT_SUBTYPE => "{f7e34c9a-42e8-4714-b74b-cb29d72c35e5}"

    /**
     * @type {String}
     */
    static MF_MT_ALL_SAMPLES_INDEPENDENT => "{c9173739-5e56-461c-b713-46fb995cb95f}"

    /**
     * @type {String}
     */
    static MF_MT_FIXED_SIZE_SAMPLES => "{b8ebefaf-b718-4e04-b0a9-116775e3321b}"

    /**
     * @type {String}
     */
    static MF_MT_COMPRESSED => "{3afd0cee-18f2-4ba5-a110-8bea502e1f92}"

    /**
     * @type {String}
     */
    static MF_MT_SAMPLE_SIZE => "{dad3ab78-1990-408b-bce2-eba673dacc10}"

    /**
     * @type {String}
     */
    static MF_MT_WRAPPED_TYPE => "{4d3f7b23-d02f-4e6c-9bee-e4bf2c6c695d}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_3D => "{cb5e88cf-7b5b-476b-85aa-1ca5ae187555}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_3D_FORMAT => "{5315d8a0-87c5-4697-b793-6606c67c049b}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_3D_NUM_VIEWS => "{bb077e8a-dcbf-42eb-af60-418df98aa495}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_3D_LEFT_IS_BASE => "{6d4b7bff-5629-4404-948c-c634f4ce26d4}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_3D_FIRST_IS_LEFT => "{ec298493-0ada-4ea1-a4fe-cbbd36ce9331}"

    /**
     * @type {String}
     */
    static MFSampleExtension_3DVideo => "{f86f97a4-dd54-4e2e-9a5e-55fc2d74a005}"

    /**
     * @type {String}
     */
    static MFSampleExtension_3DVideo_SampleFormat => "{08671772-e36f-4cff-97b3-d72e20987a48}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_ROTATION => "{c380465d-2271-428c-9b83-ecea3b4a85c1}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_MULTIPLEXED_MANAGER => "{6ea542b0-281f-4231-a464-fe2f5022501c}"

    /**
     * @type {String}
     */
    static MF_MEDIATYPE_MULTIPLEXED_MANAGER => "{13c78fb5-f275-4ea0-bb5f-0249832b0d6e}"

    /**
     * @type {String}
     */
    static MFSampleExtension_MULTIPLEXED_MANAGER => "{8dcdee79-6b5a-4c45-8db9-20b395f02fcf}"

    /**
     * @type {String}
     */
    static MF_MT_SECURE => "{c5acc4fd-0304-4ecf-809f-47bc97ff63bd}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_ATTRIBUTE_FRAMESOURCE_TYPES => "{17145fd1-1b2b-423c-8001-2b6833ed3588}"

    /**
     * @type {String}
     */
    static MF_MT_ALPHA_MODE => "{5d959b0d-4cbf-4d04-919f-3f5f7f284211}"

    /**
     * @type {String}
     */
    static MF_MT_DEPTH_MEASUREMENT => "{fd5ac489-0917-4bb6-9d54-3122bf70144b}"

    /**
     * @type {String}
     */
    static MF_MT_DEPTH_VALUE_UNIT => "{21a800f5-3189-4797-beba-f13cd9a31a5e}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_NO_FRAME_ORDERING => "{3f5b106f-6bc2-4ee3-b7ed-8902c18f5351}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_H264_NO_FMOASO => "{ed461cd6-ec9f-416a-a8a3-26d7d31018d7}"

    /**
     * @type {String}
     */
    static MFSampleExtension_ForwardedDecodeUnits => "{424c754c-97c8-48d6-8777-fc41f7b60879}"

    /**
     * @type {String}
     */
    static MFSampleExtension_TargetGlobalLuminance => "{3f60ef36-31ef-4daf-8360-940397e41ef3}"

    /**
     * @type {String}
     */
    static MFSampleExtension_ForwardedDecodeUnitType => "{089e57c7-47d3-4a26-bf9c-4b64fafb5d1e}"

    /**
     * @type {String}
     */
    static MF_MT_FORWARD_CUSTOM_NALU => "{ed336efd-244f-428d-9153-28f399458890}"

    /**
     * @type {String}
     */
    static MF_MT_FORWARD_CUSTOM_SEI => "{e27362f1-b136-41d1-9594-3a7e4febf2d1}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_RENDERER_EXTENSION_PROFILE => "{8437d4b9-d448-4fcd-9b6b-839bf96c7798}"

    /**
     * @type {String}
     */
    static MF_DECODER_FWD_CUSTOM_SEI_DECODE_ORDER => "{f13bbe3c-36d4-410a-b985-7a951a1e6294}"

    /**
     * @type {String}
     */
    static MF_VIDEO_RENDERER_EFFECT_APP_SERVICE_NAME => "{c6052a80-6d9c-40a3-9db8-f027a25c9ab9}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_NUM_CHANNELS => "{37e48bf5-645e-4c5b-89de-ada9e29b696a}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_SAMPLES_PER_SECOND => "{5faeeae7-0290-4c31-9e8a-c534f68d9dba}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_FLOAT_SAMPLES_PER_SECOND => "{fb3b724a-cfb5-4319-aefe-6e42b2406132}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_AVG_BYTES_PER_SECOND => "{1aab75c8-cfef-451c-ab95-ac034b8e1731}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_BLOCK_ALIGNMENT => "{322de230-9eeb-43bd-ab7a-ff412251541d}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_BITS_PER_SAMPLE => "{f2deb57f-40fa-4764-aa33-ed4f2d1ff669}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_VALID_BITS_PER_SAMPLE => "{d9bf8d6a-9530-4b7c-9ddf-ff6fd58bbd06}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_SAMPLES_PER_BLOCK => "{aab15aac-e13a-4995-9222-501ea15c6877}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_CHANNEL_MASK => "{55fb5765-644a-4caf-8479-938983bb1588}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_FOLDDOWN_MATRIX => "{9d62927c-36be-4cf2-b5c4-a3926e3e8711}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_WMADRC_PEAKREF => "{9d62927d-36be-4cf2-b5c4-a3926e3e8711}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_WMADRC_PEAKTARGET => "{9d62927e-36be-4cf2-b5c4-a3926e3e8711}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_WMADRC_AVGREF => "{9d62927f-36be-4cf2-b5c4-a3926e3e8711}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_WMADRC_AVGTARGET => "{9d629280-36be-4cf2-b5c4-a3926e3e8711}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_PREFER_WAVEFORMATEX => "{a901aaba-e037-458a-bdf6-545be2074042}"

    /**
     * @type {String}
     */
    static MF_MT_AAC_PAYLOAD_TYPE => "{bfbabe79-7434-4d1c-94f0-72a3b9e17188}"

    /**
     * @type {String}
     */
    static MF_MT_AAC_AUDIO_PROFILE_LEVEL_INDICATION => "{7632f0e6-9538-4d61-acda-ea29c8c14456}"

    /**
     * @type {String}
     */
    static MF_MT_AUDIO_FLAC_MAX_BLOCK_SIZE => "{8b81adae-4b5a-4d40-8022-f38d09ca3c5c}"

    /**
     * @type {String}
     */
    static MF_MT_SPATIAL_AUDIO_MAX_DYNAMIC_OBJECTS => "{dcfba24a-2609-4240-a721-3faea76a4df9}"

    /**
     * @type {String}
     */
    static MF_MT_SPATIAL_AUDIO_OBJECT_METADATA_FORMAT_ID => "{2ab71bc0-6223-4ba7-ad64-7b94b47ae792}"

    /**
     * @type {String}
     */
    static MF_MT_SPATIAL_AUDIO_OBJECT_METADATA_LENGTH => "{094ba8be-d723-489f-92fa-766777b34726}"

    /**
     * @type {String}
     */
    static MF_MT_SPATIAL_AUDIO_MAX_METADATA_ITEMS => "{11aa80b4-e0da-47c6-8060-96c1259ae50d}"

    /**
     * @type {String}
     */
    static MF_MT_SPATIAL_AUDIO_MIN_METADATA_ITEM_OFFSET_SPACING => "{83e96ec9-1184-417e-8254-9f269158fc06}"

    /**
     * @type {String}
     */
    static MF_MT_SPATIAL_AUDIO_DATA_PRESENT => "{6842f6e7-d43e-4ebb-9c9c-c96f41784863}"

    /**
     * @type {String}
     */
    static MF_MT_SPATIAL_AUDIO_IS_PREVIRTUALIZED => "{4eacab51-ffe5-421a-a2a7-8b7409a1cac4}"

    /**
     * @type {String}
     */
    static MF_MT_MPEGH_AUDIO_PROFILE_LEVEL_INDICATION => "{51267a39-dd0c-4bb9-a7bd-9173ad4b131c}"

    /**
     * @type {String}
     */
    static MF_MT_FRAME_SIZE => "{1652c33d-d6b2-4012-b834-72030849a37d}"

    /**
     * @type {String}
     */
    static MF_MT_FRAME_RATE => "{c459a2e8-3d2c-4e44-b132-fee5156c7bb0}"

    /**
     * @type {String}
     */
    static MF_MT_PIXEL_ASPECT_RATIO => "{c6376a1e-8d0a-4027-be45-6d9a0ad39bb6}"

    /**
     * @type {String}
     */
    static MF_MT_DRM_FLAGS => "{8772f323-355a-4cc7-bb78-6d61a048ae82}"

    /**
     * @type {String}
     */
    static MF_MT_TIMESTAMP_CAN_BE_DTS => "{24974215-1b7b-41e4-8625-ac469f2dedaa}"

    /**
     * @type {String}
     */
    static MF_MT_PAD_CONTROL_FLAGS => "{4d0e73e5-80ea-4354-a9d0-1176ceb028ea}"

    /**
     * @type {String}
     */
    static MF_MT_SOURCE_CONTENT_HINT => "{68aca3cc-22d0-44e6-85f8-28167197fa38}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_CHROMA_SITING => "{65df2370-c773-4c33-aa64-843e068efb0c}"

    /**
     * @type {String}
     */
    static MF_MT_INTERLACE_MODE => "{e2724bb8-e676-4806-b4b2-a8d6efb44ccd}"

    /**
     * @type {String}
     */
    static MF_MT_TRANSFER_FUNCTION => "{5fb0fce9-be5c-4935-a811-ec838f8eed93}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_PRIMARIES => "{dbfbe4d7-0740-4ee0-8192-850ab0e21935}"

    /**
     * @type {String}
     */
    static MF_MT_MAX_LUMINANCE_LEVEL => "{50253128-c110-4de4-98ae-46a324fae6da}"

    /**
     * @type {String}
     */
    static MF_MT_MAX_FRAME_AVERAGE_LUMINANCE_LEVEL => "{58d4bf57-6f52-4733-a195-a9e29ecf9e27}"

    /**
     * @type {String}
     */
    static MF_MT_MAX_MASTERING_LUMINANCE => "{d6c6b997-272f-4ca1-8d00-8042111a0ff6}"

    /**
     * @type {String}
     */
    static MF_MT_MIN_MASTERING_LUMINANCE => "{839a4460-4e7e-4b4f-ae79-cc08905c7b27}"

    /**
     * @type {String}
     */
    static MF_MT_DECODER_USE_MAX_RESOLUTION => "{4c547c24-af9a-4f38-96ad-978773cf53e7}"

    /**
     * @type {String}
     */
    static MF_MT_DECODER_MAX_DPB_COUNT => "{67be144c-88b7-4ca9-9628-c808d5262217}"

    /**
     * @type {String}
     */
    static MF_MT_CUSTOM_VIDEO_PRIMARIES => "{47537213-8cfb-4722-aa34-fbc9e24d77b8}"

    /**
     * @type {String}
     */
    static MF_MT_YUV_MATRIX => "{3e23d450-2c75-4d25-a00e-b91670d12327}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_LIGHTING => "{53a0529c-890b-4216-8bf9-599367ad6d20}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_NOMINAL_RANGE => "{c21b8ee5-b956-4071-8daf-325edf5cab11}"

    /**
     * @type {String}
     */
    static MF_MT_GEOMETRIC_APERTURE => "{66758743-7e5f-400d-980a-aa8596c85696}"

    /**
     * @type {String}
     */
    static MF_MT_MINIMUM_DISPLAY_APERTURE => "{d7388766-18fe-48c6-a177-ee894867c8c4}"

    /**
     * @type {String}
     */
    static MF_MT_PAN_SCAN_APERTURE => "{79614dde-9187-48fb-b8c7-4d52689de649}"

    /**
     * @type {String}
     */
    static MF_MT_PAN_SCAN_ENABLED => "{4b7f6bc3-8b13-40b2-a993-abf630b8204e}"

    /**
     * @type {String}
     */
    static MF_MT_AVG_BITRATE => "{20332624-fb0d-4d9e-bd0d-cbf6786c102e}"

    /**
     * @type {String}
     */
    static MF_MT_AVG_BIT_ERROR_RATE => "{799cabd6-3508-4db4-a3c7-569cd533deb1}"

    /**
     * @type {String}
     */
    static MF_MT_MAX_KEYFRAME_SPACING => "{c16eb52b-73a1-476f-8d62-839d6a020652}"

    /**
     * @type {String}
     */
    static MF_MT_USER_DATA => "{b6bc765f-4c3b-40a4-bd51-2535b66fe09d}"

    /**
     * @type {String}
     */
    static MF_MT_OUTPUT_BUFFER_NUM => "{a505d3ac-f930-436e-8ede-93a509ce23b2}"

    /**
     * @type {String}
     */
    static MF_MT_REALTIME_CONTENT => "{bb12d222-2bdb-425e-91ec-2308e189a58f}"

    /**
     * @type {String}
     */
    static MF_MT_DEFAULT_STRIDE => "{644b4e48-1e02-4516-b0eb-c01ca9d49ac6}"

    /**
     * @type {String}
     */
    static MF_MT_PALETTE => "{6d283f42-9846-4410-afd9-654d503b1a54}"

    /**
     * @type {String}
     */
    static MF_MT_AM_FORMAT_TYPE => "{73d1072d-1870-4174-a063-29ff4ff6c11e}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_PROFILE => "{ad76a80b-2d5c-4e0b-b375-64e520137036}"

    /**
     * @type {String}
     */
    static MF_MT_VIDEO_LEVEL => "{96f66574-11c5-4015-8666-bff516436da7}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG_START_TIME_CODE => "{91f67885-4333-4280-97cd-bd5a6c03a06e}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG2_PROFILE => "{ad76a80b-2d5c-4e0b-b375-64e520137036}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG2_LEVEL => "{96f66574-11c5-4015-8666-bff516436da7}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG2_FLAGS => "{31e3991d-f701-4b2f-b426-8ae3bda9e04b}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG_SEQUENCE_HEADER => "{3c036de7-3ad0-4c9e-9216-ee6d6ac21cb3}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG2_STANDARD => "{a20af9e8-928a-4b26-aaa9-f05c74cac47c}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG2_TIMECODE => "{5229ba10-e29d-4f80-a59c-df4f180207d2}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG2_CONTENT_PACKET => "{825d55e4-4f12-4197-9eb3-59b6e4710f06}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG2_ONE_FRAME_PER_PACKET => "{91a49eb5-1d20-4b42-ace8-804269bf95ed}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG2_HDCP => "{168f1b4a-3e91-450f-aea7-e4baeadae5ba}"

    /**
     * @type {String}
     */
    static MF_MT_H264_MAX_CODEC_CONFIG_DELAY => "{f5929986-4c45-4fbb-bb49-6cc534d05b9b}"

    /**
     * @type {String}
     */
    static MF_MT_H264_SUPPORTED_SLICE_MODES => "{c8be1937-4d64-4549-8343-a8086c0bfda5}"

    /**
     * @type {String}
     */
    static MF_MT_H264_SUPPORTED_SYNC_FRAME_TYPES => "{89a52c01-f282-48d2-b522-22e6ae633199}"

    /**
     * @type {String}
     */
    static MF_MT_H264_RESOLUTION_SCALING => "{e3854272-f715-4757-ba90-1b696c773457}"

    /**
     * @type {String}
     */
    static MF_MT_H264_SIMULCAST_SUPPORT => "{9ea2d63d-53f0-4a34-b94e-9de49a078cb3}"

    /**
     * @type {String}
     */
    static MF_MT_H264_SUPPORTED_RATE_CONTROL_MODES => "{6a8ac47e-519c-4f18-9bb3-7eeaaea5594d}"

    /**
     * @type {String}
     */
    static MF_MT_H264_MAX_MB_PER_SEC => "{45256d30-7215-4576-9336-b0f1bcd59bb2}"

    /**
     * @type {String}
     */
    static MF_MT_H264_SUPPORTED_USAGES => "{60b1a998-dc01-40ce-9736-aba845a2dbdc}"

    /**
     * @type {String}
     */
    static MF_MT_H264_CAPABILITIES => "{bb3bd508-490a-11e0-99e4-1316dfd72085}"

    /**
     * @type {String}
     */
    static MF_MT_H264_SVC_CAPABILITIES => "{f8993abe-d937-4a8f-bbca-6966fe9e1152}"

    /**
     * @type {String}
     */
    static MF_MT_H264_USAGE => "{359ce3a5-af00-49ca-a2f4-2ac94ca82b61}"

    /**
     * @type {String}
     */
    static MF_MT_H264_RATE_CONTROL_MODES => "{705177d8-45cb-11e0-ac7d-b91ce0d72085}"

    /**
     * @type {String}
     */
    static MF_MT_H264_LAYOUT_PER_STREAM => "{85e299b2-90e3-4fe8-b2f5-c067e0bfe57a}"

    /**
     * @type {String}
     */
    static MF_MT_IN_BAND_PARAMETER_SET => "{75da5090-910b-4a03-896c-7b898feea5af}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG4_TRACK_TYPE => "{54f486dd-9327-4f6d-80ab-6f709ebb4cce}"

    /**
     * @type {String}
     */
    static MF_MT_CONTAINER_RATE_SCALING => "{83877f5e-0444-4e28-8479-6db0989b8c09}"

    /**
     * @type {String}
     */
    static MF_MT_DV_AAUX_SRC_PACK_0 => "{84bd5d88-0fb8-4ac8-be4b-a8848bef98f3}"

    /**
     * @type {String}
     */
    static MF_MT_DV_AAUX_CTRL_PACK_0 => "{f731004e-1dd1-4515-aabe-f0c06aa536ac}"

    /**
     * @type {String}
     */
    static MF_MT_DV_AAUX_SRC_PACK_1 => "{720e6544-0225-4003-a651-0196563a958e}"

    /**
     * @type {String}
     */
    static MF_MT_DV_AAUX_CTRL_PACK_1 => "{cd1f470d-1f04-4fe0-bfb9-d07ae0386ad8}"

    /**
     * @type {String}
     */
    static MF_MT_DV_VAUX_SRC_PACK => "{41402d9d-7b57-43c6-b129-2cb997f15009}"

    /**
     * @type {String}
     */
    static MF_MT_DV_VAUX_CTRL_PACK => "{2f84e1c4-0da1-4788-938e-0dfbfbb34b48}"

    /**
     * @type {String}
     */
    static MF_MT_ARBITRARY_HEADER => "{9e6bd6f5-0109-4f95-84ac-9309153a19fc}"

    /**
     * @type {String}
     */
    static MF_MT_ARBITRARY_FORMAT => "{5a75b249-0d7d-49a1-a1c3-e0d87f0cade5}"

    /**
     * @type {String}
     */
    static MF_MT_IMAGE_LOSS_TOLERANT => "{ed062cf4-e34e-4922-be99-934032133d7c}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG4_SAMPLE_DESCRIPTION => "{261e9d83-9529-4b8f-a111-8b9c950a81a9}"

    /**
     * @type {String}
     */
    static MF_MT_MPEG4_CURRENT_SAMPLE_ENTRY => "{9aa7e155-b64a-4c1d-a500-455d600b6560}"

    /**
     * @type {String}
     */
    static MF_SD_AMBISONICS_SAMPLE3D_DESCRIPTION => "{f715cf3e-a964-4c3f-94ae-9d6ba7264641}"

    /**
     * @type {String}
     */
    static MF_MT_ORIGINAL_4CC => "{d7be3fe0-2bc7-492d-b843-61a1919b70c3}"

    /**
     * @type {String}
     */
    static MF_MT_ORIGINAL_WAVE_FORMAT_TAG => "{8cbbc843-9fd9-49c2-882f-a72586c408ad}"

    /**
     * @type {String}
     */
    static MF_MT_FRAME_RATE_RANGE_MIN => "{d2e7558c-dc1f-403f-9a72-d28bb1eb3b5e}"

    /**
     * @type {String}
     */
    static MF_MT_FRAME_RATE_RANGE_MAX => "{e3371d41-b4cf-4a05-bd4e-20b88bb2c4d6}"

    /**
     * @type {String}
     */
    static MF_LOW_LATENCY => "{9c27891a-ed7a-40e1-88e8-b22727a024ee}"

    /**
     * @type {String}
     */
    static MF_VIDEO_MAX_MB_PER_SEC => "{e3f2e203-d445-4b8c-9211-ae390d3ba017}"

    /**
     * @type {String}
     */
    static MF_DISABLE_FRAME_CORRUPTION_INFO => "{7086e16c-49c5-4201-882a-8538f38cf13a}"

    /**
     * @type {String}
     */
    static MFStreamExtension_CameraExtrinsics => "{686196d0-13e2-41d9-9638-ef032c272a52}"

    /**
     * @type {String}
     */
    static MFSampleExtension_CameraExtrinsics => "{6b761658-b7ec-4c3b-8225-8623cabec31d}"

    /**
     * @type {String}
     */
    static MFStreamExtension_PinholeCameraIntrinsics => "{dbac0455-0ec8-4aef-9c32-7a3ee3456f53}"

    /**
     * @type {String}
     */
    static MFSampleExtension_PinholeCameraIntrinsics => "{4ee3b6c5-6a15-4e72-9761-70c1db8b9fe3}"

    /**
     * @type {String}
     */
    static MFMediaType_Default => "{81a412e6-8103-4b06-857f-1862781024ac}"

    /**
     * @type {String}
     */
    static MFMediaType_Audio => "{73647561-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFMediaType_Video => "{73646976-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFMediaType_Protected => "{7b4b6fe6-9d04-4494-be14-7e0bd076c8e4}"

    /**
     * @type {String}
     */
    static MFMediaType_SAMI => "{e69669a0-3dcd-40cb-9e2e-3708387c0616}"

    /**
     * @type {String}
     */
    static MFMediaType_Script => "{72178c22-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFMediaType_Image => "{72178c23-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFMediaType_HTML => "{72178c24-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFMediaType_Binary => "{72178c25-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFMediaType_FileTransfer => "{72178c26-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFMediaType_Stream => "{e436eb83-524f-11ce-9f53-0020af0ba770}"

    /**
     * @type {String}
     */
    static MFMediaType_MultiplexedFrames => "{6ea542b0-281f-4231-a464-fe2f5022501c}"

    /**
     * @type {String}
     */
    static MFMediaType_Subtitle => "{a6d13581-ed50-4e65-ae08-26065576aacc}"

    /**
     * @type {String}
     */
    static MFMediaType_Perception => "{597ff6f9-6ea2-4670-85b4-ea84073fe940}"

    /**
     * @type {String}
     */
    static MFImageFormat_JPEG => "{19e4a5aa-5662-4fc5-a0c0-1758028e1057}"

    /**
     * @type {String}
     */
    static MFImageFormat_RGB32 => "{00000016-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MFStreamFormat_MPEG2Transport => "{e06d8023-db46-11cf-b4d1-00805f6cbbea}"

    /**
     * @type {String}
     */
    static MFStreamFormat_MPEG2Program => "{263067d1-d330-45dc-b669-34d986e4e3e1}"

    /**
     * @type {String}
     */
    static AM_MEDIA_TYPE_REPRESENTATION => "{e2e42ad2-132c-491e-a268-3c7c2dca181f}"

    /**
     * @type {String}
     */
    static FORMAT_MFVideoFormat => "{aed4ab2d-7326-43cb-9464-c879cab9c43d}"

    /**
     * @type {String}
     */
    static MFMediaType_Metadata => "{2c8fa20c-82bb-4782-90a0-98a2a5bd8ef8}"

    /**
     * @type {String}
     */
    static CLSID_MFSourceResolver => "{90eab60f-e43a-4188-bcc4-e47fdf04868c}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_ATTRIBUTE_FACEAUTH_CAPABILITY => "{cb6fd12a-2248-4e41-ad46-e78bb90ab9fc}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_ATTRIBUTE_SECURE_CAPABILITY => "{940fd626-ea6e-4684-9840-36bd6ec9fbef}"

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIASINK_FIXED_STREAMS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIASINK_CANNOT_MATCH_CLOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIASINK_RATELESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIASINK_CLOCK_REQUIRED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIASINK_CAN_PREROLL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIASINK_REQUIRE_REFERENCE_MEDIATYPE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MFCLOCK_FREQUENCY_HNS => 10000000

    /**
     * @type {Integer (UInt32)}
     */
    static MFCLOCK_TOLERANCE_UNKNOWN => 50000

    /**
     * @type {Integer (UInt32)}
     */
    static MFCLOCK_JITTER_ISR => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static MFCLOCK_JITTER_DPC => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static MFCLOCK_JITTER_PASSIVE => 10000

    /**
     * @type {Integer (UInt64)}
     */
    static PRESENTATION_CURRENT_POSITION => 9223372036854775807

    /**
     * @type {String}
     */
    static MF_PD_ADAPTIVE_STREAMING => "{ea0d5d97-29f9-488b-ae6b-7d6b4136112b}"

    /**
     * @type {String}
     */
    static MF_SD_SUPPORTS_PROTECTED_CODEC_SWITCH => "{8fb6b117-862e-4b31-8dab-5e0a434caef0}"

    /**
     * @type {Integer (UInt32)}
     */
    static MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS_CROSSPROCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS_NOPERSIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS_DONT_ALLOW_FORMAT_CHANGES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MFRR_INFO_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MF_USER_MODE_COMPONENT_LOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_KERNEL_MODE_COMPONENT_LOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MF_GRL_LOAD_FAILED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MF_INVALID_GRL_SIGNATURE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MF_GRL_ABSENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MF_COMPONENT_REVOKED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MF_COMPONENT_INVALID_EKU => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MF_COMPONENT_CERT_REVOKED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MF_COMPONENT_INVALID_ROOT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MF_COMPONENT_HS_CERT_REVOKED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MF_COMPONENT_LS_CERT_REVOKED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MF_BOOT_DRIVER_VERIFICATION_FAILED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MF_TEST_SIGNED_COMPONENT_LOADING => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MINCRYPT_FAILURE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SHA_HASH_LEN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MFSEQUENCER_INVALID_ELEMENT_ID => 4294967295

    /**
     * @type {String}
     */
    static MF_WRAPPED_BUFFER_SERVICE => "{ab544072-c269-4ebc-a552-1c3b32bed5ca}"

    /**
     * @type {String}
     */
    static CLSID_MPEG2ByteStreamPlugin => "{40871c59-ab40-471f-8dc3-1f259d862479}"

    /**
     * @type {Integer (UInt32)}
     */
    static MFCONTENTPROTECTIONDEVICE_FUNCTIONID_START => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static MFCONTENTPROTECTIONDEVICE_REALTIMECLIENT_DATA_FUNCTIONID => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static MF_UNKNOWN_DURATION => 0

    /**
     * @type {String}
     */
    static MFStreamExtension_ExtendedCameraIntrinsics => "{aa74b3df-9a2c-48d6-8393-5bd1c1a81e6e}"

    /**
     * @type {String}
     */
    static MFSampleExtension_ExtendedCameraIntrinsics => "{560bc4a5-4de0-4113-9cdc-832db9740f3d}"

    /**
     * @type {Integer (UInt64)}
     */
    static MF_INVALID_PRESENTATION_TIME => 9223372036854775808

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MEDIATYPE_EQUAL_MAJOR_TYPES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MEDIATYPE_EQUAL_FORMAT_TYPES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MEDIATYPE_EQUAL_FORMAT_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MEDIATYPE_EQUAL_FORMAT_USER_DATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_FAST_IO_PROCESSING_CALLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_SIGNAL_CALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_BLOCKING_CALLBACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_REPLY_CALLBACK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_LOCALIZE_REMOTE_CALLBACK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_STANDARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_RT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_IO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_TIMER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_MULTITHREADED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_LONG_FUNCTION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_PRIVATE_MASK => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static MFASYNC_CALLBACK_QUEUE_ALL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_IS_READABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_IS_WRITABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_IS_SEEKABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_IS_REMOTE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_IS_DIRECTORY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_HAS_SLOW_SEEK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_IS_PARTIALLY_DOWNLOADED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_SHARE_WRITE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_DOES_NOT_USE_NETWORK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MFBYTESTREAM_SEEK_FLAG_CANCEL_PENDING_IO => 1

    /**
     * @type {String}
     */
    static MF_MEDIA_SHARING_ENGINE_INITIAL_SEEK_TIME => "{6f3497f5-d528-4a4f-8dd7-db36657ec4c9}"

    /**
     * @type {String}
     */
    static MF_SHUTDOWN_RENDERER_ON_ENGINE_SHUTDOWN => "{c112d94d-6b9c-48f8-b6f9-7950ff9ab71e}"

    /**
     * @type {String}
     */
    static MF_PREFERRED_SOURCE_URI => "{5fc85488-436a-4db8-90af-4db402ae5c57}"

    /**
     * @type {String}
     */
    static MF_SHARING_ENGINE_SHAREDRENDERER => "{efa446a0-73e7-404e-8ae2-fef60af5a32b}"

    /**
     * @type {String}
     */
    static MF_SHARING_ENGINE_CALLBACK => "{57dc1e95-d252-43fa-9bbc-180070eefe6d}"

    /**
     * @type {Integer (UInt32)}
     */
    static MFT_STREAMS_UNLIMITED => 4294967295

    /**
     * @type {Integer (UInt64)}
     */
    static MFT_OUTPUT_BOUND_UPPER_UNBOUNDED => 9223372036854775807

    /**
     * @type {String}
     */
    static OPM_GET_CURRENT_HDCP_SRM_VERSION => "{99c5ceff-5f1d-4879-81c1-c52443c9482b}"

    /**
     * @type {String}
     */
    static OPM_GET_CONNECTED_HDCP_DEVICE_INFORMATION => "{0db59d74-a992-492e-a0bd-c23fda564e00}"

    /**
     * @type {String}
     */
    static OPM_GET_ACP_AND_CGMSA_SIGNALING => "{6629a591-3b79-4cf3-924a-11e8e7811671}"

    /**
     * @type {String}
     */
    static OPM_GET_CONNECTOR_TYPE => "{81d0bfd5-6afe-48c2-99c0-95a08f97c5da}"

    /**
     * @type {String}
     */
    static OPM_GET_SUPPORTED_PROTECTION_TYPES => "{38f2a801-9a6c-48bb-9107-b6696e6f1797}"

    /**
     * @type {String}
     */
    static OPM_GET_VIRTUAL_PROTECTION_LEVEL => "{b2075857-3eda-4d5d-88db-748f8c1a0549}"

    /**
     * @type {String}
     */
    static OPM_GET_ACTUAL_PROTECTION_LEVEL => "{1957210a-7766-452a-b99a-d27aed54f03a}"

    /**
     * @type {String}
     */
    static OPM_GET_ACTUAL_OUTPUT_FORMAT => "{d7bf1ba3-ad13-4f8e-af98-0dcb3ca204cc}"

    /**
     * @type {String}
     */
    static OPM_GET_ADAPTER_BUS_TYPE => "{c6f4d673-6174-4184-8e35-f6db5200bcba}"

    /**
     * @type {String}
     */
    static OPM_GET_OUTPUT_ID => "{72cb6df3-244f-40ce-b09e-20506af6302f}"

    /**
     * @type {String}
     */
    static OPM_GET_DVI_CHARACTERISTICS => "{a470b3bb-5dd7-4172-839c-3d3776e0ebf5}"

    /**
     * @type {String}
     */
    static OPM_GET_CODEC_INFO => "{4f374491-8f5f-4445-9dba-95588f6b58b4}"

    /**
     * @type {String}
     */
    static OPM_GET_OUTPUT_HARDWARE_PROTECTION_SUPPORT => "{3b129589-2af8-4ef0-96a2-704a845a218e}"

    /**
     * @type {String}
     */
    static OPM_SET_PROTECTION_LEVEL => "{9bb9327c-4eb5-4727-9f00-b42b0919c0da}"

    /**
     * @type {String}
     */
    static OPM_SET_ACP_AND_CGMSA_SIGNALING => "{09a631a5-d684-4c60-8e4d-d3bb0f0be3ee}"

    /**
     * @type {String}
     */
    static OPM_SET_HDCP_SRM => "{8b5ef5d1-c30d-44ff-84a5-ea71dce78f13}"

    /**
     * @type {String}
     */
    static OPM_SET_PROTECTION_LEVEL_ACCORDING_TO_CSS_DVD => "{39ce333e-4cc0-44ae-bfcc-da50b5f82e72}"

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CODEC_ONEPASS_CBR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CODEC_ONEPASS_VBR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CODEC_TWOPASS_CBR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CODEC_TWOPASS_VBR_UNCONSTRAINED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WM_CODEC_TWOPASS_VBR_PEAKCONSTRAINED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYSFXUI_DONOTSHOW_LOUDNESSEQUALIZATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYSFXUI_DONOTSHOW_ROOMCORRECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYSFXUI_DONOTSHOW_BASSMANAGEMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYSFXUI_DONOTSHOW_BASSBOOST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYSFXUI_DONOTSHOW_HEADPHONEVIRTUALIZATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYSFXUI_DONOTSHOW_VIRTUALSURROUND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SYSFXUI_DONOTSHOW_SPEAKERFILLING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SYSFXUI_DONOTSHOW_CHANNELPHANTOMING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static AEC_MAX_SYSTEM_MODES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WMAAECMA_E_NO_ACTIVE_RENDER_STREAM => 2278293514

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Y41T => "{54313459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_Y42T => "{54323459-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_V216 => "{36313256-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_V410 => "{30313456-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_v210 => "{30313276-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_I420 => "{30323449-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WVC1 => "{31435657-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMVA => "{41564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMVB => "{42564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMVR => "{52564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMVP => "{50564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WVP2 => "{32505657-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMV3 => "{33564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMV2 => "{32564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMV1 => "{31564d57-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPG4 => "{3447504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MP42 => "{3234504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MP43 => "{3334504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MP4S => "{5334504d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_M4S2 => "{3253344d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MSS1 => "{3153534d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MSS2 => "{3253534d-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MSAUDIO1 => "{00000160-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMAUDIO2 => "{00000161-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMAUDIO3 => "{00000162-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMAUDIO_LOSSLESS => "{00000163-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMASPDIF => "{00000164-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_WMAUDIO4 => "{00000168-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG_ADTS_AAC => "{00001600-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG_RAW_AAC => "{00001601-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG_LOAS => "{00001602-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_NOKIA_MPEG_ADTS_AAC => "{00001608-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_NOKIA_MPEG_RAW_AAC => "{00001609-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_VODAFONE_MPEG_ADTS_AAC => "{0000160a-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_VODAFONE_MPEG_RAW_AAC => "{0000160b-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_MPEG_HEAAC => "{00001610-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_RAW_AAC1 => "{000000ff-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DVM => "{00002000-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DTS2 => "{00002001-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DOLBY_DDPLUS => "{a7fb87af-2d02-42fb-a4d4-05cd93843bdd}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DOLBY_TRUEHD => "{eb27cec4-163e-4ca3-8b74-8e25f91b517e}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DTS_HD => "{a2e58eb7-0fa9-48bb-a40c-fa0e156d0645}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_DTS_HD_HRA => "{a61ac364-ad0e-4744-89ff-213ce0df8804}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_AVC1 => "{31435641-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MEDIASUBTYPE_X264 => "{34363258-0000-0010-8000-00aa00389b71}"

    /**
     * @type {String}
     */
    static MF_VIDEODSP_MODE => "{16d720f0-768c-11de-8a39-0800200c9a66}"

    /**
     * @type {String}
     */
    static MFSampleExtension_VideoDSPMode => "{c12d55cb-d7d9-476d-81f3-69117f163ea0}"

    /**
     * @type {String}
     */
    static CLSID_CTocEntry => "{f22f5e05-585c-4def-8523-6555cfbc0cb3}"

    /**
     * @type {String}
     */
    static CLSID_CTocEntryList => "{3a8cccbc-0efd-43a3-b838-f38a552ba237}"

    /**
     * @type {String}
     */
    static CLSID_CToc => "{4fe24495-28ce-4920-a4c4-e556e1f0df2a}"

    /**
     * @type {String}
     */
    static CLSID_CTocCollection => "{5058292d-a244-4840-ab44-480975c4ffe4}"

    /**
     * @type {String}
     */
    static CLSID_CTocParser => "{499eaeea-2737-4849-8bb6-47f107eaf358}"

    /**
     * @type {String}
     */
    static CLSID_CAsfTocParser => "{9b77c0f2-8735-46c5-b90f-5f0b303ef6ab}"

    /**
     * @type {String}
     */
    static CLSID_CAviTocParser => "{3adce5cc-13c8-4573-b328-ed438eb694f9}"

    /**
     * @type {String}
     */
    static CLSID_CFileIo => "{11993195-1244-4840-ab44-480975c4ffe4}"

    /**
     * @type {String}
     */
    static CLSID_CFileClient => "{bfccd195-1244-4840-ab44-480975c4ffe4}"

    /**
     * @type {String}
     */
    static CLSID_CClusterDetectorEx => "{47354492-827e-4b8a-b318-c80eba1381f0}"

    /**
     * @type {Integer (Int32)}
     */
    static E_TOCPARSER_INVALIDASFFILE => -1728053247

    /**
     * @type {Integer (Int32)}
     */
    static E_TOCPARSER_INVALIDRIFFFILE => -1728053246

    /**
     * @type {Integer (UInt32)}
     */
    static TOC_MAX_DESCRIPTION_SIZE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static TOC_ENTRY_MAX_TITLE_SIZE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MFASFINDEXER_PER_ENTRY_BYTES_DYNAMIC => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MFASFINDEXER_NO_FIXED_INTERVAL => 4294967295

    /**
     * @type {Integer (UInt64)}
     */
    static MFASFINDEXER_READ_FOR_REVERSEPLAYBACK_OUTOFDATASEGMENT => 18446744073709551615

    /**
     * @type {Integer (UInt64)}
     */
    static MFASFINDEXER_APPROX_SEEK_TIME_UNKNOWN => 18446744073709551615

    /**
     * @type {Integer (UInt32)}
     */
    static MFASF_MAX_STREAM_NUMBER => 127

    /**
     * @type {Integer (UInt32)}
     */
    static MFASF_INVALID_STREAM_NUMBER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MFASF_PAYLOADEXTENSION_MAX_SIZE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MFASF_PAYLOADEXTENSION_VARIABLE_SIZE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MFASF_DEFAULT_BUFFER_WINDOW_MS => 3000

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_MF => 13

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_MF_WIN32 => 7

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PLATFORM_NOT_INITIALIZED => -1072875856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_BUFFERTOOSMALL => -1072875855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALIDREQUEST => -1072875854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALIDSTREAMNUMBER => -1072875853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALIDMEDIATYPE => -1072875852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NOTACCEPTING => -1072875851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NOT_INITIALIZED => -1072875850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_REPRESENTATION => -1072875849

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_MORE_TYPES => -1072875847

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_SERVICE => -1072875846

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNEXPECTED => -1072875845

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALIDNAME => -1072875844

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALIDTYPE => -1072875843

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_FILE_FORMAT => -1072875842

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALIDINDEX => -1072875841

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_TIMESTAMP => -1072875840

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_SCHEME => -1072875837

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_BYTESTREAM_TYPE => -1072875836

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_TIME_FORMAT => -1072875835

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_SAMPLE_TIMESTAMP => -1072875832

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_SAMPLE_DURATION => -1072875831

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_STREAM_DATA => -1072875829

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_RT_UNAVAILABLE => -1072875825

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_RATE => -1072875824

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_THINNING_UNSUPPORTED => -1072875823

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_REVERSE_UNSUPPORTED => -1072875822

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_RATE_TRANSITION => -1072875821

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_RATE_CHANGE_PREEMPTED => -1072875820

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NOT_FOUND => -1072875819

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NOT_AVAILABLE => -1072875818

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_CLOCK => -1072875817

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_MULTIPLE_BEGIN => 866008

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MULTIPLE_BEGIN => -1072875815

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MULTIPLE_SUBSCRIBERS => -1072875814

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TIMER_ORPHANED => -1072875813

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_STATE_TRANSITION_PENDING => -1072875812

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_STATE_TRANSITION => -1072875811

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNRECOVERABLE_ERROR_OCCURRED => -1072875810

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SAMPLE_HAS_TOO_MANY_BUFFERS => -1072875809

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SAMPLE_NOT_WRITABLE => -1072875808

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_KEY => -1072875806

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_BAD_STARTUP_VERSION => -1072875805

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_CAPTION => -1072875804

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_POSITION => -1072875803

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ATTRIBUTENOTFOUND => -1072875802

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_TYPE_NOT_ALLOWED => -1072875801

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_TYPE_NOT_SUPPORTED => -1072875800

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_EMPTY => -1072875799

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_NOT_EMPTY => -1072875798

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_VECTOR_NOT_ALLOWED => -1072875797

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_VECTOR_REQUIRED => -1072875796

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_OPERATION_CANCELLED => -1072875795

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_BYTESTREAM_NOT_SEEKABLE => -1072875794

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DISABLED_IN_SAFEMODE => -1072875793

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CANNOT_PARSE_BYTESTREAM => -1072875792

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SOURCERESOLVER_MUTUALLY_EXCLUSIVE_FLAGS => -1072875791

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIAPROC_WRONGSTATE => -1072875790

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_RT_THROUGHPUT_NOT_AVAILABLE => -1072875789

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_RT_TOO_MANY_CLASSES => -1072875788

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_RT_WOULDBLOCK => -1072875787

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_BITPUMP => -1072875786

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_RT_OUTOFMEMORY => -1072875785

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_RT_WORKQUEUE_CLASS_NOT_SPECIFIED => -1072875784

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INSUFFICIENT_BUFFER => -1072860816

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CANNOT_CREATE_SINK => -1072875782

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_BYTESTREAM_UNKNOWN_LENGTH => -1072875781

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SESSION_PAUSEWHILESTOPPED => -1072875780

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_ACTIVATE_REPLACED => 866045

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_FORMAT_CHANGE_NOT_SUPPORTED => -1072875778

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_WORKQUEUE => -1072875777

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DRM_UNSUPPORTED => -1072875776

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNAUTHORIZED => -1072875775

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_OUT_OF_RANGE => -1072875774

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_CODEC_MERIT => -1072875773

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_HW_MFT_FAILED_START_STREAMING => -1072875772

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_OPERATION_IN_PROGRESS => -1072875771

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_HARDWARE_DRM_UNSUPPORTED => -1072875770

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DURATION_TOO_LONG => -1072875769

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_OPERATION_UNSUPPORTED_AT_D3D_FEATURE_LEVEL => -1072875768

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_MEDIATYPE_AT_D3D_FEATURE_LEVEL => -1072875767

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_ASF_PARSEINPROGRESS => 1074608792

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_PARSINGINCOMPLETE => -1072874856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_MISSINGDATA => -1072874855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_INVALIDDATA => -1072874854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_OPAQUEPACKET => -1072874853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_NOINDEX => -1072874852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_OUTOFRANGE => -1072874851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_INDEXNOTLOADED => -1072874850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_TOO_MANY_PAYLOADS => -1072874849

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_UNSUPPORTED_STREAM_TYPE => -1072874848

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_DROPPED_PACKET => -1072874847

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_EVENTS_AVAILABLE => -1072873856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_STATE_TRANSITION => -1072873854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_END_OF_STREAM => -1072873852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SHUTDOWN => -1072873851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MP3_NOTFOUND => -1072873850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MP3_OUTOFDATA => -1072873849

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MP3_NOTMP3 => -1072873848

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MP3_NOTSUPPORTED => -1072873847

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_DURATION => -1072873846

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_FORMAT => -1072873844

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_NOT_FOUND => -1072873843

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_READ_ONLY => -1072873842

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROPERTY_NOT_ALLOWED => -1072873841

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIA_SOURCE_NOT_STARTED => -1072873839

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_FORMAT => -1072873832

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MP3_BAD_CRC => -1072873831

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NOT_PROTECTED => -1072873830

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIA_SOURCE_WRONGSTATE => -1072873829

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIA_SOURCE_NO_STREAMS_SELECTED => -1072873828

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CANNOT_FIND_KEYFRAME_SAMPLE => -1072873827

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_CHARACTERISTICS => -1072873826

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_AUDIO_RECORDING_DEVICE => -1072873825

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_AUDIO_RECORDING_DEVICE_IN_USE => -1072873824

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_AUDIO_RECORDING_DEVICE_INVALIDATED => -1072873823

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_VIDEO_RECORDING_DEVICE_INVALIDATED => -1072873822

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_VIDEO_RECORDING_DEVICE_PREEMPTED => -1072873821

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NETWORK_RESOURCE_FAILURE => -1072872856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_WRITE => -1072872855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_READ => -1072872854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_REQUIRE_NETWORK => -1072872853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_REQUIRE_ASYNC => -1072872852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_BWLEVEL_NOT_SUPPORTED => -1072872851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_STREAMGROUPS_NOT_SUPPORTED => -1072872850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_MANUALSS_NOT_SUPPORTED => -1072872849

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_INVALID_PRESENTATION_DESCRIPTOR => -1072872848

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_CACHESTREAM_NOT_FOUND => -1072872847

    /**
     * @type {Integer (Int32)}
     */
    static MF_I_MANUAL_PROXY => 1074610802

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_REQUIRE_INPUT => -1072872844

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_REDIRECT => -1072872843

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_REDIRECT_TO_PROXY => -1072872842

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_TOO_MANY_REDIRECTS => -1072872841

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_TIMEOUT => -1072872840

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_CLIENT_CLOSE => -1072872839

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_BAD_CONTROL_DATA => -1072872838

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_INCOMPATIBLE_SERVER => -1072872837

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_UNSAFE_URL => -1072872836

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_CACHE_NO_DATA => -1072872835

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_EOL => -1072872834

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_BAD_REQUEST => -1072872833

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_INTERNAL_SERVER_ERROR => -1072872832

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_SESSION_NOT_FOUND => -1072872831

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_NOCONNECTION => -1072872830

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_CONNECTION_FAILURE => -1072872829

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_INCOMPATIBLE_PUSHSERVER => -1072872828

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_SERVER_ACCESSDENIED => -1072872827

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_PROXY_ACCESSDENIED => -1072872826

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_CANNOTCONNECT => -1072872825

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_INVALID_PUSH_TEMPLATE => -1072872824

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_INVALID_PUSH_PUBLISHING_POINT => -1072872823

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_BUSY => -1072872822

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_RESOURCE_GONE => -1072872821

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_ERROR_FROM_PROXY => -1072872820

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_PROXY_TIMEOUT => -1072872819

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_SERVER_UNAVAILABLE => -1072872818

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_TOO_MUCH_DATA => -1072872817

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_SESSION_INVALID => -1072872816

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_OFFLINE_MODE => -1072872815

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_UDP_BLOCKED => -1072872814

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_UNSUPPORTED_CONFIGURATION => -1072872813

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_PROTOCOL_DISABLED => -1072872812

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NET_COMPANION_DRIVER_DISCONNECT => -1072872811

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ALREADY_INITIALIZED => -1072871856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_BANDWIDTH_OVERRUN => -1072871855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_LATE_SAMPLE => -1072871854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_FLUSH_NEEDED => -1072871853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_PROFILE => -1072871852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INDEX_NOT_COMMITTED => -1072871851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_INDEX => -1072871850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CANNOT_INDEX_IN_PLACE => -1072871849

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MISSING_ASF_LEAKYBUCKET => -1072871848

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_ASF_STREAMID => -1072871847

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_STREAMSINK_REMOVED => -1072870856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_STREAMSINKS_OUT_OF_SYNC => -1072870854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_STREAMSINKS_FIXED => -1072870853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_STREAMSINK_EXISTS => -1072870852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SAMPLEALLOCATOR_CANCELED => -1072870851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SAMPLEALLOCATOR_EMPTY => -1072870850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SINK_ALREADYSTOPPED => -1072870849

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ASF_FILESINK_BITRATE_UNKNOWN => -1072870848

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SINK_NO_STREAMS => -1072870847

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_SINK_NOT_FINALIZED => 870978

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_METADATA_TOO_LONG => -1072870845

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SINK_NO_SAMPLES_PROCESSED => -1072870844

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SINK_HEADERS_NOT_FOUND => -1072870843

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_VIDEO_REN_NO_PROCAMP_HW => -1072869856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_VIDEO_REN_NO_DEINTERLACE_HW => -1072869855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_VIDEO_REN_COPYPROT_FAILED => -1072869854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_VIDEO_REN_SURFACE_NOT_SHARED => -1072869853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_VIDEO_DEVICE_LOCKED => -1072869852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NEW_VIDEO_DEVICE => -1072869851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_VIDEO_SAMPLE_AVAILABLE => -1072869850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_AUDIO_PLAYBACK_DEVICE => -1072869756

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_AUDIO_PLAYBACK_DEVICE_IN_USE => -1072869755

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_AUDIO_PLAYBACK_DEVICE_INVALIDATED => -1072869754

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_AUDIO_SERVICE_NOT_RUNNING => -1072869753

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_AUDIO_BUFFER_SIZE_ERROR => -1072869752

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_AUDIO_CLIENT_WRAPPER_SPOOF_ERROR => -1072869751

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_INVALID_OPTIONAL_NODE => -1072868850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_CANNOT_FIND_DECRYPTOR => -1072868847

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_CODEC_NOT_FOUND => -1072868846

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_CANNOT_CONNECT => -1072868845

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_UNSUPPORTED => -1072868844

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_INVALID_TIME_ATTRIBUTES => -1072868843

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_LOOPS_IN_TOPOLOGY => -1072868842

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_MISSING_PRESENTATION_DESCRIPTOR => -1072868841

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_MISSING_STREAM_DESCRIPTOR => -1072868840

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_STREAM_DESCRIPTOR_NOT_SELECTED => -1072868839

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_MISSING_SOURCE => -1072868838

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPO_SINK_ACTIVATES_UNSUPPORTED => -1072868837

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SEQUENCER_UNKNOWN_SEGMENT_ID => -1072864852

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_SEQUENCER_CONTEXT_CANCELED => 876973

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_SOURCE_IN_CACHE => -1072864850

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_SEQUENCER_SEGMENT_AT_END_OF_STREAM => 876975

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_TYPE_NOT_SET => -1072861856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_STREAM_CHANGE => -1072861855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_INPUT_REMAINING => -1072861854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROFILE_MISSING => -1072861853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROFILE_INVALID_OR_CORRUPT => -1072861852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROFILE_TRUNCATED => -1072861851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROPERTY_PID_NOT_RECOGNIZED => -1072861850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROPERTY_VARIANT_TYPE_WRONG => -1072861849

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROPERTY_NOT_WRITEABLE => -1072861848

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROPERTY_ARRAY_VALUE_WRONG_NUM_DIM => -1072861847

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROPERTY_VALUE_SIZE_WRONG => -1072861846

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROPERTY_VALUE_OUT_OF_RANGE => -1072861845

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_PROPERTY_VALUE_INCOMPATIBLE => -1072861844

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_OUTPUT_MEDIATYPE => -1072861843

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_INPUT_MEDIATYPE => -1072861842

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_MEDIATYPE_COMBINATION => -1072861841

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_CONFLICTS_WITH_OTHER_CURRENTLY_ENABLED_FEATURES => -1072861840

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_NEED_MORE_INPUT => -1072861838

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_NOT_POSSIBLE_FOR_CURRENT_SPKR_CONFIG => -1072861837

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_CANNOT_CHANGE_MEDIATYPE_WHILE_PROCESSING => -1072861836

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_TRANSFORM_DO_NOT_PROPAGATE_EVENT => 879989

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_D3D_TYPE => -1072861834

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_ASYNC_LOCKED => -1072861833

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_CANNOT_INITIALIZE_ACM_DRIVER => -1072861832

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_STREAM_INVALID_RESOLUTION => -1072861831

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_ASYNC_MFT_NOT_SUPPORTED => -1072861830

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSFORM_EXATTRIBUTE_NOT_SUPPORTED => -1072861828

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_LICENSE_INCORRECT_RIGHTS => -1072860856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_LICENSE_OUTOFDATE => -1072860855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_LICENSE_REQUIRED => -1072860854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DRM_HARDWARE_INCONSISTENT => -1072860853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_CONTENT_PROTECTION_MANAGER => -1072860852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_LICENSE_RESTORE_NO_RIGHTS => -1072860851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_BACKUP_RESTRICTED_LICENSE => -1072860850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_LICENSE_RESTORE_NEEDS_INDIVIDUALIZATION => -1072860849

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_PROTECTION_NOT_REQUIRED => 880976

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_COMPONENT_REVOKED => -1072860847

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRUST_DISABLED => -1072860846

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_WMDRMOTA_NO_ACTION => -1072860845

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_WMDRMOTA_ACTION_ALREADY_SET => -1072860844

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_WMDRMOTA_DRM_HEADER_NOT_AVAILABLE => -1072860843

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_WMDRMOTA_DRM_ENCRYPTION_SCHEME_NOT_SUPPORTED => -1072860842

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_WMDRMOTA_ACTION_MISMATCH => -1072860841

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_WMDRMOTA_INVALID_POLICY => -1072860840

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_POLICY_UNSUPPORTED => -1072860839

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_OPL_NOT_SUPPORTED => -1072860838

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TOPOLOGY_VERIFICATION_FAILED => -1072860837

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_SIGNATURE_VERIFICATION_FAILED => -1072860836

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DEBUGGING_NOT_ALLOWED => -1072860835

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CODE_EXPIRED => -1072860834

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_GRL_VERSION_TOO_LOW => -1072860833

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_GRL_RENEWAL_NOT_FOUND => -1072860832

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_GRL_EXTENSIBLE_ENTRY_NOT_FOUND => -1072860831

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_KERNEL_UNTRUSTED => -1072860830

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PEAUTH_UNTRUSTED => -1072860829

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NON_PE_PROCESS => -1072860827

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_REBOOT_REQUIRED => -1072860825

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_WAIT_FOR_POLICY_SET => 881000

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_VIDEO_DISABLED_WITH_UNKNOWN_SOFTWARE_OUTPUT => 881001

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_GRL_INVALID_FORMAT => -1072860822

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_GRL_UNRECOGNIZED_FORMAT => -1072860821

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ALL_PROCESS_RESTART_REQUIRED => -1072860820

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PROCESS_RESTART_REQUIRED => -1072860819

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_USERMODE_UNTRUSTED => -1072860818

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PEAUTH_SESSION_NOT_STARTED => -1072860817

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PEAUTH_PUBLICKEY_REVOKED => -1072860815

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_GRL_ABSENT => -1072860814

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_PE_TRUSTED => 881011

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PE_UNTRUSTED => -1072860812

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PEAUTH_NOT_STARTED => -1072860811

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INCOMPATIBLE_SAMPLE_PROTECTION => -1072860810

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_PE_SESSIONS_MAXED => -1072860809

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_HIGH_SECURITY_LEVEL_CONTENT_NOT_ALLOWED => -1072860808

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TEST_SIGNED_COMPONENTS_NOT_ALLOWED => -1072860807

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ITA_UNSUPPORTED_ACTION => -1072860806

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ITA_ERROR_PARSING_SAP_PARAMETERS => -1072860805

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_POLICY_MGR_ACTION_OUTOFBOUNDS => -1072860804

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_BAD_OPL_STRUCTURE_FORMAT => -1072860803

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_PROTECTION_GUID => -1072860802

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_PMP_HOST => -1072860801

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ITA_OPL_DATA_NOT_INITIALIZED => -1072860800

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ITA_UNRECOGNIZED_ANALOG_VIDEO_OUTPUT => -1072860799

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ITA_UNRECOGNIZED_DIGITAL_VIDEO_OUTPUT => -1072860798

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_RESOLUTION_REQUIRES_PMP_CREATION_CALLBACK => -1072860797

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_AKE_CHANNEL_PARAMETERS => -1072860796

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CONTENT_PROTECTION_SYSTEM_NOT_ENABLED => -1072860795

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_CONTENT_PROTECTION_SYSTEM => -1072860794

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DRM_MIGRATION_NOT_SUPPORTED => -1072860793

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_HDCP_AUTHENTICATION_FAILURE => -1072860792

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_HDCP_LINK_FAILURE => -1072860791

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CLOCK_INVALID_CONTINUITY_KEY => -1072849856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CLOCK_NO_TIME_SOURCE => -1072849855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CLOCK_STATE_ALREADY_SET => -1072849854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CLOCK_NOT_SIMPLE => -1072849853

    /**
     * @type {Integer (Int32)}
     */
    static MF_S_CLOCK_STOPPED => 891972

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CLOCK_AUDIO_DEVICE_POSITION_UNEXPECTED => 891973

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CLOCK_AUDIO_RENDER_POSITION_UNEXPECTED => 891974

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CLOCK_AUDIO_RENDER_TIME_UNEXPECTED => 891975

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_MORE_DROP_MODES => -1072848856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_MORE_QUALITY_LEVELS => -1072848855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_DROPTIME_NOT_SUPPORTED => -1072848854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_QUALITYKNOB_WAIT_LONGER => -1072848853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_QM_INVALIDSTATE => -1072848852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSCODE_NO_CONTAINERTYPE => -1072847856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSCODE_PROFILE_NO_MATCHING_STREAMS => -1072847855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSCODE_NO_MATCHING_ENCODER => -1072847854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TRANSCODE_INVALID_PROFILE => -1072847853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ALLOCATOR_NOT_INITIALIZED => -1072846856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ALLOCATOR_NOT_COMMITED => -1072846855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_ALLOCATOR_ALREADY_COMMITED => -1072846854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_STREAM_ERROR => -1072846853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_INVALID_STREAM_STATE => -1072846852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_HW_STREAM_NOT_CONNECTED => -1072846851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_NO_CAPTURE_DEVICES_AVAILABLE => -1072845856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_SINK_OUTPUT_NOT_SET => -1072845855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_SINK_MIRROR_ERROR => -1072845854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_SINK_ROTATE_ERROR => -1072845853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_ENGINE_INVALID_OP => -1072845852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_ENGINE_ALL_EFFECTS_REMOVED => -1072845851

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_SOURCE_NO_INDEPENDENT_PHOTO_STREAM_PRESENT => -1072845850

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_SOURCE_NO_VIDEO_STREAM_PRESENT => -1072845849

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_SOURCE_NO_AUDIO_STREAM_PRESENT => -1072845848

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_SOURCE_DEVICE_EXTENDEDPROP_OP_IN_PROGRESS => -1072845847

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_PROPERTY_SET_DURING_PHOTO => -1072845846

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAPTURE_NO_SAMPLES_IN_QUEUE => -1072845845

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_HW_ACCELERATED_THUMBNAIL_NOT_SUPPORTED => -1072845844

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_UNSUPPORTED_CAPTURE_DEVICE_PRESENT => -1072845843

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TIMELINECONTROLLER_UNSUPPORTED_SOURCE_TYPE => -1072844856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TIMELINECONTROLLER_NOT_ALLOWED => -1072844855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_TIMELINECONTROLLER_CANNOT_ATTACH => -1072844854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIA_EXTENSION_APPSERVICE_CONNECTION_FAILED => -1072843856

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIA_EXTENSION_APPSERVICE_REQUEST_FAILED => -1072843855

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIA_EXTENSION_PACKAGE_INTEGRITY_CHECK_FAILED => -1072843854

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIA_EXTENSION_PACKAGE_LICENSE_INVALID => -1072843853

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_MEDIA_EXTENSION_PACKAGE_BAD_STATUS => -1072843852

    /**
     * @type {Integer (Int32)}
     */
    static MF_E_CAMERA_PRIVACY_NOT_ALLOWED => -1072842856

    /**
     * @type {Integer (UInt32)}
     */
    static MF_INDEX_SIZE_ERR => 2154823681

    /**
     * @type {Integer (UInt32)}
     */
    static MF_NOT_FOUND_ERR => 2154823688

    /**
     * @type {Integer (UInt32)}
     */
    static MF_NOT_SUPPORTED_ERR => 2154823689

    /**
     * @type {Integer (UInt32)}
     */
    static MF_INVALID_STATE_ERR => 2154823691

    /**
     * @type {Integer (UInt32)}
     */
    static MF_SYNTAX_ERR => 2154823692

    /**
     * @type {Integer (UInt32)}
     */
    static MF_INVALID_ACCESS_ERR => 2154823695

    /**
     * @type {Integer (UInt32)}
     */
    static MF_QUOTA_EXCEEDED_ERR => 2154823702

    /**
     * @type {Integer (UInt32)}
     */
    static MF_PARSE_ERR => 2154823761

    /**
     * @type {Integer (UInt32)}
     */
    static MF_TYPE_ERR => 2154840069

    /**
     * @type {String}
     */
    static g_wszSpeechFormatCaps => "SpeechFormatCap"

    /**
     * @type {String}
     */
    static g_wszWMCPCodecName => "_CODECNAME"

    /**
     * @type {String}
     */
    static g_wszWMCPSupportedVBRModes => "_SUPPORTEDVBRMODES"

    /**
     * @type {String}
     */
    static g_wszWMCPAudioVBRSupported => "_VBRENABLED"

    /**
     * @type {String}
     */
    static g_wszWMCPAudioVBRQuality => "_VBRQUALITY"

    /**
     * @type {String}
     */
    static g_wszWMCPMaxPasses => "_PASSESRECOMMENDED"

    /**
     * @type {String}
     */
    static g_wszWMCPDefaultCrisp => "_DEFAULTCRISP"

    /**
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionType_Unknown => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionType_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionType_HDCP => 1

    /**
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionType_ACP => 2

    /**
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionType_CGMSA => 4

    /**
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionType_Mask => -2147483641

    /**
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionType_Reserved => 2147483640

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_ORIGIN_NAME => "{fc358288-3cb6-460c-a424-b6681260375a}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_CONTENT_TYPE => "{fc358289-3cb6-460c-a424-b6681260375a}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_DURATION => "{fc35828a-3cb6-460c-a424-b6681260375a}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_LAST_MODIFIED_TIME => "{fc35828b-3cb6-460c-a424-b6681260375a}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_IFO_FILE_URI => "{fc35828c-3cb6-460c-a424-b6681260375a}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_DLNA_PROFILE_ID => "{fc35828d-3cb6-460c-a424-b6681260375a}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_EFFECTIVE_URL => "{9afa0209-89d1-42af-8456-1de6b562d691}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_TRANSCODED => "{b6c5c282-4dc9-4db9-ab48-cf3b6d8bc5e0}"

    /**
     * @type {String}
     */
    static CLSID_MFByteStreamProxyClassFactory => "{770e8e77-4916-441c-a9a7-b342d0eebc71}"

    /**
     * @type {String}
     */
    static MEDeviceStreamCreated => "{0252a1cf-3540-43b4-9164-d72eb405fa40}"

    /**
     * @type {String}
     */
    static MF_SA_D3D_AWARE => "{eaa35c29-775e-488e-9b61-b3283e49583b}"

    /**
     * @type {String}
     */
    static MF_SA_REQUIRED_SAMPLE_COUNT => "{18802c61-324b-4952-abd0-176ff5c696ff}"

    /**
     * @type {String}
     */
    static MFT_END_STREAMING_AWARE => "{70fbc845-b07e-4089-b064-399dc6110f29}"

    /**
     * @type {String}
     */
    static MF_SA_AUDIO_ENDPOINT_AWARE => "{c0381701-805c-42b2-ac8d-e2b4bf21f4f8}"

    /**
     * @type {String}
     */
    static MFT_AUDIO_DECODER_AUDIO_ENDPOINT_ID => "{c7ccdd6e-5398-4695-8be7-51b3e95111bd}"

    /**
     * @type {String}
     */
    static MFT_AUDIO_DECODER_SPATIAL_METADATA_CLIENT => "{05987df4-1270-4999-925f-8e939a7c0af7}"

    /**
     * @type {String}
     */
    static MFT_AUDIO_DECODER_AUDIO_ENDPOINT_FORMFACTOR => "{8d574310-909a-433a-ace7-eee74719f901}"

    /**
     * @type {String}
     */
    static MFT_AUDIO_DECODER_AUDIO_ENDPOINT_IS_DIGITAL_STEREO_ONLY => "{26e5a90d-4ad1-4f8c-b8af-adf14d2178f1}"

    /**
     * @type {String}
     */
    static MF_DMFT_FRAME_BUFFER_INFO => "{396ce1c9-67a9-454c-8797-95a45799d804}"

    /**
     * @type {String}
     */
    static MF_SA_REQUIRED_SAMPLE_COUNT_PROGRESSIVE => "{b172d58e-fa77-4e48-8d2a-1df2d850eac2}"

    /**
     * @type {String}
     */
    static MF_SA_MINIMUM_OUTPUT_SAMPLE_COUNT => "{851745d5-c3d6-476d-9527-498ef2d10d18}"

    /**
     * @type {String}
     */
    static MF_SA_MINIMUM_OUTPUT_SAMPLE_COUNT_PROGRESSIVE => "{0f5523a5-1cb2-47c5-a550-2eeb84b4d14a}"

    /**
     * @type {String}
     */
    static MFT_SUPPORT_3DVIDEO => "{093f81b1-4f2e-4631-8168-7934032a01d3}"

    /**
     * @type {String}
     */
    static MF_ENABLE_3DVIDEO_OUTPUT => "{bdad7bca-0e5f-4b10-ab16-26de381b6293}"

    /**
     * @type {String}
     */
    static MF_SA_D3D11_BINDFLAGS => "{eacf97ad-065c-4408-bee3-fdcbfd128be2}"

    /**
     * @type {String}
     */
    static MF_SA_D3D11_USAGE => "{e85fe442-2ca3-486e-a9c7-109dda609880}"

    /**
     * @type {String}
     */
    static MF_SA_D3D11_AWARE => "{206b4fc8-fcf9-4c51-afe3-9764369e33a0}"

    /**
     * @type {String}
     */
    static MF_SA_D3D11_SHARED => "{7b8f32c3-6d96-4b89-9203-dd38b61414f3}"

    /**
     * @type {String}
     */
    static MF_SA_D3D11_SHARED_WITHOUT_MUTEX => "{39dbd44d-2e44-4931-a4c8-352d3dc42115}"

    /**
     * @type {String}
     */
    static MF_SA_D3D11_ALLOW_DYNAMIC_YUV_TEXTURE => "{ce06d49f-0613-4b9d-86a6-d8c4f9c10075}"

    /**
     * @type {String}
     */
    static MF_SA_D3D11_HW_PROTECTED => "{3a8ba9d9-92ca-4307-a391-6999dbf3b6ce}"

    /**
     * @type {String}
     */
    static MF_SA_BUFFERS_PER_SAMPLE => "{873c5171-1e3d-4e25-988d-b433ce041983}"

    /**
     * @type {String}
     */
    static MF_SA_D3D11_ALLOCATE_DISPLAYABLE_RESOURCES => "{eeface6d-2ea9-4adf-bbdf-7bbc482a1b6d}"

    /**
     * @type {String}
     */
    static MFT_DECODER_EXPOSE_OUTPUT_TYPES_IN_NATIVE_ORDER => "{ef80833f-f8fa-44d9-80d8-41ed6232670c}"

    /**
     * @type {String}
     */
    static MFT_DECODER_QUALITY_MANAGEMENT_CUSTOM_CONTROL => "{a24e30d7-de25-4558-bbfb-71070a2d332e}"

    /**
     * @type {String}
     */
    static MFT_DECODER_QUALITY_MANAGEMENT_RECOVERY_WITHOUT_ARTIFACTS => "{d8980deb-0a48-425f-8623-611db41d3810}"

    /**
     * @type {String}
     */
    static MFT_DECODER_OPERATING_POINT => "{a1230334-55d4-4d97-82a7-26d3e6456725}"

    /**
     * @type {String}
     */
    static MFT_DECODER_AUTOMATIC_SOFTWARE_FALLBACK => "{41f34f53-1bf6-49ed-b95d-02d2a1d7115a}"

    /**
     * @type {String}
     */
    static MFT_REMUX_MARK_I_PICTURE_AS_CLEAN_POINT => "{364e8f85-3f2e-436c-b2a2-4440a012a9e8}"

    /**
     * @type {String}
     */
    static MFT_DECODER_FINAL_VIDEO_RESOLUTION_HINT => "{dc2f8496-15c4-407a-b6f0-1b66ab5fbf53}"

    /**
     * @type {String}
     */
    static MFT_ENCODER_SUPPORTS_CONFIG_EVENT => "{86a355ae-3a77-4ec4-9f31-01149a4e92de}"

    /**
     * @type {String}
     */
    static MFT_ENUM_HARDWARE_VENDOR_ID_Attribute => "{3aecb0cc-035b-4bcc-8185-2b8d551ef3af}"

    /**
     * @type {String}
     */
    static MF_TRANSFORM_ASYNC => "{f81a699a-649a-497d-8c73-29f8fed6ad7a}"

    /**
     * @type {String}
     */
    static MF_TRANSFORM_ASYNC_UNLOCK => "{e5666d6b-3422-4eb6-a421-da7db1f8e207}"

    /**
     * @type {String}
     */
    static MF_TRANSFORM_FLAGS_Attribute => "{9359bb7e-6275-46c4-a025-1c01e45f1a86}"

    /**
     * @type {String}
     */
    static MF_TRANSFORM_CATEGORY_Attribute => "{ceabba49-506d-4757-a6ff-66c184987e4e}"

    /**
     * @type {String}
     */
    static MFT_TRANSFORM_CLSID_Attribute => "{6821c42b-65a4-4e82-99bc-9a88205ecd0c}"

    /**
     * @type {String}
     */
    static MFT_INPUT_TYPES_Attributes => "{4276c9b1-759d-4bf3-9cd0-0d723d138f96}"

    /**
     * @type {String}
     */
    static MFT_OUTPUT_TYPES_Attributes => "{8eae8cf3-a44f-4306-ba5c-bf5dda242818}"

    /**
     * @type {String}
     */
    static MFT_ENUM_HARDWARE_URL_Attribute => "{2fb866ac-b078-4942-ab6c-003d05cda674}"

    /**
     * @type {String}
     */
    static MFT_FRIENDLY_NAME_Attribute => "{314ffbae-5b41-4c95-9c19-4e7d586face3}"

    /**
     * @type {String}
     */
    static MFT_CONNECTED_STREAM_ATTRIBUTE => "{71eeb820-a59f-4de2-bcec-38db1dd611a4}"

    /**
     * @type {String}
     */
    static MFT_CONNECTED_TO_HW_STREAM => "{34e6e728-06d6-4491-a553-4795650db912}"

    /**
     * @type {String}
     */
    static MFT_PREFERRED_OUTPUTTYPE_Attribute => "{7e700499-396a-49ee-b1b4-f628021e8c9d}"

    /**
     * @type {String}
     */
    static MFT_PROCESS_LOCAL_Attribute => "{543186e4-4649-4e65-b588-4aa352aff379}"

    /**
     * @type {String}
     */
    static MFT_PREFERRED_ENCODER_PROFILE => "{53004909-1ef5-46d7-a18e-5a75f8b5905f}"

    /**
     * @type {String}
     */
    static MFT_HW_TIMESTAMP_WITH_QPC_Attribute => "{8d030fb8-cc43-4258-a22e-9210bef89be4}"

    /**
     * @type {String}
     */
    static MFT_FIELDOFUSE_UNLOCK_Attribute => "{8ec2e9fd-9148-410d-831e-702439461a8e}"

    /**
     * @type {String}
     */
    static MFT_CODEC_MERIT_Attribute => "{88a7cb15-7b07-4a34-9128-e64c6703c4d3}"

    /**
     * @type {String}
     */
    static MFT_ENUM_TRANSCODE_ONLY_ATTRIBUTE => "{111ea8cd-b62a-4bdb-89f6-67ffcdc2458b}"

    /**
     * @type {String}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_INFO_ATTRIBUTE => "{6c3386ad-ec20-430d-b2a5-505c7178d9c4}"

    /**
     * @type {String}
     */
    static MFT_POLICY_SET_AWARE => "{5a633b19-cc39-4fa8-8ca5-59981b7a0018}"

    /**
     * @type {String}
     */
    static MFT_USING_HARDWARE_DRM => "{34faa77d-d79e-4957-b8ce-362b2684996c}"

    /**
     * @type {String}
     */
    static MF_ACOUSTIC_ECHO_CANCELLATION_CONTROL_SERVICE => "{7f6c3b29-2d12-4f6f-ac05-c1a89b8d5288}"

    /**
     * @type {String}
     */
    static MF_AUDIO_EFFECTS_MANAGER_SERVICE => "{1f541943-d5df-455e-a2e5-7d64d3bbbdb5}"

    /**
     * @type {String}
     */
    static MF_WVC1_PROG_SINGLE_SLICE_CONTENT => "{67ec2559-0f2f-4420-a4dd-2f8ee7a5738b}"

    /**
     * @type {String}
     */
    static MF_PROGRESSIVE_CODING_CONTENT => "{8f020eea-1508-471f-9da6-507d7cfa40db}"

    /**
     * @type {String}
     */
    static MF_NALU_LENGTH_SET => "{a7911d53-12a4-4965-ae70-6eadd6ff0551}"

    /**
     * @type {String}
     */
    static MF_NALU_LENGTH_INFORMATION => "{19124e7c-ad4b-465f-bb18-20186287b6af}"

    /**
     * @type {String}
     */
    static MF_USER_DATA_PAYLOAD => "{d1d4985d-dc92-457a-b3a0-651a33a31047}"

    /**
     * @type {String}
     */
    static MF_MPEG4SINK_SPSPPS_PASSTHROUGH => "{5601a134-2005-4ad2-b37d-22a6c554deb2}"

    /**
     * @type {String}
     */
    static MF_MPEG4SINK_MOOV_BEFORE_MDAT => "{f672e3ac-e1e6-4f10-b5ec-5f3b30828816}"

    /**
     * @type {String}
     */
    static MF_MPEG4SINK_MINIMUM_PROPERTIES_SIZE => "{dca1ed52-450e-4a22-8c62-4ed452f7a187}"

    /**
     * @type {String}
     */
    static MF_MPEG4SINK_MIN_FRAGMENT_DURATION => "{a30b570c-8efd-45e8-94fe-27c84b5bdff6}"

    /**
     * @type {String}
     */
    static MF_MPEG4SINK_MAX_CODED_SEQUENCES_PER_FRAGMENT => "{fc1b3bd6-692d-4ce5-9299-738aa5463e9a}"

    /**
     * @type {String}
     */
    static MF_SESSION_TOPOLOADER => "{1e83d482-1f1c-4571-8405-88f4b2181f71}"

    /**
     * @type {String}
     */
    static MF_SESSION_GLOBAL_TIME => "{1e83d482-1f1c-4571-8405-88f4b2181f72}"

    /**
     * @type {String}
     */
    static MF_SESSION_QUALITY_MANAGER => "{1e83d482-1f1c-4571-8405-88f4b2181f73}"

    /**
     * @type {String}
     */
    static MF_SESSION_CONTENT_PROTECTION_MANAGER => "{1e83d482-1f1c-4571-8405-88f4b2181f74}"

    /**
     * @type {String}
     */
    static MF_SESSION_SERVER_CONTEXT => "{afe5b291-50fa-46e8-b9be-0c0c3ce4b3a5}"

    /**
     * @type {String}
     */
    static MF_SESSION_REMOTE_SOURCE_MODE => "{f4033ef4-9bb3-4378-941f-85a0856bc244}"

    /**
     * @type {String}
     */
    static MF_SESSION_APPROX_EVENT_OCCURRENCE_TIME => "{190e852f-6238-42d1-b5af-69ea338ef850}"

    /**
     * @type {String}
     */
    static MF_PMP_SERVER_CONTEXT => "{2f00c910-d2cf-4278-8b6a-d077fac3a25f}"

    /**
     * @type {String}
     */
    static MF_TIME_FORMAT_ENTRY_RELATIVE => "{4399f178-46d3-4504-afda-20d32e9ba360}"

    /**
     * @type {String}
     */
    static MF_SOURCE_STREAM_SUPPORTS_HW_CONNECTION => "{a38253aa-6314-42fd-a3ce-bb27b6859946}"

    /**
     * @type {String}
     */
    static MF_STREAM_SINK_SUPPORTS_HW_CONNECTION => "{9b465cbf-0597-4f9e-9f3c-b97eeef90359}"

    /**
     * @type {String}
     */
    static MF_STREAM_SINK_SUPPORTS_ROTATION => "{b3e96280-bd05-41a5-97ad-8a7fee24b912}"

    /**
     * @type {String}
     */
    static MF_SINK_VIDEO_PTS => "{2162bde7-421e-4b90-9b33-e58fbf1d58b6}"

    /**
     * @type {String}
     */
    static MF_SINK_VIDEO_NATIVE_WIDTH => "{e6d6a707-1505-4747-9b10-72d2d158cb3a}"

    /**
     * @type {String}
     */
    static MF_SINK_VIDEO_NATIVE_HEIGHT => "{f0ca6705-490c-43e8-941c-c0b3206b9a65}"

    /**
     * @type {String}
     */
    static MF_SINK_VIDEO_DISPLAY_ASPECT_RATIO_NUMERATOR => "{d0f33b22-b78a-4879-b455-f03ef3fa82cd}"

    /**
     * @type {String}
     */
    static MF_SINK_VIDEO_DISPLAY_ASPECT_RATIO_DENOMINATOR => "{6ea1eb97-1fe0-4f10-a6e4-1f4f661564e0}"

    /**
     * @type {String}
     */
    static MF_BD_MVC_PLANE_OFFSET_METADATA => "{62a654e4-b76c-4901-9823-2cb615d47318}"

    /**
     * @type {String}
     */
    static MF_LUMA_KEY_ENABLE => "{7369820f-76de-43ca-9284-47b8f37e0649}"

    /**
     * @type {String}
     */
    static MF_LUMA_KEY_LOWER => "{93d7b8d5-0b81-4715-aea0-8725871621e9}"

    /**
     * @type {String}
     */
    static MF_LUMA_KEY_UPPER => "{d09f39bb-4602-4c31-a706-a12171a5110a}"

    /**
     * @type {String}
     */
    static MF_USER_EXTENDED_ATTRIBUTES => "{c02abac6-feb2-4541-922f-920b43702722}"

    /**
     * @type {String}
     */
    static MF_INDEPENDENT_STILL_IMAGE => "{ea12af41-0710-42c9-a127-daa3e78483a5}"

    /**
     * @type {String}
     */
    static MF_XVP_SAMPLE_LOCK_TIMEOUT => "{aa4ddb29-5134-4363-ac72-83ec4bc10426}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_PROJECTSTART => "{7ed3f802-86bb-4b3f-b7e4-7cb43afd4b80}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_PROJECTSTOP => "{7ed3f803-86bb-4b3f-b7e4-7cb43afd4b80}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_NO_MARKIN_MARKOUT => "{7ed3f804-86bb-4b3f-b7e4-7cb43afd4b80}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_DXVA_MODE => "{1e8d34f6-f5ab-4e23-bb88-874aa3a1a74d}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_ENABLE_XVP_FOR_PLAYBACK => "{1967731f-cd78-42fc-b026-0992a56e5693}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_STATIC_PLAYBACK_OPTIMIZATIONS => "{b86cac42-41a6-4b79-897a-1ab0e52b4a1b}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_PLAYBACK_MAX_DIMS => "{5715cf19-5768-44aa-ad6e-8721f1b0f9bb}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_HARDWARE_MODE => "{d2d362fd-4e4f-4191-a579-c618b66706af}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_PLAYBACK_FRAMERATE => "{c164737a-c2b1-4553-83bb-5a526072448f}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_DYNAMIC_CHANGE_NOT_ALLOWED => "{d529950b-d484-4527-a9cd-b1909532b5b0}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_ENUMERATE_SOURCE_TYPES => "{6248c36d-5d0b-4f40-a0bb-b0b305f77698}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_START_TIME_ON_PRESENTATION_SWITCH => "{c8cc113f-7951-4548-aad6-9ed6202e62b3}"

    /**
     * @type {String}
     */
    static MF_DISABLE_LOCALLY_REGISTERED_PLUGINS => "{66b16da9-add4-47e0-a16b-5af1fb483634}"

    /**
     * @type {String}
     */
    static MF_LOCAL_PLUGIN_CONTROL_POLICY => "{d91b0085-c86d-4f81-8822-8c68e1d7fa04}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_FLUSH => "{494bbce8-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_DRAIN => "{494bbce9-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_D3DAWARE => "{494bbced-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPOLOGY_RESOLUTION_STATUS => "{494bbcde-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_ERRORCODE => "{494bbcee-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_CONNECT_METHOD => "{494bbcf1-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_LOCKED => "{494bbcf7-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_WORKQUEUE_ID => "{494bbcf8-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_WORKQUEUE_MMCSS_CLASS => "{494bbcf9-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_DECRYPTOR => "{494bbcfa-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_DISCARDABLE => "{494bbcfb-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_ERROR_MAJORTYPE => "{494bbcfd-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_ERROR_SUBTYPE => "{494bbcfe-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_WORKQUEUE_MMCSS_TASKID => "{494bbcff-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_WORKQUEUE_MMCSS_PRIORITY => "{5001f840-2816-48f4-9364-ad1ef661a123}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_WORKQUEUE_ITEM_PRIORITY => "{a1ff99be-5e97-4a53-b494-568c642c0ff3}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_MARKIN_HERE => "{494bbd00-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_MARKOUT_HERE => "{494bbd01-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_DECODER => "{494bbd02-b031-4e38-97c4-d5422dd618dc}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_MEDIASTART => "{835c58ea-e075-4bc7-bcba-4de000df9ae6}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_MEDIASTOP => "{835c58eb-e075-4bc7-bcba-4de000df9ae6}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_SOURCE => "{835c58ec-e075-4bc7-bcba-4de000df9ae6}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_PRESENTATION_DESCRIPTOR => "{835c58ed-e075-4bc7-bcba-4de000df9ae6}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_STREAM_DESCRIPTOR => "{835c58ee-e075-4bc7-bcba-4de000df9ae6}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_SEQUENCE_ELEMENTID => "{835c58ef-e075-4bc7-bcba-4de000df9ae6}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_TRANSFORM_OBJECTID => "{88dcc0c9-293e-4e8b-9aeb-0ad64cc016b0}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_STREAMID => "{14932f9b-9087-4bb4-8412-5167145cbe04}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_NOSHUTDOWN_ON_REMOVE => "{14932f9c-9087-4bb4-8412-5167145cbe04}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_RATELESS => "{14932f9d-9087-4bb4-8412-5167145cbe04}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_DISABLE_PREROLL => "{14932f9e-9087-4bb4-8412-5167145cbe04}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_PRIMARYOUTPUT => "{6304ef99-16b2-4ebe-9d67-e4c539b3a259}"

    /**
     * @type {String}
     */
    static MF_PD_PMPHOST_CONTEXT => "{6c990d31-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_APP_CONTEXT => "{6c990d32-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_DURATION => "{6c990d33-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_TOTAL_FILE_SIZE => "{6c990d34-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_AUDIO_ENCODING_BITRATE => "{6c990d35-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_VIDEO_ENCODING_BITRATE => "{6c990d36-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_MIME_TYPE => "{6c990d37-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_LAST_MODIFIED_TIME => "{6c990d38-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_PLAYBACK_ELEMENT_ID => "{6c990d39-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_PREFERRED_LANGUAGE => "{6c990d3a-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_PLAYBACK_BOUNDARY_TIME => "{6c990d3b-bb8e-477a-8598-0d5d96fcd88a}"

    /**
     * @type {String}
     */
    static MF_PD_AUDIO_ISVARIABLEBITRATE => "{33026ee0-e387-4582-ae0a-34a2ad3baa18}"

    /**
     * @type {String}
     */
    static MF_SD_LANGUAGE => "{00af2180-bdc2-423c-abca-f503593bc121}"

    /**
     * @type {String}
     */
    static MF_SD_PROTECTED => "{00af2181-bdc2-423c-abca-f503593bc121}"

    /**
     * @type {String}
     */
    static MF_SD_STREAM_NAME => "{4f1b099d-d314-41e5-a781-7fefaa4c501f}"

    /**
     * @type {String}
     */
    static MF_SD_MUTUALLY_EXCLUSIVE => "{023ef79c-388d-487f-ac17-696cd6e3c6f5}"

    /**
     * @type {String}
     */
    static MF_ACTIVATE_CUSTOM_VIDEO_MIXER_CLSID => "{ba491360-be50-451e-95ab-6d4accc7dad8}"

    /**
     * @type {String}
     */
    static MF_ACTIVATE_CUSTOM_VIDEO_MIXER_ACTIVATE => "{ba491361-be50-451e-95ab-6d4accc7dad8}"

    /**
     * @type {String}
     */
    static MF_ACTIVATE_CUSTOM_VIDEO_MIXER_FLAGS => "{ba491362-be50-451e-95ab-6d4accc7dad8}"

    /**
     * @type {String}
     */
    static MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_CLSID => "{ba491364-be50-451e-95ab-6d4accc7dad8}"

    /**
     * @type {String}
     */
    static MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_ACTIVATE => "{ba491365-be50-451e-95ab-6d4accc7dad8}"

    /**
     * @type {String}
     */
    static MF_ACTIVATE_CUSTOM_VIDEO_PRESENTER_FLAGS => "{ba491366-be50-451e-95ab-6d4accc7dad8}"

    /**
     * @type {String}
     */
    static MF_ACTIVATE_MFT_LOCKED => "{c1f6093c-7f65-4fbd-9e39-5faec3c4fbd7}"

    /**
     * @type {String}
     */
    static MF_ACTIVATE_VIDEO_WINDOW => "{9a2dbbdd-f57e-4162-82b9-6831377682d3}"

    /**
     * @type {String}
     */
    static MF_AUDIO_RENDERER_ATTRIBUTE_FLAGS => "{ede4b5e0-f805-4d6c-99b3-db01bf95dfab}"

    /**
     * @type {String}
     */
    static MF_AUDIO_RENDERER_ATTRIBUTE_SESSION_ID => "{ede4b5e3-f805-4d6c-99b3-db01bf95dfab}"

    /**
     * @type {String}
     */
    static MF_AUDIO_RENDERER_ATTRIBUTE_ENDPOINT_ID => "{b10aaec3-ef71-4cc3-b873-05a9a08b9f8e}"

    /**
     * @type {String}
     */
    static MF_AUDIO_RENDERER_ATTRIBUTE_ENDPOINT_ROLE => "{6ba644ff-27c5-4d02-9887-c28619fdb91b}"

    /**
     * @type {String}
     */
    static MF_AUDIO_RENDERER_ATTRIBUTE_STREAM_CATEGORY => "{a9770471-92ec-4df4-94fe-81c36f0c3a7a}"

    /**
     * @type {String}
     */
    static MFENABLETYPE_WMDRMV1_LicenseAcquisition => "{4ff6eeaf-0b43-4797-9b85-abf31815e7b0}"

    /**
     * @type {String}
     */
    static MFENABLETYPE_WMDRMV7_LicenseAcquisition => "{003306df-4a06-4884-a097-ef6d22ec84a3}"

    /**
     * @type {String}
     */
    static MFENABLETYPE_WMDRMV7_Individualization => "{acd2c84a-b303-4f65-bc2c-2c848d01a989}"

    /**
     * @type {String}
     */
    static MFENABLETYPE_MF_UpdateRevocationInformation => "{e558b0b5-b3c4-44a0-924c-50d178932385}"

    /**
     * @type {String}
     */
    static MFENABLETYPE_MF_UpdateUntrustedComponent => "{9879f3d6-cee2-48e6-b573-9767ab172f16}"

    /**
     * @type {String}
     */
    static MFENABLETYPE_MF_RebootRequired => "{6d4d3d4b-0ece-4652-8b3a-f2d24260d887}"

    /**
     * @type {String}
     */
    static MF_METADATA_PROVIDER_SERVICE => "{db214084-58a4-4d2e-b84f-6f755b2f7a0d}"

    /**
     * @type {String}
     */
    static MF_PROPERTY_HANDLER_SERVICE => "{a3face02-32b8-41dd-90e7-5fef7c8991b5}"

    /**
     * @type {String}
     */
    static MF_RATE_CONTROL_SERVICE => "{866fa297-b802-4bf8-9dc9-5e3b6a9f53c9}"

    /**
     * @type {String}
     */
    static MF_TIMECODE_SERVICE => "{a0d502a7-0eb3-4885-b1b9-9feb0d083454}"

    /**
     * @type {String}
     */
    static MR_POLICY_VOLUME_SERVICE => "{1abaa2ac-9d3b-47c6-ab48-c59506de784d}"

    /**
     * @type {String}
     */
    static MR_CAPTURE_POLICY_VOLUME_SERVICE => "{24030acd-107a-4265-975c-414e33e65f2a}"

    /**
     * @type {String}
     */
    static MR_STREAM_VOLUME_SERVICE => "{f8b5fa2f-32ef-46f5-b172-1321212fb2c4}"

    /**
     * @type {String}
     */
    static MR_AUDIO_POLICY_SERVICE => "{911fd737-6775-4ab0-a614-297862fdac88}"

    /**
     * @type {String}
     */
    static MF_SAMPLEGRABBERSINK_SAMPLE_TIME_OFFSET => "{62e3d776-8100-4e03-a6e8-bd3857ac9c47}"

    /**
     * @type {String}
     */
    static MF_SAMPLEGRABBERSINK_IGNORE_CLOCK => "{0efda2c0-2b69-4e2e-ab8d-46dcbff7d25d}"

    /**
     * @type {String}
     */
    static MF_QUALITY_SERVICES => "{b7e2be11-2f96-4640-b52c-282365bdf16c}"

    /**
     * @type {String}
     */
    static MF_WORKQUEUE_SERVICES => "{8e37d489-41e0-413a-9068-287c886d8dda}"

    /**
     * @type {String}
     */
    static MF_QUALITY_NOTIFY_PROCESSING_LATENCY => "{f6b44af8-604d-46fe-a95d-45479b10c9bc}"

    /**
     * @type {String}
     */
    static MF_QUALITY_NOTIFY_SAMPLE_LAG => "{30d15206-ed2a-4760-be17-eb4a9f12295c}"

    /**
     * @type {String}
     */
    static MF_TIME_FORMAT_SEGMENT_OFFSET => "{c8b8be77-869c-431d-812e-169693f65a39}"

    /**
     * @type {String}
     */
    static MF_SOURCE_PRESENTATION_PROVIDER_SERVICE => "{e002aadc-f4af-4ee5-9847-053edf840426}"

    /**
     * @type {String}
     */
    static MF_TOPONODE_ATTRIBUTE_EDITOR_SERVICE => "{65656e1a-077f-4472-83ef-316f11d5087a}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_SSLCERTIFICATE_MANAGER => "{55e6cb27-e69b-4267-940c-2d7ec5bb8a0f}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_RESOURCE_FILTER => "{815d0ff6-265a-4477-9e46-7b80ad80b5fb}"

    /**
     * @type {String}
     */
    static MFNET_SAVEJOB_SERVICE => "{b85a587f-3d02-4e52-9565-55d3ec1e7ff7}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_STATISTICS_SERVICE => "{3cb1f275-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_STATISTICS => "{3cb1f274-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_BUFFERINGTIME => "{3cb1f276-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ACCELERATEDSTREAMINGDURATION => "{3cb1f277-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_MAXUDPACCELERATEDSTREAMINGDURATION => "{4aab2879-bbe1-4994-9ff0-5495bd250129}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_MAXBUFFERTIMEMS => "{408b24e6-4038-4401-b5b2-fe701a9ebf10}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_CONNECTIONBANDWIDTH => "{3cb1f278-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_CACHEENABLED => "{3cb1f279-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_AUTORECONNECTLIMIT => "{3cb1f27a-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_RESENDSENABLED => "{3cb1f27b-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_THINNINGENABLED => "{3cb1f27c-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROTOCOL => "{3cb1f27d-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_TRANSPORT => "{3cb1f27e-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PREVIEWMODEENABLED => "{3cb1f27f-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_CREDENTIAL_MANAGER => "{3cb1f280-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PPBANDWIDTH => "{3cb1f281-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_AUTORECONNECTPROGRESS => "{3cb1f282-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROXYLOCATORFACTORY => "{3cb1f283-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_BROWSERUSERAGENT => "{3cb1f28b-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_BROWSERWEBPAGE => "{3cb1f28c-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PLAYERVERSION => "{3cb1f28d-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PLAYERID => "{3cb1f28e-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_HOSTEXE => "{3cb1f28f-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_HOSTVERSION => "{3cb1f291-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PLAYERUSERAGENT => "{3cb1f292-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_CLIENTGUID => "{60a2c4a6-f197-4c14-a5bf-88830d2458af}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_LOGURL => "{3cb1f293-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ENABLE_UDP => "{3cb1f294-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ENABLE_TCP => "{3cb1f295-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ENABLE_MSB => "{3cb1f296-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ENABLE_RTSP => "{3cb1f298-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ENABLE_HTTP => "{3cb1f299-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ENABLE_STREAMING => "{3cb1f29c-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ENABLE_DOWNLOAD => "{3cb1f29d-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_ENABLE_PRIVATEMODE => "{824779d8-f18b-4405-8cf1-464fb5aa8f71}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_UDP_PORT_RANGE => "{3cb1f29a-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROXYINFO => "{3cb1f29b-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_DRMNET_LICENSE_REPRESENTATION => "{47eae1bd-bdfe-42e2-82f3-54a48c17962d}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROXYSETTINGS => "{3cb1f287-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROXYHOSTNAME => "{3cb1f284-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROXYPORT => "{3cb1f288-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROXYEXCEPTIONLIST => "{3cb1f285-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROXYBYPASSFORLOCAL => "{3cb1f286-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PROXYRERUNAUTODETECTION => "{3cb1f289-0505-4c5d-ae71-0a556344efa1}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_STREAM_LANGUAGE => "{9ab44318-f7cd-4f2d-8d6d-fa35b492cecb}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_LOGPARAMS => "{64936ae8-9418-453a-8cda-3e0a668b353b}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_PEERMANAGER => "{48b29adb-febf-45ee-a9bf-efb81c492efc}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_FRIENDLYNAME => "{5b2a7757-bc6b-447e-aa06-0dda1c646e2f}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAMHANDLER_ACCEPTS_SHARE_WRITE => "{a6e1f733-3001-4915-8150-1558a2180ec8}"

    /**
     * @type {String}
     */
    static MF_BYTESTREAM_SERVICE => "{ab025e2b-16d9-4180-a127-ba6c70156161}"

    /**
     * @type {String}
     */
    static MF_MEDIA_PROTECTION_MANAGER_PROPERTIES => "{38bd81a9-acea-4c73-89b2-5532c0aeca79}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_SPDIF => "{0b94a712-ad3e-4cee-83ce-ce32e3db6522}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_UNKNOWN => "{ac3aef5c-ce43-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_PCI => "{ac3aef5d-ce43-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_PCIX => "{ac3aef5e-ce43-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_PCI_Express => "{ac3aef5f-ce43-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_AGP => "{ac3aef60-ce43-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_VGA => "{57cd5968-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_SVIDEO => "{57cd5969-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_COMPOSITE => "{57cd596a-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_COMPONENT => "{57cd596b-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_DVI => "{57cd596c-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_HDMI => "{57cd596d-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_LVDS => "{57cd596e-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_D_JPN => "{57cd5970-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_SDI => "{57cd5971-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_DISPLAYPORT_EXTERNAL => "{57cd5972-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_DISPLAYPORT_EMBEDDED => "{57cd5973-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_UDI_EXTERNAL => "{57cd5974-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_UDI_EMBEDDED => "{57cd5975-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_MIRACAST => "{57cd5977-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_TRANSPORT_AGNOSTIC_DIGITAL_MODE_A => "{57cd5978-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MFCONNECTOR_TRANSPORT_AGNOSTIC_DIGITAL_MODE_B => "{57cd5979-ce47-11d9-92db-000bdb28ff98}"

    /**
     * @type {String}
     */
    static MF_POLICY_ID => "{b160c24d-c059-48f1-a901-9ee298a9a8c3}"

    /**
     * @type {String}
     */
    static MFPROTECTION_DISABLE => "{8cc6d81b-fec6-4d8f-964b-cfba0b0dad0d}"

    /**
     * @type {String}
     */
    static MFPROTECTION_CONSTRICTVIDEO => "{193370ce-c5e4-4c3a-8a66-6959b4da4442}"

    /**
     * @type {String}
     */
    static MFPROTECTION_CONSTRICTVIDEO_NOOPM => "{a580e8cd-c247-4957-b983-3c2eebd1ff59}"

    /**
     * @type {String}
     */
    static MFPROTECTION_CONSTRICTAUDIO => "{ffc99b44-df48-4e16-8e66-096892c1578a}"

    /**
     * @type {String}
     */
    static MFPROTECTION_TRUSTEDAUDIODRIVERS => "{65bdf3d2-0168-4816-a533-55d47b027101}"

    /**
     * @type {String}
     */
    static MFPROTECTION_HDCP => "{ae7cc03d-c828-4021-acb7-d578d27aaf13}"

    /**
     * @type {String}
     */
    static MFPROTECTION_CGMSA => "{e57e69e9-226b-4d31-b4e3-d3db008736dd}"

    /**
     * @type {String}
     */
    static MFPROTECTION_ACP => "{c3fd11c6-f8b7-4d20-b008-1db17d61f2da}"

    /**
     * @type {String}
     */
    static MFPROTECTION_WMDRMOTA => "{a267a6a1-362e-47d0-8805-4628598a23e4}"

    /**
     * @type {String}
     */
    static MFPROTECTION_FFT => "{462a56b2-2866-4bb6-980d-6d8d9edb1a8c}"

    /**
     * @type {String}
     */
    static MFPROTECTION_PROTECTED_SURFACE => "{4f5d9566-e742-4a25-8d1f-d287b5fa0ade}"

    /**
     * @type {String}
     */
    static MFPROTECTION_DISABLE_SCREEN_SCRAPE => "{a21179a4-b7cd-40d8-9614-8ef2371ba78d}"

    /**
     * @type {String}
     */
    static MFPROTECTION_VIDEO_FRAMES => "{36a59cbc-7401-4a8c-bc20-46a7c9e597f0}"

    /**
     * @type {String}
     */
    static MFPROTECTION_HARDWARE => "{4ee7f0c1-9ed7-424f-b6be-996b33528856}"

    /**
     * @type {String}
     */
    static MFPROTECTION_HDCP_WITH_TYPE_ENFORCEMENT => "{a4a585e8-ed60-442d-814d-db4d4220a06d}"

    /**
     * @type {String}
     */
    static MFPROTECTIONATTRIBUTE_BEST_EFFORT => "{c8e06331-75f0-4ec1-8e77-17578f773b46}"

    /**
     * @type {String}
     */
    static MFPROTECTIONATTRIBUTE_FAIL_OVER => "{8536abc5-38f1-4151-9cce-f55d941229ac}"

    /**
     * @type {String}
     */
    static MFPROTECTION_GRAPHICS_TRANSFER_AES_ENCRYPTION => "{c873de64-d8a5-49e6-88bb-fb963fd3d4ce}"

    /**
     * @type {String}
     */
    static MFPROTECTIONATTRIBUTE_CONSTRICTVIDEO_IMAGESIZE => "{008476fc-4b58-4d80-a790-e7297673161d}"

    /**
     * @type {String}
     */
    static MFPROTECTIONATTRIBUTE_HDCP_SRM => "{6f302107-3477-4468-8a08-eef9db10e20f}"

    /**
     * @type {String}
     */
    static MF_SampleProtectionSalt => "{5403deee-b9ee-438f-aa83-3804997e569d}"

    /**
     * @type {String}
     */
    static MF_REMOTE_PROXY => "{2f00c90e-d2cf-4278-8b6a-d077fac3a25f}"

    /**
     * @type {String}
     */
    static CLSID_CreateMediaExtensionObject => "{ef65a54d-0788-45b8-8b14-bc0f6a6b5137}"

    /**
     * @type {String}
     */
    static MF_SAMI_SERVICE => "{49a89ae7-b4d9-4ef2-aa5c-f65a3e05ae4e}"

    /**
     * @type {String}
     */
    static MF_PD_SAMI_STYLELIST => "{e0b73c7f-486d-484e-9872-4de5192a7bf8}"

    /**
     * @type {String}
     */
    static MF_SD_SAMI_LANGUAGE => "{36fcb98a-6cd0-44cb-acb9-a8f5600dd0bb}"

    /**
     * @type {String}
     */
    static MF_TRANSCODE_CONTAINERTYPE => "{150ff23f-4abc-478b-ac4f-e1916fba1cca}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_ASF => "{430f6f6e-b6bf-4fc1-a0bd-9ee46eee2afb}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_MPEG4 => "{dc6cd05d-b9d0-40ef-bd35-fa622c1ab28a}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_MP3 => "{e438b912-83f1-4de6-9e3a-9ffbc6dd24d1}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_FLAC => "{31344aa3-05a9-42b5-901b-8e9d4257f75e}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_3GP => "{34c50167-4472-4f34-9ea0-c49fbacf037d}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_AC3 => "{6d8d91c3-8c91-4ed1-8742-8c347d5b44d0}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_ADTS => "{132fd27d-0f02-43de-a301-38fbbbb3834e}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_MPEG2 => "{bfc2dbf9-7bb4-4f8f-afde-e112c44ba882}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_WAVE => "{64c3453c-0f26-4741-be63-87bdf8bb935b}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_AVI => "{7edfe8af-402f-4d76-a33c-619fd157d0f1}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_FMPEG4 => "{9ba876f1-419f-4b77-a1e0-35959d9d4004}"

    /**
     * @type {String}
     */
    static MFTranscodeContainerType_AMR => "{025d5ad3-621a-475b-964d-66b1c824f079}"

    /**
     * @type {String}
     */
    static MF_TRANSCODE_SKIP_METADATA_TRANSFER => "{4e4469ef-b571-4959-8f83-3dcfba33a393}"

    /**
     * @type {String}
     */
    static MF_TRANSCODE_TOPOLOGYMODE => "{3e3df610-394a-40b2-9dea-3bab650bebf2}"

    /**
     * @type {String}
     */
    static MF_TRANSCODE_ADJUST_PROFILE => "{9c37c21b-060f-487c-a690-80d7f50d1c72}"

    /**
     * @type {String}
     */
    static MF_TRANSCODE_ENCODINGPROFILE => "{6947787c-f508-4ea9-b1e9-a1fe3a49fbc9}"

    /**
     * @type {String}
     */
    static MF_TRANSCODE_QUALITYVSSPEED => "{98332df8-03cd-476b-89fa-3f9e442dec9f}"

    /**
     * @type {String}
     */
    static MF_TRANSCODE_DONOT_INSERT_ENCODER => "{f45aa7ce-ab24-4012-a11b-dc8220201410}"

    /**
     * @type {String}
     */
    static MF_VIDEO_PROCESSOR_ALGORITHM => "{4a0a1e1f-272c-4fb6-9eb1-db330cbc97ca}"

    /**
     * @type {String}
     */
    static MF_XVP_DISABLE_FRC => "{2c0afa19-7a97-4d5a-9ee8-16d4fc518d8c}"

    /**
     * @type {String}
     */
    static MF_XVP_CALLER_ALLOCATES_OUTPUT => "{04a2cabc-0cab-40b1-a1b9-75bc3658f000}"

    /**
     * @type {String}
     */
    static MF_LOCAL_MFT_REGISTRATION_SERVICE => "{ddf5cf9c-4506-45aa-abf0-6d5d94dd1b4a}"

    /**
     * @type {String}
     */
    static MF_WRAPPED_SAMPLE_SERVICE => "{31f52bf2-d03e-4048-80d0-9c1046d87c61}"

    /**
     * @type {String}
     */
    static MF_WRAPPED_OBJECT => "{2b182c4c-d6ac-49f4-8915-f71887db70cd}"

    /**
     * @type {String}
     */
    static CLSID_HttpSchemePlugin => "{44cb442b-9da9-49df-b3fd-023777b16e50}"

    /**
     * @type {String}
     */
    static CLSID_UrlmonSchemePlugin => "{9ec4b4f9-3029-45ad-947b-344de2a249e2}"

    /**
     * @type {String}
     */
    static CLSID_NetSchemePlugin => "{e9f4ebab-d97b-463e-a2b1-c54ee3f9414d}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE => "{c60ac5fe-252a-478f-a0ef-bc8fa5f7cad3}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_HW_SOURCE => "{de7046ba-54d6-4487-a2a4-ec7c0d1bd163}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME => "{60d0e559-52f8-4fa2-bbce-acdb34a8ec01}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_MEDIA_TYPE => "{56a819ca-0c78-4de4-a0a7-3ddaba0f24d4}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_CATEGORY => "{77f0ae69-c3bd-4509-941d-467e4d24899e}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK => "{58f0aad8-22bf-4f8a-bb3d-d2c4978c6e2f}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_SYMBOLIC_LINK => "{98d24b5e-5930-4614-b5a1-f600f9355a78}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_MAX_BUFFERS => "{7dd9b730-4f2d-41d5-8f95-0cc9a912ba26}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID => "{30da9258-feb9-47a7-a453-763a7a8e1c5f}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE => "{bc9d118e-8c67-4a18-85d4-12d300400552}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_PROVIDER_DEVICE_ID => "{36689d42-a06c-40ae-84cf-f5a034067cc4}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_XADDRESS => "{bca0be52-c327-44c7-9b7d-7fa8d9b5bcda}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_STREAM_URL => "{9d7b40d2-3617-4043-93e3-8d6da9bb3492}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_USERNAME => "{05d01add-949f-46eb-bc8e-8b0d2b32d79d}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_PASSWORD => "{a0fd7e16-42d9-49df-84c0-e82c5eab8874}"

    /**
     * @type {String}
     */
    static CLSID_FrameServerNetworkCameraSource => "{7a213aa7-866f-414a-8c1a-275c7283a395}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_GUID => "{14dd9a1c-7cff-41be-b1b9-ba1ac6ecb571}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_GUID => "{8ac3587a-4ae7-42d8-99e0-0a6013eef90f}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_IMAGE_STREAM => "{a7ffb865-e7b2-43b0-9f6f-9af2a0e50fc0}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_INDEPENDENT_IMAGE_STREAM => "{03eeec7e-d605-4576-8b29-6580b490d7d3}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_STREAM_ID => "{11bd5120-d124-446b-88e6-17060257fff9}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_STREAM_CATEGORY => "{2939e7b8-a62e-4579-b674-d4073dfabbba}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_FRAMESERVER_SHARED => "{1cb378e9-b279-41d4-af97-34a243e68320}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_TRANSFORM_STREAM_ID => "{e63937b7-daaf-4d49-815f-d826f8ad31e7}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_EXTENSION_PLUGIN_CLSID => "{048e6558-60c4-4173-bd5b-6a3ca2896aee}"

    /**
     * @type {String}
     */
    static MF_DEVICEMFT_EXTENSION_PLUGIN_CLSID => "{0844dbae-34fa-48a0-a783-8e696fb1c9a8}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_EXTENSION_PLUGIN_CONNECTION_POINT => "{37f9375c-e664-4ea4-aae4-cb6d1daca1f4}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_TAKEPHOTO_TRIGGER => "{1d180e34-538c-4fbb-a75a-859af7d261a6}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_MAX_FRAME_BUFFERS => "{1684cebe-3175-4985-882c-0efd3e8ac11e}"

    /**
     * @type {String}
     */
    static MF_DEVICEMFT_CONNECTED_FILTER_KSCONTROL => "{6a2c4fa6-d179-41cd-9523-822371ea40e5}"

    /**
     * @type {String}
     */
    static MF_DEVICEMFT_CONNECTED_PIN_KSCONTROL => "{e63310f7-b244-4ef8-9a7d-24c74e32ebd0}"

    /**
     * @type {String}
     */
    static MF_DEVICE_THERMAL_STATE_CHANGED => "{70ccd0af-fc9f-4deb-a875-9fecd16c5bd4}"

    /**
     * @type {String}
     */
    static MFSampleExtension_DeviceTimestamp => "{8f3e35e7-2dcd-4887-8622-2a58baa652b0}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Spatial_CameraViewTransform => "{4e251fa4-830f-4770-859a-4b8d99aa809b}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Spatial_CameraCoordinateSystem => "{9d13c82f-2199-4e67-91cd-d1a4181f2534}"

    /**
     * @type {String}
     */
    static MFSampleExtension_Spatial_CameraProjectionTransform => "{47f9fcb5-2a02-4f26-a477-792fdf95886a}"

    /**
     * @type {String}
     */
    static MF_MEDIASOURCE_SERVICE => "{f09992f7-9fba-4c4a-a37f-8c47b4e1dfe7}"

    /**
     * @type {String}
     */
    static MF_ACCESS_CONTROLLED_MEDIASOURCE_SERVICE => "{014a5031-2f05-4c6a-9f9c-7d0dc4eda5f4}"

    /**
     * @type {String}
     */
    static MF_CONTENT_DECRYPTOR_SERVICE => "{68a72927-fc7b-44ee-85f4-7c51bd55a659}"

    /**
     * @type {String}
     */
    static MF_CONTENT_PROTECTION_DEVICE_SERVICE => "{ff58436f-76a0-41fe-b566-10cc53962edd}"

    /**
     * @type {String}
     */
    static MF_SD_AUDIO_ENCODER_DELAY => "{8e85422c-73de-403f-9a35-550ad6e8b951}"

    /**
     * @type {String}
     */
    static MF_SD_AUDIO_ENCODER_PADDING => "{529c7f2c-ac4b-4e3f-bfc3-0902194982cb}"

    /**
     * @type {String}
     */
    static CLSID_MSH264DecoderMFT => "{62ce7e72-4c71-4d20-b15d-452831a87d9d}"

    /**
     * @type {String}
     */
    static CLSID_MSH264EncoderMFT => "{6ca50344-051a-4ded-9779-a43305165e35}"

    /**
     * @type {String}
     */
    static CLSID_MSDDPlusDecMFT => "{177c0afe-900b-48d4-9e4c-57add250b3d4}"

    /**
     * @type {String}
     */
    static CLSID_MP3DecMediaObject => "{bbeea841-0a63-4f52-a7ab-a9b3a84ed38a}"

    /**
     * @type {String}
     */
    static CLSID_MSAACDecMFT => "{32d186a7-218f-4c75-8876-dd77273a8999}"

    /**
     * @type {String}
     */
    static CLSID_MSH265DecoderMFT => "{420a51a3-d605-430c-b4fc-45274fa6c562}"

    /**
     * @type {String}
     */
    static CLSID_WMVDecoderMFT => "{82d353df-90bd-4382-8bc2-3f6192b76e34}"

    /**
     * @type {String}
     */
    static CLSID_WMADecMediaObject => "{2eeb4adf-4578-4d10-bca7-bb955f56320a}"

    /**
     * @type {String}
     */
    static CLSID_MSMPEGAudDecMFT => "{70707b39-b2ca-4015-abea-f8447d22d88b}"

    /**
     * @type {String}
     */
    static CLSID_MSMPEGDecoderMFT => "{2d709e52-123f-49b5-9cbc-9af5cde28fb9}"

    /**
     * @type {String}
     */
    static CLSID_AudioResamplerMediaObject => "{f447b69e-1884-4a7e-8055-346f74d6edb3}"

    /**
     * @type {String}
     */
    static CLSID_MSVPxDecoder => "{e3aaf548-c9a4-4c6e-234d-5ada374b0000}"

    /**
     * @type {String}
     */
    static CLSID_MSOpusDecoder => "{63e17c10-2d43-4c42-8fe3-8d8b63e46a6a}"

    /**
     * @type {String}
     */
    static CLSID_VideoProcessorMFT => "{88753b26-5b24-49bd-b2e7-0c445c78c982}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_CROSS_ORIGIN_SUPPORT => "{9842207c-b02c-4271-a2fc-72e49308e5c2}"

    /**
     * @type {String}
     */
    static MFNETSOURCE_HTTP_DOWNLOAD_SESSION_PROVIDER => "{7d55081e-307d-4d6d-a663-a93be97c4b5c}"

    /**
     * @type {String}
     */
    static MF_SD_MEDIASOURCE_STATUS => "{1913678b-fc0f-44da-8f43-1ba3b526f4ae}"

    /**
     * @type {String}
     */
    static MF_SD_VIDEO_SPHERICAL => "{a51da449-3fdc-478c-bcb5-30be76595f55}"

    /**
     * @type {String}
     */
    static MF_SD_VIDEO_SPHERICAL_FORMAT => "{4a8fc407-6ea1-46c8-b567-6971d4a139c3}"

    /**
     * @type {String}
     */
    static MF_SD_VIDEO_SPHERICAL_INITIAL_VIEWDIRECTION => "{11d25a49-bb62-467f-9db1-c17165716c49}"

    /**
     * @type {String}
     */
    static MF_MEDIASOURCE_EXPOSE_ALL_STREAMS => "{e7f250b8-8fd9-4a09-b6c1-6a315c7c720e}"

    /**
     * @type {String}
     */
    static MF_ST_MEDIASOURCE_COLLECTION => "{616de972-83ad-4950-8170-630d19cbe307}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_FILTER_KSCONTROL => "{46783cca-3df5-4923-a9ef-36b7223edde0}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_PIN_KSCONTROL => "{ef3ef9a7-87f2-48ca-be02-674878918e98}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_SOURCE_ATTRIBUTES => "{2f8cb617-361b-434f-85ea-99a03e1ce4e0}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_FRAMESERVER_HIDDEN => "{f402567b-4d91-4179-96d1-74c8480c2034}"

    /**
     * @type {String}
     */
    static MF_STF_VERSION_INFO => "{6770bd39-ef82-44ee-a49b-934beb24aef7}"

    /**
     * @type {String}
     */
    static MF_STF_VERSION_DATE => "{31a165d5-df67-4095-8e44-8868fc20dbfd}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_REQUIRED_CAPABILITIES => "{6d8b957e-7cf6-43f4-af56-9c0e1e4fcbe1}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_REQUIRED_SDDL => "{331ae85d-c0d3-49ba-83ba-82a12d63cdd6}"

    /**
     * @type {String}
     */
    static MF_DEVICEMFT_SENSORPROFILE_COLLECTION => "{36ebdc44-b12c-441b-89f4-08b2f41a9cfc}"

    /**
     * @type {String}
     */
    static MF_DEVICESTREAM_SENSORSTREAM_ID => "{e35b9fe4-0659-4cad-bb51-33160be7e413}"

    /**
     * @type {String}
     */
    static KSPROPERTYSETID_ANYCAMERACONTROL => "{94dd0c30-28c7-4efb-9d6b-812300fb0c7f}"

    /**
     * @type {String}
     */
    static CLSID_CameraConfigurationManager => "{6c92b540-5854-4a17-92b6-ac89c96e9683}"

    /**
     * @type {String}
     */
    static CLSID_FaceDetectionMFT => "{c1e565e2-f2de-4537-9612-2f30a160eb5c}"

    /**
     * @type {String}
     */
    static CLSID_FrameServerClassFactory => "{9a93092c-9cdc-49b8-8349-cbcf3145fe0a}"

    /**
     * @type {String}
     */
    static MF_CAMERASOURCE_PROVIDE_SELECTED_PROFILE_ON_START => "{a9b46058-82f2-4e5c-bf6e-25b4b09f22ed}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_FRAMESERVER_SHARE_MODE => "{44d1a9bc-2999-4238-ae43-0730ceb2ab1b}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_FILE_ID => "{3de649b4-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_CREATION_TIME => "{3de649b6-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_PACKETS => "{3de649b7-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_PLAY_DURATION => "{3de649b8-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_SEND_DURATION => "{3de649b9-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_PREROLL => "{3de649ba-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_FLAGS => "{3de649bb-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_MIN_PACKET_SIZE => "{3de649bc-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_MAX_PACKET_SIZE => "{3de649bd-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_FILEPROPERTIES_MAX_BITRATE => "{3de649be-d76d-4e66-9ec9-78120fb4c7e3}"

    /**
     * @type {String}
     */
    static CLSID_WMDRMSystemID => "{8948bb22-11bd-4796-93e3-974d1b575678}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_CONTENTENCRYPTION_TYPE => "{8520fe3d-277e-46ea-99e4-e30a86db12be}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_CONTENTENCRYPTION_KEYID => "{8520fe3e-277e-46ea-99e4-e30a86db12be}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_CONTENTENCRYPTION_SECRET_DATA => "{8520fe3f-277e-46ea-99e4-e30a86db12be}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_CONTENTENCRYPTION_LICENSE_URL => "{8520fe40-277e-46ea-99e4-e30a86db12be}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_CONTENTENCRYPTIONEX_ENCRYPTION_DATA => "{62508be5-ecdf-4924-a359-72bab3397b9d}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_LANGLIST => "{f23de43c-9977-460d-a6ec-32937f160f7d}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_LANGLIST_LEGACYORDER => "{f23de43d-9977-460d-a6ec-32937f160f7d}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_MARKER => "{5134330e-83a6-475e-a9d5-4fb875fb2e31}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_SCRIPT => "{e29cd0d7-d602-4923-a7fe-73fd97ecc650}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_CODECLIST => "{e4bb3509-c18d-4df1-bb99-7a36b3cc4119}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_METADATA_IS_VBR => "{5fc6947a-ef60-445d-b449-442ecc78b4c1}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_METADATA_V8_VBRPEAK => "{5fc6947b-ef60-445d-b449-442ecc78b4c1}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_METADATA_V8_BUFFERAVERAGE => "{5fc6947c-ef60-445d-b449-442ecc78b4c1}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_METADATA_LEAKY_BUCKET_PAIRS => "{5fc6947d-ef60-445d-b449-442ecc78b4c1}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_DATA_START_OFFSET => "{e7d5b3e7-1f29-45d3-8822-3e78fae272ed}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_DATA_LENGTH => "{e7d5b3e8-1f29-45d3-8822-3e78fae272ed}"

    /**
     * @type {String}
     */
    static MF_SD_ASF_EXTSTRMPROP_LANGUAGE_ID_INDEX => "{48f8a522-305d-422d-8524-2502dda33680}"

    /**
     * @type {String}
     */
    static MF_SD_ASF_EXTSTRMPROP_AVG_DATA_BITRATE => "{48f8a523-305d-422d-8524-2502dda33680}"

    /**
     * @type {String}
     */
    static MF_SD_ASF_EXTSTRMPROP_AVG_BUFFERSIZE => "{48f8a524-305d-422d-8524-2502dda33680}"

    /**
     * @type {String}
     */
    static MF_SD_ASF_EXTSTRMPROP_MAX_DATA_BITRATE => "{48f8a525-305d-422d-8524-2502dda33680}"

    /**
     * @type {String}
     */
    static MF_SD_ASF_EXTSTRMPROP_MAX_BUFFERSIZE => "{48f8a526-305d-422d-8524-2502dda33680}"

    /**
     * @type {String}
     */
    static MF_SD_ASF_STREAMBITRATES_BITRATE => "{a8e182ed-afc8-43d0-b0d1-f65bad9da558}"

    /**
     * @type {String}
     */
    static MF_SD_ASF_METADATA_DEVICE_CONFORMANCE_TEMPLATE => "{245e929d-c44e-4f7e-bb3c-77d4dfd27f8a}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_INFO_HAS_AUDIO => "{80e62295-2296-4a44-b31c-d103c6fed23c}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_INFO_HAS_VIDEO => "{80e62296-2296-4a44-b31c-d103c6fed23c}"

    /**
     * @type {String}
     */
    static MF_PD_ASF_INFO_HAS_NON_AUDIO_VIDEO => "{80e62297-2296-4a44-b31c-d103c6fed23c}"

    /**
     * @type {String}
     */
    static MF_ASFPROFILE_MINPACKETSIZE => "{22587626-47de-4168-87f5-b5aa9b12a8f0}"

    /**
     * @type {String}
     */
    static MF_ASFPROFILE_MAXPACKETSIZE => "{22587627-47de-4168-87f5-b5aa9b12a8f0}"

    /**
     * @type {String}
     */
    static MF_ASFSTREAMCONFIG_LEAKYBUCKET1 => "{c69b5901-ea1a-4c9b-b692-e2a0d29a8add}"

    /**
     * @type {String}
     */
    static MF_ASFSTREAMCONFIG_LEAKYBUCKET2 => "{c69b5902-ea1a-4c9b-b692-e2a0d29a8add}"

    /**
     * @type {String}
     */
    static MFASFSampleExtension_SampleDuration => "{c6bd9450-867f-4907-83a3-c77921b733ad}"

    /**
     * @type {String}
     */
    static MFASFSampleExtension_OutputCleanPoint => "{f72a3c6f-6eb4-4ebc-b192-09ad9759e828}"

    /**
     * @type {String}
     */
    static MFASFSampleExtension_SMPTE => "{399595ec-8667-4e2d-8fdb-98814ce76c1e}"

    /**
     * @type {String}
     */
    static MFASFSampleExtension_FileName => "{e165ec0e-19ed-45d7-b4a7-25cbd1e28e9b}"

    /**
     * @type {String}
     */
    static MFASFSampleExtension_ContentType => "{d590dc20-07bc-436c-9cf7-f3bbfbf1a4dc}"

    /**
     * @type {String}
     */
    static MFASFSampleExtension_PixelAspectRatio => "{1b1ee554-f9ea-4bc8-821a-376b74e4c4b8}"

    /**
     * @type {String}
     */
    static MFASFSampleExtension_Encryption_SampleID => "{6698b84e-0afa-4330-aeb2-1c0a98d7a44d}"

    /**
     * @type {String}
     */
    static MFASFSampleExtension_Encryption_KeyID => "{76376591-795f-4da1-86ed-9d46eca109a9}"

    /**
     * @type {String}
     */
    static MFASFMutexType_Language => "{72178c2b-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFASFMutexType_Bitrate => "{72178c2c-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFASFMutexType_Presentation => "{72178c2d-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFASFMutexType_Unknown => "{72178c2e-e45b-11d5-bc2a-00b0d0f3f4ab}"

    /**
     * @type {String}
     */
    static MFASFSPLITTER_PACKET_BOUNDARY => "{fe584a05-e8d6-42e3-b176-f1211705fb6f}"

    /**
     * @type {String}
     */
    static MFASFINDEXER_TYPE_TIMECODE => "{49815231-6bad-44fd-810a-3f60984ec7fd}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_INITIALIZED => "{219992bc-cf92-4531-a1ae-96e1e886c8f1}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_PREVIEW_STARTED => "{a416df21-f9d3-4a74-991b-b817298952c4}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_PREVIEW_STOPPED => "{13d5143c-1edd-4e50-a2ef-350a47678060}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_RECORD_STARTED => "{ac2b027b-ddf9-48a0-89be-38ab35ef45c0}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_RECORD_STOPPED => "{55e5200a-f98f-4c0d-a9ec-9eb25ed3d773}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_PHOTO_TAKEN => "{3c50c445-7304-48eb-865d-bba19ba3af5c}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_SOURCE_CURRENT_DEVICE_MEDIA_TYPE_SET => "{e7e75e4c-039c-4410-815b-8741307b63aa}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_ERROR => "{46b89fc6-33cc-4399-9dad-784de77d587c}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_EFFECT_ADDED => "{aa8dc7b5-a048-4e13-8ebe-f23c46c830c1}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_EFFECT_REMOVED => "{c6e8db07-fb09-4a48-89c6-bf92a04222c9}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_ALL_EFFECTS_REMOVED => "{fded7521-8ed8-431a-a96b-f3e2565e981c}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_SINK_PREPARED => "{7bfce257-12b1-4409-8c34-d445daab7578}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_OUTPUT_MEDIA_TYPE_SET => "{caaad994-83ec-45e9-a30a-1f20aadb9831}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_CAMERA_STREAM_BLOCKED => "{a4209417-8d39-46f3-b759-5912528f4207}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_CAMERA_STREAM_UNBLOCKED => "{9be9eef0-cdaf-4717-8564-834aae66415c}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_D3D_MANAGER => "{76e25e7b-d595-4283-962c-c594afd78ddf}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_RECORD_SINK_VIDEO_MAX_UNPROCESSED_SAMPLES => "{b467f705-7913-4894-9d42-a215fea23da9}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_RECORD_SINK_AUDIO_MAX_UNPROCESSED_SAMPLES => "{1cddb141-a7f4-4d58-9896-4d15a53c4efe}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_RECORD_SINK_VIDEO_MAX_PROCESSED_SAMPLES => "{e7b4a49e-382c-4aef-a946-aed5490b7111}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_RECORD_SINK_AUDIO_MAX_PROCESSED_SAMPLES => "{9896e12a-f707-4500-b6bd-db8eb810b50f}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_USE_AUDIO_DEVICE_ONLY => "{1c8077da-8466-4dc4-8b8e-276b3f85923b}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_USE_VIDEO_DEVICE_ONLY => "{7e025171-cf32-4f2e-8f19-410577b73a66}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_DISABLE_HARDWARE_TRANSFORMS => "{b7c42a6b-3207-4495-b4e7-81f9c35d5991}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_DISABLE_DXVA => "{f9818862-179d-433f-a32f-74cbcf74466d}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_MEDIASOURCE_CONFIG => "{bc6989d2-0fc1-46e1-a74f-efd36bc788de}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_DECODER_MFT_FIELDOFUSE_UNLOCK_Attribute => "{2b8ad2e8-7acb-4321-a606-325c4249f4fc}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_ENCODER_MFT_FIELDOFUSE_UNLOCK_Attribute => "{54c63a00-78d5-422f-aa3e-5e99ac649269}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_ENABLE_CAMERA_STREAMSTATE_NOTIFICATION => "{4c808e9d-aaed-4713-90fb-cb24064ab8da}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_MEDIA_CATEGORY => "{8e3f5bd5-dbbf-42f0-8542-d07a3971762a}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_AUDIO_PROCESSING => "{10f1be5e-7e11-410b-973d-f4b6109000fe}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_EVENT_GENERATOR_GUID => "{abfa8ad5-fc6d-4911-87e0-961945f8f7ce}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_EVENT_STREAM_INDEX => "{82697f44-b1cf-42eb-9753-f86d649c8865}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_SELECTEDCAMERAPROFILE => "{03160b7e-1c6f-4db2-ad56-a7c430f82392}"

    /**
     * @type {String}
     */
    static MF_CAPTURE_ENGINE_SELECTEDCAMERAPROFILE_INDEX => "{3ce88613-2214-46c3-b417-82f8a313c9c3}"

    /**
     * @type {String}
     */
    static CLSID_MFCaptureEngine => "{efce38d3-8914-4674-a7df-ae1b3d654b8a}"

    /**
     * @type {String}
     */
    static CLSID_MFCaptureEngineClassFactory => "{efce38d3-8914-4674-a7df-ae1b3d654b8a}"

    /**
     * @type {String}
     */
    static MFSampleExtension_DeviceReferenceSystemTime => "{6523775a-ba2d-405f-b2c5-01ff88e2e8f6}"

    /**
     * @type {String}
     */
    static MF_D3D12_SYNCHRONIZATION_OBJECT => "{2a7c8d6a-85a6-494d-a046-06ea1a138f4b}"

    /**
     * @type {String}
     */
    static MF_MT_D3D_RESOURCE_VERSION => "{174f1e85-fe26-453d-b52e-5bdd4e55b944}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_CPU_READBACK => "{28ee9fe3-d481-46a6-b98a-7f69d5280e82}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_TEXTURE_LAYOUT => "{97c85caa-0beb-4ee1-9715-f22fad8c10f5}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET => "{eeac2585-3430-498c-84a2-77b1bba570f6}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL => "{b1138dc3-01d5-4c14-9bdc-cdc9336f55b9}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS => "{82c85647-5057-4960-9559-f45b8e271427}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_RESOURCE_FLAG_DENY_SHADER_RESOURCE => "{ba06bfac-ffe3-474a-ab55-161ee4417a2e}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_RESOURCE_FLAG_ALLOW_CROSS_ADAPTER => "{a6a1e439-2f96-4ab5-98dc-adf74973505d}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_RESOURCE_FLAG_ALLOW_SIMULTANEOUS_ACCESS => "{0a4940b2-cfd6-4738-9d02-98113734015a}"

    /**
     * @type {String}
     */
    static MF_MT_D3D12_RESOURCE_DIMENSION => "{5f772624-16ca-4b89-9651-5ddf769f8ab8}"

    /**
     * @type {String}
     */
    static MF_SA_D3D12_HEAP_FLAGS => "{496b3266-d28f-4f8c-93a7-4a596b1a31a1}"

    /**
     * @type {String}
     */
    static MF_SA_D3D12_HEAP_TYPE => "{56f26a76-bbc1-4ce0-bb11-e22368d874ed}"

    /**
     * @type {String}
     */
    static MF_SA_D3D12_CLEAR_VALUE => "{86ba9a39-0526-495d-9ab5-54ec9fad6fc3}"

    /**
     * @type {String}
     */
    static MF_SA_D3D12_AWARE => "{77f0bacb-17a8-4a50-9a7d-a5cc09d39d44}"

    /**
     * @type {String}
     */
    static MF_MSE_CALLBACK => "{9063a7c0-42c5-4ffd-a8a8-6fcf9ea3d00c}"

    /**
     * @type {String}
     */
    static MF_MSE_ACTIVELIST_CALLBACK => "{949bda0f-4549-46d5-ad7f-b846e1ab1652}"

    /**
     * @type {String}
     */
    static MF_MSE_BUFFERLIST_CALLBACK => "{42e669b0-d60e-4afb-a85b-d8e5fe6bdab5}"

    /**
     * @type {String}
     */
    static MF_MSE_VP9_SUPPORT => "{92d78429-d88b-4ff0-8322-803efa6e9626}"

    /**
     * @type {String}
     */
    static MF_MSE_OPUS_SUPPORT => "{4d224cc1-8cc4-48a3-a7a7-e4c16ce6388a}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_NEEDKEY_CALLBACK => "{7ea80843-b6e4-432c-8ea4-7848ffe4220e}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_CALLBACK => "{c60381b8-83a4-41f8-a3d0-de05076849a9}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_DXGI_MANAGER => "{065702da-1094-486d-8617-ee7cc4ee4648}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_EXTENSION => "{3109fd46-060d-4b62-8dcf-faff811318d2}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_PLAYBACK_HWND => "{d988879b-67c9-4d92-baa7-6eadd446039d}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_OPM_HWND => "{a0be8ee7-0572-4f2c-a801-2a151bd3e726}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_PLAYBACK_VISUAL => "{6debd26f-6ab9-4d7e-b0ee-c61a73ffad15}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_COREWINDOW => "{fccae4dc-0b7f-41c2-9f96-4659948acddc}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_VIDEO_OUTPUT_FORMAT => "{5066893c-8cf9-42bc-8b8a-472212e52726}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_CONTENT_PROTECTION_FLAGS => "{e0350223-5aaf-4d76-a7c3-06de70894db4}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_CONTENT_PROTECTION_MANAGER => "{fdd6dfaa-bd85-4af3-9e0f-a01d539d876a}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_AUDIO_ENDPOINT_ROLE => "{d2cb93d1-116a-44f2-9385-f7d0fda2fb46}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_AUDIO_CATEGORY => "{c8d4c51d-350e-41f2-ba46-faebbb0857f6}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_STREAM_CONTAINS_ALPHA_CHANNEL => "{5cbfaf44-d2b2-4cfb-80a7-d429c74c789d}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE => "{4e0212e2-e18f-41e1-95e5-c0e7e9235bc3}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE_IE9 => "{052c2d39-40c0-4188-ab86-f828273b7522}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE_IE10 => "{11a47afd-6589-4124-b312-6158ec517fc3}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE_IE11 => "{1cf1315f-ce3f-4035-9391-16142f775189}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_BROWSER_COMPATIBILITY_MODE_IE_EDGE => "{a6f3e465-3aca-442c-a3f0-ad6ddad839ae}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_COMPATIBILITY_MODE => "{3ef26ad4-dc54-45de-b9af-76c8c66bfa8e}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_COMPATIBILITY_MODE_WWA_EDGE => "{15b29098-9f01-4e4d-b65a-c06c6c89da2a}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_COMPATIBILITY_MODE_WIN10 => "{5b25e089-6ca7-4139-a2cb-fcaab39552a3}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_SOURCE_RESOLVER_CONFIG_STORE => "{0ac0c497-b3c4-48c9-9cde-bb8ca2442ca3}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_TRACK_ID => "{65bea312-4043-4815-8eab-44dce2ef8f2a}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_TELEMETRY_APPLICATION_ID => "{1e7b273b-a7e4-402a-8f51-c48e88a2cabc}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_SYNCHRONOUS_CLOSE => "{c3c2e12f-7e0e-4e43-b91c-dc992ccdfa5e}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_MEDIA_PLAYER_MODE => "{3ddd8d45-5aa1-4112-82e5-36f6a2197e6e}"

    /**
     * @type {String}
     */
    static CLSID_MFMediaEngineClassFactory => "{b44392da-499b-446b-a4cb-005fead0e6d5}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_TIMEDTEXT => "{805ea411-92e0-4e59-9b6e-5c7d7915e64f}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_CONTINUE_ON_CODEC_ERROR => "{dbcdb7f9-48e4-4295-b70d-d518234eeb38}"

    /**
     * @type {String}
     */
    static MF_MEDIA_ENGINE_EME_CALLBACK => "{494553a7-a481-4cb7-bec5-380903513731}"

    /**
     * @type {String}
     */
    static CLSID_MPEG2DLNASink => "{fa5fe7c5-6a1d-4b11-b41f-f959d6c76500}"

    /**
     * @type {String}
     */
    static MF_MP2DLNA_USE_MMCSS => "{54f3e2ee-a2a2-497d-9834-973afde521eb}"

    /**
     * @type {String}
     */
    static MF_MP2DLNA_VIDEO_BIT_RATE => "{e88548de-73b4-42d7-9c75-adfa0a2a6e4c}"

    /**
     * @type {String}
     */
    static MF_MP2DLNA_AUDIO_BIT_RATE => "{2d1c070e-2b5f-4ab3-a7e6-8d943ba8d00a}"

    /**
     * @type {String}
     */
    static MF_MP2DLNA_ENCODE_QUALITY => "{b52379d7-1d46-4fb6-a317-a4a5f60959f8}"

    /**
     * @type {String}
     */
    static MF_MP2DLNA_STATISTICS => "{75e488a3-d5ad-4898-85e0-bcce24a722d7}"

    /**
     * @type {String}
     */
    static CLSID_MFReadWriteClassFactory => "{48e2ed0f-98c2-4a37-bed5-166312ddd83f}"

    /**
     * @type {String}
     */
    static CLSID_MFSourceReader => "{1777133c-0881-411b-a577-ad545f0714c4}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_ASYNC_CALLBACK => "{1e3dbeac-bb43-4c35-b507-cd644464c965}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_D3D_MANAGER => "{ec822da2-e1e9-4b29-a0d8-563c719f5269}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_DISABLE_DXVA => "{aa456cfd-3943-4a1e-a77d-1838c0ea2e35}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_MEDIASOURCE_CONFIG => "{9085abeb-0354-48f9-abb5-200df838c68e}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_MEDIASOURCE_CHARACTERISTICS => "{6d23f5c8-c5d7-4a9b-9971-5d11f8bca880}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING => "{fb394f3d-ccf1-42ee-bbb3-f9b845d5681d}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_ENABLE_ADVANCED_VIDEO_PROCESSING => "{0f81da2c-b537-4672-a8b2-a681b17307a3}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_DISABLE_CAMERA_PLUGINS => "{9d3365dd-058f-4cfb-9f97-b314cc99c8ad}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_DISCONNECT_MEDIASOURCE_ON_SHUTDOWN => "{56b67165-219e-456d-a22e-2d3004c7fe56}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_ENABLE_TRANSCODE_ONLY_TRANSFORMS => "{dfd4f008-b5fd-4e78-ae44-62a1e67bbe27}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_D3D11_BIND_FLAGS => "{33f3197b-f73a-4e14-8d85-0e4c4368788d}"

    /**
     * @type {String}
     */
    static MF_SOURCE_READER_PASSTHROUGH_MODE => "{043ff126-fe2c-4708-a09b-da2ab435ced9}"

    /**
     * @type {String}
     */
    static CLSID_MFSinkWriter => "{a3bbfb17-8273-4e52-9e0e-9739dc887990}"

    /**
     * @type {String}
     */
    static MF_SINK_WRITER_ASYNC_CALLBACK => "{48cb183e-7b0b-46f4-822e-5e1d2dda4354}"

    /**
     * @type {String}
     */
    static MF_SINK_WRITER_DISABLE_THROTTLING => "{08b845d8-2b74-4afe-9d53-be16d2d5ae4f}"

    /**
     * @type {String}
     */
    static MF_SINK_WRITER_D3D_MANAGER => "{ec822da2-e1e9-4b29-a0d8-563c719f5269}"

    /**
     * @type {String}
     */
    static MF_SINK_WRITER_ENCODER_CONFIG => "{ad91cd04-a7cc-4ac7-99b6-a57b9a4a7c70}"

    /**
     * @type {String}
     */
    static MF_READWRITE_DISABLE_CONVERTERS => "{98d5b065-1374-4847-8d5d-31520fee7156}"

    /**
     * @type {String}
     */
    static MF_READWRITE_ENABLE_HARDWARE_TRANSFORMS => "{a634a91c-822b-41b9-a494-4de4643612b0}"

    /**
     * @type {String}
     */
    static MF_READWRITE_MMCSS_CLASS => "{39384300-d0eb-40b1-87a0-3318871b5a53}"

    /**
     * @type {String}
     */
    static MF_READWRITE_MMCSS_PRIORITY => "{43ad19ce-f33f-4ba9-a580-e4cd12f2d144}"

    /**
     * @type {String}
     */
    static MF_READWRITE_MMCSS_CLASS_AUDIO => "{430847da-0890-4b0e-938c-054332c547e1}"

    /**
     * @type {String}
     */
    static MF_READWRITE_MMCSS_PRIORITY_AUDIO => "{273db885-2de2-4db2-a6a7-fdb66fb40b61}"

    /**
     * @type {String}
     */
    static MF_READWRITE_D3D_OPTIONAL => "{216479d9-3071-42ca-bb6c-4c22102e1d18}"

    /**
     * @type {String}
     */
    static MF_MEDIASINK_AUTOFINALIZE_SUPPORTED => "{48c131be-135a-41cb-8290-03652509c999}"

    /**
     * @type {String}
     */
    static MF_MEDIASINK_ENABLE_AUTOFINALIZE => "{34014265-cb7e-4cde-ac7c-effd3b3c2530}"

    /**
     * @type {String}
     */
    static MF_READWRITE_ENABLE_AUTOFINALIZE => "{dd7ca129-8cd1-4dc5-9dde-ce168675de61}"

    /**
     * @type {String}
     */
    static MFP_POSITIONTYPE_100NS => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static MF_MEDIA_SHARING_ENGINE_DEVICE_NAME => "{771e05d1-862f-4299-95ac-ae81fd14f3e7}"

    /**
     * @type {String}
     */
    static MF_MEDIA_SHARING_ENGINE_DEVICE => "{b461c58a-7a08-4b98-99a8-70fd5f3badfd}"

    /**
     * @type {String}
     */
    static CLSID_MFMediaSharingEngineClassFactory => "{f8e307fb-6d45-4ad3-9993-66cd5a529659}"

    /**
     * @type {String}
     */
    static CLSID_MFImageSharingEngineClassFactory => "{b22c3339-87f3-4059-a0c5-037aa9707eaf}"

    /**
     * @type {String}
     */
    static CLSID_PlayToSourceClassFactory => "{da17539a-3dc3-42c1-a749-a183b51f085e}"

    /**
     * @type {String}
     */
    static GUID_PlayToService => "{f6a8ff9d-9e14-41c9-bf0f-120a2b3ce120}"

    /**
     * @type {String}
     */
    static GUID_NativeDeviceService => "{ef71e53c-52f4-43c5-b86a-ad6cb216a61e}"

    /**
     * @type {String}
     */
    static MF_CONTENTDECRYPTIONMODULE_SERVICE => "{15320c45-ff80-484a-9dcb-0df894e69a01}"

    /**
     * @type {String}
     */
    static MF_DEVSOURCE_ATTRIBUTE_ENABLE_MS_CAMERA_EFFECTS => "{28a5531a-57dd-4fd5-aaa7-385abf57d785}"

    /**
     * @type {String}
     */
    static MF_VIRTUALCAMERA_ASSOCIATED_CAMERA_SOURCES => "{1bb79e7c-5d83-438c-94d8-e5f0df6d3279}"

    /**
     * @type {String}
     */
    static MF_VIRTUALCAMERA_PROVIDE_ASSOCIATED_CAMERA_SOURCES => "{f0273718-4a4d-4ac5-a15d-305eb5e90667}"

    /**
     * @type {String}
     */
    static MF_VIRTUALCAMERA_CONFIGURATION_APP_PACKAGE_FAMILY_NAME => "{658abe51-8044-462e-97ea-e676fd72055f}"

    /**
     * @type {String}
     */
    static MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_INITIALIZE => "{e52c4dff-e46d-4d0b-bc75-ddd4c8723f96}"

    /**
     * @type {String}
     */
    static MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_START => "{b1eeb989-b456-4f4a-ae40-079c28e24af8}"

    /**
     * @type {String}
     */
    static MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_STOP => "{b7fe7a61-fe91-415e-8608-d37dedb1a58b}"

    /**
     * @type {String}
     */
    static MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_UNINITIALIZE => "{a0ebaba7-a422-4e33-8401-b37d2800aa67}"

    /**
     * @type {String}
     */
    static MF_FRAMESERVER_VCAMEVENT_EXTENDED_PIPELINE_SHUTDOWN => "{45a81b31-43f8-4e5d-8ce2-22dce026996d}"

    /**
     * @type {String}
     */
    static MF_FRAMESERVER_VCAMEVENT_EXTENDED_CUSTOM_EVENT => "{6e59489c-47d3-4467-83ef-12d34e871665}"
;@endregion Constants

;@region Methods
    /**
     * Creates a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
     * @param {IDirect3DDevice9Ex} pD3DDevice A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3ddevice9ex">IDirect3DDevice9Ex</a> interface of a Direct3D 9 device.
     * @param {Pointer<DXVAHD_CONTENT_DESC>} pContentDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_content_desc">DXVAHD_CONTENT_DESC</a> structure that describes the video content. The driver uses this information as a hint when it creates the device.
     * @param {Integer} Usage A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_usage">DXVAHD_DEVICE_USAGE</a> enumeration, describing how the device will be used. The value indicates the desired trade-off between speed and video quality. The driver uses this flag as a hint when it creates the device.
     * @param {Pointer<PDXVAHDSW_Plugin>} pPlugin A pointer to an initialization function for a software device. Set this pointer if you are using a software plug-in device. Otherwise, set this parameter to <b>NULL</b>. If the value is <b>NULL</b>, the driver creates the DXVA-HD device.
     * 
     * The function pointer type is <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nc-dxvahd-pdxvahdsw_plugin">PDXVAHDSW_Plugin</a>.
     * @param {Pointer<IDXVAHD_Device>} ppDevice Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nn-dxvahd-idxvahd_device">IDXVAHD_Device</a> interface. The caller must release the interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Direct3D device does not support DXVA-HD.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nf-dxvahd-dxvahd_createdevice
     * @since windows6.1
     */
    static DXVAHD_CreateDevice(pD3DDevice, pContentDesc, Usage, pPlugin, ppDevice) {
        result := DllCall("dxva2.dll\DXVAHD_CreateDevice", "ptr", pD3DDevice, "ptr", pContentDesc, "int", Usage, "ptr", pPlugin, "ptr*", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the Direct3D Device Manager.
     * @param {Pointer<Integer>} pResetToken Receives a token that identifies this instance of the Direct3D device manager. Use this token when calling <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice">IDirect3DDeviceManager9::ResetDevice</a>.
     * @param {Pointer<IDirect3DDeviceManager9>} ppDeviceManager Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirect3ddevicemanager9">IDirect3DDeviceManager9</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-dxva2createdirect3ddevicemanager9
     * @since windows6.0.6000
     */
    static DXVA2CreateDirect3DDeviceManager9(pResetToken, ppDeviceManager) {
        result := DllCall("dxva2.dll\DXVA2CreateDirect3DDeviceManager9", "uint*", pResetToken, "ptr*", ppDeviceManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a DirectX Video Acceleration (DXVA) services object.
     * @param {IDirect3DDevice9} pDD A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface of a Direct3D device.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the requested interface. Any of the following interfaces might be supported by the Direct3D device:
     *           
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoaccelerationservice">IDirectXVideoAccelerationService</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoderservice">IDirectXVideoDecoderService</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessorservice">IDirectXVideoProcessorService</a>
     * </li>
     * </ul>
     * @param {Pointer<Pointer<Void>>} ppService Receives a pointer to the interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-dxva2createvideoservice
     * @since windows6.0.6000
     */
    static DXVA2CreateVideoService(pDD, riid, ppService) {
        result := DllCall("dxva2.dll\DXVA2CreateVideoService", "ptr", pDD, "ptr", riid, "ptr*", ppService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an Output Protection Manager (OPM) object for each physical monitor that is associated with a particular HMONITOR handle.
     * @param {HMONITOR} hMonitor The monitor handle for which to create OPM objects. There are several functions that return <b>HMONITOR</b> values. For more information, see the topic <a href="https://docs.microsoft.com/windows/desktop/gdi/multiple-display-monitors-functions">Multiple Display Monitors Functions</a> in the Windows graphics device interface (GDI) documentation.
     * @param {Integer} vos A member of the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_video_output_semantics">OPM_VIDEO_OUTPUT_SEMANTICS</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_VOS_OPM_SEMANTICS"></a><a id="opm_vos_opm_semantics"></a><dl>
     * <dt><b>OPM_VOS_OPM_SEMANTICS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers will use OPM semantics.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_VOS_COPP_SEMANTICS"></a><a id="opm_vos_copp_semantics"></a><dl>
     * <dt><b>OPM_VOS_COPP_SEMANTICS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers will use Certified Output Protection Protocol (COPP) semantics.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pulNumVideoOutputs Receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers returned in the <i>pppOPMVideoOutputArray</i> parameter.
     * @param {Pointer<Pointer<IOPMVideoOutput>>} pppOPMVideoOutputArray Receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers. Each <b>IOPMVideoOutput</b> pointer is associated with a single physical monitor. The caller must release each pointer in the array, and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the array.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//opmapi/nf-opmapi-opmgetvideooutputsfromhmonitor
     * @since windows6.0.6000
     */
    static OPMGetVideoOutputsFromHMONITOR(hMonitor, vos, pulNumVideoOutputs, pppOPMVideoOutputArray) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := DllCall("dxva2.dll\OPMGetVideoOutputsFromHMONITOR", "ptr", hMonitor, "int", vos, "uint*", pulNumVideoOutputs, "ptr*", pppOPMVideoOutputArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns a video output object for the VidPN target on the specified adapter.
     * @param {Pointer<LUID>} pAdapterLuid The LUID for the adapter where the target is located.
     * @param {Integer} VidPnTarget Target ID for the target on the specified adapter adapter.
     * @param {Integer} vos A member of the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_video_output_semantics">OPM_VIDEO_OUTPUT_SEMANTICS</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_VOS_OPM_SEMANTICS"></a><a id="opm_vos_opm_semantics"></a><dl>
     * <dt><b>OPM_VOS_OPM_SEMANTICS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointer will use OPM semantics.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_VOS_COPP_SEMANTICS"></a><a id="opm_vos_copp_semantics"></a><dl>
     * <dt><b>OPM_VOS_COPP_SEMANTICS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointer will use Certified Output Protection Protocol (COPP) semantics.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<IOPMVideoOutput>} ppOPMVideoOutput Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointer. The caller must release this  pointer.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//opmapi/nf-opmapi-opmgetvideooutputfortarget
     * @since windows6.0.6000
     */
    static OPMGetVideoOutputForTarget(pAdapterLuid, VidPnTarget, vos, ppOPMVideoOutput) {
        result := DllCall("dxva2.dll\OPMGetVideoOutputForTarget", "ptr", pAdapterLuid, "uint", VidPnTarget, "int", vos, "ptr*", ppOPMVideoOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an Output Protection Manager (OPM) object for each physical monitor that is associated with a particular Direct3D device.
     * @param {IDirect3DDevice9} pDirect3DDevice9 Pointer to the <b>IDirect3DDevice9</b> interface of a Direct3D device.
     * @param {Integer} vos A member of the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_video_output_semantics">OPM_VIDEO_OUTPUT_SEMANTICS</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_VOS_OPM_SEMANTICS"></a><a id="opm_vos_opm_semantics"></a><dl>
     * <dt><b>OPM_VOS_OPM_SEMANTICS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers will use OPM semantics.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_VOS_COPP_SEMANTICS"></a><a id="opm_vos_copp_semantics"></a><dl>
     * <dt><b>OPM_VOS_COPP_SEMANTICS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers will use Certified Output Protection Protocol (COPP) semantics.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pulNumVideoOutputs Receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers returned in the <i>pppOPMVideoOutputArray</i> parameter.
     * @param {Pointer<Pointer<IOPMVideoOutput>>} pppOPMVideoOutputArray Receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nn-opmapi-iopmvideooutput">IOPMVideoOutput</a> pointers. Each <b>IOPMVideoOutput</b> pointer is associated with a single physical monitor. The caller must release each pointer in the array, and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the array.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//opmapi/nf-opmapi-opmgetvideooutputsfromidirect3ddevice9object
     * @since windows6.0.6000
     */
    static OPMGetVideoOutputsFromIDirect3DDevice9Object(pDirect3DDevice9, vos, pulNumVideoOutputs, pppOPMVideoOutputArray) {
        result := DllCall("dxva2.dll\OPMGetVideoOutputsFromIDirect3DDevice9Object", "ptr", pDirect3DDevice9, "int", vos, "uint*", pulNumVideoOutputs, "ptr*", pppOPMVideoOutputArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes the contents of an attribute store to a stream.
     * @param {IMFAttributes} pAttr Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
     * @param {Integer} dwOptions Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_serialize_options">MF_ATTRIBUTE_SERIALIZE_OPTIONS</a> enumeration.
     * @param {IStream} pStm Pointer to the <b>IStream</b> interface of the stream where the attributes are saved.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-mfserializeattributestostream
     * @since windows6.0.6000
     */
    static MFSerializeAttributesToStream(pAttr, dwOptions, pStm) {
        result := DllCall("MFPlat.dll\MFSerializeAttributesToStream", "ptr", pAttr, "uint", dwOptions, "ptr", pStm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Loads attributes from a stream into an attribute store.
     * @param {IMFAttributes} pAttr Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
     * @param {Integer} dwOptions Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mf_attribute_serialize_options">MF_ATTRIBUTE_SERIALIZE_OPTIONS</a> enumeration.
     * @param {IStream} pStm Pointer to the <b>IStream</b> interface of the stream from which to read the attributes.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nf-mfobjects-mfdeserializeattributesfromstream
     * @since windows6.0.6000
     */
    static MFDeserializeAttributesFromStream(pAttr, dwOptions, pStm) {
        result := DllCall("MFPlat.dll\MFDeserializeAttributesFromStream", "ptr", pAttr, "uint", dwOptions, "ptr", pStm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a generic activation object for Media Foundation transforms (MFTs).
     * @param {Pointer<IMFActivate>} ppActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface.
     *           The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-mfcreatetransformactivate
     * @since windows6.1
     */
    static MFCreateTransformActivate(ppActivate) {
        result := DllCall("MFPlat.dll\MFCreateTransformActivate", "ptr*", ppActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the Media Session in the application's process.
     * @param {IMFAttributes} pConfiguration Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. This parameter can be <b>NULL</b>. See Remarks.
     * @param {Pointer<IMFMediaSession>} ppMediaSession Receives a pointer to the Media Session's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasession">IMFMediaSession</a> interface. The caller must release the interface. Before releasing the last reference to the <b>IMFMediaSession</b> pointer, the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-shutdown">IMFMediaSession::Shutdown</a> method.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatemediasession
     * @since windows6.0.6000
     */
    static MFCreateMediaSession(pConfiguration, ppMediaSession) {
        result := DllCall("MF.dll\MFCreateMediaSession", "ptr", pConfiguration, "ptr*", ppMediaSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the Media Session inside a Protected Media Path (PMP) process.
     * @param {Integer} dwCreationFlags A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpmpsession_creation_flags">MFPMPSESSION_CREATION_FLAGS</a> enumeration that specifies how to create the session object.
     * @param {IMFAttributes} pConfiguration A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. This parameter can be <b>NULL</b>. See Remarks.
     * @param {Pointer<IMFMediaSession>} ppMediaSession Receives a pointer to the PMP Media Session's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasession">IMFMediaSession</a> interface. The caller must release the interface. Before releasing the last reference to the <b>IMFMediaSession</b> pointer, the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-shutdown">IMFMediaSession::Shutdown</a> method.
     * @param {Pointer<IMFActivate>} ppEnablerActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface or the value <b>NULL</b>. If non-<b>NULL</b>, the caller must release the interface. See Remarks.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatepmpmediasession
     * @since windows6.0.6000
     */
    static MFCreatePMPMediaSession(dwCreationFlags, pConfiguration, ppMediaSession, ppEnablerActivate) {
        result := DllCall("MF.dll\MFCreatePMPMediaSession", "uint", dwCreationFlags, "ptr", pConfiguration, "ptr*", ppMediaSession, "ptr*", ppEnablerActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the source resolver, which is used to create a media source from a URL or byte stream.
     * @param {Pointer<IMFSourceResolver>} ppISourceResolver Receives a pointer to the source resolver's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsourceresolver">IMFSourceResolver</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesourceresolver
     * @since windows6.0.6000
     */
    static MFCreateSourceResolver(ppISourceResolver) {
        result := DllCall("MFPlat.dll\MFCreateSourceResolver", "ptr*", ppISourceResolver, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an empty property store object.
     * @param {Pointer<IPropertyStore>} ppStore Receives a pointer to the <b>IPropertyStore</b> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-createpropertystore
     * @since windows6.0.6000
     */
    static CreatePropertyStore(ppStore) {
        result := DllCall("MFPlat.dll\CreatePropertyStore", "ptr*", ppStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the URL schemes that are registered for the source resolver.
     * @param {Pointer<PROPVARIANT>} pPropVarSchemeArray Pointer to a <b>PROPVARIANT</b> that receives the URL schemes. Before calling this method, call <b>PropVariantInit</b> to initialize the <b>PROPVARIANT</b>. If the method succeeds, the <b>PROPVARIANT</b> contains an array of wide-character strings. The <b>PROPVARIANT</b> data type is VT_VECTOR | VT_LPWSTR. The caller must release the <b>PROPVARIANT</b> by calling <b>PropVariantClear</b>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfgetsupportedschemes
     * @since windows6.0.6000
     */
    static MFGetSupportedSchemes(pPropVarSchemeArray) {
        result := DllCall("MFPlat.dll\MFGetSupportedSchemes", "ptr", pPropVarSchemeArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the MIME types that are registered for the source resolver.
     * @param {Pointer<PROPVARIANT>} pPropVarMimeTypeArray Pointer to a <b>PROPVARIANT</b> that receives the MIME types. Before calling this method, call <b>PropVariantInit</b> to initialize the <b>PROPVARIANT</b>. If the method succeeds, the <b>PROPVARIANT</b> contains an array of wide-character strings. The <b>PROPVARIANT</b> data type is VT_VECTOR | VT_LPWSTR. The caller must release the <b>PROPVARIANT</b> by calling <b>PropVariantClear</b>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfgetsupportedmimetypes
     * @since windows6.0.6000
     */
    static MFGetSupportedMimeTypes(pPropVarMimeTypeArray) {
        result := DllCall("MFPlat.dll\MFGetSupportedMimeTypes", "ptr", pPropVarMimeTypeArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a topology object.
     * @param {Pointer<IMFTopology>} ppTopo Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology object. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatetopology
     * @since windows6.0.6000
     */
    static MFCreateTopology(ppTopo) {
        result := DllCall("MF.dll\MFCreateTopology", "ptr*", ppTopo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a topology node.
     * @param {Integer} NodeType The type of node to create, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_topology_type">MF_TOPOLOGY_TYPE</a> enumeration.
     * @param {Pointer<IMFTopologyNode>} ppNode Receives a pointer to the node's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatetopologynode
     * @since windows6.0.6000
     */
    static MFCreateTopologyNode(NodeType, ppNode) {
        result := DllCall("MF.dll\MFCreateTopologyNode", "int", NodeType, "ptr*", ppNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the media type for a stream associated with a topology node.
     * @param {IMFTopologyNode} pNode A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface.
     * @param {Integer} dwStreamIndex The identifier of the stream to query. This parameter is interpreted as follows:
     * 
     * <ul>
     * <li>Transform nodes: The value is the zero-based index of the input or output stream.</li>
     * <li>All other node types: The value must be zero.</li>
     * </ul>
     * @param {BOOL} fOutput <b>If TRUE</b>, the function gets an output type<b>. If FALSE</b>, the function gets an input type. This parameter is interpreted as follows:
     * 
     * <ul>
     * <li>Output nodes: The value must be <b>TRUE</b>.</li>
     * <li>Source nodes: The value must be <b>FALSE</b>.</li>
     * <li>Tee nodes: The value is ignored.</li>
     * <li>Transform nodes: If the value is <b>TRUE</b>, the <i>dwStreamIndex</i> parameter is the index for an output stream. Otherwise, <i>dwStreamIndex</i> is the index for an input stream.</li>
     * </ul>
     * @param {Pointer<IMFMediaType>} ppType Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream index is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfgettoponodecurrenttype
     * @since windows6.1
     */
    static MFGetTopoNodeCurrentType(pNode, dwStreamIndex, fOutput, ppType) {
        result := DllCall("MF.dll\MFGetTopoNodeCurrentType", "ptr", pNode, "uint", dwStreamIndex, "int", fOutput, "ptr*", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Queries an object for a specified service interface.
     * @param {IUnknown} punkObject A pointer to the <b>IUnknown</b> interface of the object to query.
     * @param {Pointer<Guid>} guidService The service identifier (SID) of the service. For a list of service identifiers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/service-interfaces">Service Interfaces</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @param {Pointer<Pointer<Void>>} ppvObject Receives the interface pointer. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service requested cannot be found in the object represented by <i>punkObject</i>.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfgetservice
     * @since windows6.0.6000
     */
    static MFGetService(punkObject, guidService, riid, ppvObject) {
        result := DllCall("MF.dll\MFGetService", "ptr", punkObject, "ptr", guidService, "ptr", riid, "ptr*", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the system time.
     * @returns {Integer} Returns the system time, in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfgetsystemtime
     * @since windows6.0.6000
     */
    static MFGetSystemTime() {
        result := DllCall("MFPlat.dll\MFGetSystemTime", "int64")
        return result
    }

    /**
     * Creates the presentation clock.
     * @param {Pointer<IMFPresentationClock>} ppPresentationClock Receives a pointer to the clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatepresentationclock
     * @since windows6.0.6000
     */
    static MFCreatePresentationClock(ppPresentationClock) {
        result := DllCall("MF.dll\MFCreatePresentationClock", "ptr*", ppPresentationClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a presentation time source that is based on the system time.
     * @param {Pointer<IMFPresentationTimeSource>} ppSystemTimeSource Receives a pointer to the object's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationtimesource">IMFPresentationTimeSource</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesystemtimesource
     * @since windows6.0.6000
     */
    static MFCreateSystemTimeSource(ppSystemTimeSource) {
        result := DllCall("MFPlat.dll\MFCreateSystemTimeSource", "ptr*", ppSystemTimeSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a presentation descriptor.
     * @param {Integer} cStreamDescriptors Number of elements in the <i>apStreamDescriptors</i> array.
     * @param {Pointer<IMFStreamDescriptor>} apStreamDescriptors Array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamdescriptor">IMFStreamDescriptor</a> interface pointers. Each pointer represents a stream descriptor for one stream in the presentation.
     * @param {Pointer<IMFPresentationDescriptor>} ppPresentationDescriptor Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatepresentationdescriptor
     * @since windows6.0.6000
     */
    static MFCreatePresentationDescriptor(cStreamDescriptors, apStreamDescriptors, ppPresentationDescriptor) {
        result := DllCall("MFPlat.dll\MFCreatePresentationDescriptor", "uint", cStreamDescriptors, "ptr*", apStreamDescriptors, "ptr*", ppPresentationDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Queries whether a media presentation requires the Protected Media Path (PMP).
     * @param {IMFPresentationDescriptor} pPresentationDescriptor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of a presentation descriptor. The presentation descriptor is created by the media source, and describes the presentation.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This presentation requires a protected environment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This presentation does not require a protected environment.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfrequireprotectedenvironment
     * @since windows6.0.6000
     */
    static MFRequireProtectedEnvironment(pPresentationDescriptor) {
        result := DllCall("MF.dll\MFRequireProtectedEnvironment", "ptr", pPresentationDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Serializes a presentation descriptor to a byte array.
     * @param {IMFPresentationDescriptor} pPD Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor to serialize.
     * @param {Pointer<Integer>} pcbData Receives the size of the <i>ppbData</i> array, in bytes.
     * @param {Pointer<Pointer<Integer>>} ppbData Receives a pointer to an array of bytes containing the serialized presentation descriptor. The caller must free the memory for the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfserializepresentationdescriptor
     * @since windows6.0.6000
     */
    static MFSerializePresentationDescriptor(pPD, pcbData, ppbData) {
        result := DllCall("MFPlat.dll\MFSerializePresentationDescriptor", "ptr", pPD, "uint*", pcbData, "ptr*", ppbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deserializes a presentation descriptor from a byte array.
     * @param {Integer} cbData Size of the <i>pbData</i> array, in bytes.
     * @param {Pointer<Integer>} pbData Pointer to an array of bytes that contains the serialized presentation descriptor.
     * @param {Pointer<IMFPresentationDescriptor>} ppPD Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfdeserializepresentationdescriptor
     * @since windows6.0.6000
     */
    static MFDeserializePresentationDescriptor(cbData, pbData, ppPD) {
        result := DllCall("MFPlat.dll\MFDeserializePresentationDescriptor", "uint", cbData, "char*", pbData, "ptr*", ppPD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a stream descriptor.
     * @param {Integer} dwStreamIdentifier Stream identifier.
     * @param {Integer} cMediaTypes Number of elements in the <i>apMediaTypes</i> array.
     * @param {Pointer<IMFMediaType>} apMediaTypes Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface pointers. These pointers are used to initialize the media type handler for the stream descriptor.
     * @param {Pointer<IMFStreamDescriptor>} ppDescriptor Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamdescriptor">IMFStreamDescriptor</a> interface of the new stream descriptor. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatestreamdescriptor
     * @since windows6.0.6000
     */
    static MFCreateStreamDescriptor(dwStreamIdentifier, cMediaTypes, apMediaTypes, ppDescriptor) {
        result := DllCall("MFPlat.dll\MFCreateStreamDescriptor", "uint", dwStreamIdentifier, "uint", cMediaTypes, "ptr*", apMediaTypes, "ptr*", ppDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media-type handler that supports a single media type at a time.
     * @param {Pointer<IMFMediaTypeHandler>} ppHandler Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediatypehandler">IMFMediaTypeHandler</a> interface of the media-type handler. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesimpletypehandler
     * @since windows6.0.6000
     */
    static MFCreateSimpleTypeHandler(ppHandler) {
        result := DllCall("MF.dll\MFCreateSimpleTypeHandler", "ptr*", ppHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Shuts down a Media Foundation object and releases all resources associated with the object.
     * @param {IUnknown} pUnk Pointer to the <b>IUnknown</b> interface of the object.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfshutdownobject
     * @since windows6.0.6000
     */
    static MFShutdownObject(pUnk) {
        result := DllCall("MF.dll\MFShutdownObject", "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the Streaming Audio Renderer.
     * @param {IMFAttributes} pAudioAttributes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface, which is used to configure the audio renderer. This parameter can be <b>NULL</b>. See Remarks.
     * @param {Pointer<IMFMediaSink>} ppSink Receives a pointer to the audio renderer's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateaudiorenderer
     * @since windows6.0.6000
     */
    static MFCreateAudioRenderer(pAudioAttributes, ppSink) {
        result := DllCall("MF.dll\MFCreateAudioRenderer", "ptr", pAudioAttributes, "ptr*", ppSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object for the Streaming Audio Renderer.
     * @param {Pointer<IMFActivate>} ppActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to create the audio renderer. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateaudiorendereractivate
     * @since windows6.0.6000
     */
    static MFCreateAudioRendererActivate(ppActivate) {
        result := DllCall("MF.dll\MFCreateAudioRendererActivate", "ptr*", ppActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object for the enhanced video renderer (EVR) media sink.
     * @param {HWND} hwndVideo Handle to the window where the video will be displayed.
     * @param {Pointer<IMFActivate>} ppActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to create the EVR. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatevideorendereractivate
     * @since windows6.0.6000
     */
    static MFCreateVideoRendererActivate(hwndVideo, ppActivate) {
        hwndVideo := hwndVideo is Win32Handle ? NumGet(hwndVideo, "ptr") : hwndVideo

        result := DllCall("MF.dll\MFCreateVideoRendererActivate", "ptr", hwndVideo, "ptr*", ppActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media sink for authoring MP4 files.
     * @param {IMFByteStream} pIByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream.  The media sink writes the MP4 file to this byte stream. The byte stream must be writable and support seeking.
     * @param {IMFMediaType} pVideoMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a video media type. This type specifies the format of the video stream.
     * 
     * This parameter can be <b>NULL</b>, but not if <i>pAudioMediaType</i> is <b>NULL</b>.
     * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of an audio media type. This type specifies the format of the audio stream.
     * 
     * This parameter can be <b>NULL</b>, but not if <i>pVideoMediaType</i> is <b>NULL</b>.
     * @param {Pointer<IMFMediaSink>} ppIMediaSink Receives a pointer to the MP4 media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatempeg4mediasink
     * @since windows6.1
     */
    static MFCreateMPEG4MediaSink(pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink) {
        result := DllCall("MF.dll\MFCreateMPEG4MediaSink", "ptr", pIByteStream, "ptr", pVideoMediaType, "ptr", pAudioMediaType, "ptr*", ppIMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media sink for authoring 3GP files.
     * @param {IMFByteStream} pIByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream.  The media sink writes the 3GP file to this byte stream. The byte stream must be writable and support seeking.
     * @param {IMFMediaType} pVideoMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a video media type. This type specifies the format of the video stream.
     * 
     * This parameter can be <b>NULL</b>, but not if <i>pAudioMediaType</i> is <b>NULL</b>.
     * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of an audio media type. This type specifies the format of the audio stream.
     * 
     * This parameter can be <b>NULL</b>, but not if <i>pVideoMediaType</i> is <b>NULL</b>.
     * @param {Pointer<IMFMediaSink>} ppIMediaSink Receives a pointer to the 3GP media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreate3gpmediasink
     * @since windows6.1
     */
    static MFCreate3GPMediaSink(pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink) {
        result := DllCall("MF.dll\MFCreate3GPMediaSink", "ptr", pIByteStream, "ptr", pVideoMediaType, "ptr", pAudioMediaType, "ptr*", ppIMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the MP3 media sink.
     * @param {IMFByteStream} pTargetByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream.  The media sink writes the MP3 file to this byte stream. The byte stream must be writable.
     * @param {Pointer<IMFMediaSink>} ppMediaSink Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the MP3 media sink.. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatemp3mediasink
     * @since windows6.1
     */
    static MFCreateMP3MediaSink(pTargetByteStream, ppMediaSink) {
        result := DllCall("MF.dll\MFCreateMP3MediaSink", "ptr", pTargetByteStream, "ptr*", ppMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the AC-3 media sink.
     * @param {IMFByteStream} pTargetByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The media sink writes the AC-3 file to this byte stream. The byte stream must be writable.
     * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. This parameter specifies the media type for the AC-3 audio stream. The media type must contain the following attributes.
     * 
     * <table>
     * <tr>
     * <th>Attribute</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-major-type-attribute">MF_MT_MAJOR_TYPE</a>
     * </td>
     * <td><b>MFMediaType_Audio</b></td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-subtype-attribute">MF_MT_SUBTYPE</a>
     * </td>
     * <td><b>MFAudioFormat_Dolby_AC3</b> or <b>MFAudioFormat_Dolby_DDPlus</b></td>
     * </tr>
     * </table>
     * @param {Pointer<IMFMediaSink>} ppMediaSink Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateac3mediasink
     * @since windows8.0
     */
    static MFCreateAC3MediaSink(pTargetByteStream, pAudioMediaType, ppMediaSink) {
        result := DllCall("MF.dll\MFCreateAC3MediaSink", "ptr", pTargetByteStream, "ptr", pAudioMediaType, "ptr*", ppMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the audio data transport stream (ADTS) media sink.
     * @param {IMFByteStream} pTargetByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The media sink writes the ADTS stream to this byte stream. The byte stream must be writable.
     * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. This parameter specifies the media type for the ADTS stream. The media type must contain the following attributes.
     * 
     * <table>
     * <tr>
     * <th>Attribute</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-major-type-attribute">MF_MT_MAJOR_TYPE</a>
     * </td>
     * <td><b>MFMediaType_Audio</b></td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-subtype-attribute">MF_MT_SUBTYPE</a>
     * </td>
     * <td><b>MFAudioFormat_AAC</b></td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-aac-payload-type">MF_MT_AAC_PAYLOAD_TYPE</a>
     * </td>
     * <td>0 (raw AAC) or 1 (ADTS)</td>
     * </tr>
     * </table>
     * @param {Pointer<IMFMediaSink>} ppMediaSink Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateadtsmediasink
     * @since windows8.0
     */
    static MFCreateADTSMediaSink(pTargetByteStream, pAudioMediaType, ppMediaSink) {
        result := DllCall("MF.dll\MFCreateADTSMediaSink", "ptr", pTargetByteStream, "ptr", pAudioMediaType, "ptr*", ppMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a generic media sink that wraps a multiplexer Microsoft Media Foundation transform (MFT).
     * @param {Guid} guidOutputSubType The subtype GUID of the output type for the MFT.
     * @param {IMFAttributes} pOutputAttributes A list of format attributes for the MFT output type. This parameter is optional and can be <b>NULL</b>.
     * @param {IMFByteStream} pOutputByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The output from the MFT is written to this byte stream. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFMediaSink>} ppMuxSink Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the media sink. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatemuxsink
     * @since windows8.0
     */
    static MFCreateMuxSink(guidOutputSubType, pOutputAttributes, pOutputByteStream, ppMuxSink) {
        result := DllCall("MF.dll\MFCreateMuxSink", "ptr", guidOutputSubType, "ptr", pOutputAttributes, "ptr", pOutputByteStream, "ptr*", ppMuxSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media sink for authoring fragmented MP4 files.
     * @param {IMFByteStream} pIByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream.  The media sink writes the MP4 file to this byte stream. The byte stream must be writable and support seeking.
     * @param {IMFMediaType} pVideoMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a video media type. This type specifies the format of the video stream.
     * 
     * This parameter can be <b>NULL</b>, but not if <i>pAudioMediaType</i> is <b>NULL</b>.
     * @param {IMFMediaType} pAudioMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of an audio media type. This type specifies the format of the audio stream.
     * 
     * This parameter can be <b>NULL</b>, but not if <i>pVideoMediaType</i> is <b>NULL</b>.
     * @param {Pointer<IMFMediaSink>} ppIMediaSink Receives a pointer to the MP4 media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatefmpeg4mediasink
     * @since windows8.0
     */
    static MFCreateFMPEG4MediaSink(pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink) {
        result := DllCall("MF.dll\MFCreateFMPEG4MediaSink", "ptr", pIByteStream, "ptr", pVideoMediaType, "ptr", pAudioMediaType, "ptr*", ppIMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an Audio-Video Interleaved (AVI) Sink.
     * @param {IMFByteStream} pIByteStream Pointer to the byte stream that will be used to write the AVI file.
     * @param {IMFMediaType} pVideoMediaType Pointer to the media type of the video input stream
     * @param {IMFMediaType} pAudioMediaType Pointer to the media type of the audio input stream
     * @param {Pointer<IMFMediaSink>} ppIMediaSink Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> Interface.  The caller must release this interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateavimediasink
     * @since windows8.1
     */
    static MFCreateAVIMediaSink(pIByteStream, pVideoMediaType, pAudioMediaType, ppIMediaSink) {
        result := DllCall("mfsrcsnk.dll\MFCreateAVIMediaSink", "ptr", pIByteStream, "ptr", pVideoMediaType, "ptr", pAudioMediaType, "ptr*", ppIMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an WAVE archive sink. The WAVE archive sink takes audio and writes it to an .wav file.
     * @param {IMFByteStream} pTargetByteStream Pointer to the byte stream that will be used to write the .wav file.
     * @param {IMFMediaType} pAudioMediaType Pointer to the audio media type.
     * @param {Pointer<IMFMediaSink>} ppMediaSink Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface.  The caller must release this interface.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatewavemediasink
     * @since windows8.1
     */
    static MFCreateWAVEMediaSink(pTargetByteStream, pAudioMediaType, ppMediaSink) {
        result := DllCall("mfsrcsnk.dll\MFCreateWAVEMediaSink", "ptr", pTargetByteStream, "ptr", pAudioMediaType, "ptr*", ppMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new instance of the topology loader.
     * @param {Pointer<IMFTopoLoader>} ppObj Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopoloader">IMFTopoLoader</a> interface of the topology loader. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatetopoloader
     * @since windows6.0.6000
     */
    static MFCreateTopoLoader(ppObj) {
        result := DllCall("MF.dll\MFCreateTopoLoader", "ptr*", ppObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object for the sample grabber media sink.
     * @param {IMFMediaType} pIMFMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface, defining the media type for the sample grabber's input stream.
     * @param {IMFSampleGrabberSinkCallback} pIMFSampleGrabberSinkCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsamplegrabbersinkcallback">IMFSampleGrabberSinkCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {Pointer<IMFActivate>} ppIActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to complete the creation of the sample grabber. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesamplegrabbersinkactivate
     * @since windows6.0.6000
     */
    static MFCreateSampleGrabberSinkActivate(pIMFMediaType, pIMFSampleGrabberSinkCallback, ppIActivate) {
        result := DllCall("MF.dll\MFCreateSampleGrabberSinkActivate", "ptr", pIMFMediaType, "ptr", pIMFSampleGrabberSinkCallback, "ptr*", ppIActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the default implementation of the quality manager.
     * @param {Pointer<IMFQualityManager>} ppQualityManager Receives a pointer to the quality manager's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfqualitymanager">IMFQualityManager</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatestandardqualitymanager
     * @since windows6.0.6000
     */
    static MFCreateStandardQualityManager(ppQualityManager) {
        result := DllCall("MF.dll\MFCreateStandardQualityManager", "ptr*", ppQualityManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the sequencer source.
     * @param {IUnknown} pReserved Reserved. Must be <b>NULL</b>.
     * @param {Pointer<IMFSequencerSource>} ppSequencerSource Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsequencersource">IMFSequencerSource</a> interface of the sequencer source. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesequencersource
     * @since windows6.0.6000
     */
    static MFCreateSequencerSource(pReserved, ppSequencerSource) {
        result := DllCall("MF.dll\MFCreateSequencerSource", "ptr", pReserved, "ptr*", ppSequencerSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a PROPVARIANT that can be used to seek within a sequencer source presentation.
     * @param {Integer} dwId Sequencer element identifier. This value specifies the segment in which to begin playback. The element identifier is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsequencersource-appendtopology">IMFSequencerSource::AppendTopology</a> method.
     * @param {Integer} hnsOffset Starting position within the segment, in 100-nanosecond units.
     * @param {Pointer<PROPVARIANT>} pvarSegmentOffset Pointer to a <b>PROPVARIANT</b>. The method fills in the <b>PROPVARIANT</b> with the information needed for performing a seek operation. The caller must free the <b>PROPVARIANT</b> by calling <b>PropVariantClear</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesequencersegmentoffset
     * @since windows6.0.6000
     */
    static MFCreateSequencerSegmentOffset(dwId, hnsOffset, pvarSegmentOffset) {
        result := DllCall("MF.dll\MFCreateSequencerSegmentOffset", "uint", dwId, "int64", hnsOffset, "ptr", pvarSegmentOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media source that aggregates a collection of media sources.
     * @param {IMFCollection} pSourceCollection A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface of the collection object that contains a list of media sources.
     * @param {Pointer<IMFMediaSource>} ppAggSource Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface of the aggregated media source. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSourceCollection</i> collection does not contain any elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateaggregatesource
     * @since windows6.1
     */
    static MFCreateAggregateSource(pSourceCollection, ppAggSource) {
        result := DllCall("MF.dll\MFCreateAggregateSource", "ptr", pSourceCollection, "ptr*", ppAggSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a credential cache object. An application can use this object to implement a custom credential manager.
     * @param {Pointer<IMFNetCredentialCache>} ppCache Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredentialcache">IMFNetCredentialCache</a> interface of the new credential cache object. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatecredentialcache
     * @since windows6.0.6000
     */
    static MFCreateCredentialCache(ppCache) {
        result := DllCall("MF.dll\MFCreateCredentialCache", "ptr*", ppCache, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a default proxy locator.
     * @param {PWSTR} pszProtocol The name of the protocol.
     * 
     * <div class="alert"><b>Note</b>  In this release of Media Foundation, the default proxy locator does not support RTSP.</div>
     * <div> </div>
     * @param {IPropertyStore} pProxyConfig Pointer to the <b>IPropertyStore</b> interface of a property store that contains the proxy configuration in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-proxysettings-property">MFNETSOURCE_PROXYSETTINGS</a> property.
     * @param {Pointer<IMFNetProxyLocator>} ppProxyLocator Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetproxylocator">IMFNetProxyLocator</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateproxylocator
     * @since windows6.0.6000
     */
    static MFCreateProxyLocator(pszProtocol, pProxyConfig, ppProxyLocator) {
        pszProtocol := pszProtocol is String ? StrPtr(pszProtocol) : pszProtocol

        result := DllCall("MF.dll\MFCreateProxyLocator", "ptr", pszProtocol, "ptr", pProxyConfig, "ptr*", ppProxyLocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the scheme handler for the network source.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the interface to retrieve.
     * @param {Pointer<Pointer<Void>>} ppvHandler Receives a pointer to the requested interface. The caller must release the interface. The scheme handler exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfschemehandler">IMFSchemeHandler</a> interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatenetschemeplugin
     * @since windows6.0.6000
     */
    static MFCreateNetSchemePlugin(riid, ppvHandler) {
        result := DllCall("MF.dll\MFCreateNetSchemePlugin", "ptr", riid, "ptr*", ppvHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the protected media path (PMP) server object.
     * @param {Integer} dwCreationFlags A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpmpsession_creation_flags">MFPMPSESSION_CREATION_FLAGS</a> enumeration that specifies how to create the PMP session.
     * @param {Pointer<IMFPMPServer>} ppPMPServer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmpserver">IMFPMPServer</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatepmpserver
     * @since windows6.0.6000
     */
    static MFCreatePMPServer(dwCreationFlags, ppPMPServer) {
        result := DllCall("MF.dll\MFCreatePMPServer", "uint", dwCreationFlags, "ptr*", ppPMPServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the remote desktop plug-in object. Use this object if the application is running in a Terminal Services client session.
     * @param {Pointer<IMFRemoteDesktopPlugin>} ppPlugin Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfremotedesktopplugin">IMFRemoteDesktopPlugin</a> interface of the plug-in object. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remote desktop connections are not allowed by the current session policy.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateremotedesktopplugin
     * @since windows6.0.6000
     */
    static MFCreateRemoteDesktopPlugin(ppPlugin) {
        result := DllCall("MF.dll\MFCreateRemoteDesktopPlugin", "ptr*", ppPlugin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an empty property store to hold name/value pairs.
     * @param {Pointer<INamedPropertyStore>} ppStore Receives a pointer to the <b>INamedPropertyStore</b> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-createnamedpropertystore
     * @since windows6.0.6000
     */
    static CreateNamedPropertyStore(ppStore) {
        result := DllCall("MF.dll\CreateNamedPropertyStore", "ptr*", ppStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the sample copier transform.
     * @param {Pointer<IMFTransform>} ppCopierMFT Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesamplecopiermft
     * @since windows6.1
     */
    static MFCreateSampleCopierMFT(ppCopierMFT) {
        result := DllCall("MF.dll\MFCreateSampleCopierMFT", "ptr*", ppCopierMFT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an empty transcode profile object.
     * @param {Pointer<IMFTranscodeProfile>} ppTranscodeProfile Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodeprofile">IMFTranscodeProfile</a> interface of the transcode profile object. Caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatetranscodeprofile
     * @since windows6.1
     */
    static MFCreateTranscodeProfile(ppTranscodeProfile) {
        result := DllCall("MF.dll\MFCreateTranscodeProfile", "ptr*", ppTranscodeProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a partial transcode topology.
     * @param {IMFMediaSource} pSrc A pointer to a media source that encapsulates the source file to be transcoded. The media source object exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface and can be created by using the source resolver. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/using-the-source-resolver">Using the Source Resolver</a>.
     * @param {PWSTR} pwszOutputFilePath A pointer to a null-terminated string that contains the name and path of the output file to be generated.
     * @param {IMFTranscodeProfile} pProfile A pointer to the transcode profile that contains the configuration settings for the audio stream, the video stream, and the container to which the file is written. The transcode profile object exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodeprofile">IMFTranscodeProfile</a> interface and must be created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetranscodeprofile">MFCreateTranscodeProfile</a> function. After the object has been created the caller must provide the configuration settings by calling appropriate the <b>IMFTranscodeProfile</b> methods.
     * @param {Pointer<IMFTopology>} ppTranscodeTopo Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the transcode topology object. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function call succeeded, and <i>ppTranscodeTopo</i> receives a pointer to the transcode topology.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pwszOutputFilePath</i> contains invalid characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_MEDIA_SOURCE_NO_STREAMS_SELECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No streams are selected in the media source.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSCODE_NO_CONTAINERTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile does not contain the <a href="/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a> attribute.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSCODE_NO_MATCHING_ENCODER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For one or more streams, cannot find an encoder that accepts the media type given in the profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSCODE_PROFILE_NO_MATCHING_STREAMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile does not specify a media type for any of the selected streams on the media source.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatetranscodetopology
     * @since windows6.1
     */
    static MFCreateTranscodeTopology(pSrc, pwszOutputFilePath, pProfile, ppTranscodeTopo) {
        pwszOutputFilePath := pwszOutputFilePath is String ? StrPtr(pwszOutputFilePath) : pwszOutputFilePath

        result := DllCall("MF.dll\MFCreateTranscodeTopology", "ptr", pSrc, "ptr", pwszOutputFilePath, "ptr", pProfile, "ptr*", ppTranscodeTopo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a topology for transcoding to a byte stream.
     * @param {IMFMediaSource} pSrc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface of a media source. The media source provides that source content for transcoding.
     * @param {IMFByteStream} pOutputStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. The transcoded output will be written to this byte stream.
     * @param {IMFTranscodeProfile} pProfile A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodeprofile">IMFTranscodeProfile</a> interface of a transcoding profile.
     * @param {Pointer<IMFTopology>} ppTranscodeTopo Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatetranscodetopologyfrombytestream
     * @since windows8.0
     */
    static MFCreateTranscodeTopologyFromByteStream(pSrc, pOutputStream, pProfile, ppTranscodeTopo) {
        result := DllCall("MF.dll\MFCreateTranscodeTopologyFromByteStream", "ptr", pSrc, "ptr", pOutputStream, "ptr", pProfile, "ptr*", ppTranscodeTopo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a list of output formats from an audio encoder.
     * @param {Pointer<Guid>} guidSubType Specifies the subtype of the output media. The encoder uses this value as a filter when it is enumerating the available output types. For information about the audio subtypes, see  <a href="https://docs.microsoft.com/windows/desktop/medfound/audio-subtype-guids">Audio Subtype GUIDs</a>.
     * @param {Integer} dwMFTFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
     * @param {IMFAttributes} pCodecConfig A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. The attribute store specifies the encoder configuration settings. This parameter can be <b>NULL</b>. The attribute store can hold any of the following attributes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFT_FIELDOFUSE_UNLOCK_Attribute"></a><a id="mft_fieldofuse_unlock_attribute"></a><a id="MFT_FIELDOFUSE_UNLOCK_ATTRIBUTE"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mft-fieldofuse-unlock-attribute">MFT_FIELDOFUSE_UNLOCK_Attribute</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set this attribute to unlock an encoder that has field-of-use descriptions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_TRANSCODE_ENCODINGPROFILE"></a><a id="mf_transcode_encodingprofile"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-encodingprofile">MF_TRANSCODE_ENCODINGPROFILE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a device conformance profile for a Windows Media encoder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_TRANSCODE_QUALITYVSSPEED"></a><a id="mf_transcode_qualityvsspeed"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-qualityvsspeed">MF_TRANSCODE_QUALITYVSSPEED</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets the tradeoff between encoding quality and encoding speed.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<IMFCollection>} ppAvailableTypes Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface of a collection object that contains a list of preferred audio media types. The collection contains <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> pointers. The caller must release the interface pointer.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function call succeeded. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSCODE_NO_MATCHING_ENCODER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to find an encoder that matches the specified configuration settings.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mftranscodegetaudiooutputavailabletypes
     * @since windows6.1
     */
    static MFTranscodeGetAudioOutputAvailableTypes(guidSubType, dwMFTFlags, pCodecConfig, ppAvailableTypes) {
        result := DllCall("MF.dll\MFTranscodeGetAudioOutputAvailableTypes", "ptr", guidSubType, "uint", dwMFTFlags, "ptr", pCodecConfig, "ptr*", ppAvailableTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the transcode sink activation object.
     * @param {Pointer<IMFActivate>} ppActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. This interface is used to create the file sink instance from the activation object. Before doing so, query the returned pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodesinkinfoprovider">IMFTranscodeSinkInfoProvider</a> interface and use that interface to initialize the object.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatetranscodesinkactivate
     * @since windows6.1
     */
    static MFCreateTranscodeSinkActivate(ppActivate) {
        result := DllCall("MF.dll\MFCreateTranscodeSinkActivate", "ptr*", ppActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IMFTrackedSample object that tracks the reference counts on a video media sample.
     * @param {Pointer<IMFTrackedSample>} ppMFSample Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftrackedsample">IMFTrackedSample</a> interface.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatetrackedsample
     * @since windows8.0
     */
    static MFCreateTrackedSample(ppMFSample) {
        result := DllCall("MFPlat.dll\MFCreateTrackedSample", "ptr*", ppMFSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a Microsoft Media Foundation byte stream that wraps an IStream pointer.
     * @param {IStream} pStream A pointer to the <b>IStream</b> interface.
     * @param {Pointer<IMFByteStream>} ppByteStream Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. The caller must release the interface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatemfbytestreamonstream
     * @since windows6.1
     */
    static MFCreateMFByteStreamOnStream(pStream, ppByteStream) {
        result := DllCall("MFPlat.dll\MFCreateMFByteStreamOnStream", "ptr", pStream, "ptr*", ppByteStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns an IStream pointer that wraps a Microsoft Media Foundation byte stream.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the Media Foundation byte stream.
     * @param {Pointer<IStream>} ppStream Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatestreamonmfbytestream
     * @since windows8.0
     */
    static MFCreateStreamOnMFByteStream(pByteStream, ppStream) {
        result := DllCall("MFPlat.dll\MFCreateStreamOnMFByteStream", "ptr", pByteStream, "ptr*", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a Microsoft Media Foundation byte stream that wraps an IRandomAccessStream object.
     * @param {IUnknown} punkStream A pointer to the <a href="https://docs.microsoft.com/previous-versions/hh438400(v=vs.85)">IRandomAccessStream</a> interface.
     * @param {Pointer<IMFByteStream>} ppByteStream Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatemfbytestreamonstreamex
     * @since windows8.0
     */
    static MFCreateMFByteStreamOnStreamEx(punkStream, ppByteStream) {
        result := DllCall("MFPlat.dll\MFCreateMFByteStreamOnStreamEx", "ptr", punkStream, "ptr*", ppByteStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IRandomAccessStream object that wraps a Microsoft Media Foundation byte stream.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the Media Foundation byte stream.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @param {Pointer<Pointer<Void>>} ppv Receives a pointer to the requested interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatestreamonmfbytestreamex
     * @since windows8.0
     */
    static MFCreateStreamOnMFByteStreamEx(pByteStream, riid, ppv) {
        result := DllCall("MFPlat.dll\MFCreateStreamOnMFByteStreamEx", "ptr", pByteStream, "ptr", riid, "ptr*", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Create an IMFMediaType from properties.
     * @param {IUnknown} punkStream A pointer to properties.
     * @param {Pointer<IMFMediaType>} ppMediaType Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a>. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatemediatypefromproperties
     * @since windows8.0
     */
    static MFCreateMediaTypeFromProperties(punkStream, ppMediaType) {
        result := DllCall("MFPlat.dll\MFCreateMediaTypeFromProperties", "ptr", punkStream, "ptr*", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates properties from a IMFMediaType.
     * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @param {Pointer<Pointer<Void>>} ppv Receives a pointer to the requested interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatepropertiesfrommediatype
     * @since windows8.0
     */
    static MFCreatePropertiesFromMediaType(pMediaType, riid, ppv) {
        result := DllCall("MFPlat.dll\MFCreatePropertiesFromMediaType", "ptr", pMediaType, "ptr", riid, "ptr*", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enumerates a list of audio or video capture devices.
     * @param {IMFAttributes} pAttributes Pointer to an attribute store that contains search criteria. To create the attribute store, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a>. Set one or more of the following attributes on the attribute store:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE"></a><a id="mf_devsource_attribute_source_type"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies whether to enumerate audio or video devices. (Required.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE"></a><a id="mf_devsource_attribute_source_type_audcap_role"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-role">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For audio capture devices, specifies the device role. (Optional.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_CATEGORY"></a><a id="mf_devsource_attribute_source_type_vidcap_category"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-vidcap-category">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_CATEGORY</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For video capture devices, specifies the device category. (Optional.)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<IMFActivate>>} pppSourceActivate Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface pointers. Each pointer represents an activation object for a media source. The function allocates the memory for the array. The caller must release the pointers in the array and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the memory for the array.
     * @param {Pointer<Integer>} pcSourceActivate Receives the number of elements in the <i>pppSourceActivate</i> array. If no capture devices match the search criteria, this parameter receives the value 0.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfenumdevicesources
     * @since windows6.1
     */
    static MFEnumDeviceSources(pAttributes, pppSourceActivate, pcSourceActivate) {
        result := DllCall("MF.dll\MFEnumDeviceSources", "ptr", pAttributes, "ptr*", pppSourceActivate, "uint*", pcSourceActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media source for a hardware capture device.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store, which is used to select the device. See Remarks.
     * @param {Pointer<IMFMediaSource>} ppSource Receives a pointer to the media source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatedevicesource
     * @since windows6.1
     */
    static MFCreateDeviceSource(pAttributes, ppSource) {
        result := DllCall("MF.dll\MFCreateDeviceSource", "ptr", pAttributes, "ptr*", ppSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object that represents a hardware capture device.
     * @remarks
     * 
     * This function creates an activation object that can be used to create a media source for a hardware device. To create the media source itself, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a>.
     * 
     * The <i>pAttributes</i> parameter specifies an attribute store. To create the attribute store, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a> function.  You must set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE</a> attribute, which specifies the type of device (audio or video).
     * 
     * For audio capture devices, optionally set one of the following attributes:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Attribute</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID"></a><a id="mf_devsource_attribute_source_type_audcap_endpoint_id"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-endpoint-id">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID</a>
     * 
     * 
     * </td>
     * <td width="60%">
     * Specifies the audio endpoint ID of the audio capture device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE"></a><a id="mf_devsource_attribute_source_type_audcap_role"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-role">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ROLE</a>
     * 
     * 
     * </td>
     * <td width="60%">
     * Specifies the device role. If this attribute is set, the function uses the default audio capture device for that device role.
     * 
     * Do not combine this attribute with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-audcap-endpoint-id">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_AUDCAP_ENDPOINT_ID</a> attribute.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If neither attribute is specified, the function selects the default audio capture device for the <b>eCommunications</b> role.
     * 
     * For video capture devices, you must set the following attribute:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Attribute</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK"></a><a id="mf_devsource_attribute_source_type_vidcap_symbolic_link"></a><a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link">MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK</a>
     * 
     * 
     * </td>
     * <td width="60%">
     * Specifies the symbolic link to the device.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store, which is used to select the device. See Remarks.
     * @param {Pointer<IMFActivate>} ppActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. The caller must release the interface.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatedevicesourceactivate
     * @since windows6.1
     */
    static MFCreateDeviceSourceActivate(pAttributes, ppActivate) {
        result := DllCall("MF.dll\MFCreateDeviceSourceActivate", "ptr", pAttributes, "ptr*", ppActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IMFProtectedEnvironmentAccess object that allows content protection systems to perform a handshake with the protected environment.
     * @param {Pointer<IMFProtectedEnvironmentAccess>} ppAccess Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfprotectedenvironmentaccess">IMFProtectedEnvironmentAccess</a> interface.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreateprotectedenvironmentaccess
     * @since windows8.0
     */
    static MFCreateProtectedEnvironmentAccess(ppAccess) {
        result := DllCall("MF.dll\MFCreateProtectedEnvironmentAccess", "ptr*", ppAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Loads a dynamic link library that is signed for the protected environment.
     * @remarks
     * 
     * A singlemodule load count is maintained on the dynamic link library (as it is with <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>).  This load count  is freed when the final release is called on the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsignedlibrary">IMFSignedLibrary</a> object.
     * 
     * 
     * 
     * @param {PWSTR} pszName The name of the dynamic link library to load.  This dynamic link library must be signed for the protected environment.
     * @param {Pointer<IMFSignedLibrary>} ppLib Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsignedlibrary">IMFSignedLibrary</a> interface for the library.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfloadsignedlibrary
     * @since windows8.0
     */
    static MFLoadSignedLibrary(pszName, ppLib) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("MF.dll\MFLoadSignedLibrary", "ptr", pszName, "ptr*", ppLib, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns an IMFSystemId object for retrieving system id data.
     * @param {Pointer<IMFSystemId>} ppId Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsystemid">IMFSystemId</a> interface.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfgetsystemid
     * @since windows8.0
     */
    static MFGetSystemId(ppId) {
        result := DllCall("MF.dll\MFGetSystemId", "ptr*", ppId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the local system ID.
     * @param {Pointer} verifier Application-specific verifier value.
     * @param {Integer} size Length in bytes of verifier.
     * @param {Pointer<PWSTR>} id Returned ID string.  This value must be freed by the caller by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfgetlocalid
     * @since windows8.0
     */
    static MFGetLocalId(verifier, size, id) {
        result := DllCall("MF.dll\MFGetLocalId", "ptr", verifier, "uint", size, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IMFContentProtectionDevice interface for the specified media protection system.
     * @param {Pointer<Guid>} ProtectionSystemId The idenfier of the media protection system for which you want to create the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentprotectiondevice">IMFContentProtectionDevice</a> interface.
     * @param {Pointer<IMFContentProtectionDevice>} ContentProtectionDevice Pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentprotectiondevice">IMFContentProtectionDevice</a> interface.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatecontentprotectiondevice
     * @since windows10.0.10240
     */
    static MFCreateContentProtectionDevice(ProtectionSystemId, ContentProtectionDevice) {
        result := DllCall("MFPlat.dll\MFCreateContentProtectionDevice", "ptr", ProtectionSystemId, "ptr*", ContentProtectionDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Checks whether a hardware security processor is supported for the specified media protection system.
     * @param {Pointer<Guid>} ProtectionSystemId The identifier of the protection system that you want to check.
     * @param {Pointer<BOOL>} isSupported <b>TRUE</b> if the hardware security processor is supported for the specified protection system; otherwise <b>FALSE</b>.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfiscontentprotectiondevicesupported
     * @since windows10.0.10240
     */
    static MFIsContentProtectionDeviceSupported(ProtectionSystemId, isSupported) {
        result := DllCall("MFPlat.dll\MFIsContentProtectionDeviceSupported", "ptr", ProtectionSystemId, "ptr", isSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IMFContentDecryptorContext interface for the specified media protection system.
     * @param {Pointer<Guid>} guidMediaProtectionSystemId The identifier of the media protection system for which you want to create an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentdecryptorcontext">IMFContentDecryptorContext</a> interface.
     * @param {IMFDXGIDeviceManager} pD3DManager Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface that you want to use for sharing the Direct3D 11 device.
     * @param {IMFContentProtectionDevice} pContentProtectionDevice The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentprotectiondevice">IMFContentProtectionDevice</a> interface for the specified media protection system.
     * @param {Pointer<IMFContentDecryptorContext>} ppContentDecryptorContext Pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentdecryptorcontext">IMFContentDecryptorContext</a> interface.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatecontentdecryptorcontext
     * @since windows10.0.10240
     */
    static MFCreateContentDecryptorContext(guidMediaProtectionSystemId, pD3DManager, pContentProtectionDevice, ppContentDecryptorContext) {
        result := DllCall("MFPlat.dll\MFCreateContentDecryptorContext", "ptr", guidMediaProtectionSystemId, "ptr", pD3DManager, "ptr", pContentProtectionDevice, "ptr*", ppContentDecryptorContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the IMFSensorGroup interface based on the provided symbolic link name.
     * @param {PWSTR} SensorGroupSymbolicLink The symbolic link for the new <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a>. This name can be obtained through device enumeration APIs such as <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdigetclassdevsw">SetupDiGetClassDevs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfenumdevicesources">MFEnumDeviceSources</a> or by getting the  <a href="https://docs.microsoft.com/uwp/api/Windows.Devices.Enumeration.DeviceInformation">Id</a> property of the <a href="https://docs.microsoft.com/uwp/api/Windows.Devices.Enumeration.DeviceInformation">DeviceInformation</a> class.
     * @param {Pointer<IMFSensorGroup>} ppSensorGroup The symbolic link for the new <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied <a href="/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a> is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied <b>LPCWSTR</b> is null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesensorgroup
     * @since windows10.0.14393
     */
    static MFCreateSensorGroup(SensorGroupSymbolicLink, ppSensorGroup) {
        SensorGroupSymbolicLink := SensorGroupSymbolicLink is String ? StrPtr(SensorGroupSymbolicLink) : SensorGroupSymbolicLink

        result := DllCall("MFSENSORGROUP.dll\MFCreateSensorGroup", "ptr", SensorGroupSymbolicLink, "ptr*", ppSensorGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the IMFSensorStream interface.
     * @param {Integer} StreamId The identifier for the created stream. This is the same as setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devicestream-stream-id">MF_DEVICESTREAM_STREAM_ID</a> attribute. This value is used if <i>pAttributes</i> is null.
     * @param {IMFAttributes} pAttributes The attribute store for the created stream.
     * @param {IMFCollection} pMediaTypeCollection The collection of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> objects specifying the media types supported by the stream.
     * @param {Pointer<IMFSensorStream>} ppStream The created stream interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied <a href="/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a> is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied <b>LPCWSTR</b> is null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesensorstream
     * @since windows10.0.15063
     */
    static MFCreateSensorStream(StreamId, pAttributes, pMediaTypeCollection, ppStream) {
        result := DllCall("MFSENSORGROUP.dll\MFCreateSensorStream", "uint", StreamId, "ptr", pAttributes, "ptr", pMediaTypeCollection, "ptr*", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a sensor profile, based on the specified type, index, and optional constraints.
     * @param {Pointer<Guid>} ProfileType The profile type to create.
     * @param {Integer} ProfileIndex The profile index.
     * @param {PWSTR} Constraints Any optional constraints to be put on the profile.
     * @param {Pointer<IMFSensorProfile>} ppProfile On success, returns a double pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprofile">IMFSensorProfile</a> containing the sensor profile.
     * @returns {HRESULT} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesensorprofile
     * @since windows10.0.17134
     */
    static MFCreateSensorProfile(ProfileType, ProfileIndex, Constraints, ppProfile) {
        Constraints := Constraints is String ? StrPtr(Constraints) : Constraints

        result := DllCall("MFSENSORGROUP.dll\MFCreateSensorProfile", "ptr", ProfileType, "uint", ProfileIndex, "ptr", Constraints, "ptr*", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a sensor profile collection.
     * @param {Pointer<IMFSensorProfileCollection>} ppSensorProfile On success, points to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprofilecollection">IMFSensorProfileCollection</a> containing the sensor profile collection.
     * @returns {HRESULT} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesensorprofilecollection
     * @since windows10.0.15063
     */
    static MFCreateSensorProfileCollection(ppSensorProfile) {
        result := DllCall("MFSENSORGROUP.dll\MFCreateSensorProfileCollection", "ptr*", ppSensorProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a new instance of the IMFSensorActivityMonitor interface.
     * @param {IMFSensorActivitiesReportCallback} pCallback An implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitiesreportcallback">IMFSensorActivitiesReportCallback</a> interface through which the system delivers <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitiesreport">IMFSensorActivitiesReport</a> objects.
     * @param {Pointer<IMFSensorActivityMonitor>} ppActivityMonitor A pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensoractivitymonitor">IMFSensorActivityMonitor</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppActivityMonitor</i> parameter is null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreatesensoractivitymonitor
     */
    static MFCreateSensorActivityMonitor(pCallback, ppActivityMonitor) {
        result := DllCall("MFSENSORGROUP.dll\MFCreateSensorActivityMonitor", "ptr", pCallback, "ptr*", ppActivityMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFExtendedCameraIntrinsics>} ppExtendedCameraIntrinsics 
     * @returns {HRESULT} 
     */
    static MFCreateExtendedCameraIntrinsics(ppExtendedCameraIntrinsics) {
        result := DllCall("MFCORE.dll\MFCreateExtendedCameraIntrinsics", "ptr*", ppExtendedCameraIntrinsics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} distortionModelType 
     * @param {Pointer<IMFExtendedCameraIntrinsicModel>} ppExtendedCameraIntrinsicModel 
     * @returns {HRESULT} 
     */
    static MFCreateExtendedCameraIntrinsicModel(distortionModelType, ppExtendedCameraIntrinsicModel) {
        result := DllCall("MFCORE.dll\MFCreateExtendedCameraIntrinsicModel", "int", distortionModelType, "ptr*", ppExtendedCameraIntrinsicModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new instance of the **IMFRelativePanelWatcher** interface
     * @param {PWSTR} videoDeviceId A string containing the symbolic link name of the video capture device.
     * @param {PWSTR} displayMonitorDeviceId A string containing the symbolic link name of the display monitor device.
     * @param {Pointer<IMFRelativePanelWatcher>} ppRelativePanelWatcher A pointer to an **IMFRelativePanelWatcher** interface representing the watcher.
     * @returns {HRESULT} The function returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * | Return code | Description |
     * |--------------|------------------------|
     * |S_OK | The function succeeded.|
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-mfcreaterelativepanelwatcher
     * @since windows10.0.19041
     */
    static MFCreateRelativePanelWatcher(videoDeviceId, displayMonitorDeviceId, ppRelativePanelWatcher) {
        videoDeviceId := videoDeviceId is String ? StrPtr(videoDeviceId) : videoDeviceId
        displayMonitorDeviceId := displayMonitorDeviceId is String ? StrPtr(displayMonitorDeviceId) : displayMonitorDeviceId

        result := DllCall("MFSENSORGROUP.dll\MFCreateRelativePanelWatcher", "ptr", videoDeviceId, "ptr", displayMonitorDeviceId, "ptr*", ppRelativePanelWatcher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} symbolicLink 
     * @param {IMFCameraOcclusionStateReportCallback} callback 
     * @param {Pointer<IMFCameraOcclusionStateMonitor>} occlusionStateMonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatecameraocclusionstatemonitor
     */
    static MFCreateCameraOcclusionStateMonitor(symbolicLink, callback, occlusionStateMonitor) {
        symbolicLink := symbolicLink is String ? StrPtr(symbolicLink) : symbolicLink

        result := DllCall("MFSENSORGROUP.dll\MFCreateCameraOcclusionStateMonitor", "ptr", symbolicLink, "ptr", callback, "ptr*", occlusionStateMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} symbolicLink 
     * @param {IMFCameraControlNotify} callback 
     * @param {Pointer<IMFCameraControlMonitor>} ppCameraControlMonitor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-mfcreatecameracontrolmonitor
     */
    static MFCreateCameraControlMonitor(symbolicLink, callback, ppCameraControlMonitor) {
        symbolicLink := symbolicLink is String ? StrPtr(symbolicLink) : symbolicLink

        result := DllCall("MFSENSORGROUP.dll\MFCreateCameraControlMonitor", "ptr", symbolicLink, "ptr", callback, "ptr*", ppCameraControlMonitor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the ASF Header Object object.
     * @param {Pointer<IMFASFContentInfo>} ppIContentInfo Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfcontentinfo
     * @since windows6.0.6000
     */
    static MFCreateASFContentInfo(ppIContentInfo) {
        result := DllCall("MF.dll\MFCreateASFContentInfo", "ptr*", ppIContentInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the ASF Indexer object.
     * @param {Pointer<IMFASFIndexer>} ppIIndexer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfindexer">IMFASFIndexer</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfindexer
     * @since windows6.0.6000
     */
    static MFCreateASFIndexer(ppIIndexer) {
        result := DllCall("MF.dll\MFCreateASFIndexer", "ptr*", ppIIndexer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a byte stream to access the index in an ASF stream.
     * @param {IMFByteStream} pIContentByteStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream that contains the ASF stream.
     * @param {Integer} cbIndexStartOffset Byte offset of the index within the ASF stream. To get this value, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfindexer-getindexposition">IMFASFIndexer::GetIndexPosition</a>.
     * @param {Pointer<IMFByteStream>} pIIndexByteStream Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. Use this interface to read from the index or write to the index. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The offset specified in <i>cbIndexStartOffset</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfindexerbytestream
     * @since windows6.0.6000
     */
    static MFCreateASFIndexerByteStream(pIContentByteStream, cbIndexStartOffset, pIIndexByteStream) {
        result := DllCall("MF.dll\MFCreateASFIndexerByteStream", "ptr", pIContentByteStream, "uint", cbIndexStartOffset, "ptr*", pIIndexByteStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the ASF Splitter.
     * @param {Pointer<IMFASFSplitter>} ppISplitter Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfsplitter">IMFASFSplitter</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfsplitter
     * @since windows6.0.6000
     */
    static MFCreateASFSplitter(ppISplitter) {
        result := DllCall("MF.dll\MFCreateASFSplitter", "ptr*", ppISplitter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the ASF profile object.
     * @param {Pointer<IMFASFProfile>} ppIProfile Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfprofile
     * @since windows6.0.6000
     */
    static MFCreateASFProfile(ppIProfile) {
        result := DllCall("MF.dll\MFCreateASFProfile", "ptr*", ppIProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an ASF profile object from a presentation descriptor.
     * @param {IMFPresentationDescriptor} pIPD Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor that contains the profile information.
     * @param {Pointer<IMFASFProfile>} ppIProfile Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfprofilefrompresentationdescriptor
     * @since windows6.0.6000
     */
    static MFCreateASFProfileFromPresentationDescriptor(pIPD, ppIProfile) {
        result := DllCall("MF.dll\MFCreateASFProfileFromPresentationDescriptor", "ptr", pIPD, "ptr*", ppIProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a presentation descriptor from an ASF profile object.
     * @param {IMFASFProfile} pIProfile Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface of the ASF profile object.
     * @param {Pointer<IMFPresentationDescriptor>} ppIPD Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreatepresentationdescriptorfromasfprofile
     * @since windows6.0.6000
     */
    static MFCreatePresentationDescriptorFromASFProfile(pIProfile, ppIPD) {
        result := DllCall("MF.dll\MFCreatePresentationDescriptorFromASFProfile", "ptr", pIProfile, "ptr*", ppIPD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the ASF Multiplexer.
     * @param {Pointer<IMFASFMultiplexer>} ppIMultiplexer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfmultiplexer">IMFASFMultiplexer</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfmultiplexer
     * @since windows6.0.6000
     */
    static MFCreateASFMultiplexer(ppIMultiplexer) {
        result := DllCall("MF.dll\MFCreateASFMultiplexer", "ptr*", ppIMultiplexer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the ASF stream selector.
     * @param {IMFASFProfile} pIASFProfile Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface.
     * @param {Pointer<IMFASFStreamSelector>} ppSelector Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamselector">IMFASFStreamSelector</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfstreamselector
     * @since windows6.0.6000
     */
    static MFCreateASFStreamSelector(pIASFProfile, ppSelector) {
        result := DllCall("MF.dll\MFCreateASFStreamSelector", "ptr", pIASFProfile, "ptr*", ppSelector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the ASF media sink.
     * @param {IMFByteStream} pIByteStream Pointer to a byte stream that will be used to write the ASF stream.
     * @param {Pointer<IMFMediaSink>} ppIMediaSink Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfmediasink
     * @since windows6.0.6000
     */
    static MFCreateASFMediaSink(pIByteStream, ppIMediaSink) {
        result := DllCall("MF.dll\MFCreateASFMediaSink", "ptr", pIByteStream, "ptr*", ppIMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object that can be used to create the ASF media sink.
     * @param {PWSTR} pwszFileName Null-terminated wide-character string that contains the output file name.
     * @param {IMFASFContentInfo} pContentInfo A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface of an initialized <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-file-structure">ASF Header Object</a> object. Use this interface to configure the ASF media sink.
     * @param {Pointer<IMFActivate>} ppIActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfmediasinkactivate
     * @since windows6.0.6000
     */
    static MFCreateASFMediaSinkActivate(pwszFileName, pContentInfo, ppIActivate) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := DllCall("MF.dll\MFCreateASFMediaSinkActivate", "ptr", pwszFileName, "ptr", pContentInfo, "ptr*", ppIActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object that can be used to create a Windows Media Video (WMV) encoder.
     * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. This parameter specifies the encoded output format.
     * @param {IPropertyStore} pEncodingConfigurationProperties A pointer to the <b>IPropertyStore</b> interface of a property store that contains encoding parameters. Encoding parameters for the WMV encoder are defined in the header file wmcodecdsp.h. If you have an ASF ContentInfo object that contains an ASF profile object with all the streams for the output file, you can get the property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getencodingconfigurationpropertystore">IMFASFContentInfo::GetEncodingConfigurationPropertyStore</a>.
     * @param {Pointer<IMFActivate>} ppActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to create the encoder. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreatewmvencoderactivate
     * @since windows6.0.6000
     */
    static MFCreateWMVEncoderActivate(pMediaType, pEncodingConfigurationProperties, ppActivate) {
        result := DllCall("MF.dll\MFCreateWMVEncoderActivate", "ptr", pMediaType, "ptr", pEncodingConfigurationProperties, "ptr*", ppActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object that can be used to create a Windows Media Audio (WMA) encoder.
     * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. This parameter specifies the encoded output format.
     * @param {IPropertyStore} pEncodingConfigurationProperties A pointer to the <b>IPropertyStore</b> interface of a property store that contains encoding parameters. Encoding parameters for the WMV encoder are defined in the header file wmcodecdsp.h. If you have an ASF ContentInfo object that contains an ASF profile object with all the streams for the output file, you can get the property store by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getencodingconfigurationpropertystore">IMFASFContentInfo::GetEncodingConfigurationPropertyStore</a>.
     * @param {Pointer<IMFActivate>} ppActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. Use this interface to create the encoder. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreatewmaencoderactivate
     * @since windows6.0.6000
     */
    static MFCreateWMAEncoderActivate(pMediaType, pEncodingConfigurationProperties, ppActivate) {
        result := DllCall("MF.dll\MFCreateWMAEncoderActivate", "ptr", pMediaType, "ptr", pEncodingConfigurationProperties, "ptr*", ppActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object for the ASF streaming sink.
     * @param {IMFByteStream} pIByteStream A pointer to a byte stream object in which the ASF media sink writes the streamed content.
     * @param {Pointer<IMFMediaSink>} ppIMediaSink Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of the ASF streaming-media sink object. To create the media sink, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> on the received pointer. The caller must release the interface pointer.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfstreamingmediasink
     * @since windows6.1
     */
    static MFCreateASFStreamingMediaSink(pIByteStream, ppIMediaSink) {
        result := DllCall("MF.dll\MFCreateASFStreamingMediaSink", "ptr", pIByteStream, "ptr*", ppIMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object for the ASF streaming sink.
     * @param {IMFActivate} pByteStreamActivate A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of an activation object. The caller  implements this interface.  The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> method of the activation object must create a byte-stream object. The byte stream exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. The ASF streaming sink will write data to this byte stream.
     * @param {IMFASFContentInfo} pContentInfo A pointer to an <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-contentinfo-object">ASF ContentInfo Object</a> that contains the properties that describe the ASF content. These  settings can contain  stream settings, encoding properties, and metadata. For more information about these properties, see <a href="https://docs.microsoft.com/windows/desktop/medfound/setting-properties-in-the-contentinfo-object">Setting Properties in the ContentInfo Object</a>.
     * @param {Pointer<IMFActivate>} ppIActivate Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of the activation object that is used to create the ASF streaming-media sink. To create the media sink, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> by using the received pointer. The <b>ActivateObject</b> method also calls   <b>IMFActivate::Activate</b> on the byte stream activate object specified by  <i>pByteStreamActivate</i>, to create it so that the media sink can write streamed content in the byte stream. The caller must release the <b>IMFActivate</b> interface pointer of the media sink activation object received in <i>ppIActivate</i>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-mfcreateasfstreamingmediasinkactivate
     * @since windows6.1
     */
    static MFCreateASFStreamingMediaSinkActivate(pByteStreamActivate, pContentInfo, ppIActivate) {
        result := DllCall("MF.dll\MFCreateASFStreamingMediaSinkActivate", "ptr", pByteStreamActivate, "ptr", pContentInfo, "ptr*", ppIActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {ID3D12Device} pDevice 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvSyncObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-mfcreated3d12synchronizationobject
     */
    static MFCreateD3D12SynchronizationObject(pDevice, riid, ppvSyncObject) {
        result := DllCall("MFPlat.dll\MFCreateD3D12SynchronizationObject", "ptr", pDevice, "ptr", riid, "ptr*", ppvSyncObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes Microsoft Media Foundation.
     * @param {Integer} Version Version number. Use the value <b>MF_VERSION</b>, defined in mfapi.h.
     * @param {Integer} dwFlags This parameter is optional when using C++ but required in C. The value must be one of the following flags:
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>MFSTARTUP_NOSOCKET</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not initialize the sockets library.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>MFSTARTUP_LITE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Equivalent to MFSTARTUP_NOSOCKET.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>MFSTARTUP_FULL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Initialize the entire Media Foundation platform. This is the default value when <i>dwFlags</i> is not specified.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BAD_STARTUP_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Version</i> parameter requires a newer version of Media Foundation than the version that is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_DISABLED_IN_SAFEMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Foundation platform is disabled because the system was started in "Safe Mode" (fail-safe boot).
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media Foundation is not implemented on the system.  This error can occur if the media components are not present (See <a href="https://support.microsoft.com/help/2703761">KB2703761</a> for more info). 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfstartup
     * @since windows6.0.6000
     */
    static MFStartup(Version, dwFlags) {
        result := DllCall("MFPlat.dll\MFStartup", "uint", Version, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Shuts down the Microsoft Media Foundation platform.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfshutdown
     * @since windows6.0.6000
     */
    static MFShutdown() {
        result := DllCall("MFPlat.dll\MFShutdown", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Blocks the MFShutdown function.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mflockplatform
     * @since windows6.0.6000
     */
    static MFLockPlatform() {
        result := DllCall("MFPlat.dll\MFLockPlatform", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unlocks the Media Foundation platform after it was locked by a call to the MFLockPlatform function.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfunlockplatform
     * @since windows6.0.6000
     */
    static MFUnlockPlatform() {
        result := DllCall("MFPlat.dll\MFUnlockPlatform", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Puts an asynchronous operation on a work queue.
     * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueueex">MFAllocateWorkQueueEx</a>.
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. The caller must implement this interface.
     * @param {IUnknown} pState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid work queue. For more information, see <a href="/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters">IMFAsyncCallback::GetParameters</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function was not called, or <a href="/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfputworkitem
     * @since windows6.0.6000
     */
    static MFPutWorkItem(dwQueue, pCallback, pState) {
        result := DllCall("MFPlat.dll\MFPutWorkItem", "uint", dwQueue, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Puts an asynchronous operation on a work queue, with a specified priority.
     * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> or  MFAllocateWorkQueueEx.
     * @param {Integer} Priority The priority of the work item. Work items are performed in order of priority.
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. The caller must implement this interface.
     * @param {IUnknown} pState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid work queue identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function was not called, or <a href="/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfputworkitem2
     * @since windows8.0
     */
    static MFPutWorkItem2(dwQueue, Priority, pCallback, pState) {
        result := DllCall("MFPlat.dll\MFPutWorkItem2", "uint", dwQueue, "int", Priority, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Puts an asynchronous operation on a work queue.
     * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueueex">MFAllocateWorkQueueEx</a>.
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid work queue identifier. For more information, see <a href="/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters">IMFAsyncCallback::GetParameters</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function was not called, or <a href="/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfputworkitemex
     * @since windows6.0.6000
     */
    static MFPutWorkItemEx(dwQueue, pResult) {
        result := DllCall("MFPlat.dll\MFPutWorkItemEx", "uint", dwQueue, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Puts an asynchronous operation on a work queue, with a specified priority.
     * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard Media Foundation work queues, or a work queue created by the application. For list of standard Media Foundation work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>. To create a new work queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueueex">MFAllocateWorkQueueEx</a>.
     * @param {Integer} Priority The priority of the work item. This value should be 1, 0, or -1. Items with a value of 1 are executed before items with a value of 0. Items with a value of  -1 are executed after items with a value of 0.
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid work queue identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a> function was not called, or <a href="/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfputworkitemex2
     * @since windows8.0
     */
    static MFPutWorkItemEx2(dwQueue, Priority, pResult) {
        result := DllCall("MFPlat.dll\MFPutWorkItemEx2", "uint", dwQueue, "int", Priority, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Queues a work item that waits for an event to be signaled.
     * @param {HANDLE} hEvent A handle to an event object. To create an event object, call <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventexa">CreateEventEx</a>.
     * @param {Integer} Priority The priority of the work item. Work items are performed in order of priority.
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
     * @param {Pointer<Integer>} pKey Receives a key that can be used to cancel the wait. To cancel the wait, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcancelworkitem">MFCancelWorkItem</a> and pass this key in the <i>Key</i> parameter.
     * 
     * This parameter can be <b>NULL</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfputwaitingworkitem
     * @since windows8.0
     */
    static MFPutWaitingWorkItem(hEvent, Priority, pResult, pKey) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := DllCall("MFPlat.dll\MFPutWaitingWorkItem", "ptr", hEvent, "int", Priority, "ptr", pResult, "uint*", pKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a work queue that is guaranteed to serialize work items.
     * @param {Integer} dwWorkQueue The identifier of an existing work queue. This must be either a multithreaded queue or another serial work queue. Any of the following can be used:
     * 
     * <ul>
     * <li>The default work queue (<b>MFASYNC_CALLBACK_QUEUE_STANDARD</b>)</li>
     * <li>The platform multithreaded queue (<b>MFASYNC_CALLBACK_QUEUE_MULTITHREADED</b>)</li>
     * <li>A multithreaded queue returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mflocksharedworkqueue">MFLockSharedWorkQueue</a>  function.</li>
     * <li>A serial queue created by the <b>MFAllocateSerialWorkQueue</b> function.</li>
     * </ul>
     * @param {Pointer<Integer>} pdwWorkQueue Receives an identifier for the new serial work queue. Use this identifier when queuing work items.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application exceeded the maximum number of work queues.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not call <a href="/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a>, or the application has already called <a href="/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a>.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfallocateserialworkqueue
     * @since windows8.0
     */
    static MFAllocateSerialWorkQueue(dwWorkQueue, pdwWorkQueue) {
        result := DllCall("MFPlat.dll\MFAllocateSerialWorkQueue", "uint", dwWorkQueue, "uint*", pdwWorkQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Schedules an asynchronous operation to be completed after a specified interval.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
     * @param {Integer} Timeout Time-out interval, in milliseconds. Set this parameter to a negative value. The callback is invoked after −<i>Timeout</i> milliseconds. For example, if <i>Timeout</i> is −5000, the callback is invoked after 5000 milliseconds.
     * @param {Pointer<Integer>} pKey Receives a key that can be used to cancel the timer. To cancel the timer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcancelworkitem">MFCancelWorkItem</a> and pass this key in the <i>Key</i> parameter.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfscheduleworkitemex
     * @since windows6.0.6000
     */
    static MFScheduleWorkItemEx(pResult, Timeout, pKey) {
        result := DllCall("MFPlat.dll\MFScheduleWorkItemEx", "ptr", pResult, "int64", Timeout, "uint*", pKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Schedules an asynchronous operation to be completed after a specified interval.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. The caller must implement this interface.
     * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @param {Integer} Timeout Time-out interval, in milliseconds. Set this parameter to a negative value. The callback is invoked after −<i>Timeout</i> milliseconds. For example, if <i>Timeout</i> is −5000, the callback is invoked after 5000 milliseconds.
     * @param {Pointer<Integer>} pKey Receives a key that can be used to cancel the timer. To cancel the timer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcancelworkitem">MFCancelWorkItem</a> and pass this key in the <i>Key</i> parameter.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfscheduleworkitem
     * @since windows6.0.6000
     */
    static MFScheduleWorkItem(pCallback, pState, Timeout, pKey) {
        result := DllCall("MFPlat.dll\MFScheduleWorkItem", "ptr", pCallback, "ptr", pState, "int64", Timeout, "uint*", pKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Attempts to cancel an asynchronous operation that was scheduled with MFScheduleWorkItem or MFScheduleWorkItemEx.
     * @param {Integer} Key The key that was received in the <i>pKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfscheduleworkitem">MFScheduleWorkItem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfscheduleworkitemex">MFScheduleWorkItemEx</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputwaitingworkitem">MFPutWaitingWorkItem</a> functions.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcancelworkitem
     * @since windows6.0.6000
     */
    static MFCancelWorkItem(Key) {
        result := DllCall("MFPlat.dll\MFCancelWorkItem", "uint", Key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the timer interval for the MFAddPeriodicCallback function.
     * @param {Pointer<Integer>} Periodicity Receives the timer interval, in milliseconds.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgettimerperiodicity
     * @since windows6.0.6000
     */
    static MFGetTimerPeriodicity(Periodicity) {
        result := DllCall("MFPlat.dll\MFGetTimerPeriodicity", "uint*", Periodicity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a callback function to be called at a fixed interval.
     * @param {Pointer<MFPERIODICCALLBACK>} Callback Pointer to the callback function, of type <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nc-mfapi-mfperiodiccallback">MFPERIODICCALLBACK</a>.
     * @param {IUnknown} pContext Pointer to a caller-provided object that implements <b>IUnknown</b>, or <b>NULL</b>. This parameter is passed to the callback function.
     * @param {Pointer<Integer>} pdwKey Receives a key that can be used to cancel the callback. To cancel the callback, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfremoveperiodiccallback">MFRemovePeriodicCallback</a> and pass this key as the <i>dwKey</i> parameter.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfaddperiodiccallback
     * @since windows6.0.6000
     */
    static MFAddPeriodicCallback(Callback, pContext, pdwKey) {
        result := DllCall("MFPlat.dll\MFAddPeriodicCallback", "ptr", Callback, "ptr", pContext, "uint*", pdwKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels a callback function that was set by the MFAddPeriodicCallback function.
     * @param {Integer} dwKey Key that identifies the callback. This value is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfaddperiodiccallback">MFAddPeriodicCallback</a> function.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfremoveperiodiccallback
     * @since windows6.0.6000
     */
    static MFRemovePeriodicCallback(dwKey) {
        result := DllCall("MFPlat.dll\MFRemovePeriodicCallback", "uint", dwKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new work queue.
     * @param {Integer} WorkQueueType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ne-mfapi-mfasync_workqueue_type">MFASYNC_WORKQUEUE_TYPE</a> enumeration, specifying the type of work queue to create.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_MULTITHREADED_WORKQUEUE"></a><a id="mf_multithreaded_workqueue"></a><dl>
     * <dt><b>MF_MULTITHREADED_WORKQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a multithreaded work queue. Generally, applications should not create private multithreaded queues. Use the platform multithreaded queues instead. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-work-queue-and-threading-improvements">Work Queue and Threading Improvements</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_STANDARD_WORKQUEUE"></a><a id="mf_standard_workqueue"></a><dl>
     * <dt><b>MF_STANDARD_WORKQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a work queue without a message loop. Using this flag is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_WINDOW_WORKQUEUE"></a><a id="mf_window_workqueue"></a><dl>
     * <dt><b>MF_WINDOW_WORKQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a work queue with a message loop. The thread that dispatches the work items for this queue will also call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dispatchmessage">DispatchMessage</a>. Use this option if your callback performs any actions that require a message loop.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwWorkQueue Receives an identifier for the work queue that was created.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application exceeded the maximum number of work queues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not call <a href="/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a>, or the application has already called <a href="/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfallocateworkqueueex
     * @since windows6.1
     */
    static MFAllocateWorkQueueEx(WorkQueueType, pdwWorkQueue) {
        result := DllCall("MFPlat.dll\MFAllocateWorkQueueEx", "int", WorkQueueType, "uint*", pdwWorkQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new work queue.
     * @param {Pointer<Integer>} pdwWorkQueue Receives an identifier for the work queue.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application exceeded the maximum number of work queues.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not call <a href="/windows/desktop/api/mfapi/nf-mfapi-mfstartup">MFStartup</a>, or the application has already called <a href="/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a>.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfallocateworkqueue
     * @since windows6.0.6000
     */
    static MFAllocateWorkQueue(pdwWorkQueue) {
        result := DllCall("MFPlat.dll\MFAllocateWorkQueue", "uint*", pdwWorkQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Locks a work queue.
     * @param {Integer} dwWorkQueue The identifier for the work queue. The identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mflockworkqueue
     * @since windows6.0.6000
     */
    static MFLockWorkQueue(dwWorkQueue) {
        result := DllCall("MFPlat.dll\MFLockWorkQueue", "uint", dwWorkQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unlocks a work queue.
     * @param {Integer} dwWorkQueue Identifier for the work queue to be unlocked. The identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfunlockworkqueue
     * @since windows6.0.6000
     */
    static MFUnlockWorkQueue(dwWorkQueue) {
        result := DllCall("MFPlat.dll\MFUnlockWorkQueue", "uint", dwWorkQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Associates a work queue with a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {Integer} dwWorkQueueId The identifier of the work queue.  For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function. For platform work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
     * @param {PWSTR} wszClass The name of the MMCSS task.For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/multimedia-class-scheduler-service">Multimedia Class Scheduler Service</a>.
     * @param {Integer} dwTaskId The unique task identifier. To obtain a new task identifier, set this value to zero.
     * @param {IMFAsyncCallback} pDoneCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pDoneState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcss
     * @since windows6.0.6000
     */
    static MFBeginRegisterWorkQueueWithMMCSS(dwWorkQueueId, wszClass, dwTaskId, pDoneCallback, pDoneState) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := DllCall("MFPlat.dll\MFBeginRegisterWorkQueueWithMMCSS", "uint", dwWorkQueueId, "ptr", wszClass, "uint", dwTaskId, "ptr", pDoneCallback, "ptr", pDoneState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Associates a work queue with a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {Integer} dwWorkQueueId The identifier of the work queue.  For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function. For platform work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
     * @param {PWSTR} wszClass The name of the MMCSS task. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/multimedia-class-scheduler-service">Multimedia Class Scheduler Service</a>.
     * @param {Integer} dwTaskId The unique task identifier. To obtain a new task identifier, set this value to zero.
     * @param {Integer} lPriority The base relative priority for the work-queue threads. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadpriority">AvSetMmThreadPriority</a>.
     * @param {IMFAsyncCallback} pDoneCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pDoneState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfbeginregisterworkqueuewithmmcssex
     * @since windows8.0
     */
    static MFBeginRegisterWorkQueueWithMMCSSEx(dwWorkQueueId, wszClass, dwTaskId, lPriority, pDoneCallback, pDoneState) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := DllCall("MFPlat.dll\MFBeginRegisterWorkQueueWithMMCSSEx", "uint", dwWorkQueueId, "ptr", wszClass, "uint", dwTaskId, "int", lPriority, "ptr", pDoneCallback, "ptr", pDoneState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Completes an asynchronous request to associate a work queue with a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @param {Pointer<Integer>} pdwTaskId The unique task identifier.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfendregisterworkqueuewithmmcss
     * @since windows6.0.6000
     */
    static MFEndRegisterWorkQueueWithMMCSS(pResult, pdwTaskId) {
        result := DllCall("MFPlat.dll\MFEndRegisterWorkQueueWithMMCSS", "ptr", pResult, "uint*", pdwTaskId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters a work queue from a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {Integer} dwWorkQueueId The identifier of the work queue.  For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function. For platform work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
     * @param {IMFAsyncCallback} pDoneCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pDoneState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfbeginunregisterworkqueuewithmmcss
     * @since windows6.0.6000
     */
    static MFBeginUnregisterWorkQueueWithMMCSS(dwWorkQueueId, pDoneCallback, pDoneState) {
        result := DllCall("MFPlat.dll\MFBeginUnregisterWorkQueueWithMMCSS", "uint", dwWorkQueueId, "ptr", pDoneCallback, "ptr", pDoneState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Completes an asynchronous request to unregister a work queue from a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfendunregisterworkqueuewithmmcss
     * @since windows6.0.6000
     */
    static MFEndUnregisterWorkQueueWithMMCSS(pResult) {
        result := DllCall("MFPlat.dll\MFEndUnregisterWorkQueueWithMMCSS", "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) class currently associated with this work queue.
     * @param {Integer} dwWorkQueueId Identifier for the work queue. The identifier is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function.
     * @param {PWSTR} pwszClass Pointer to a buffer that receives the name of the MMCSS class. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pcchClass On input, specifies the size of the <i>pwszClass</i> buffer, in characters. On output, receives the required size of the buffer, in characters. The size includes the terminating null character.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwszClass</i> buffer is too small to receive the task name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetworkqueuemmcssclass
     * @since windows6.0.6000
     */
    static MFGetWorkQueueMMCSSClass(dwWorkQueueId, pwszClass, pcchClass) {
        pwszClass := pwszClass is String ? StrPtr(pwszClass) : pwszClass

        result := DllCall("MFPlat.dll\MFGetWorkQueueMMCSSClass", "uint", dwWorkQueueId, "ptr", pwszClass, "uint*", pcchClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) task identifier currently associated with this work queue.
     * @param {Integer} dwWorkQueueId Identifier for the work queue. The identifier is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function.
     * @param {Pointer<Integer>} pdwTaskId Receives the task identifier.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetworkqueuemmcsstaskid
     * @since windows6.0.6000
     */
    static MFGetWorkQueueMMCSSTaskId(dwWorkQueueId, pdwTaskId) {
        result := DllCall("MFPlat.dll\MFGetWorkQueueMMCSSTaskId", "uint", dwWorkQueueId, "uint*", pdwTaskId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers the standard Microsoft Media Foundation platform work queues with the Multimedia Class Scheduler Service (MMCSS).
     * @param {PWSTR} wszClass The name of the MMCSS task.
     * @param {Pointer<Integer>} pdwTaskId The MMCSS task identifier. On input, specify an existing  MCCSS task group ID, or use the value zero to create a new task group. On output, receives the actual task group ID.
     * @param {Integer} lPriority The base priority of the work-queue threads.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfregisterplatformwithmmcss
     * @since windows8.0
     */
    static MFRegisterPlatformWithMMCSS(wszClass, pdwTaskId, lPriority) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := DllCall("MFPlat.dll\MFRegisterPlatformWithMMCSS", "ptr", wszClass, "uint*", pdwTaskId, "int", lPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters the Microsoft Media Foundation platform work queues from a Multimedia Class Scheduler Service (MMCSS) task.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfunregisterplatformfrommmcss
     * @since windows8.0
     */
    static MFUnregisterPlatformFromMMCSS() {
        result := DllCall("MFPlat.dll\MFUnregisterPlatformFromMMCSS", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains and locks a shared work queue.
     * @param {PWSTR} wszClass The name of the MMCSS task.
     * @param {Integer} BasePriority The base priority of the work-queue threads. 
     * 
     * If the regular-priority queue is being used (<i>wszClass</i>=""), then the value 0 must be passed in.
     * @param {Pointer<Integer>} pdwTaskId The MMCSS task identifier. On input, specify an existing MCCSS task group ID , or use the value zero to create a new task group. If the regular priority queue is being used (<i>wszClass</i>=""), then <b>NULL</b> must be passed in. On output, receives the actual task group ID.
     * @param {Pointer<Integer>} pID Receives an identifier for the new work queue. Use this identifier when queuing work items.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mflocksharedworkqueue
     * @since windows8.0
     */
    static MFLockSharedWorkQueue(wszClass, BasePriority, pdwTaskId, pID) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := DllCall("MFPlat.dll\MFLockSharedWorkQueue", "ptr", wszClass, "int", BasePriority, "uint*", pdwTaskId, "uint*", pID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the relative thread priority of a work queue.
     * @param {Integer} dwWorkQueueId The identifier of the work queue. For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfallocateworkqueue">MFAllocateWorkQueue</a> function. For platform work queues, see <a href="https://docs.microsoft.com/windows/desktop/medfound/work-queue-identifiers">Work Queue Identifiers</a>.
     * @param {Pointer<Integer>} lPriority Receives the relative thread priority.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetworkqueuemmcsspriority
     * @since windows8.0
     */
    static MFGetWorkQueueMMCSSPriority(dwWorkQueueId, lPriority) {
        result := DllCall("MFPlat.dll\MFGetWorkQueueMMCSSPriority", "uint", dwWorkQueueId, "int*", lPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an asynchronous result object. Use this function if you are implementing an asynchronous method.
     * @param {IUnknown} punkObject Pointer to the object stored in the asynchronous result. This pointer is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasyncresult-getobject">IMFAsyncResult::GetObject</a> method. This parameter can be <b>NULL</b>.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. This interface is implemented by the caller of the asynchronous method.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object. This value is provided by the caller of the asynchronous method. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFAsyncResult>} ppAsyncResult Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreateasyncresult
     * @since windows6.0.6000
     */
    static MFCreateAsyncResult(punkObject, pCallback, punkState, ppAsyncResult) {
        result := DllCall("MFPlat.dll\MFCreateAsyncResult", "ptr", punkObject, "ptr", pCallback, "ptr", punkState, "ptr*", ppAsyncResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Invokes a callback method to complete an asynchronous operation.
     * @param {IMFAsyncResult} pAsyncResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. To create this object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALID_WORKQUEUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid work queue. For more information, see <a href="/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-getparameters">IMFAsyncCallback::GetParameters</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> function was called to shut down the Media Foundation platform.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinvokecallback
     * @since windows6.0.6000
     */
    static MFInvokeCallback(pAsyncResult) {
        result := DllCall("MFPlat.dll\MFInvokeCallback", "ptr", pAsyncResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a byte stream from a file.
     * @param {Integer} AccessMode The requested access mode, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode">MF_FILE_ACCESSMODE</a> enumeration.
     * @param {Integer} OpenMode The behavior of the function if the file already exists or does not exist, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_openmode">MF_FILE_OPENMODE</a> enumeration.
     * @param {Integer} fFlags Bitwise <b>OR</b> of values from the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags">MF_FILE_FLAGS</a> enumeration.
     * @param {PWSTR} pwszFileURL Pointer to a null-terminated string that contains the file name.
     * @param {Pointer<IMFByteStream>} ppIByteStream Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatefile
     * @since windows6.0.6000
     */
    static MFCreateFile(AccessMode, OpenMode, fFlags, pwszFileURL, ppIByteStream) {
        pwszFileURL := pwszFileURL is String ? StrPtr(pwszFileURL) : pwszFileURL

        result := DllCall("MFPlat.dll\MFCreateFile", "int", AccessMode, "int", OpenMode, "int", fFlags, "ptr", pwszFileURL, "ptr*", ppIByteStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a byte stream that is backed by a temporary local file.
     * @param {Integer} AccessMode The requested access mode, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode">MF_FILE_ACCESSMODE</a> enumeration.
     * @param {Integer} OpenMode The behavior of the function if the file already exists or does not exist, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_openmode">MF_FILE_OPENMODE</a> enumeration.
     * @param {Integer} fFlags Bitwise <b>OR</b> of values from the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags">MF_FILE_FLAGS</a> enumeration.
     * @param {Pointer<IMFByteStream>} ppIByteStream Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatetempfile
     * @since windows6.0.6000
     */
    static MFCreateTempFile(AccessMode, OpenMode, fFlags, ppIByteStream) {
        result := DllCall("MFPlat.dll\MFCreateTempFile", "int", AccessMode, "int", OpenMode, "int", fFlags, "ptr*", ppIByteStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Begins an asynchronous request to create a byte stream from a file.
     * @param {Integer} AccessMode The requested access mode, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_accessmode">MF_FILE_ACCESSMODE</a> enumeration.
     * @param {Integer} OpenMode The behavior of the function if the file already exists or does not exist, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_openmode">MF_FILE_OPENMODE</a> enumeration.
     * @param {Integer} fFlags Bitwise <b>OR</b> of values from the <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_file_flags">MF_FILE_FLAGS</a> enumeration.
     * @param {PWSTR} pwszFilePath Pointer to a null-terminated string containing the file name.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface
     * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @param {Pointer<IUnknown>} ppCancelCookie Receives an <b>IUnknown</b> pointer or the value <b>NULL</b>. If the value is not <b>NULL</b>, you can cancel the asynchronous operation by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcancelcreatefile">MFCancelCreateFile</a> function. The caller must release the interface. This parameter is optional and can be <b>NULL</b>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfbegincreatefile
     * @since windows6.0.6000
     */
    static MFBeginCreateFile(AccessMode, OpenMode, fFlags, pwszFilePath, pCallback, pState, ppCancelCookie) {
        pwszFilePath := pwszFilePath is String ? StrPtr(pwszFilePath) : pwszFilePath

        result := DllCall("MFPlat.dll\MFBeginCreateFile", "int", AccessMode, "int", OpenMode, "int", fFlags, "ptr", pwszFilePath, "ptr", pCallback, "ptr", pState, "ptr*", ppCancelCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Completes an asynchronous request to create a byte stream from a file.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method.
     * @param {Pointer<IMFByteStream>} ppFile Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfendcreatefile
     * @since windows6.0.6000
     */
    static MFEndCreateFile(pResult, ppFile) {
        result := DllCall("MFPlat.dll\MFEndCreateFile", "ptr", pResult, "ptr*", ppFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels an asynchronous request to create a byte stream from a file.
     * @param {IUnknown} pCancelCookie A pointer to the <b>IUnknown</b> interface of the cancellation object. This pointer is received in the <i>ppCancelCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbegincreatefile">MFBeginCreateFile</a> function.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcancelcreatefile
     * @since windows6.0.6000
     */
    static MFCancelCreateFile(pCancelCookie) {
        result := DllCall("MFPlat.dll\MFCancelCreateFile", "ptr", pCancelCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates system memory and creates a media buffer to manage it.
     * @param {Integer} cbMaxLength Size of the buffer, in bytes.
     * @param {Pointer<IMFMediaBuffer>} ppBuffer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the media buffer. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatememorybuffer
     * @since windows6.0.6000
     */
    static MFCreateMemoryBuffer(cbMaxLength, ppBuffer) {
        result := DllCall("MFPlat.dll\MFCreateMemoryBuffer", "uint", cbMaxLength, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media buffer that wraps an existing media buffer.
     * @param {IMFMediaBuffer} pBuffer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the original media buffer.
     * @param {Integer} cbOffset The start of the new buffer, as an offset in bytes from the start of the original buffer.
     * @param {Integer} dwLength The size of the new buffer. The value of <i>cbOffset</i> + <i>dwLength</i> must be less than or equal to the size of valid data the original buffer. (The size of the valid data is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediabuffer-getcurrentlength">IMFMediaBuffer::GetCurrentLength</a> method.)
     * @param {Pointer<IMFMediaBuffer>} ppBuffer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested offset or the requested length is not valid.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemediabufferwrapper
     * @since windows6.0.6000
     */
    static MFCreateMediaBufferWrapper(pBuffer, cbOffset, dwLength, ppBuffer) {
        result := DllCall("MFPlat.dll\MFCreateMediaBufferWrapper", "ptr", pBuffer, "uint", cbOffset, "uint", dwLength, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a Media Foundation media buffer into a buffer that is compatible with DirectX Media Objects (DMOs).
     * @param {IMFSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the sample that contains the Media Foundation buffer. This parameter can be <b>NULL</b>.
     * @param {IMFMediaBuffer} pMFMediaBuffer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the Media Foundation buffer.
     * @param {Integer} cbOffset Offset in bytes from the start of the Media Foundation buffer. This offset defines where the DMO buffer starts. If this parameter is zero, the DMO buffer starts at the beginning of the Media Foundation buffer.
     * @param {Pointer<IMediaBuffer>} ppMediaBuffer Receives a pointer to the <b>IMediaBuffer</b> interface. This interface is documented in the DirectShow SDK documentation. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. The <i>pIMFMediaBuffer</i> parameter must not be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatelegacymediabufferonmfmediabuffer
     * @since windows6.0.6000
     */
    static MFCreateLegacyMediaBufferOnMFMediaBuffer(pSample, pMFMediaBuffer, cbOffset, ppMediaBuffer) {
        result := DllCall("MFPlat.dll\MFCreateLegacyMediaBufferOnMFMediaBuffer", "ptr", pSample, "ptr", pMFMediaBuffer, "uint", cbOffset, "ptr*", ppMediaBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a Microsoft Direct3D 9 format identifier to a Microsoft DirectX Graphics Infrastructure (DXGI) format identifier.
     * @param {Integer} dx9 The <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_d3dformat_data">D3DFORMAT</a> value or FOURCC code to convert.
     * @returns {Integer} Returns a <a href="/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfmapdx9formattodxgiformat
     * @since windows8.0
     */
    static MFMapDX9FormatToDXGIFormat(dx9) {
        result := DllCall("MFPlat.dll\MFMapDX9FormatToDXGIFormat", "uint", dx9, "int")
        return result
    }

    /**
     * Converts a Microsoft DirectX Graphics Infrastructure (DXGI) format identifier to a Microsoft Direct3D 9 format identifier.
     * @param {Integer} dx11 The <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value to convert.
     * @returns {Integer} Returns a <a href="/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_d3dformat_data">D3DFORMAT</a> value or FOURCC code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfmapdxgiformattodx9format
     * @since windows8.0
     */
    static MFMapDXGIFormatToDX9Format(dx11) {
        result := DllCall("MFPlat.dll\MFMapDXGIFormatToDX9Format", "int", dx11, "uint")
        return result
    }

    /**
     * Locks the shared Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
     * @param {Pointer<Integer>} pResetToken Receives a token that identifies this instance of the DXGI Device Manager. Use this token when calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a>.
     *           This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFDXGIDeviceManager>} ppManager Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mflockdxgidevicemanager
     * @since windows8.0
     */
    static MFLockDXGIDeviceManager(pResetToken, ppManager) {
        result := DllCall("MFPlat.dll\MFLockDXGIDeviceManager", "uint*", pResetToken, "ptr*", ppManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unlocks the shared Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfunlockdxgidevicemanager
     * @since windows8.0
     */
    static MFUnlockDXGIDeviceManager() {
        result := DllCall("MFPlat.dll\MFUnlockDXGIDeviceManager", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media buffer object that manages a Direct3D 9 surface.
     * @param {Pointer<Guid>} riid Identifies the type of Direct3D 9 surface. Currently this value must be <b>IID_IDirect3DSurface9</b>.
     * @param {IUnknown} punkSurface A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the DirectX surface.
     * @param {BOOL} fBottomUpWhenLinear If <b>TRUE</b>, the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto">IMF2DBuffer::ContiguousCopyTo</a> method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is <b>FALSE</b>, the <b>ContiguousCopyTo</b> method copies the buffer into a top-down format, which is compatible with DirectX.
     *           
     * 
     * For more information about top-down versus bottom-up images, see <a href="https://docs.microsoft.com/windows/desktop/medfound/image-stride">Image Stride</a>.
     * @param {Pointer<IMFMediaBuffer>} ppBuffer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the buffer.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatedxsurfacebuffer
     * @since windows6.0.6000
     */
    static MFCreateDXSurfaceBuffer(riid, punkSurface, fBottomUpWhenLinear, ppBuffer) {
        result := DllCall("MFPlat.dll\MFCreateDXSurfaceBuffer", "ptr", riid, "ptr", punkSurface, "int", fBottomUpWhenLinear, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media buffer object that manages a Windows Imaging Component (WIC).
     * @param {Pointer<Guid>} riid Set this parameter to <c>__uuidof(IWICBitmap)</c>.
     * @param {IUnknown} punkSurface A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the bitmap surface. The bitmap surface must be a WIC bitmap that exposes the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a> interface.
     * @param {Pointer<IMFMediaBuffer>} ppBuffer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatewicbitmapbuffer
     * @since windows8.0
     */
    static MFCreateWICBitmapBuffer(riid, punkSurface, ppBuffer) {
        result := DllCall("MFPlat.dll\MFCreateWICBitmapBuffer", "ptr", riid, "ptr", punkSurface, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media buffer to manage a Microsoft DirectX Graphics Infrastructure (DXGI) surface.
     * @param {Pointer<Guid>} riid Identifies the type of DXGI surface. This value must be <b>IID_ID3D11Texture2D</b>.
     * @param {IUnknown} punkSurface A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the DXGI surface.
     * @param {Integer} uSubresourceIndex The zero-based index of a subresource of the surface. The media buffer object is associated with this subresource.
     * @param {BOOL} fBottomUpWhenLinear If <b>TRUE</b>, the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto">IMF2DBuffer::ContiguousCopyTo</a> method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is <b>FALSE</b>, the <b>ContiguousCopyTo</b> method copies the buffer into a top-down format, which is compatible with Direct3D.
     *           
     * 
     * For more information about top-down versus bottom-up images, see <a href="https://docs.microsoft.com/windows/desktop/medfound/image-stride">Image Stride</a>.
     * @param {Pointer<IMFMediaBuffer>} ppBuffer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the buffer.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatedxgisurfacebuffer
     * @since windows8.0
     */
    static MFCreateDXGISurfaceBuffer(riid, punkSurface, uSubresourceIndex, fBottomUpWhenLinear, ppBuffer) {
        result := DllCall("MFPlat.dll\MFCreateDXGISurfaceBuffer", "ptr", riid, "ptr", punkSurface, "uint", uSubresourceIndex, "int", fBottomUpWhenLinear, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punkDevice 
     * @param {IMFMediaType} pMediaType 
     * @param {Integer} uSubresource 
     * @param {Pointer<IMFMediaBuffer>} ppBuffer 
     * @returns {HRESULT} 
     */
    static MFCreateDXGICrossAdapterBuffer(riid, punkDevice, pMediaType, uSubresource, ppBuffer) {
        result := DllCall("MFPlat.DLL\MFCreateDXGICrossAdapterBuffer", "ptr", riid, "ptr", punkDevice, "ptr", pMediaType, "uint", uSubresource, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an object that allocates video samples that are compatible with Microsoft DirectX Graphics Infrastructure (DXGI).
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppSampleAllocator Receives a pointer to the requested interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatevideosampleallocatorex
     * @since windows8.0
     */
    static MFCreateVideoSampleAllocatorEx(riid, ppSampleAllocator) {
        result := DllCall("MFPlat.dll\MFCreateVideoSampleAllocatorEx", "ptr", riid, "ptr*", ppSampleAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the Microsoft DirectX Graphics Infrastructure (DXGI) Device Manager.
     * @param {Pointer<Integer>} resetToken Receives a token that identifies this instance of the DXGI Device Manager. Use this token when calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgidevicemanager-resetdevice">IMFDXGIDeviceManager::ResetDevice</a>.
     * @param {Pointer<IMFDXGIDeviceManager>} ppDeviceManager Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatedxgidevicemanager
     * @since windows8.0
     */
    static MFCreateDXGIDeviceManager(resetToken, ppDeviceManager) {
        result := DllCall("MFPlat.dll\MFCreateDXGIDeviceManager", "uint*", resetToken, "ptr*", ppDeviceManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IUnknown} pDeviceManager 
     * @param {Pointer<Integer>} mode 
     * @returns {HRESULT} 
     */
    static MFGetDXGIDeviceManageMode(pDeviceManager, mode) {
        result := DllCall("MFPlat.DLL\MFGetDXGIDeviceManageMode", "ptr", pDeviceManager, "int*", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates system memory with a specified byte alignment and creates a media buffer to manage the memory.
     * @param {Integer} cbMaxLength Size of the buffer, in bytes.
     * @param {Integer} cbAligment Specifies the memory alignment for the buffer. Use one of the following constants.
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_1_BYTE_ALIGNMENT"></a><a id="mf_1_byte_alignment"></a><dl>
     * <dt><b>MF_1_BYTE_ALIGNMENT</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 1 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_2_BYTE_ALIGNMENT"></a><a id="mf_2_byte_alignment"></a><dl>
     * <dt><b>MF_2_BYTE_ALIGNMENT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 2 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_4_BYTE_ALIGNMENT"></a><a id="mf_4_byte_alignment"></a><dl>
     * <dt><b>MF_4_BYTE_ALIGNMENT</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 4 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_8_BYTE_ALIGNMENT"></a><a id="mf_8_byte_alignment"></a><dl>
     * <dt><b>MF_8_BYTE_ALIGNMENT</b></dt>
     * <dt>0x00000007</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 8 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_16_BYTE_ALIGNMENT"></a><a id="mf_16_byte_alignment"></a><dl>
     * <dt><b>MF_16_BYTE_ALIGNMENT</b></dt>
     * <dt>0x0000000F</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 16 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_32_BYTE_ALIGNMENT"></a><a id="mf_32_byte_alignment"></a><dl>
     * <dt><b>MF_32_BYTE_ALIGNMENT</b></dt>
     * <dt>0x0000001F</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 32 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_64_BYTE_ALIGNMENT"></a><a id="mf_64_byte_alignment"></a><dl>
     * <dt><b>MF_64_BYTE_ALIGNMENT</b></dt>
     * <dt>0x0000003F</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 64 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_128_BYTE_ALIGNMENT"></a><a id="mf_128_byte_alignment"></a><dl>
     * <dt><b>MF_128_BYTE_ALIGNMENT</b></dt>
     * <dt>0x0000007F</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 128 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_256_BYTE_ALIGNMENT"></a><a id="mf_256_byte_alignment"></a><dl>
     * <dt><b>MF_256_BYTE_ALIGNMENT</b></dt>
     * <dt>0x000000FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 256 bytes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_512_BYTE_ALIGNMENT"></a><a id="mf_512_byte_alignment"></a><dl>
     * <dt><b>MF_512_BYTE_ALIGNMENT</b></dt>
     * <dt>0x000001FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Align to 512 bytes.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<IMFMediaBuffer>} ppBuffer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the media buffer. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatealignedmemorybuffer
     * @since windows6.0.6000
     */
    static MFCreateAlignedMemoryBuffer(cbMaxLength, cbAligment, ppBuffer) {
        result := DllCall("MFPlat.dll\MFCreateAlignedMemoryBuffer", "uint", cbMaxLength, "uint", cbAligment, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media event object.
     * @param {Integer} met The event type. See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-gettype">IMFMediaEvent::GetType</a>. For a list of event types, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-events">Media Foundation Events</a>.
     * @param {Pointer<Guid>} guidExtendedType The extended type. See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getextendedtype">IMFMediaEvent::GetExtendedType</a>. If the event type does not have an extended type, use the value GUID_NULL.
     * @param {HRESULT} hrStatus The event status. See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getstatus">IMFMediaEvent::GetStatus</a>
     * @param {Pointer<PROPVARIANT>} pvValue The value associated with the event, if any. See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue">IMFMediaEvent::GetValue</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFMediaEvent>} ppEvent Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemediaevent
     * @since windows6.0.6000
     */
    static MFCreateMediaEvent(met, guidExtendedType, hrStatus, pvValue, ppEvent) {
        result := DllCall("MFPlat.dll\MFCreateMediaEvent", "uint", met, "ptr", guidExtendedType, "int", hrStatus, "ptr", pvValue, "ptr*", ppEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an event queue.
     * @param {Pointer<IMFMediaEventQueue>} ppMediaEventQueue Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventqueue">IMFMediaEventQueue</a> interface of the event queue. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreateeventqueue
     * @since windows6.0.6000
     */
    static MFCreateEventQueue(ppMediaEventQueue) {
        result := DllCall("MFPlat.dll\MFCreateEventQueue", "ptr*", ppMediaEventQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an empty media sample.
     * @param {Pointer<IMFSample>} ppIMFSample Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the media sample. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatesample
     * @since windows6.0.6000
     */
    static MFCreateSample(ppIMFSample) {
        result := DllCall("MFPlat.dll\MFCreateSample", "ptr*", ppIMFSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an empty attribute store.
     * @param {Pointer<IMFAttributes>} ppMFAttributes Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @param {Integer} cInitialSize The initial number of elements allocated for the attribute store. The attribute store grows as needed.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreateattributes
     * @since windows6.0.6000
     */
    static MFCreateAttributes(ppMFAttributes, cInitialSize) {
        result := DllCall("MFPlat.dll\MFCreateAttributes", "ptr*", ppMFAttributes, "uint", cInitialSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes the contents of an attribute store from a byte array.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
     * @param {Pointer} pBuf Pointer to the array that contains the initialization data.
     * @param {Integer} cbBufSize Size of the <i>pBuf</i> array, in bytes.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitattributesfromblob
     * @since windows6.0.6000
     */
    static MFInitAttributesFromBlob(pAttributes, pBuf, cbBufSize) {
        result := DllCall("MFPlat.dll\MFInitAttributesFromBlob", "ptr", pAttributes, "ptr", pBuf, "uint", cbBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the size of the buffer needed for the MFGetAttributesAsBlob function.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
     * @param {Pointer<Integer>} pcbBufSize Receives the required size of the array, in bytes.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetattributesasblobsize
     * @since windows6.0.6000
     */
    static MFGetAttributesAsBlobSize(pAttributes, pcbBufSize) {
        result := DllCall("MFPlat.dll\MFGetAttributesAsBlobSize", "ptr", pAttributes, "uint*", pcbBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts the contents of an attribute store to a byte array.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store.
     * @param {Pointer} pBuf Pointer to an array that receives the attribute data.
     * @param {Integer} cbBufSize Size of the <i>pBuf</i> array, in bytes. To get the required size of the buffer, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfgetattributesasblobsize">MFGetAttributesAsBlobSize</a>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer given in <i>pBuf</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetattributesasblob
     * @since windows6.0.6000
     */
    static MFGetAttributesAsBlob(pAttributes, pBuf, cbBufSize) {
        result := DllCall("MFPlat.dll\MFGetAttributesAsBlob", "ptr", pAttributes, "ptr", pBuf, "uint", cbBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds information about a Media Foundation transform (MFT) to the registry.
     * @param {Guid} clsidMFT The CLSID of the MFT.
     *           The MFT must also be registered as a COM object using the same CLSID.
     * @param {Guid} guidCategory GUID that specifies the category of the MFT. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {PWSTR} pszName Wide-character string that contains the friendly name of the MFT.
     * @param {Integer} Flags Bitwise <b>OR</b> of zero or more of the following flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a>  enumeration:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFT_ENUM_FLAG_ASYNCMFT"></a><a id="mft_enum_flag_asyncmft"></a><dl>
     * <dt><b>MFT_ENUM_FLAG_ASYNCMFT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT performs asynchronous processing in software. See <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-mfts">Asynchronous MFTs</a>. This flag does not apply to hardware transforms.
     * 
     * Requires Windows 7.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFT_ENUM_FLAG_FIELDOFUSE"></a><a id="mft_enum_flag_fieldofuse"></a><dl>
     * <dt><b>MFT_ENUM_FLAG_FIELDOFUSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application must unlock the MFT in order to use it. See <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imffieldofusemftunlock">IMFFieldOfUseMFTUnlock</a>.
     * 
     * Requires Windows 7.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFT_ENUM_FLAG_HARDWARE"></a><a id="mft_enum_flag_hardware"></a><dl>
     * <dt><b>MFT_ENUM_FLAG_HARDWARE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT performs hardware-based data processing, using either the AVStream driver or a GPU-based proxy MFT. MFTs in this category always process data asynchronously. See <a href="https://docs.microsoft.com/windows/desktop/medfound/hardware-mfts">Hardware MFTs</a>.
     * 
     * <div class="alert"><b>Note</b>  This flag applies to video codecs and video processors that perform their work entirely in hardware. It does not apply to software decoders that use DirectX Video Acceleration to assist decoding.</div>
     * <div> </div>
     * Requires Windows 7.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFT_ENUM_FLAG_SYNCMFT"></a><a id="mft_enum_flag_syncmft"></a><dl>
     * <dt><b>MFT_ENUM_FLAG_SYNCMFT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT performs synchronous processing in software. This flag does not apply to hardware transforms.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFT_ENUM_FLAG_TRANSCODE_ONLY"></a><a id="mft_enum_flag_transcode_only"></a><dl>
     * <dt><b>MFT_ENUM_FLAG_TRANSCODE_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT is optimized for transcoding and should not be used for playback.
     * 
     * Requires Windows 7.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Setting <i>Flags</i> to zero is  equivalent to setting the <b>MFT_ENUM_FLAG_SYNCMFT</b> flag. The default processing model for MFTs is synchronous processing.
     * 
     * Prior to Windows 7, the <i>Flags</i> parameter was reserved.
     * @param {Integer} cInputTypes Number of elements in the <i>pInputTypes</i> array.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputTypes Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array specifies an input format that the MFT supports.  This parameter can be <b>NULL</b>.
     * 
     * This parameter can be <b>NULL</b>. However, if the parameter is <b>NULL</b>, the MFT will be enumerated only when an application specifies <b>NULL</b> for the desired input type.
     * @param {Integer} cOutputTypes Number of elements in the <i>pOutputTypes</i> array.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputTypes Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array defines an output format that the MFT supports. 
     * 
     * This parameter can be <b>NULL</b>. However, if the parameter is <b>NULL</b>, the MFT will be enumerated only when an application specifies <b>NULL</b> for the desired output type.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store that contains additional registry information. This parameter can be <b>NULL</b>. If the parameter is non-<b>NULL</b>, the attributes are written to the registery as a byte array.
     *       You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftgetinfo">MFTGetInfo</a> function to retrieve the attributes.
     * 
     * The following attribute is defined for this parameter:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFT_CODEC_MERIT_Attribute"></a><a id="mft_codec_merit_attribute"></a><a id="MFT_CODEC_MERIT_ATTRIBUTE"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/medfound/mft-codec-merit-attribute">MFT_CODEC_MERIT_Attribute</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Contains the merit value of a hardware codec. See <a href="https://docs.microsoft.com/windows/desktop/medfound/codec-merit">Codec Merit</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftregister
     * @since windows6.0.6000
     */
    static MFTRegister(clsidMFT, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes, pAttributes) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("MFPlat.dll\MFTRegister", "ptr", clsidMFT, "ptr", guidCategory, "ptr", pszName, "uint", Flags, "uint", cInputTypes, "ptr", pInputTypes, "uint", cOutputTypes, "ptr", pOutputTypes, "ptr", pAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters a Media Foundation transform (MFT).
     * @param {Guid} clsidMFT The CLSID of the MFT.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftunregister
     * @since windows6.0.6000
     */
    static MFTUnregister(clsidMFT) {
        result := DllCall("MFPlat.dll\MFTUnregister", "ptr", clsidMFT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a Media Foundation transform (MFT) in the caller's process.
     * @param {IClassFactory} pClassFactory A pointer to the <b>IClassFactory</b> interface of a class factory object. The class factory creates the MFT.
     * @param {Pointer<Guid>} guidCategory A GUID that specifies the category of the MFT. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {PWSTR} pszName A wide-character null-terminated string that contains the friendly name of the MFT.
     * @param {Integer} Flags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
     * @param {Integer} cInputTypes The number of elements in the <i>pInputTypes</i> array.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputTypes A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array specifies an input format that the MFT supports. This parameter can be <b>NULL</b> if <i>cInputTypes</i> is zero.
     * @param {Integer} cOutputTypes The number of elements in the <i>pOutputTypes</i> array.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputTypes A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array defines an output format that the MFT supports. This parameter can be <b>NULL</b> if <i>cOutputTypes</i> is zero.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftregisterlocal
     * @since windows6.1
     */
    static MFTRegisterLocal(pClassFactory, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("MFPlat.dll\MFTRegisterLocal", "ptr", pClassFactory, "ptr", guidCategory, "ptr", pszName, "uint", Flags, "uint", cInputTypes, "ptr", pInputTypes, "uint", cOutputTypes, "ptr", pOutputTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters one or more Media Foundation transforms (MFTs) from the caller's process.
     * @param {IClassFactory} pClassFactory A pointer to the <b>IClassFactory</b> interface of a class factory object. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(<b>ERROR_NOT_FOUND</b>)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT specified by the <i>pClassFactory</i> parameter was not registered in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftunregisterlocal
     * @since windows6.1
     */
    static MFTUnregisterLocal(pClassFactory) {
        result := DllCall("MFPlat.dll\MFTUnregisterLocal", "ptr", pClassFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a Media Foundation transform (MFT) in the caller's process.
     * @param {Pointer<Guid>} clisdMFT The class identifier (CLSID) of the MFT.
     * @param {Pointer<Guid>} guidCategory A GUID that specifies the category of the MFT. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {PWSTR} pszName A wide-character null-terminated string that contains the friendly name of the MFT.
     * @param {Integer} Flags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
     * @param {Integer} cInputTypes The number of elements in the <i>pInputTypes</i> array.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputTypes A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array specifies an input format that the MFT supports. This parameter can be <b>NULL</b> if <i>cInputTypes</i> is zero.
     * @param {Integer} cOutputTypes The number of elements in the <i>pOutputTypes</i> array.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputTypes A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array defines an output format that the MFT supports. This parameter can be <b>NULL</b> if <i>cOutputTypes</i> is zero.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftregisterlocalbyclsid
     * @since windows6.1
     */
    static MFTRegisterLocalByCLSID(clisdMFT, guidCategory, pszName, Flags, cInputTypes, pInputTypes, cOutputTypes, pOutputTypes) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("MFPlat.dll\MFTRegisterLocalByCLSID", "ptr", clisdMFT, "ptr", guidCategory, "ptr", pszName, "uint", Flags, "uint", cInputTypes, "ptr", pInputTypes, "uint", cOutputTypes, "ptr", pOutputTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters a Media Foundation transform (MFT) from the caller's process.
     * @param {Guid} clsidMFT The class identifier (CLSID) of the MFT.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(<b>ERROR_NOT_FOUND</b>)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT specified by the <i>clsidMFT</i> parameter was not registered in this process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftunregisterlocalbyclsid
     * @since windows6.1
     */
    static MFTUnregisterLocalByCLSID(clsidMFT) {
        result := DllCall("MFPlat.dll\MFTUnregisterLocalByCLSID", "ptr", clsidMFT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enumerates Media Foundation transforms (MFTs) in the registry.
     * @param {Guid} guidCategory GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {Integer} Flags Reserved. Must be zero.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputType Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an input media type to match. 
     * 
     * This parameter can be <b>NULL</b>. If <b>NULL</b>, all input types are matched.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputType Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an output media type to match.
     * 
     * This parameter can be <b>NULL</b>.
     *           If <b>NULL</b>, all output types are matched.
     * @param {IMFAttributes} pAttributes Reserved. Set to <b>NULL</b>.
     * 
     * <div class="alert"><b>Note</b>  Windows Vista and Windows Server 2008: This parameter can specify a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. The <b>MFTEnum</b> function matches the attributes in this object against the attributes stored in the registry. (Registry attributes are specified in the <i>pAttributes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregister">MFTRegister</a> function.) Only MFTs with matching attributes are returned in the enumeration results.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  Windows 7 and later: This parameter is ignored.</div>
     * <div> </div>
     * @param {Pointer<Pointer<Guid>>} ppclsidMFT Receives a pointer to an array of CLSIDs. To create an MFT from this list, call <b>CoCreateInstance</b> with one of the CLSIDs. To get information about a particular MFT from its CLSID, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftgetinfo">MFTGetInfo</a>. The caller must free the memory for the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcMFTs Receives the number of elements in the <i>ppclsidMFT</i> array. The value can be zero.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftenum
     * @since windows6.0.6000
     */
    static MFTEnum(guidCategory, Flags, pInputType, pOutputType, pAttributes, ppclsidMFT, pcMFTs) {
        result := DllCall("MFPlat.dll\MFTEnum", "ptr", guidCategory, "uint", Flags, "ptr", pInputType, "ptr", pOutputType, "ptr", pAttributes, "ptr*", ppclsidMFT, "uint*", pcMFTs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a list of Microsoft Media Foundation transforms (MFTs) that match specified search criteria. This function extends the MFTEnum function.
     * @param {Guid} guidCategory A GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {Integer} Flags The bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputType A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an input media type to match. 
     * 
     * This parameter can be <b>NULL</b>. If <b>NULL</b>, all input types are matched.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputType A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an output media type to match.
     * 
     * This parameter can be <b>NULL</b>. If <b>NULL</b>, all output types are matched.
     * @param {Pointer<Pointer<IMFActivate>>} pppMFTActivate Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface pointers. Each pointer represents an activation object for an MFT that matches the search criteria. The function allocates the memory for the array. The caller must release the pointers and call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory for the array.
     * @param {Pointer<Integer>} pnumMFTActivate Receives the number of elements in the <i>pppMFTActivate</i> array. If no MFTs match the search criteria, this parameter receives the value zero.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftenumex
     * @since windows6.1
     */
    static MFTEnumEx(guidCategory, Flags, pInputType, pOutputType, pppMFTActivate, pnumMFTActivate) {
        result := DllCall("MFPlat.dll\MFTEnumEx", "ptr", guidCategory, "uint", Flags, "ptr", pInputType, "ptr", pOutputType, "ptr*", pppMFTActivate, "uint*", pnumMFTActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a list of Microsoft Media Foundation transforms (MFTs) that match specified search criteria.
     * @param {Guid} guidCategory A GUID that specifies the category of MFTs to enumerate. For a list of MFT categories, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {Integer} Flags The bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfapi/ne-mfapi-_mft_enum_flag">_MFT_ENUM_FLAG</a> enumeration.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pInputType A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an input media type to match. 
     * 
     * This parameter can be <b>NULL</b>. If <b>NULL</b>, all input types are matched.
     * @param {Pointer<MFT_REGISTER_TYPE_INFO>} pOutputType A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structure that specifies an output media type to match.
     * 
     * This parameter can be <b>NULL</b>. If <b>NULL</b>, all output types are matched.
     * @param {IMFAttributes} pAttributes A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface that enables access to the standard attribute store. To specify a specific hardware adapter for which MFTs are queried, set the  <a href="https://docs.microsoft.com/windows/win32/medfound/mft-enum-adapter-luid">MFT_ENUM_ADAPTER_LUID</a> attribute to the LUID of the adapter. If you do this, you must also specify the MFT_ENUM_FLAG_HARDWARE flag or E_INVALIDARG is returned.
     * @param {Pointer<Pointer<IMFActivate>>} pppMFTActivate Receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface pointers. Each pointer represents an activation object for an MFT that matches the search criteria. The function allocates the memory for the array. The caller must release the pointers and call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory for the array.
     * @param {Pointer<Integer>} pnumMFTActivate Receives the number of elements in the <i>pppMFTActivate</i> array. If no MFTs match the search criteria, this parameter receives the value zero.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <a href="/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> containing the MFT_ENUM_ADAPTER_LUID attribute was provided in the <i>pAttributes</i> parameter and the MFT_ENUM_FLAG_HARDWARE flag was not specified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftenum2
     * @since windows10.0.10240
     */
    static MFTEnum2(guidCategory, Flags, pInputType, pOutputType, pAttributes, pppMFTActivate, pnumMFTActivate) {
        result := DllCall("MFPlat.dll\MFTEnum2", "ptr", guidCategory, "uint", Flags, "ptr", pInputType, "ptr", pOutputType, "ptr", pAttributes, "ptr*", pppMFTActivate, "uint*", pnumMFTActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets information from the registry about a Media Foundation transform (MFT).
     * @param {Guid} clsidMFT The CLSID of the MFT.
     * @param {Pointer<PWSTR>} pszName Receives a pointer to a wide-character string containing the friendly name of the MFT. The caller must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<Pointer<MFT_REGISTER_TYPE_INFO>>} ppInputTypes Receives a pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array describes an input format that the MFT supports. The caller must free the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pcInputTypes Receives the number of elements in the <i>ppInputTypes</i> array. If <i>ppInputTypes</i> is <b>NULL</b>, this parameter is ignored and can be <b>NULL</b>.
     * @param {Pointer<Pointer<MFT_REGISTER_TYPE_INFO>>} ppOutputTypes Receives a pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info">MFT_REGISTER_TYPE_INFO</a> structures. Each member of the array describes an output format that the MFT supports. The caller must free the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pcOutputTypes Receives the number of elements in the <i>ppOutputType</i> array. If <i>ppOutputTypes</i> is <b>NULL</b>, this parameter is ignored and can be <b>NULL</b>.
     * @param {Pointer<IMFAttributes>} ppAttributes Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. The caller must release the interface. The attribute store might contain attributes that are stored in the registry for the specified MFT. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregister">MFTRegister</a>.)  If no attributes are stored in the registry for this MFT, the attribute store is empty. 
     * 
     * This parameter can be <b>NULL</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mftgetinfo
     * @since windows6.0.6000
     */
    static MFTGetInfo(clsidMFT, pszName, ppInputTypes, pcInputTypes, ppOutputTypes, pcOutputTypes, ppAttributes) {
        result := DllCall("MFPlat.dll\MFTGetInfo", "ptr", clsidMFT, "ptr", pszName, "ptr*", ppInputTypes, "uint*", pcInputTypes, "ptr*", ppOutputTypes, "uint*", pcOutputTypes, "ptr*", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a pointer to the Microsoft Media Foundation plug-in manager.
     * @param {Pointer<IMFPluginControl>} ppPluginControl Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfplugincontrol">IMFPluginControl</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetplugincontrol
     * @since windows6.1
     */
    static MFGetPluginControl(ppPluginControl) {
        result := DllCall("MFPlat.dll\MFGetPluginControl", "ptr*", ppPluginControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the merit value of a hardware codec.
     * @param {IUnknown} pMFT A pointer to the <b>IUnknown</b> interface of the Media Foundation transform (MFT) that represents the codec.
     * @param {Integer} cbVerifier The size, in bytes, of the <i>verifier</i> array.
     * @param {Pointer} verifier The address of a buffer that contains one of the following:
     * 
     * <ul>
     * <li>The class identifier (CLSID) of the MFT.</li>
     * <li>A null-terminated wide-character string that contains the symbol link for the underlying hardware device. Include the size of the terminating null in the value of <i>cbVerifier</i>.</li>
     * </ul>
     * @param {Pointer<Integer>} merit Receives the merit value.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetmftmerit
     * @since windows6.1
     */
    static MFGetMFTMerit(pMFT, cbVerifier, verifier, merit) {
        result := DllCall("MFPlat.dll\MFGetMFTMerit", "ptr", pMFT, "uint", cbVerifier, "ptr", verifier, "uint*", merit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a scheme handler in the caller's process.
     * @param {PWSTR} szScheme A string that contains the scheme. The scheme includes the trailing ':' character; for example, 
     *       "http:".
     * @param {IMFActivate} pActivate A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of an activation 
     *       object. The caller implements this interface. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> 
     *       method of the activation object must create a scheme handler object. The scheme handler exposes the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfschemehandler">IMFSchemeHandler</a> interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfregisterlocalschemehandler
     * @since windows8.0
     */
    static MFRegisterLocalSchemeHandler(szScheme, pActivate) {
        szScheme := szScheme is String ? StrPtr(szScheme) : szScheme

        result := DllCall("MFPlat.dll\MFRegisterLocalSchemeHandler", "ptr", szScheme, "ptr", pActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a byte-stream handler in the caller's process.
     * @param {PWSTR} szFileExtension A string that contains the file name extension for this handler.
     * @param {PWSTR} szMimeType A string that contains the MIME type for this handler.
     * @param {IMFActivate} pActivate A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of an activation object. The caller implements this interface. The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> method of the activation object must create a byte-stream handler. The byte-stream handler exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfbytestreamhandler">IMFByteStreamHandler</a> interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfregisterlocalbytestreamhandler
     * @since windows8.0
     */
    static MFRegisterLocalByteStreamHandler(szFileExtension, szMimeType, pActivate) {
        szFileExtension := szFileExtension is String ? StrPtr(szFileExtension) : szFileExtension
        szMimeType := szMimeType is String ? StrPtr(szMimeType) : szMimeType

        result := DllCall("MFPlat.dll\MFRegisterLocalByteStreamHandler", "ptr", szFileExtension, "ptr", szMimeType, "ptr", pActivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a wrapper for a byte stream.
     * @param {IMFByteStream} pStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the original byte stream.
     * @param {Pointer<IMFByteStream>} ppStreamWrapper Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the wrapper. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemfbytestreamwrapper
     * @since windows8.0
     */
    static MFCreateMFByteStreamWrapper(pStream, ppStreamWrapper) {
        result := DllCall("MFPlat.dll\MFCreateMFByteStreamWrapper", "ptr", pStream, "ptr*", ppStreamWrapper, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activation object for a Windows Runtime class.
     * @param {PWSTR} szActivatableClassId The class identifier that is associated with the activatable runtime class.
     * @param {IUnknown} pConfiguration A pointer to an optional <a href="https://docs.microsoft.com/uwp/api/windows.foundation.collections.ipropertyset">IPropertySet</a> object, which is used to configure the Windows Runtime class. This parameter can be <b>NULL</b>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested. The activation object created  by this function supports the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>
     * </li>
     * </ul>
     * @param {Pointer<Pointer<Void>>} ppvObject Receives a pointer to the requested interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemediaextensionactivate
     * @since windows8.0
     */
    static MFCreateMediaExtensionActivate(szActivatableClassId, pConfiguration, riid, ppvObject) {
        szActivatableClassId := szActivatableClassId is String ? StrPtr(szActivatableClassId) : szActivatableClassId

        result := DllCall("MFPlat.dll\MFCreateMediaExtensionActivate", "ptr", szActivatableClassId, "ptr", pConfiguration, "ptr", riid, "ptr*", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IMFAttributes describing the content of multiplexed substreams.
     * @param {IMFCollection} pAttributesToMux The collection containing the  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> for each multiplexed substream.
     * @param {Pointer<IMFAttributes>} ppMuxAttribs The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> containing the attributes for the multiplexed substreams.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pAttributesToMux</i> parameter in null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemuxstreamattributes
     * @since windows10.0.15063
     */
    static MFCreateMuxStreamAttributes(pAttributesToMux, ppMuxAttribs) {
        result := DllCall("MFPlat.dll\MFCreateMuxStreamAttributes", "ptr", pAttributesToMux, "ptr*", ppMuxAttribs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IMFMediaType describing the media types of multiplexed substreams.
     * @param {IMFCollection} pMediaTypesToMux The collection containing the  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> for each multiplexed substream.
     * @param {Pointer<IMFMediaType>} ppMuxMediaType The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> containing the media types for the multiplexed substreams.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pMediaTypesToMux</i> parameter in null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemuxstreammediatype
     * @since windows10.0.15063
     */
    static MFCreateMuxStreamMediaType(pMediaTypesToMux, ppMuxMediaType) {
        result := DllCall("MFPlat.dll\MFCreateMuxStreamMediaType", "ptr", pMediaTypesToMux, "ptr*", ppMuxMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an IMFSample containing the samples of multiplexed substreams.
     * @param {IMFCollection} pSamplesToMux The collection containing the  <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> for each multiplexed substream.
     * @param {Pointer<IMFSample>} ppMuxSample The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> containing the samples for the multiplexed substreams.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSamplesToMux</i> parameter in null.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemuxstreamsample
     * @since windows10.0.15063
     */
    static MFCreateMuxStreamSample(pSamplesToMux, ppMuxSample) {
        result := DllCall("MFPlat.dll\MFCreateMuxStreamSample", "ptr", pSamplesToMux, "ptr*", ppMuxSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Validates the size of a buffer for a video format block.
     * @param {Guid} FormatType 
     * @param {Pointer} pBlock Pointer to a buffer that contains the format block.
     * @param {Integer} cbSize Size of the <i>pBlock</i> buffer, in bytes.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer that contains the format block is large enough.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer that contains the format block is too small, or the format block is not valid.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function does not support the specified format type.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfvalidatemediatypesize
     * @since windows6.0.6000
     */
    static MFValidateMediaTypeSize(FormatType, pBlock, cbSize) {
        result := DllCall("MFPlat.dll\MFValidateMediaTypeSize", "ptr", FormatType, "ptr", pBlock, "uint", cbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an empty media type.
     * @param {Pointer<IMFMediaType>} ppMFType Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemediatype
     * @since windows6.0.6000
     */
    static MFCreateMediaType(ppMFType) {
        result := DllCall("MFPlat.dll\MFCreateMediaType", "ptr*", ppMFType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an MFVIDEOFORMAT structure from a video media type.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a video media type.
     * @param {Pointer<Pointer<MFVIDEOFORMAT>>} ppMFVF Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The caller must release the memory allocated for the structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbSize Receives the size of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemfvideoformatfrommfmediatype
     * @since windows6.0.6000
     */
    static MFCreateMFVideoFormatFromMFMediaType(pMFType, ppMFVF, pcbSize) {
        result := DllCall("MFPlat.dll\MFCreateMFVideoFormatFromMFMediaType", "ptr", pMFType, "ptr*", ppMFVF, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a Media Foundation audio media type to a WAVEFORMATEX structure.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type.
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppWF Receives a pointer to the <b>WAVEFORMATEX</b> structure. The caller must release the memory allocated for the structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pcbSize Receives the size of the <b>WAVEFORMATEX</b> structure.
     * @param {Integer} Flags Contains a flag from the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ne-mfapi-mfwaveformatexconvertflags">MFWaveFormatExConvertFlags</a> enumeration.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatewaveformatexfrommfmediatype
     * @since windows6.0.6000
     */
    static MFCreateWaveFormatExFromMFMediaType(pMFType, ppWF, pcbSize, Flags) {
        result := DllCall("MFPlat.dll\MFCreateWaveFormatExFromMFMediaType", "ptr", pMFType, "ptr*", ppWF, "uint*", pcbSize, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a media type from a DirectShow VIDEOINFOHEADER structure.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
     * @param {Pointer} pVIH Pointer to a <b>VIDEOINFOHEADER</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
     * @param {Integer} cbBufSize Size of the <b>VIDEOINFOHEADER</b> structure, in bytes.
     * @param {Pointer<Guid>} pSubtype Pointer to a subtype GUID. This parameter can be <b>NULL</b>. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the <b>biCompression</b> field contained in the <b>VIDEOINFOHEADER</b> structure.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitmediatypefromvideoinfoheader
     * @since windows6.0.6000
     */
    static MFInitMediaTypeFromVideoInfoHeader(pMFType, pVIH, cbBufSize, pSubtype) {
        result := DllCall("MFPlat.dll\MFInitMediaTypeFromVideoInfoHeader", "ptr", pMFType, "ptr", pVIH, "uint", cbBufSize, "ptr", pSubtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a media type from a DirectShow VIDEOINFOHEADER2 structure.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
     * @param {Pointer} pVIH2 Pointer to a <b>VIDEOINFOHEADER2</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
     * @param {Integer} cbBufSize Size of the <b>VIDEOINFOHEADER2</b> structure, in bytes.
     * @param {Pointer<Guid>} pSubtype Pointer to a subtype GUID. This parameter can be <b>NULL</b>. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the <b>biCompression</b> field contained in the <b>VIDEOINFOHEADER2</b> structure.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitmediatypefromvideoinfoheader2
     * @since windows6.0.6000
     */
    static MFInitMediaTypeFromVideoInfoHeader2(pMFType, pVIH2, cbBufSize, pSubtype) {
        result := DllCall("MFPlat.dll\MFInitMediaTypeFromVideoInfoHeader2", "ptr", pMFType, "ptr", pVIH2, "uint", cbBufSize, "ptr", pSubtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a media type from a DirectShow MPEG1VIDEOINFO structure.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
     * @param {Pointer} pMP1VI Pointer to a <b>MPEG1VIDEOINFO</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
     * @param {Integer} cbBufSize Size of the <b>MPEG1VIDEOINFO</b> structure, in bytes.
     * @param {Pointer<Guid>} pSubtype Pointer to a subtype GUID. This parameter can be <b>NULL</b>. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the <b>biCompression</b> field contained in the <b>MPEG1VIDEOINFO</b> structure.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitmediatypefrommpeg1videoinfo
     * @since windows6.0.6000
     */
    static MFInitMediaTypeFromMPEG1VideoInfo(pMFType, pMP1VI, cbBufSize, pSubtype) {
        result := DllCall("MFPlat.dll\MFInitMediaTypeFromMPEG1VideoInfo", "ptr", pMFType, "ptr", pMP1VI, "uint", cbBufSize, "ptr", pSubtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a media type from a DirectShow MPEG2VIDEOINFO structure.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
     * @param {Pointer} pMP2VI Pointer to a <b>MPEG2VIDEOINFO</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
     * @param {Integer} cbBufSize Size of the <b>MPEG2VIDEOINFO</b> structure, in bytes.
     * @param {Pointer<Guid>} pSubtype Pointer to a subtype GUID. This parameter can be <b>NULL</b>. If the subtype GUID is specified, the function uses it to set the media subtype. Otherwise, the function attempts to deduce the subtype from the <b>biCompression</b> field contained in the <b>MPEG2VIDEOINFO</b> structure.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitmediatypefrommpeg2videoinfo
     * @since windows6.0.6000
     */
    static MFInitMediaTypeFromMPEG2VideoInfo(pMFType, pMP2VI, cbBufSize, pSubtype) {
        result := DllCall("MFPlat.dll\MFInitMediaTypeFromMPEG2VideoInfo", "ptr", pMFType, "ptr", pMP2VI, "uint", cbBufSize, "ptr", pSubtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the image size for a video format.
     * @param {Pointer} pBMIH Pointer to a <b>BITMAPINFOHEADER</b> structure that describes the format.
     * @param {Integer} cbBufSize Size of the <i>pBMIH</i> buffer, in bytes. The size includes any color masks or palette entries that follow the <b>BITMAPINFOHEADER</b> structure.
     * @param {Pointer<Integer>} pcbImageSize Receives the image size, in bytes.
     * @param {Pointer<BOOL>} pbKnown Receives the value <b>TRUE</b> if the function recognizes the video format. Otherwise, receives the value <b>FALSE</b>. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BITMAPINFOHEADER</b> structure is not valid, or the value of <i>cbBufSize</i> is too small.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcalculatebitmapimagesize
     * @since windows6.0.6000
     */
    static MFCalculateBitmapImageSize(pBMIH, cbBufSize, pcbImageSize, pbKnown) {
        result := DllCall("MFPlat.dll\MFCalculateBitmapImageSize", "ptr", pBMIH, "uint", cbBufSize, "uint*", pcbImageSize, "ptr", pbKnown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the image size, in bytes, for an uncompressed video format.
     * @param {Pointer<Guid>} guidSubtype Media subtype for the video format. For a list of subtypes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Media Type GUIDs</a>.
     * @param {Integer} unWidth Width of the image, in pixels.
     * @param {Integer} unHeight Height of the image, in pixels.
     * @param {Pointer<Integer>} pcbImageSize Receives the size of each frame, in bytes. If the format is compressed or is not recognized, the value is zero.
     * @returns {HRESULT} The function returns an HRESULT. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcalculateimagesize
     * @since windows6.0.6000
     */
    static MFCalculateImageSize(guidSubtype, unWidth, unHeight, pcbImageSize) {
        result := DllCall("MFPlat.dll\MFCalculateImageSize", "ptr", guidSubtype, "uint", unWidth, "uint", unHeight, "uint*", pcbImageSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a video frame rate into a frame duration.
     * @param {Integer} unNumerator The numerator of the frame rate.
     * @param {Integer} unDenominator The denominator of the frame rate.
     * @param {Pointer<Integer>} punAverageTimePerFrame Receives the average duration of a video frame, in 100-nanosecond units.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfframeratetoaveragetimeperframe
     * @since windows6.0.6000
     */
    static MFFrameRateToAverageTimePerFrame(unNumerator, unDenominator, punAverageTimePerFrame) {
        result := DllCall("MFPlat.dll\MFFrameRateToAverageTimePerFrame", "uint", unNumerator, "uint", unDenominator, "uint*", punAverageTimePerFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Calculates the frame rate, in frames per second, from the average duration of a video frame.
     * @param {Integer} unAverageTimePerFrame The average duration of a video frame, in 100-nanosecond units.
     * @param {Pointer<Integer>} punNumerator Receives the numerator of the frame rate.
     * @param {Pointer<Integer>} punDenominator Receives the denominator of the frame rate.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfaveragetimeperframetoframerate
     * @since windows6.0.6000
     */
    static MFAverageTimePerFrameToFrameRate(unAverageTimePerFrame, punNumerator, punDenominator) {
        result := DllCall("MFPlat.dll\MFAverageTimePerFrameToFrameRate", "uint", unAverageTimePerFrame, "uint*", punNumerator, "uint*", punDenominator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a media type from a WAVEFORMATEX structure.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
     * @param {Pointer} pWaveFormat Pointer to a <b>WAVEFORMATEX</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
     * @param {Integer} cbBufSize Size of the <b>WAVEFORMATEX</b> structure, in bytes.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitmediatypefromwaveformatex
     * @since windows6.0.6000
     */
    static MFInitMediaTypeFromWaveFormatEx(pMFType, pWaveFormat, cbBufSize) {
        result := DllCall("MFPlat.dll\MFInitMediaTypeFromWaveFormatEx", "ptr", pMFType, "ptr", pWaveFormat, "uint", cbBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a media type from an MFVIDEOFORMAT structure.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
     * @param {Pointer} pMFVF Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure that describes the media type. The caller must fill in the structure members before calling this function.
     * @param {Integer} cbBufSize Size of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure, in bytes.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitmediatypefrommfvideoformat
     * @since windows6.0.6000
     */
    static MFInitMediaTypeFromMFVideoFormat(pMFType, pMFVF, cbBufSize) {
        result := DllCall("MFPlat.dll\MFInitMediaTypeFromMFVideoFormat", "ptr", pMFType, "ptr", pMFVF, "uint", cbBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a media type from a DirectShow AM_MEDIA_TYPE structure.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to initialize. To create the uninitialized media type object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype">MFCreateMediaType</a>.
     * @param {Pointer<AM_MEDIA_TYPE>} pAMType Pointer to an <b>AM_MEDIA_TYPE</b> structure that describes the media type. The caller must fill in the structure members before calling this function.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitmediatypefromammediatype
     * @since windows6.0.6000
     */
    static MFInitMediaTypeFromAMMediaType(pMFType, pAMType) {
        result := DllCall("MFPlat.dll\MFInitMediaTypeFromAMMediaType", "ptr", pMFType, "ptr", pAMType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a DirectShow AM_MEDIA_TYPE structure from a Media Foundation media type.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to convert.
     * @param {Guid} guidFormatBlockType Format type GUID. This value corresponds to the <b>formattype</b> member of the <b>AM_MEDIA_TYPE</b> structure and specifies the type of format block to allocate. If the value is GUID_NULL, the function attempts to deduce the correct format block, based on the major type and subtype.
     * @param {Pointer<AM_MEDIA_TYPE>} pAMType Pointer to an <b>AM_MEDIA_TYPE</b> structure. The function allocates memory for the format block. The caller must release the format block by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> on the <b>pbFormat</b> member.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media type is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitammediatypefrommfmediatype
     * @since windows6.0.6000
     */
    static MFInitAMMediaTypeFromMFMediaType(pMFType, guidFormatBlockType, pAMType) {
        result := DllCall("MFPlat.dll\MFInitAMMediaTypeFromMFMediaType", "ptr", pMFType, "ptr", guidFormatBlockType, "ptr", pAMType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a DirectShow AM_MEDIA_TYPE structure from a Media Foundation media type.
     * @param {IMFMediaType} pMFType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to convert.
     * @param {Guid} guidFormatBlockType Format type GUID. This value corresponds to the <b>formattype</b> member of the <b>AM_MEDIA_TYPE</b> structure and specifies the type of format block to allocate. If the value is GUID_NULL, the function attempts to deduce the correct format block, based on the major type and subtype.
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppAMType Receives a pointer to an <b>AM_MEDIA_TYPE</b> structure. The caller must release the memory allocated for the structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. The function also allocates memory for the format block, which the caller must release by calling <b>CoTaskMemFree</b> on the <b>pbFormat</b> member.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreateammediatypefrommfmediatype
     * @since windows6.0.6000
     */
    static MFCreateAMMediaTypeFromMFMediaType(pMFType, guidFormatBlockType, ppAMType) {
        result := DllCall("MFPlat.dll\MFCreateAMMediaTypeFromMFMediaType", "ptr", pMFType, "ptr", guidFormatBlockType, "ptr*", ppAMType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compares a full media type to a partial media type.
     * @param {IMFMediaType} pMFTypeFull Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the full media type.
     * @param {IMFMediaType} pMFTypePartial Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the partial media type.
     * @returns {BOOL} If the full media type is compatible with the partial media type, the function returns <b>TRUE</b>. Otherwise, the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcomparefulltopartialmediatype
     * @since windows6.0.6000
     */
    static MFCompareFullToPartialMediaType(pMFTypeFull, pMFTypePartial) {
        result := DllCall("MFPlat.dll\MFCompareFullToPartialMediaType", "ptr", pMFTypeFull, "ptr", pMFTypePartial, "int")
        return result
    }

    /**
     * Creates a media type that wraps another media type.
     * @param {IMFMediaType} pOrig A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type to wrap in a new media type.
     * @param {Pointer<Guid>} MajorType A 
     *             GUID that specifies the major type for the new media type. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @param {Pointer<Guid>} SubType A 
     *             GUID that specifies the subtype for the new media type. For possible values, see:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/audio-subtypes">Audio Subtypes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-subtypes">Video Subtypes</a>
     * </li>
     * </ul>
     * Applications can define custom subtype GUIDs.
     * @param {Pointer<IMFMediaType>} ppWrap Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the new media type that wraps the original media type. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfwrapmediatype
     * @since windows6.0.6000
     */
    static MFWrapMediaType(pOrig, MajorType, SubType, ppWrap) {
        result := DllCall("MFPlat.dll\MFWrapMediaType", "ptr", pOrig, "ptr", MajorType, "ptr", SubType, "ptr*", ppWrap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a media type that was wrapped in another media type by the MFWrapMediaType function.
     * @param {IMFMediaType} pWrap Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type that was retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfwrapmediatype">MFWrapMediaType</a>.
     * @param {Pointer<IMFMediaType>} ppOrig Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the original media type. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfunwrapmediatype
     * @since windows6.0.6000
     */
    static MFUnwrapMediaType(pWrap, ppOrig) {
        result := DllCall("MFPlat.dll\MFUnwrapMediaType", "ptr", pWrap, "ptr*", ppOrig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Calculates the minimum surface stride for a video format.
     * @param {Integer} format FOURCC code or <b>D3DFORMAT</b> value that specifies the video format. If you have a video subtype GUID, you can use the first <b>DWORD</b> of the subtype.
     * @param {Integer} dwWidth Width of the image, in pixels.
     * @param {Pointer<Integer>} pStride Receives the minimum surface stride, in pixels.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetstrideforbitmapinfoheader
     * @since windows6.0.6000
     */
    static MFGetStrideForBitmapInfoHeader(format, dwWidth, pStride) {
        result := DllCall("MFPlat.dll\MFGetStrideForBitmapInfoHeader", "uint", format, "uint", dwWidth, "int*", pStride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a video media type from an MFVIDEOFORMAT structure.
     * @param {Pointer<MFVIDEOFORMAT>} pVideoFormat Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure that describes the video format.
     * @param {Pointer<IMFVideoMediaType>} ppIVideoMediaType Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfvideomediatype">IMFVideoMediaType</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatevideomediatype
     * @since windows6.0.6000
     */
    static MFCreateVideoMediaType(pVideoFormat, ppIVideoMediaType) {
        result := DllCall("MFPlat.dll\MFCreateVideoMediaType", "ptr", pVideoFormat, "ptr*", ppIVideoMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a partial video media type with a specified subtype.
     * @param {Pointer<Guid>} pAMSubtype Pointer to a GUID that specifies the subtype. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-subtype-guids">Video Subtype GUIDs</a>.
     * @param {Pointer<IMFVideoMediaType>} ppIVideoMediaType Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfvideomediatype">IMFVideoMediaType</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatevideomediatypefromsubtype
     * @since windows6.0.6000
     */
    static MFCreateVideoMediaTypeFromSubtype(pAMSubtype, ppIVideoMediaType) {
        result := DllCall("MFPlat.dll\MFCreateVideoMediaTypeFromSubtype", "ptr", pAMSubtype, "ptr*", ppIVideoMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Queries whether a FOURCC code or D3DFORMAT value is a YUV format.
     * @param {Integer} Format FOURCC code or <b>D3DFORMAT</b> value.
     * @returns {BOOL} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specifies a YUV format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value does not specify a recognized YUV format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfisformatyuv
     * @since windows6.0.6000
     */
    static MFIsFormatYUV(Format) {
        result := DllCall("EVR.dll\MFIsFormatYUV", "uint", Format, "int")
        return result
    }

    /**
     * This function is not implemented.
     * @param {Pointer<BITMAPINFOHEADER>} pbmihBitMapInfoHeader Reserved.
     * @param {Integer} dwPixelAspectRatioX Reserved.
     * @param {Integer} dwPixelAspectRatioY Reserved.
     * @param {Integer} InterlaceMode Reserved.
     * @param {Integer} VideoFlags Reserved.
     * @param {Integer} qwFramesPerSecondNumerator Reserved.
     * @param {Integer} qwFramesPerSecondDenominator Reserved.
     * @param {Integer} dwMaxBitRate Reserved.
     * @param {Pointer<IMFVideoMediaType>} ppIVideoMediaType Reserved.
     * @returns {HRESULT} Returns <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatevideomediatypefrombitmapinfoheader
     * @since windows6.0.6000
     */
    static MFCreateVideoMediaTypeFromBitMapInfoHeader(pbmihBitMapInfoHeader, dwPixelAspectRatioX, dwPixelAspectRatioY, InterlaceMode, VideoFlags, qwFramesPerSecondNumerator, qwFramesPerSecondDenominator, dwMaxBitRate, ppIVideoMediaType) {
        result := DllCall("MFPlat.dll\MFCreateVideoMediaTypeFromBitMapInfoHeader", "ptr", pbmihBitMapInfoHeader, "uint", dwPixelAspectRatioX, "uint", dwPixelAspectRatioY, "int", InterlaceMode, "uint", VideoFlags, "uint", qwFramesPerSecondNumerator, "uint", qwFramesPerSecondDenominator, "uint", dwMaxBitRate, "ptr*", ppIVideoMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the image size, in bytes, for an uncompressed video format.
     * @param {Integer} format FOURCC code or <b>D3DFORMAT</b> value that specifies the video format.
     * @param {Integer} dwWidth Width of the image, in pixels.
     * @param {Integer} dwHeight Height of the image, in pixels.
     * @param {Pointer<Integer>} pdwPlaneSize Receives the size of one frame, in bytes. If the format is compressed or is not recognized, this value is zero.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetplanesize
     * @since windows6.0.6000
     */
    static MFGetPlaneSize(format, dwWidth, dwHeight, pdwPlaneSize) {
        result := DllCall("EVR.dll\MFGetPlaneSize", "uint", format, "uint", dwWidth, "uint", dwHeight, "uint*", pdwPlaneSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a video media type from a BITMAPINFOHEADER structure.
     * @param {Pointer} pbmihBitMapInfoHeader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure to convert.
     * @param {Integer} cbBitMapInfoHeader The size of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure in bytes, including the size of any palette entries or color masks that follow the structure.
     * @param {Integer} dwPixelAspectRatioX The X dimension of the pixel aspect ratio.
     * @param {Integer} dwPixelAspectRatioY The Y dimension of the pixel aspect ratio.
     * @param {Integer} InterlaceMode A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideointerlacemode">MFVideoInterlaceMode</a> enumeration, specifying how the video is interlaced.
     * @param {Integer} VideoFlags A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideoflags">MFVideoFlags</a> enumeration.
     * @param {Integer} dwFramesPerSecondNumerator The numerator of the 
     *           frame rate in frames per second.
     * @param {Integer} dwFramesPerSecondDenominator The denominator of the frame rate in frames per second
     * @param {Integer} dwMaxBitRate The approximate data rate of the video stream, in bits per second. If the rate is unknown, set this parameter to zero.
     * @param {Pointer<IMFVideoMediaType>} ppIVideoMediaType Receives a pointer to the 
     *           <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfvideomediatype">IMFVideoMediaType</a> interface. The caller must release the interface.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatevideomediatypefrombitmapinfoheaderex
     * @since windows6.1
     */
    static MFCreateVideoMediaTypeFromBitMapInfoHeaderEx(pbmihBitMapInfoHeader, cbBitMapInfoHeader, dwPixelAspectRatioX, dwPixelAspectRatioY, InterlaceMode, VideoFlags, dwFramesPerSecondNumerator, dwFramesPerSecondDenominator, dwMaxBitRate, ppIVideoMediaType) {
        result := DllCall("MFPlat.dll\MFCreateVideoMediaTypeFromBitMapInfoHeaderEx", "ptr", pbmihBitMapInfoHeader, "uint", cbBitMapInfoHeader, "uint", dwPixelAspectRatioX, "uint", dwPixelAspectRatioY, "int", InterlaceMode, "uint", VideoFlags, "uint", dwFramesPerSecondNumerator, "uint", dwFramesPerSecondDenominator, "uint", dwMaxBitRate, "ptr*", ppIVideoMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a Media Foundation media type from another format representation.
     * @param {Guid} guidRepresentation GUID that specifies which format representation to convert. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>GUID</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>AM_MEDIA_TYPE_REPRESENTATION</td>
     * <td>Convert a DirectShow <b>AM_MEDIA_TYPE</b> structure.</td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pvRepresentation Pointer to a buffer that contains the format representation to convert. The layout of the buffer depends on the value of <i>guidRepresentation</i>.
     * @param {Pointer<IMFMediaType>} ppIMediaType Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_REPRESENTATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GUID specified in <i>guidRepresentation</i> is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemediatypefromrepresentation
     * @since windows6.0.6000
     */
    static MFCreateMediaTypeFromRepresentation(guidRepresentation, pvRepresentation, ppIMediaType) {
        result := DllCall("MFPlat.dll\MFCreateMediaTypeFromRepresentation", "ptr", guidRepresentation, "ptr", pvRepresentation, "ptr*", ppIMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an audio media type from a WAVEFORMATEX structure.
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat Pointer to a <b>WAVEFORMATEX</b> structure that describes the audio format.
     * @param {Pointer<IMFAudioMediaType>} ppIAudioMediaType Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfaudiomediatype">IMFAudioMediaType</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreateaudiomediatype
     * @since windows6.0.6000
     */
    static MFCreateAudioMediaType(pAudioFormat, ppIAudioMediaType) {
        result := DllCall("MFPlat.dll\MFCreateAudioMediaType", "ptr", pAudioFormat, "ptr*", ppIAudioMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the FOURCC or D3DFORMAT value for an uncompressed video format.
     * @param {Pointer<MFVIDEOFORMAT>} pVideoFormat Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure.
     * @returns {Integer} Returns a FOURCC or <b>D3DFORMAT</b> value that identifies the video format. If the video format is compressed or not recognized, the return value is D3DFMT_UNKNOWN.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetuncompressedvideoformat
     * @since windows6.0.6000
     */
    static MFGetUncompressedVideoFormat(pVideoFormat) {
        result := DllCall("MFPlat.dll\MFGetUncompressedVideoFormat", "ptr", pVideoFormat, "uint")
        return result
    }

    /**
     * Initializes an MFVIDEOFORMAT structure for a standard video format such as DVD, analog television, or ATSC digital television.
     * @param {Pointer<MFVIDEOFORMAT>} pVideoFormat A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The function fills in the structure members based on the video format specified in the type parameter.
     * @param {Integer} type The video format, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfstandardvideoformat">MFStandardVideoFormat</a> enumeration.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitvideoformat
     * @since windows6.0.6000
     */
    static MFInitVideoFormat(pVideoFormat, type) {
        result := DllCall("MFPlat.dll\MFInitVideoFormat", "ptr", pVideoFormat, "int", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes an MFVIDEOFORMAT structure for an uncompressed RGB video format.
     * @param {Pointer<MFVIDEOFORMAT>} pVideoFormat A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The functions fills in the structure members with the format information.
     * @param {Integer} dwWidth The width of the video, in pixels.
     * @param {Integer} dwHeight The height of the video, in pixels.
     * @param {Integer} D3Dfmt A <b>D3DFORMAT</b> value that specifies the RGB format.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfinitvideoformat_rgb
     * @since windows6.0.6000
     */
    static MFInitVideoFormat_RGB(pVideoFormat, dwWidth, dwHeight, D3Dfmt) {
        result := DllCall("MFPlat.dll\MFInitVideoFormat_RGB", "ptr", pVideoFormat, "uint", dwWidth, "uint", dwHeight, "uint", D3Dfmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts the extended color information from an MFVIDEOFORMAT to the equivalent DirectX Video Acceleration (DXVA) color information.
     * @param {Pointer<Integer>} pdwToDXVA Receives the DXVA extended color information. The bitfields in the <b>DWORD</b> are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure.
     * @param {Pointer<MFVIDEOFORMAT>} pFromFormat Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure that describes the video format.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfconvertcolorinfotodxva
     * @since windows6.0.6000
     */
    static MFConvertColorInfoToDXVA(pdwToDXVA, pFromFormat) {
        result := DllCall("MFPlat.dll\MFConvertColorInfoToDXVA", "uint*", pdwToDXVA, "ptr", pFromFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the extended color information in a MFVIDEOFORMAT structure.
     * @param {Pointer<MFVIDEOFORMAT>} pToFormat Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure. The function fills in the structure members that correspond to the DXVA color information in the <i>dwFromDXVA</i> parameter. The function does not modify the other structure members.
     * @param {Integer} dwFromDXVA <b>DWORD</b> that contains extended color information. The bitfields in the <b>DWORD</b> are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfconvertcolorinfofromdxva
     * @since windows6.0.6000
     */
    static MFConvertColorInfoFromDXVA(pToFormat, dwFromDXVA) {
        result := DllCall("MFPlat.dll\MFConvertColorInfoFromDXVA", "ptr", pToFormat, "uint", dwFromDXVA, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Copies an image or image plane from one buffer to another.
     * @param {Pointer<Integer>} pDest Pointer to the start of the first row of pixels in the destination buffer.
     * @param {Integer} lDestStride Stride of the destination buffer, in bytes.
     * @param {Pointer<Integer>} pSrc Pointer to the start of the first row of pixels in the source image.
     * @param {Integer} lSrcStride Stride of the source image, in bytes.
     * @param {Integer} dwWidthInBytes Width of the image, in bytes.
     * @param {Integer} dwLines Number of rows of pixels to copy.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcopyimage
     * @since windows6.0.6000
     */
    static MFCopyImage(pDest, lDestStride, pSrc, lSrcStride, dwWidthInBytes, dwLines) {
        result := DllCall("MFPlat.dll\MFCopyImage", "char*", pDest, "int", lDestStride, "char*", pSrc, "int", lSrcStride, "uint", dwWidthInBytes, "uint", dwLines, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an array of 16-bit floating-point numbers into an array of 32-bit floating-point numbers.
     * @param {Pointer<Float>} pDest Pointer to an array of <b>float</b> values. The array must contain at least <i>dwCount</i> elements.
     * @param {Pointer<Integer>} pSrc Pointer to an array of 16-bit floating-point values, typed as <b>WORD</b> values. The array must contain at least <i>dwCount</i> elements.
     * @param {Integer} dwCount Number of elements in the <i>pSrc</i> array to convert.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfconvertfromfp16array
     * @since windows6.0.6000
     */
    static MFConvertFromFP16Array(pDest, pSrc, dwCount) {
        result := DllCall("MFPlat.dll\MFConvertFromFP16Array", "float*", pDest, "ushort*", pSrc, "uint", dwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an array of 32-bit floating-point numbers into an array of 16-bit floating-point numbers.
     * @param {Pointer<Integer>} pDest Pointer to an array of 16-bit floating-point values, typed as <b>WORD</b> values. The array must contain at least <i>dwCount</i> elements.
     * @param {Pointer<Float>} pSrc Pointer to an array of <b>float</b> values. The array must contain at least <i>dwCount</i> elements.
     * @param {Integer} dwCount Number of elements in the <i>pSrc</i> array to convert.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfconverttofp16array
     * @since windows6.0.6000
     */
    static MFConvertToFP16Array(pDest, pSrc, dwCount) {
        result := DllCall("MFPlat.dll\MFConvertToFP16Array", "ushort*", pDest, "float*", pSrc, "uint", dwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a system-memory buffer object to hold 2D image data.
     * @param {Integer} dwWidth Width of the image, in pixels.
     * @param {Integer} dwHeight Height of the image, in pixels.
     * @param {Integer} dwFourCC A <b>FOURCC</b> code or <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> value that specifies the video format. If you have a video subtype GUID, you can use the first <b>DWORD</b> of the subtype.
     * @param {BOOL} fBottomUp If <b>TRUE,</b> the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imf2dbuffer-contiguouscopyto">IMF2DBuffer::ContiguousCopyTo</a> method copies the buffer into a bottom-up format. The bottom-up format is compatible with GDI for uncompressed RGB images. If this parameter is <b>FALSE</b>, the <b>ContiguousCopyTo</b> method copies the buffer into a top-down format, which is compatible with DirectX. 
     * 
     * 
     * 
     * For more information about top-down versus bottom-up images, see <a href="https://docs.microsoft.com/windows/desktop/medfound/image-stride">Image Stride</a>.
     * @param {Pointer<IMFMediaBuffer>} ppBuffer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unrecognized video format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreate2dmediabuffer
     * @since windows8.0
     */
    static MFCreate2DMediaBuffer(dwWidth, dwHeight, dwFourCC, fBottomUp, ppBuffer) {
        result := DllCall("MFPlat.dll\MFCreate2DMediaBuffer", "uint", dwWidth, "uint", dwHeight, "uint", dwFourCC, "int", fBottomUp, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates a system-memory buffer that is optimal for a specified media type.
     * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type.
     * @param {Integer} llDuration The sample duration. This value is required for audio formats.
     * @param {Integer} dwMinLength The minimum size of the buffer, in bytes. The actual buffer size might be larger. Specify zero to allocate the default buffer size for the media type.
     * @param {Integer} dwMinAlignment The minimum memory alignment for the buffer. Specify zero to use the default memory alignment.
     * @param {Pointer<IMFMediaBuffer>} ppBuffer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatemediabufferfrommediatype
     * @since windows8.0
     */
    static MFCreateMediaBufferFromMediaType(pMediaType, llDuration, dwMinLength, dwMinAlignment, ppBuffer) {
        result := DllCall("MFPlat.dll\MFCreateMediaBufferFromMediaType", "ptr", pMediaType, "int64", llDuration, "uint", dwMinLength, "uint", dwMinAlignment, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an empty collection object.
     * @param {Pointer<IMFCollection>} ppIMFCollection Receives a pointer to the collection object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcreatecollection
     * @since windows6.0.6000
     */
    static MFCreateCollection(ppIMFCollection) {
        result := DllCall("MFPlat.dll\MFCreateCollection", "ptr*", ppIMFCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates a block of memory.
     * @param {Pointer} nSize Number of bytes to allocate.
     * @param {Integer} dwFlags Zero or more flags. For a list of valid flags, see <b>HeapAlloc</b> in the Windows SDK documentation.
     * @param {PSTR} pszFile Reserved. Set to <b>NULL</b>.
     * @param {Integer} line Reserved. Set to zero.
     * @param {Integer} eat Reserved. Set to <b>eAllocationTypeIgnore</b>.
     * @returns {Pointer<Void>} If the function succeeds, it returns a pointer to the allocated memory block. If the function fails, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfheapalloc
     * @since windows6.0.6000
     */
    static MFHeapAlloc(nSize, dwFlags, pszFile, line, eat) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := DllCall("MFPlat.dll\MFHeapAlloc", "ptr", nSize, "uint", dwFlags, "ptr", pszFile, "int", line, "int", eat, "ptr")
        return result
    }

    /**
     * Frees a block of memory that was allocated by calling the MFHeapAlloc function.
     * @param {Pointer<Void>} pv Pointer to the memory to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfheapfree
     * @since windows6.0.6000
     */
    static MFHeapFree(pv) {
        DllCall("MFPlat.dll\MFHeapFree", "ptr", pv)
    }

    /**
     * Calculates ((a * b) + d) / c, where each term is a 64-bit signed value.
     * @param {Integer} a A multiplier.
     * @param {Integer} b Another multiplier.
     * @param {Integer} c The divisor.
     * @param {Integer} d The rounding factor.
     * @returns {Integer} Returns the result of the calculation. If numeric overflow occurs, the function returns _I64_MAX (positive overflow) or LLONG_MIN (negative overflow). If Mfplat.dll cannot be loaded, the function returns _I64_MAX.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfllmuldiv
     * @since windows6.1
     */
    static MFllMulDiv(a, b, c, d) {
        result := DllCall("MFPlat.dll\MFllMulDiv", "int64", a, "int64", b, "int64", c, "int64", d, "int64")
        return result
    }

    /**
     * Gets the class identifier for a content protection system.
     * @param {Pointer<Guid>} guidProtectionSystemID The GUID that identifies the content protection system.
     * @param {Pointer<Guid>} pclsid Receives the class identifier to the content protection system.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfgetcontentprotectionsystemclsid
     * @since windows8.0
     */
    static MFGetContentProtectionSystemCLSID(guidProtectionSystemID, pclsid) {
        result := DllCall("MFPlat.dll\MFGetContentProtectionSystemCLSID", "ptr", guidProtectionSystemID, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Concatenates a media sample onto another sample if their combined duration does not exceed the specified duration.
     * @param {IMFSample} pSample A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) to which the the sample provided in the *pSampleToAdd* parameter is appended.
     * @param {IMFSample} pSampleToAdd A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) to append to the sample provided in the  *pSample* parameter.
     * @param {Integer} dwMaxMergedDurationInMS The maximum duration in milliseconds that the combined sample can fill for the operation to be successful.
     * @param {Pointer<BOOL>} pMerged Output parameter that receives a BOOL indicating whether the sample was successfully appended.
     * @returns {HRESULT} Returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfcombinesamples
     * @since windows10.0.19041
     */
    static MFCombineSamples(pSample, pSampleToAdd, dwMaxMergedDurationInMS, pMerged) {
        result := DllCall("MFPlat.dll\MFCombineSamples", "ptr", pSample, "ptr", pSampleToAdd, "uint", dwMaxMergedDurationInMS, "ptr", pMerged, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Split up a combined media sample back into individual samples.
     * @param {IMFSample} pSample A pointer to an [IMFSample](../mfobjects/nn-mfobjects-imfsample.md) representing a combined sample to be split.
     * @param {Pointer<IMFSample>} pOutputSamples Receives a pointer to an array of output samples from the split operation.
     * @param {Integer} dwOutputSampleMaxCount The maximum output array size. Call [IMFSample::GetBufferCount](../mfobjects/nf-mfobjects-imfsample-getbuffercount.md) on the sample provided in *pSample* to find out an upper bound.
     * @param {Pointer<Integer>} pdwOutputSampleCount Output parameter that receives the number of samples contained in the pOutputSamples array.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mfapi/nf-mfapi-mfsplitsample
     * @since windows10.0.19041
     */
    static MFSplitSample(pSample, pOutputSamples, dwOutputSampleMaxCount, pdwOutputSampleCount) {
        result := DllCall("MFPlat.dll\MFSplitSample", "ptr", pSample, "ptr*", pOutputSamples, "uint", dwOutputSampleMaxCount, "uint*", pdwOutputSampleCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the source reader from a URL.
     * @param {PWSTR} pwszURL The URL  of a media file to open.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the source reader. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/source-reader-attributes">Source Reader Attributes</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFSourceReader>} ppSourceReader Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfromurl
     * @since windows6.1
     */
    static MFCreateSourceReaderFromURL(pwszURL, pAttributes, ppSourceReader) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := DllCall("MFReadWrite.dll\MFCreateSourceReaderFromURL", "ptr", pwszURL, "ptr", pAttributes, "ptr*", ppSourceReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the source reader from a byte stream.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. This byte stream will provide the source data for the source reader.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the source reader. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/source-reader-attributes">Source Reader Attributes</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFSourceReader>} ppSourceReader Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfrombytestream
     * @since windows6.1
     */
    static MFCreateSourceReaderFromByteStream(pByteStream, pAttributes, ppSourceReader) {
        result := DllCall("MFReadWrite.dll\MFCreateSourceReaderFromByteStream", "ptr", pByteStream, "ptr", pAttributes, "ptr*", ppSourceReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the source reader from a media source.
     * @param {IMFMediaSource} pMediaSource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface of a media source.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the source reader. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/source-reader-attributes">Source Reader Attributes</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFSourceReader>} ppSourceReader Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> interface. The caller must release the interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_DRM_UNSUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source contains protected content.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfrommediasource
     * @since windows6.1
     */
    static MFCreateSourceReaderFromMediaSource(pMediaSource, pAttributes, ppSourceReader) {
        result := DllCall("MFReadWrite.dll\MFCreateSourceReaderFromMediaSource", "ptr", pMediaSource, "ptr", pAttributes, "ptr*", ppSourceReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the sink writer from a URL or byte stream.
     * @param {PWSTR} pwszOutputURL A null-terminated string that contains the URL of the output file. This parameter can be <b>NULL</b>.
     * @param {IMFByteStream} pByteStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of a byte stream. This parameter can be <b>NULL</b>.
     * 
     * If this parameter is a valid pointer, the sink writer writes to the provided byte stream. (The byte stream must be writable.) Otherwise, if <i>pByteStream</i> is <b>NULL</b>, the sink writer creates a new file named <i>pwszOutputURL</i>.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the sink writer. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/sink-writer-attributes">Sink Writer Attributes</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFSinkWriter>} ppSinkWriter Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a> interface. The caller must release the interface.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified URL was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfromurl
     * @since windows6.1
     */
    static MFCreateSinkWriterFromURL(pwszOutputURL, pByteStream, pAttributes, ppSinkWriter) {
        pwszOutputURL := pwszOutputURL is String ? StrPtr(pwszOutputURL) : pwszOutputURL

        result := DllCall("MFReadWrite.dll\MFCreateSinkWriterFromURL", "ptr", pwszOutputURL, "ptr", pByteStream, "ptr", pAttributes, "ptr*", ppSinkWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the sink writer from a media sink.
     * @param {IMFMediaSink} pMediaSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface of a media sink.
     * @param {IMFAttributes} pAttributes Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this parameter to configure the sink writer. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/sink-writer-attributes">Sink Writer Attributes</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFSinkWriter>} ppSinkWriter Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfrommediasink
     * @since windows6.1
     */
    static MFCreateSinkWriterFromMediaSink(pMediaSink, pAttributes, ppSinkWriter) {
        result := DllCall("MFReadWrite.dll\MFCreateSinkWriterFromMediaSink", "ptr", pMediaSink, "ptr", pAttributes, "ptr*", ppSinkWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the default video presenter for the enhanced video renderer (EVR).
     * @param {IUnknown} pOwner Pointer to the owner of the object. If the object is aggregated, pass a pointer to the aggregating object's <b>IUnknown</b> interface. Otherwise, set this parameter to <b>NULL</b>.
     * @param {Pointer<Guid>} riidDevice Interface identifier (IID) of the video device interface that will be used for processing the video. Currently the only supported value is IID_IDirect3DDevice9.
     * @param {Pointer<Guid>} riid IID of the requested interface on the video presenter. The video presenter exposes the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface.
     * @param {Pointer<Pointer<Void>>} ppVideoPresenter Receives a pointer to the requested interface on the video presenter. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nc-evr-mfcreatevideopresenter
     */
    static MFCreateVideoPresenter(pOwner, riidDevice, riid, ppVideoPresenter) {
        result := DllCall("EVR.dll\MFCreateVideoPresenter", "ptr", pOwner, "ptr", riidDevice, "ptr", riid, "ptr*", ppVideoPresenter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the default video mixer for the enhanced video renderer (EVR).
     * @param {IUnknown} pOwner Pointer to the owner of this object. If the object is aggregated, pass a pointer to the aggregating object's <b>IUnknown</b> interface. Otherwise, set this parameter to <b>NULL</b>.
     * @param {Pointer<Guid>} riidDevice Interface identifier (IID) of the video device interface that will be used for processing the video. Currently the only supported value is IID_IDirect3DDevice9.
     * @param {Pointer<Guid>} riid IID of the requested interface on the video mixer.  The video mixer exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
     * @param {Pointer<Pointer<Void>>} ppv Receives a pointer to the requested interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nc-evr-mfcreatevideomixer
     */
    static MFCreateVideoMixer(pOwner, riidDevice, riid, ppv) {
        result := DllCall("EVR.dll\MFCreateVideoMixer", "ptr", pOwner, "ptr", riidDevice, "ptr", riid, "ptr*", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates the default video mixer and video presenter for the enhanced video renderer (EVR).
     * @param {IUnknown} pMixerOwner Pointer to the owner of the video mixer. If the mixer is aggregated, pass a pointer to the aggregating object's <b>IUnknown</b> interface. Otherwise, set this parameter to <b>NULL</b>.
     * @param {IUnknown} pPresenterOwner Pointer to the owner of the video presenter. If the presenter is aggregated, pass a pointer to the aggregating object's <b>IUnknown</b> interface. Otherwise, set this parameter to <b>NULL</b>.
     * @param {Pointer<Guid>} riidMixer Interface identifier (IID) of the requested interface on the video mixer. The video mixer exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
     * @param {Pointer<Pointer<Void>>} ppvVideoMixer Receives a pointer to the requested interface on the video mixer. The caller must release the interface.
     * @param {Pointer<Guid>} riidPresenter IID of the requested interface on the video presenter. The video presenter exposes the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface.
     * @param {Pointer<Pointer<Void>>} ppvVideoPresenter Receives a pointer to the requested interface on the video presenter. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nc-evr-mfcreatevideomixerandpresenter
     */
    static MFCreateVideoMixerAndPresenter(pMixerOwner, pPresenterOwner, riidMixer, ppvVideoMixer, riidPresenter, ppvVideoPresenter) {
        result := DllCall("EVR.dll\MFCreateVideoMixerAndPresenter", "ptr", pMixerOwner, "ptr", pPresenterOwner, "ptr", riidMixer, "ptr*", ppvVideoMixer, "ptr", riidPresenter, "ptr*", ppvVideoPresenter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the enhanced video renderer (EVR) media sink.
     * @param {Pointer<Guid>} riidRenderer Interface identifier (IID) of the requested interface on the EVR.
     * @param {Pointer<Pointer<Void>>} ppVideoRenderer Receives a pointer to the requested interface. The caller must release the interface.
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nc-evr-mfcreatevideorenderer
     */
    static MFCreateVideoRenderer(riidRenderer, ppVideoRenderer) {
        result := DllCall("MF.dll\MFCreateVideoRenderer", "ptr", riidRenderer, "ptr*", ppVideoRenderer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a media sample that manages a Direct3D surface.
     * @param {IUnknown} pUnkSurface A pointer to the <b>IUnknown</b> interface of the Direct3D surface. This parameter can be <b>NULL</b>.
     * @param {Pointer<IMFSample>} ppSample Receives a pointer to the sample's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface.
     *           The caller must release the interface.
     * @returns {HRESULT} If this callback function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nc-evr-mfcreatevideosamplefromsurface
     */
    static MFCreateVideoSampleFromSurface(pUnkSurface, ppSample) {
        result := DllCall("EVR.dll\MFCreateVideoSampleFromSurface", "ptr", pUnkSurface, "ptr*", ppSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an object that allocates video samples.
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppSampleAllocator Receives a pointer to the requested interface. The caller must release the interface.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nc-evr-mfcreatevideosampleallocator
     */
    static MFCreateVideoSampleAllocator(riid, ppSampleAllocator) {
        result := DllCall("EVR.dll\MFCreateVideoSampleAllocator", "ptr", riid, "ptr*", ppSampleAllocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new instance of the MFPlay player object.
     * @param {PWSTR} pwszURL Null-terminated string that contains the URL  of a media file to open. This parameter can be <b>NULL</b>. If the parameter is <b>NULL</b>, <i>fStartPlayback</i> must be <b>FALSE</b>.
     * 
     * If this parameter is <b>NULL</b>, you can open a URL later by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">IMFPMediaPlayer::CreateMediaItemFromURL</a>.
     * @param {BOOL} fStartPlayback If <b>TRUE</b>, playback starts automatically. If <b>FALSE</b>, playback does not start until the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-play">IMFMediaPlayer::Play</a>.
     * 
     * If <i>pwszURL</i> is <b>NULL</b>, this parameter is ignored.
     * @param {Integer} creationOptions Bitwise <b>OR</b> of zero of more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfplay/ne-mfplay-_mfp_creation_options">_MFP_CREATION_OPTIONS</a> enumeration.
     * @param {IMFPMediaPlayerCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayercallback">IMFPMediaPlayerCallback</a> interface of a callback object, implemented by the application. Use this interface to get event notifications from the MFPlay player object. This parameter can be <b>NULL</b>. If  the parameter is <b>NULL</b>, the application will not receive  event notifications from the player object.
     * @param {HWND} hWnd A handle to a window where the video will appear. For audio-only playback, this parameter can be <b>NULL</b>.
     * 
     * The window specified by <i>hWnd</i> is used for the first selected video stream in the source. If the source has multiple video streams, you must call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstreamsink">IMFPMediaItem::SetStreamSink</a> to render any of the video streams after the first.
     * 
     * If <i>hWnd</i> is <b>NULL</b>, MFPlay will not display any video unless the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstreamsink">IMFPMediaItem::SetStreamSink</a> to specify a media sink for the video stream.
     * @param {Pointer<IMFPMediaPlayer>} ppMediaPlayer Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> interface. The caller must release the interface. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, <i>fStartPlayback</i> must be <b>TRUE</b> and <i>pwszURL</i> cannot be <b>NULL</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-mfpcreatemediaplayer
     * @since windows6.1
     */
    static MFPCreateMediaPlayer(pwszURL, fStartPlayback, creationOptions, pCallback, hWnd, ppMediaPlayer) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("MFPlay.dll\MFPCreateMediaPlayer", "ptr", pwszURL, "int", fStartPlayback, "int", creationOptions, "ptr", pCallback, "ptr", hWnd, "ptr*", ppMediaPlayer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IMFPMPHostApp} pmpHost An [IMFPMPHostApp](../mfidl/nn-mfidl-imfpmphostapp.md) with the necessary information to create the **IMFActivate** for this app package.
     * @param {IStream} objectStream An [IStream](../objidl/nn-objidl-istream.md) representing the object stream that will be loaded via IMFActivate::Load.
     * @param {PWSTR} classId An **LPCWSTR** representing the target object's activatable class id.
     * @param {Pointer<IMFActivate>} activate Receives a reference to the to an **IMFActivate**.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-mfcreateencryptedmediaextensionsstoreactivate
     * @since windows10.0.19041
     */
    static MFCreateEncryptedMediaExtensionsStoreActivate(pmpHost, objectStream, classId, activate) {
        classId := classId is String ? StrPtr(classId) : classId

        result := DllCall("MF.dll\MFCreateEncryptedMediaExtensionsStoreActivate", "ptr", pmpHost, "ptr", objectStream, "ptr", classId, "ptr*", activate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Integer} lifetime 
     * @param {Integer} access 
     * @param {PWSTR} friendlyName 
     * @param {PWSTR} sourceId 
     * @param {Pointer<Guid>} categories 
     * @param {Integer} categoryCount 
     * @param {Pointer<IMFVirtualCamera>} virtualCamera 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-mfcreatevirtualcamera
     */
    static MFCreateVirtualCamera(type, lifetime, access, friendlyName, sourceId, categories, categoryCount, virtualCamera) {
        friendlyName := friendlyName is String ? StrPtr(friendlyName) : friendlyName
        sourceId := sourceId is String ? StrPtr(sourceId) : sourceId

        result := DllCall("MFSENSORGROUP.dll\MFCreateVirtualCamera", "int", type, "int", lifetime, "int", access, "ptr", friendlyName, "ptr", sourceId, "ptr", categories, "uint", categoryCount, "ptr*", virtualCamera, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<BOOL>} supported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-mfisvirtualcameratypesupported
     */
    static MFIsVirtualCameraTypeSupported(type, supported) {
        result := DllCall("MFSENSORGROUP.dll\MFIsVirtualCameraTypeSupported", "int", type, "ptr", supported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HDCPType 
     * @returns {HRESULT} 
     */
    static OPMXboxEnableHDCP(HDCPType) {
        result := DllCall("OPMXbox.dll\OPMXboxEnableHDCP", "int", HDCPType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pHDCPStatus 
     * @returns {HRESULT} 
     */
    static OPMXboxGetHDCPStatus(pHDCPStatus) {
        result := DllCall("OPMXbox.dll\OPMXboxGetHDCPStatus", "int*", pHDCPStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pHDCPStatus 
     * @param {Pointer<Integer>} pHDCPType 
     * @returns {HRESULT} 
     */
    static OPMXboxGetHDCPStatusAndType(pHDCPStatus, pHDCPType) {
        result := DllCall("OPMXbox.dll\OPMXboxGetHDCPStatusAndType", "int*", pHDCPStatus, "int*", pHDCPType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
