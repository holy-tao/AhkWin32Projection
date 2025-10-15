#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The DVD_KaraokeAttributes structure contains information about a karaoke audio stream. The IDvdInfo2::GetKaraokeAttributes method fills in a DVD_KaraokeAttributes structure for a specified stream.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_karaokeattributes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_KaraokeAttributes extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Version number. The current karaoke version is 1.0.
     * @type {Integer}
     */
    bVersion {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, the "Guide Vocal 1" channel contains the "Master of Ceremonies" content.
     * @type {BOOL}
     */
    fMasterOfCeremoniesInGuideVocal1{
        get {
            if(!this.HasProp("__fMasterOfCeremoniesInGuideVocal1"))
                this.__fMasterOfCeremoniesInGuideVocal1 := BOOL(this.ptr + 4)
            return this.__fMasterOfCeremoniesInGuideVocal1
        }
    }

    /**
     * A Boolean value indicating whether the song is intended to be sung as a duet.
     * @type {BOOL}
     */
    fDuet{
        get {
            if(!this.HasProp("__fDuet"))
                this.__fDuet := BOOL(this.ptr + 8)
            return this.__fDuet
        }
    }

    /**
     * A [DVD_KARAOKE_ASSIGNMENT](/windows/desktop/api/strmif/ne-strmif-dvd_karaoke_assignment) value indicating the speaker configuration into which all the channels will be mixed.
     * @type {Integer}
     */
    ChannelAssignment {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * An array of valid [DVD_KARAOKE_CONTENTS](/windows/desktop/api/strmif/ne-strmif-dvd_karaoke_contents) values that identifies the content on each channel.
     * @type {Array<UInt16>}
     */
    wChannelContents{
        get {
            if(!this.HasProp("__wChannelContentsProxyArray"))
                this.__wChannelContentsProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "ushort")
            return this.__wChannelContentsProxyArray
        }
    }
}
