#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFARGB.ahk" { MFARGB }
#Import ".\MFAYUVSample.ahk" { MFAYUVSample }
#Import ".\MFPaletteEntry.ahk" { MFPaletteEntry }

/**
 * Contains information about an uncompressed video format. This structure is used in the MFVIDEOFORMAT structure.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfvideosurfaceinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoSurfaceInfo {
    #StructPack 4

    /**
     * For compressed formats, this value must be zero. For uncompressed formats, the value is a FOURCC or <b>D3DFORMAT</b> value that identifies the format. Use the <b>Data1</b> field from the subtype GUID. See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-subtype-guids">Video Subtype GUIDs</a>.
     */
    Format : UInt32

    /**
     * Number of palette entries. The value must be between 0 and 256.
     */
    PaletteEntries : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfpaletteentry">MFPaletteEntry Union</a>s that contains the color table for a palettized format. The size of the array is given in the <b>PaletteEntries</b> member. If the format is not palettized, set <b>PaletteEntries</b> to zero.
     */
    Palette : MFPaletteEntry[1]

}
