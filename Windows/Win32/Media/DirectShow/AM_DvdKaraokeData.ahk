#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies how to mix the karaoke audio channels.
 * @remarks
 * This structure is used for the AM_PROPERTY_DVDKARAOKE_DATA property.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_dvdkaraokedata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DvdKaraokeData extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A bitwise OR of <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_karaoke_downmix">DVD_KARAOKE_DOWNMIX</a> flags telling the decoder which channels are downmixed to channels 0 or 1.
     * @type {Integer}
     */
    dwDownmix {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A valid <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_karaoke_assignment">DVD_KARAOKE_ASSIGNMENT</a> value that indicates which speakers the output is going to.
     * @type {Integer}
     */
    dwSpeakerAssignment {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
