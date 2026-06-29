#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFARGB.ahk" { MFARGB }
#Import ".\MFAYUVSample.ahk" { MFAYUVSample }

/**
 * Contains one palette entry in a color table.
 * @remarks
 * This union can be used to represent both RGB palettes and Y'Cb'Cr' palettes. The video format that defines the palette determines which union member should be used.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfpaletteentry
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFPaletteEntry {
    #StructPack 1

    /**
     * [MFARGB](./ns-mfobjects-mfargb.md) structure that contains an RGB color.
     */
    ARGB : MFARGB

    static __New() {
        DefineProp(this.Prototype, 'AYCbCr', { type: MFAYUVSample, offset: 0 })
        this.DeleteProp("__New")
    }
}
