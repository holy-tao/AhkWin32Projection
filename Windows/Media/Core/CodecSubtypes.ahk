#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICodecSubtypesStatics2.ahk
#Include .\ICodecSubtypesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties for most supported media subtypes that return the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the subtype. Use these property values to filter a query performed with [CodecQuery.FindAllAsync](codecquery_findallasync_1027997915.md). You can also compare the values returned by these properties to the values in the [Subtypes](./codecinfo_subtypes.md) collection of a [CodecInfo](codecinfo.md) object to determine if a codec supports a particular media subtype.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class CodecSubtypes extends IInspectable {
;@region Static Properties
    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the AV1 video subtype.
     * @remarks
     * This GUID matches the value of the Media Foundation subtype [MFVideoFormat_AV1](/windows/win32/medfound/video-subtype-guids), defined using the FOURCC 'AV01'.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatav1
     * @type {HSTRING} 
     */
    static VideoFormatAv1 {
        get => CodecSubtypes.get_VideoFormatAv1()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the DVCPRO 25 (525-60 or 625-50) video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatdv25
     * @type {HSTRING} 
     */
    static VideoFormatDV25 {
        get => CodecSubtypes.get_VideoFormatDV25()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the DVCPRO 50 (525-60 or 625-50) video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatdv50
     * @type {HSTRING} 
     */
    static VideoFormatDV50 {
        get => CodecSubtypes.get_VideoFormatDV50()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the DVC/DV Video video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatdvc
     * @type {HSTRING} 
     */
    static VideoFormatDvc {
        get => CodecSubtypes.get_VideoFormatDvc()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the DVCPRO 100 (1080/60i, 1080/50i, or 720/60P) video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatdvh1
     * @type {HSTRING} 
     */
    static VideoFormatDvh1 {
        get => CodecSubtypes.get_VideoFormatDvh1()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the HD-DVCR (1125-60 or 1250-50) video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatdvhd
     * @type {HSTRING} 
     */
    static VideoFormatDvhD {
        get => CodecSubtypes.get_VideoFormatDvhD()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the SDL-DVCR (525-60 or 625-50) video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatdvsd
     * @type {HSTRING} 
     */
    static VideoFormatDvsd {
        get => CodecSubtypes.get_VideoFormatDvsd()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the SD-DVCR (525-60 or 625-50) video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatdvsl
     * @type {HSTRING} 
     */
    static VideoFormatDvsl {
        get => CodecSubtypes.get_VideoFormatDvsl()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the H.263 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformath263
     * @type {HSTRING} 
     */
    static VideoFormatH263 {
        get => CodecSubtypes.get_VideoFormatH263()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the H.264 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformath264
     * @type {HSTRING} 
     */
    static VideoFormatH264 {
        get => CodecSubtypes.get_VideoFormatH264()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the H.265 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformath265
     * @type {HSTRING} 
     */
    static VideoFormatH265 {
        get => CodecSubtypes.get_VideoFormatH265()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the H.264 elementary stream video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformath264es
     * @type {HSTRING} 
     */
    static VideoFormatH264ES {
        get => CodecSubtypes.get_VideoFormatH264ES()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the High Efficiency Video Coding (HEVC) Main profile and Main Still Picture profile video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformathevc
     * @type {HSTRING} 
     */
    static VideoFormatHevc {
        get => CodecSubtypes.get_VideoFormatHevc()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the High Efficiency Video Coding Elementary Stream (HEVC-ES) profile video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformathevces
     * @type {HSTRING} 
     */
    static VideoFormatHevcES {
        get => CodecSubtypes.get_VideoFormatHevcES()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the MPEG-4 part 2 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatm4s2
     * @type {HSTRING} 
     */
    static VideoFormatM4S2 {
        get => CodecSubtypes.get_VideoFormatM4S2()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Motion JPEG video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatmjpg
     * @type {HSTRING} 
     */
    static VideoFormatMjpg {
        get => CodecSubtypes.get_VideoFormatMjpg()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Microsoft MPEG 4 codec version 3 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatmp43
     * @type {HSTRING} 
     */
    static VideoFormatMP43 {
        get => CodecSubtypes.get_VideoFormatMP43()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the ISO MPEG 4 codec version 1 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatmp4s
     * @type {HSTRING} 
     */
    static VideoFormatMP4S {
        get => CodecSubtypes.get_VideoFormatMP4S()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the MPEG-4 part 2 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatmp4v
     * @type {HSTRING} 
     */
    static VideoFormatMP4V {
        get => CodecSubtypes.get_VideoFormatMP4V()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the MPEG-2 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatmpeg2
     * @type {HSTRING} 
     */
    static VideoFormatMpeg2 {
        get => CodecSubtypes.get_VideoFormatMpeg2()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the VP8 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatvp80
     * @type {HSTRING} 
     */
    static VideoFormatVP80 {
        get => CodecSubtypes.get_VideoFormatVP80()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the VP9 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatvp90
     * @type {HSTRING} 
     */
    static VideoFormatVP90 {
        get => CodecSubtypes.get_VideoFormatVP90()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the MPEG-1 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatmpg1
     * @type {HSTRING} 
     */
    static VideoFormatMpg1 {
        get => CodecSubtypes.get_VideoFormatMpg1()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Screen codec version 1 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatmss1
     * @type {HSTRING} 
     */
    static VideoFormatMss1 {
        get => CodecSubtypes.get_VideoFormatMss1()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Video 9 Screen codec video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatmss2
     * @type {HSTRING} 
     */
    static VideoFormatMss2 {
        get => CodecSubtypes.get_VideoFormatMss2()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Video codec version 7 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatwmv1
     * @type {HSTRING} 
     */
    static VideoFormatWmv1 {
        get => CodecSubtypes.get_VideoFormatWmv1()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Video 8 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatwmv2
     * @type {HSTRING} 
     */
    static VideoFormatWmv2 {
        get => CodecSubtypes.get_VideoFormatWmv2()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Video 9 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatwmv3
     * @type {HSTRING} 
     */
    static VideoFormatWmv3 {
        get => CodecSubtypes.get_VideoFormatWmv3()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the SMPTE 421M (VC-1). video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformatwvc1
     * @type {HSTRING} 
     */
    static VideoFormatWvc1 {
        get => CodecSubtypes.get_VideoFormatWvc1()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the 8-bit per channel planar YUV 4:2:0 video subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.videoformat420o
     * @type {HSTRING} 
     */
    static VideoFormat420O {
        get => CodecSubtypes.get_VideoFormat420O()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Advanced Audio Coding (AAC) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformataac
     * @type {HSTRING} 
     */
    static AudioFormatAac {
        get => CodecSubtypes.get_AudioFormatAac()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Audio Data Transport Stream (ADTS) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatadts
     * @type {HSTRING} 
     */
    static AudioFormatAdts {
        get => CodecSubtypes.get_AudioFormatAdts()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Apple Lossless Audio Codec (ALAC) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatalac
     * @type {HSTRING} 
     */
    static AudioFormatAlac {
        get => CodecSubtypes.get_AudioFormatAlac()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Adaptive Multi-Rate (AMR-NB) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatamrnb
     * @type {HSTRING} 
     */
    static AudioFormatAmrNB {
        get => CodecSubtypes.get_AudioFormatAmrNB()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Adaptive Multi-Rate Wideband (AMR-WB) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatamrwb
     * @type {HSTRING} 
     */
    static AudioFormatAmrWB {
        get => CodecSubtypes.get_AudioFormatAmrWB()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Adaptive Multi-Rate (AMR-WP) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatamrwp
     * @type {HSTRING} 
     */
    static AudioFormatAmrWP {
        get => CodecSubtypes.get_AudioFormatAmrWP()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Dolby Digital Audio Coding 3 (AC-3) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatdolbyac3
     * @type {HSTRING} 
     */
    static AudioFormatDolbyAC3 {
        get => CodecSubtypes.get_AudioFormatDolbyAC3()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Dolby AC-3 audio over Sony/Philips Digital Interface (S/PDIF) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatdolbyac3spdif
     * @type {HSTRING} 
     */
    static AudioFormatDolbyAC3Spdif {
        get => CodecSubtypes.get_AudioFormatDolbyAC3Spdif()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Dolby Digital Plus (DD Plus) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatdolbyddplus
     * @type {HSTRING} 
     */
    static AudioFormatDolbyDDPlus {
        get => CodecSubtypes.get_AudioFormatDolbyDDPlus()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the encrypted audio data used with secure audio path audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatdrm
     * @type {HSTRING} 
     */
    static AudioFormatDrm {
        get => CodecSubtypes.get_AudioFormatDrm()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Digital Theater Systems (DTS) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatdts
     * @type {HSTRING} 
     */
    static AudioFormatDts {
        get => CodecSubtypes.get_AudioFormatDts()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Free Lossless Audio Codec (FLAC) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatflac
     * @type {HSTRING} 
     */
    static AudioFormatFlac {
        get => CodecSubtypes.get_AudioFormatFlac()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the uncompressed IEEE floating-point audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatfloat
     * @type {HSTRING} 
     */
    static AudioFormatFloat {
        get => CodecSubtypes.get_AudioFormatFloat()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the MPEG Audio Layer-3 (MP3) audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatmp3
     * @type {HSTRING} 
     */
    static AudioFormatMP3 {
        get => CodecSubtypes.get_AudioFormatMP3()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the MPEG-1 audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatmpeg
     * @type {HSTRING} 
     */
    static AudioFormatMPeg {
        get => CodecSubtypes.get_AudioFormatMPeg()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Audio 9 Voice codec audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatmsp1
     * @type {HSTRING} 
     */
    static AudioFormatMsp1 {
        get => CodecSubtypes.get_AudioFormatMsp1()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Opus audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatopus
     * @type {HSTRING} 
     */
    static AudioFormatOpus {
        get => CodecSubtypes.get_AudioFormatOpus()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the uncompressed PCM audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatpcm
     * @type {HSTRING} 
     */
    static AudioFormatPcm {
        get => CodecSubtypes.get_AudioFormatPcm()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Audio 9 Professional codec over S/PDIF audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatwmaspdif
     * @type {HSTRING} 
     */
    static AudioFormatWmaSpdif {
        get => CodecSubtypes.get_AudioFormatWmaSpdif()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Audio 9 Lossless codec or Windows Media Audio 9.1 audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatwmaudiolossless
     * @type {HSTRING} 
     */
    static AudioFormatWMAudioLossless {
        get => CodecSubtypes.get_AudioFormatWMAudioLossless()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Audio 8 codec, Windows Media Audio 9 codec, or Windows Media Audio 9.1 codec audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatwmaudiov8
     * @type {HSTRING} 
     */
    static AudioFormatWMAudioV8 {
        get => CodecSubtypes.get_AudioFormatWMAudioV8()
    }

    /**
     * Gets the string representation of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the Windows Media Audio 9 Professional codec or Windows Media Audio 9.1 Professional codec audio subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.codecsubtypes.audioformatwmaudiov9
     * @type {HSTRING} 
     */
    static AudioFormatWMAudioV9 {
        get => CodecSubtypes.get_AudioFormatWMAudioV9()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatAv1() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics2.IID)
            CodecSubtypes.__ICodecSubtypesStatics2 := ICodecSubtypesStatics2(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics2.get_VideoFormatAv1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatDV25() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatDV25()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatDV50() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatDV50()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatDvc() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatDvc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatDvh1() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatDvh1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatDvhD() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatDvhD()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatDvsd() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatDvsd()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatDvsl() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatDvsl()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatH263() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatH263()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatH264() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatH264()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatH265() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatH265()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatH264ES() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatH264ES()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatHevc() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatHevc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatHevcES() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatHevcES()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatM4S2() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatM4S2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatMjpg() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatMjpg()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatMP43() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatMP43()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatMP4S() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatMP4S()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatMP4V() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatMP4V()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatMpeg2() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatMpeg2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatVP80() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatVP80()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatVP90() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatVP90()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatMpg1() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatMpg1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatMss1() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatMss1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatMss2() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatMss2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatWmv1() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatWmv1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatWmv2() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatWmv2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatWmv3() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatWmv3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormatWvc1() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormatWvc1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VideoFormat420O() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_VideoFormat420O()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatAac() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatAac()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatAdts() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatAdts()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatAlac() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatAlac()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatAmrNB() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatAmrNB()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatAmrWB() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatAmrWB()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatAmrWP() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatAmrWP()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatDolbyAC3() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatDolbyAC3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatDolbyAC3Spdif() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatDolbyAC3Spdif()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatDolbyDDPlus() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatDolbyDDPlus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatDrm() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatDrm()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatDts() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatDts()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatFlac() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatFlac()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatFloat() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatFloat()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatMP3() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatMP3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatMPeg() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatMPeg()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatMsp1() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatMsp1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatOpus() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatOpus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatPcm() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatPcm()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatWmaSpdif() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatWmaSpdif()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatWMAudioLossless() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatWMAudioLossless()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatWMAudioV8() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatWMAudioV8()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AudioFormatWMAudioV9() {
        if (!CodecSubtypes.HasProp("__ICodecSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.CodecSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICodecSubtypesStatics.IID)
            CodecSubtypes.__ICodecSubtypesStatics := ICodecSubtypesStatics(factoryPtr)
        }

        return CodecSubtypes.__ICodecSubtypesStatics.get_AudioFormatWMAudioV9()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
