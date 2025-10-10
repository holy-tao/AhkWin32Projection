#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies flags that, when used in a bitwise OR operation, describe the contents of each channel of an audio stream in a karaoke title.
 * @remarks
 * 
  * This enumeration is used in the [DVD_KaraokeAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_karaokeattributes) structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_karaoke_contents
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_KARAOKE_CONTENTS{

    /**
     * The channel contains guide vocal 1.
     * @type {Integer (Int32)}
     */
    static DVD_Karaoke_GuideVocal1 => 1

    /**
     * The channel contains guide vocal 2.
     * @type {Integer (Int32)}
     */
    static DVD_Karaoke_GuideVocal2 => 2

    /**
     * The channel contains guide melody 1.
     * @type {Integer (Int32)}
     */
    static DVD_Karaoke_GuideMelody1 => 4

    /**
     * The channel contains guide melody 2.
     * @type {Integer (Int32)}
     */
    static DVD_Karaoke_GuideMelody2 => 8

    /**
     * The channel contains guide melody A.
     * @type {Integer (Int32)}
     */
    static DVD_Karaoke_GuideMelodyA => 16

    /**
     * The channel contains guide melody B.
     * @type {Integer (Int32)}
     */
    static DVD_Karaoke_GuideMelodyB => 32

    /**
     * The channel contains sound effect A.
     * @type {Integer (Int32)}
     */
    static DVD_Karaoke_SoundEffectA => 64

    /**
     * The channel contains sound effect B.
     * @type {Integer (Int32)}
     */
    static DVD_Karaoke_SoundEffectB => 128
}
