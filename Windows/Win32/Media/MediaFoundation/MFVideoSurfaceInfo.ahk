#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFARGB.ahk
#Include .\MFAYUVSample.ahk
#Include .\MFPaletteEntry.ahk

/**
 * Contains information about an uncompressed video format. This structure is used in the MFVIDEOFORMAT structure.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ns-mfobjects-mfvideosurfaceinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoSurfaceInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * For compressed formats, this value must be zero. For uncompressed formats, the value is a FOURCC or <b>D3DFORMAT</b> value that identifies the format. Use the <b>Data1</b> field from the subtype GUID. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-subtype-guids">Video Subtype GUIDs</a>.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of palette entries. The value must be between 0 and 256.
     * @type {Integer}
     */
    PaletteEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfpaletteentry">MFPaletteEntry Union</a>s that contains the color table for a palettized format. The size of the array is given in the <b>PaletteEntries</b> member. If the format is not palettized, set <b>PaletteEntries</b> to zero.
     * @type {Array<MFPaletteEntry>}
     */
    Palette{
        get {
            if(!this.HasProp("__PaletteProxyArray"))
                this.__PaletteProxyArray := Win32FixedArray(this.ptr + 8, 1, MFPaletteEntry, "")
            return this.__PaletteProxyArray
        }
    }
}
