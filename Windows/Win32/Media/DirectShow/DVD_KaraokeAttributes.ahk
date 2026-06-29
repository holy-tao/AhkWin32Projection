#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_KARAOKE_ASSIGNMENT.ahk" { DVD_KARAOKE_ASSIGNMENT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DVD_KaraokeAttributes structure contains information about a karaoke audio stream. The IDvdInfo2::GetKaraokeAttributes method fills in a DVD_KaraokeAttributes structure for a specified stream.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_karaokeattributes
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_KaraokeAttributes {
    #StructPack 4

    /**
     * Version number. The current karaoke version is 1.0.
     */
    bVersion : Int8

    /**
     * If <b>TRUE</b>, the "Guide Vocal 1" channel contains the "Master of Ceremonies" content.
     */
    fMasterOfCeremoniesInGuideVocal1 : BOOL

    /**
     * A Boolean value indicating whether the song is intended to be sung as a duet.
     */
    fDuet : BOOL

    /**
     * A [DVD_KARAOKE_ASSIGNMENT](/windows/win32/api/strmif/ne-strmif-dvd_karaoke_assignment) value indicating the speaker configuration into which all the channels will be mixed.
     */
    ChannelAssignment : DVD_KARAOKE_ASSIGNMENT

    /**
     * An array of valid [DVD_KARAOKE_CONTENTS](/windows/desktop/api/strmif/ne-strmif-dvd_karaoke_contents) values that identifies the content on each channel.
     */
    wChannelContents : UInt16[8]

}
