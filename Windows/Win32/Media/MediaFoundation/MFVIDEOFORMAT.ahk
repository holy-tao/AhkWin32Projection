#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\MFARGB.ahk" { MFARGB }
#Import ".\MFAYUVSample.ahk" { MFAYUVSample }
#Import ".\MFNominalRange.ahk" { MFNominalRange }
#Import ".\MFOffset.ahk" { MFOffset }
#Import ".\MFPaletteEntry.ahk" { MFPaletteEntry }
#Import ".\MFRatio.ahk" { MFRatio }
#Import ".\MFVideoArea.ahk" { MFVideoArea }
#Import ".\MFVideoChromaSubsampling.ahk" { MFVideoChromaSubsampling }
#Import ".\MFVideoCompressedInfo.ahk" { MFVideoCompressedInfo }
#Import ".\MFVideoInfo.ahk" { MFVideoInfo }
#Import ".\MFVideoInterlaceMode.ahk" { MFVideoInterlaceMode }
#Import ".\MFVideoLighting.ahk" { MFVideoLighting }
#Import ".\MFVideoPrimaries.ahk" { MFVideoPrimaries }
#Import ".\MFVideoSurfaceInfo.ahk" { MFVideoSurfaceInfo }
#Import ".\MFVideoTransferFunction.ahk" { MFVideoTransferFunction }
#Import ".\MFVideoTransferMatrix.ahk" { MFVideoTransferMatrix }

/**
 * Describes a video format.
 * @remarks
 * Applications should avoid using this structure. Instead, it is recommended that applications use attributes to describe the video format. For a list of media type attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-attributes">Media Type Attributes</a>. With attributes, you can set just the format information that you know, which is easier (and more likely to be accurate) than trying to fill in complete format information for the <b>MFVIDEOFORMAT</b> structure.
 * 
 * To initialize a media type object from an <b>MFVIDEOFORMAT</b> structure, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfinitmediatypefrommfvideoformat">MFInitMediaTypeFromMFVideoFormat</a>.
 * 
 * You can use the <b>MFVIDEOFORMAT</b> structure as the format block for a DirectShow media type. Set the format GUID to FORMAT_MFVideoFormat.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfvideoformat
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVIDEOFORMAT {
    #StructPack 8

    /**
     * Size of the structure, in bytes. This value includes the size of the palette entries that may appear after the <b>surfaceInfo</b> member.
     */
    dwSize : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoinfo">MFVideoInfo</a> structure. This structure contains information that applies to both compressed and uncompressed formats.
     */
    videoInfo : MFVideoInfo

    /**
     * Video subtype. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-subtype-guids">Video Subtype GUIDs</a>.
     */
    guidFormat : Guid

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideocompressedinfo">MFVideoCompressedInfo</a> structure. This structure contains information that applies only to compressed formats.
     */
    compressedInfo : MFVideoCompressedInfo

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideosurfaceinfo">MFVideoSurfaceInfo</a> structure. This structure contains information that applies only to uncompressed formats.
     */
    surfaceInfo : MFVideoSurfaceInfo

}
