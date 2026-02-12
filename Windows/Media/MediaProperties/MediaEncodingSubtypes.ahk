#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaEncodingSubtypesStatics2.ahk
#Include .\IMediaEncodingSubtypesStatics4.ahk
#Include .\IMediaEncodingSubtypesStatics6.ahk
#Include .\IMediaEncodingSubtypesStatics3.ahk
#Include .\IMediaEncodingSubtypesStatics7.ahk
#Include .\IMediaEncodingSubtypesStatics5.ahk
#Include .\IMediaEncodingSubtypesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties for getting the standard names for media subtypes.
 * @remarks
 * MediaEncodingSubtypes provides names for media subtypes which can be used to set [AudioEncodingProperties.Subtype](audioencodingproperties_subtype.md), [VideoEncodingProperties.Subtype](videoencodingproperties_subtype.md), [ContainerEncodingProperties.Subtype](containerencodingproperties_subtype.md), and [ImageEncodingProperties.Subtype](imediaencodingproperties_subtype.md).
 * 
 * > [!WARNING]
 * > The string values returned by the MediaEncodingSubtypes properties may not use the same letter casing as [AudioEncodingProperties.Subtype](audioencodingproperties_subtype.md), [VideoEncodingProperties.Subtype](videoencodingproperties_subtype.md), [ContainerEncodingProperties.Subtype](containerencodingproperties_subtype.md), and [ImageEncodingProperties.Subtype](imediaencodingproperties_subtype.md). For this reason, if you compare the values, you should use a case-insensitive comparison or use hardcoded strings that match the casing returned by the encoding properties.
 * 
 * For how-to guidance for setting the encoding properties for media, see [Set media encoding properties for MediaCapture](/windows/uwp/audio-video-camera/set-media-encoding-properties).
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class MediaEncodingSubtypes extends IInspectable {
;@region Static Properties
    /**
     * Gets the name for VP9 video encoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.vp9
     * @type {HSTRING} 
     */
    static Vp9 {
        get => MediaEncodingSubtypes.get_Vp9()
    }

    /**
     * Gets the name for 8-bit luminance-only image encoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.l8
     * @type {HSTRING} 
     */
    static L8 {
        get => MediaEncodingSubtypes.get_L8()
    }

    /**
     * Gets the name for 16-bit luminance-only image encoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.l16
     * @type {HSTRING} 
     */
    static L16 {
        get => MediaEncodingSubtypes.get_L16()
    }

    /**
     * Gets the name for 16-bit z-buffer depth image encoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.d16
     * @type {HSTRING} 
     */
    static D16 {
        get => MediaEncodingSubtypes.get_D16()
    }

    /**
     * Gets the P010, the 10-bit equivalent of NV12 format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.p010
     * @type {HSTRING} 
     */
    static P010 {
        get => MediaEncodingSubtypes.get_P010()
    }

    /**
     * Gets the name for the Presentation Graphic Stream (PGS) format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.pgs
     * @type {HSTRING} 
     */
    static Pgs {
        get => MediaEncodingSubtypes.get_Pgs()
    }

    /**
     * Gets the name for the SubRip Text (SRT) format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.srt
     * @type {HSTRING} 
     */
    static Srt {
        get => MediaEncodingSubtypes.get_Srt()
    }

    /**
     * Gets the name for the SubStation Alpha Text (SSA) format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.ssa
     * @type {HSTRING} 
     */
    static Ssa {
        get => MediaEncodingSubtypes.get_Ssa()
    }

    /**
     * Gets the name for the VobSub format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.vobsub
     * @type {HSTRING} 
     */
    static VobSub {
        get => MediaEncodingSubtypes.get_VobSub()
    }

    /**
     * Gets the name for Apple Lossless Audio Codec (ALAC) audio encoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.alac
     * @type {HSTRING} 
     */
    static Alac {
        get => MediaEncodingSubtypes.get_Alac()
    }

    /**
     * Gets the name for Free Lossless Audio Codec (FLAC) audio encoding.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.flac
     * @type {HSTRING} 
     */
    static Flac {
        get => MediaEncodingSubtypes.get_Flac()
    }

    /**
     * Gets the name for the AOMedia Video 1 (AV1) video encoding subtype.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.av1
     * @type {HSTRING} 
     */
    static Av1 {
        get => MediaEncodingSubtypes.get_Av1()
    }

    /**
     * Gets the name for High Efficiency Image File (HEIF).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.heif
     * @type {HSTRING} 
     */
    static Heif {
        get => MediaEncodingSubtypes.get_Heif()
    }

    /**
     * Gets the name for Advanced Audio Coding (AAC).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.aac
     * @type {HSTRING} 
     */
    static Aac {
        get => MediaEncodingSubtypes.get_Aac()
    }

    /**
     * Gets the name for Advanced Audio Coding (AAC) audio in Audio Data Transport Stream (ADTS) format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.aacadts
     * @type {HSTRING} 
     */
    static AacAdts {
        get => MediaEncodingSubtypes.get_AacAdts()
    }

    /**
     * Gets the name for Dolby Digital audio (AC-3).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.ac3
     * @type {HSTRING} 
     */
    static Ac3 {
        get => MediaEncodingSubtypes.get_Ac3()
    }

    /**
     * Gets the name for Adaptive Multi-Rate (AmrNb).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.amrnb
     * @type {HSTRING} 
     */
    static AmrNb {
        get => MediaEncodingSubtypes.get_AmrNb()
    }

    /**
     * Gets the name for Adaptive Multi-Rate Wideband.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.amrwb
     * @type {HSTRING} 
     */
    static AmrWb {
        get => MediaEncodingSubtypes.get_AmrWb()
    }

    /**
     * Gets the name for RGB 32 with alpha channel.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.argb32
     * @type {HSTRING} 
     */
    static Argb32 {
        get => MediaEncodingSubtypes.get_Argb32()
    }

    /**
     * Gets the name for Advanced Systems Format (ASF).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.asf
     * @type {HSTRING} 
     */
    static Asf {
        get => MediaEncodingSubtypes.get_Asf()
    }

    /**
     * Gets the name for Audio Video Interleave (AVI).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.avi
     * @type {HSTRING} 
     */
    static Avi {
        get => MediaEncodingSubtypes.get_Avi()
    }

    /**
     * Gets the name for BGRA8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.bgra8
     * @type {HSTRING} 
     */
    static Bgra8 {
        get => MediaEncodingSubtypes.get_Bgra8()
    }

    /**
     * Gets the name for BMP file format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.bmp
     * @type {HSTRING} 
     */
    static Bmp {
        get => MediaEncodingSubtypes.get_Bmp()
    }

    /**
     * Gets the name Dolby Digital Plus (E-AC-3).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.eac3
     * @type {HSTRING} 
     */
    static Eac3 {
        get => MediaEncodingSubtypes.get_Eac3()
    }

    /**
     * Gets the name for Uncompressed IEEE floating-point audio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.float
     * @type {HSTRING} 
     */
    static Float {
        get => MediaEncodingSubtypes.get_Float()
    }

    /**
     * Gets the name for Graphics Interchange Format (GIF).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.gif
     * @type {HSTRING} 
     */
    static Gif {
        get => MediaEncodingSubtypes.get_Gif()
    }

    /**
     * Gets the name for H.263.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.h263
     * @type {HSTRING} 
     */
    static H263 {
        get => MediaEncodingSubtypes.get_H263()
    }

    /**
     * The name for H.264.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.h264
     * @type {HSTRING} 
     */
    static H264 {
        get => MediaEncodingSubtypes.get_H264()
    }

    /**
     * Get the name for H.264Es.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.h264es
     * @type {HSTRING} 
     */
    static H264Es {
        get => MediaEncodingSubtypes.get_H264Es()
    }

    /**
     * Gets the name for High Efficiency Video Coding (HEVC).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.hevc
     * @type {HSTRING} 
     */
    static Hevc {
        get => MediaEncodingSubtypes.get_Hevc()
    }

    /**
     * Gets the name for HEVCES.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.hevces
     * @type {HSTRING} 
     */
    static HevcEs {
        get => MediaEncodingSubtypes.get_HevcEs()
    }

    /**
     * Gets the name for IYUV.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.iyuv
     * @type {HSTRING} 
     */
    static Iyuv {
        get => MediaEncodingSubtypes.get_Iyuv()
    }

    /**
     * Gets the name for JPEG.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.jpeg
     * @type {HSTRING} 
     */
    static Jpeg {
        get => MediaEncodingSubtypes.get_Jpeg()
    }

    /**
     * Gets the name for JPEG-XR.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.jpegxr
     * @type {HSTRING} 
     */
    static JpegXr {
        get => MediaEncodingSubtypes.get_JpegXr()
    }

    /**
     * Gets the name for Motion JPEG (MJPG).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.mjpg
     * @type {HSTRING} 
     */
    static Mjpg {
        get => MediaEncodingSubtypes.get_Mjpg()
    }

    /**
     * Gets the name for MPEG.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.mpeg
     * @type {HSTRING} 
     */
    static Mpeg {
        get => MediaEncodingSubtypes.get_Mpeg()
    }

    /**
     * Gets the name for MPEG-1.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.mpeg1
     * @type {HSTRING} 
     */
    static Mpeg1 {
        get => MediaEncodingSubtypes.get_Mpeg1()
    }

    /**
     * Gets the name for MPEG-2.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.mpeg2
     * @type {HSTRING} 
     */
    static Mpeg2 {
        get => MediaEncodingSubtypes.get_Mpeg2()
    }

    /**
     * Gets the name for MPEG Audio Layer-3 (MP3).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.mp3
     * @type {HSTRING} 
     */
    static Mp3 {
        get => MediaEncodingSubtypes.get_Mp3()
    }

    /**
     * Gets the name for MPEG-4.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.mpeg4
     * @type {HSTRING} 
     */
    static Mpeg4 {
        get => MediaEncodingSubtypes.get_Mpeg4()
    }

    /**
     * Gets the name for NV12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.nv12
     * @type {HSTRING} 
     */
    static Nv12 {
        get => MediaEncodingSubtypes.get_Nv12()
    }

    /**
     * Gets the name for PCM.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.pcm
     * @type {HSTRING} 
     */
    static Pcm {
        get => MediaEncodingSubtypes.get_Pcm()
    }

    /**
     * Gets the name for Portable Network Graphics (PNG).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.png
     * @type {HSTRING} 
     */
    static Png {
        get => MediaEncodingSubtypes.get_Png()
    }

    /**
     * Gets the name for the RGB24 image format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.rgb24
     * @type {HSTRING} 
     */
    static Rgb24 {
        get => MediaEncodingSubtypes.get_Rgb24()
    }

    /**
     * Gets the name for the RGB32 image format.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.rgb32
     * @type {HSTRING} 
     */
    static Rgb32 {
        get => MediaEncodingSubtypes.get_Rgb32()
    }

    /**
     * Gets the name for TIFF.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.tiff
     * @type {HSTRING} 
     */
    static Tiff {
        get => MediaEncodingSubtypes.get_Tiff()
    }

    /**
     * Gets the name for Waveform Audio File (WAVE).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.wave
     * @type {HSTRING} 
     */
    static Wave {
        get => MediaEncodingSubtypes.get_Wave()
    }

    /**
     * Gets the name for Windows Media Audio 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.wma8
     * @type {HSTRING} 
     */
    static Wma8 {
        get => MediaEncodingSubtypes.get_Wma8()
    }

    /**
     * Gets the name for Windows Media Audio 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.wma9
     * @type {HSTRING} 
     */
    static Wma9 {
        get => MediaEncodingSubtypes.get_Wma9()
    }

    /**
     * Gets the name for Windows Media Video 9.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.wmv3
     * @type {HSTRING} 
     */
    static Wmv3 {
        get => MediaEncodingSubtypes.get_Wmv3()
    }

    /**
     * Gets the name for Windows Media Video 9 Advanced Profile.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.wvc1
     * @type {HSTRING} 
     */
    static Wvc1 {
        get => MediaEncodingSubtypes.get_Wvc1()
    }

    /**
     * Gets the name for YUY2.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.yuy2
     * @type {HSTRING} 
     */
    static Yuy2 {
        get => MediaEncodingSubtypes.get_Yuy2()
    }

    /**
     * Gets the name for YV12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaencodingsubtypes.yv12
     * @type {HSTRING} 
     */
    static Yv12 {
        get => MediaEncodingSubtypes.get_Yv12()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Vp9() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics2.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics2 := IMediaEncodingSubtypesStatics2(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics2.get_Vp9()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_L8() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics2.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics2 := IMediaEncodingSubtypesStatics2(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics2.get_L8()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_L16() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics2.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics2 := IMediaEncodingSubtypesStatics2(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics2.get_L16()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_D16() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics2.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics2 := IMediaEncodingSubtypesStatics2(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics2.get_D16()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_P010() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics4.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics4 := IMediaEncodingSubtypesStatics4(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics4.get_P010()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Pgs() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics6")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics6.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics6 := IMediaEncodingSubtypesStatics6(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics6.get_Pgs()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Srt() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics6")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics6.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics6 := IMediaEncodingSubtypesStatics6(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics6.get_Srt()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ssa() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics6")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics6.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics6 := IMediaEncodingSubtypesStatics6(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics6.get_Ssa()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VobSub() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics6")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics6.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics6 := IMediaEncodingSubtypesStatics6(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics6.get_VobSub()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Alac() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics3.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics3 := IMediaEncodingSubtypesStatics3(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics3.get_Alac()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Flac() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics3.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics3 := IMediaEncodingSubtypesStatics3(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics3.get_Flac()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Av1() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics7")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics7.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics7 := IMediaEncodingSubtypesStatics7(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics7.get_Av1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Heif() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics5")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics5.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics5 := IMediaEncodingSubtypesStatics5(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics5.get_Heif()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Aac() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Aac()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AacAdts() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_AacAdts()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ac3() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Ac3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AmrNb() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_AmrNb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AmrWb() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_AmrWb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Argb32() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Argb32()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Asf() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Asf()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Avi() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Avi()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Bgra8() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Bgra8()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Bmp() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Bmp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Eac3() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Eac3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Float() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Float()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Gif() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Gif()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_H263() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_H263()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_H264() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_H264()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_H264Es() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_H264Es()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Hevc() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Hevc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HevcEs() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_HevcEs()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Iyuv() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Iyuv()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Jpeg() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Jpeg()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_JpegXr() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_JpegXr()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mjpg() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Mjpg()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mpeg() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Mpeg()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mpeg1() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Mpeg1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mpeg2() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Mpeg2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mp3() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Mp3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mpeg4() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Mpeg4()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Nv12() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Nv12()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Pcm() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Pcm()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Png() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Png()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rgb24() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Rgb24()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rgb32() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Rgb32()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Tiff() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Tiff()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wave() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Wave()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wma8() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Wma8()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wma9() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Wma9()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wmv3() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Wmv3()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Wvc1() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Wvc1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Yuy2() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Yuy2()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Yv12() {
        if (!MediaEncodingSubtypes.HasProp("__IMediaEncodingSubtypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.MediaEncodingSubtypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaEncodingSubtypesStatics.IID)
            MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics := IMediaEncodingSubtypesStatics(factoryPtr)
        }

        return MediaEncodingSubtypes.__IMediaEncodingSubtypesStatics.get_Yv12()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
