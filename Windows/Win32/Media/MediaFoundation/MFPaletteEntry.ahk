#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFARGB.ahk
#Include .\MFAYUVSample.ahk

/**
 * Contains one palette entry in a color table.
 * @remarks
 * 
  * This union can be used to represent both RGB palettes and Y'Cb'Cr' palettes. The video format that defines the palette determines which union member should be used.
  *      
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ns-mfobjects-mfpaletteentry
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFPaletteEntry extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * [MFARGB](./ns-mfobjects-mfargb.md) structure that contains an RGB color.
     * @type {MFARGB}
     */
    ARGB{
        get {
            if(!this.HasProp("__ARGB"))
                this.__ARGB := MFARGB(0, this)
            return this.__ARGB
        }
    }

    /**
     * [MFAYUVSample](./ns-mfobjects-mfayuvsample.md) structure that contains a Y'Cb'Cr' color.
     * @type {MFAYUVSample}
     */
    AYCbCr{
        get {
            if(!this.HasProp("__AYCbCr"))
                this.__AYCbCr := MFAYUVSample(0, this)
            return this.__AYCbCr
        }
    }
}
