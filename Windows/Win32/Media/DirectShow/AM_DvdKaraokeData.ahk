#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how to mix the karaoke audio channels.
 * @remarks
 * This structure is used for the AM_PROPERTY_DVDKARAOKE_DATA property.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_dvdkaraokedata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DvdKaraokeData {
    #StructPack 4

    /**
     * A bitwise OR of <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_karaoke_downmix">DVD_KARAOKE_DOWNMIX</a> flags telling the decoder which channels are downmixed to channels 0 or 1.
     */
    dwDownmix : UInt32

    /**
     * A valid <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_karaoke_assignment">DVD_KARAOKE_ASSIGNMENT</a> value that indicates which speakers the output is going to.
     */
    dwSpeakerAssignment : UInt32

}
