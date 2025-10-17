#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFRatio.ahk
#Include .\MFOffset.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\MFVideoArea.ahk
#Include .\MFVideoInfo.ahk
#Include .\MFVideoCompressedInfo.ahk
#Include .\MFARGB.ahk
#Include .\MFAYUVSample.ahk
#Include .\MFPaletteEntry.ahk
#Include .\MFVideoSurfaceInfo.ahk

/**
 * Describes a video format.
 * @remarks
 * 
  * Applications should avoid using this structure. Instead, it is recommended that applications use attributes to describe the video format. For a list of media type attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-attributes">Media Type Attributes</a>. With attributes, you can set just the format information that you know, which is easier (and more likely to be accurate) than trying to fill in complete format information for the <b>MFVIDEOFORMAT</b> structure.
  * 
  * To initialize a media type object from an <b>MFVIDEOFORMAT</b> structure, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfinitmediatypefrommfvideoformat">MFInitMediaTypeFromMFVideoFormat</a>.
  * 
  * You can use the <b>MFVIDEOFORMAT</b> structure as the format block for a DirectShow media type. Set the format GUID to FORMAT_MFVideoFormat.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ns-mfobjects-mfvideoformat
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVIDEOFORMAT extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * Size of the structure, in bytes. This value includes the size of the palette entries that may appear after the <b>surfaceInfo</b> member.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoinfo">MFVideoInfo</a> structure. This structure contains information that applies to both compressed and uncompressed formats.
     * @type {MFVideoInfo}
     */
    videoInfo{
        get {
            if(!this.HasProp("__videoInfo"))
                this.__videoInfo := MFVideoInfo(8, this)
            return this.__videoInfo
        }
    }

    /**
     * Video subtype. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-subtype-guids">Video Subtype GUIDs</a>.
     * @type {Pointer<Guid>}
     */
    guidFormat {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideocompressedinfo">MFVideoCompressedInfo</a> structure. This structure contains information that applies only to compressed formats.
     * @type {MFVideoCompressedInfo}
     */
    compressedInfo{
        get {
            if(!this.HasProp("__compressedInfo"))
                this.__compressedInfo := MFVideoCompressedInfo(128, this)
            return this.__compressedInfo
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideosurfaceinfo">MFVideoSurfaceInfo</a> structure. This structure contains information that applies only to uncompressed formats.
     * @type {MFVideoSurfaceInfo}
     */
    surfaceInfo{
        get {
            if(!this.HasProp("__surfaceInfo"))
                this.__surfaceInfo := MFVideoSurfaceInfo(152, this)
            return this.__surfaceInfo
        }
    }
}
