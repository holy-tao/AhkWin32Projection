#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies flags that, when used in a bitwise OR operation, describe the contents of each channel of an audio stream in a karaoke title.
 * @remarks
 * This enumeration is used in the [DVD_KaraokeAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_karaokeattributes) structure.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_karaoke_contents
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_KARAOKE_CONTENTS extends Win32Enum {

    /**
     * The channel contains guide vocal 1.
     * Native name: DVD_Karaoke_GuideVocal1
     * @type {Integer (Int32)}
     */
    static GuideVocal1 => 1

    /**
     * The channel contains guide vocal 2.
     * Native name: DVD_Karaoke_GuideVocal2
     * @type {Integer (Int32)}
     */
    static GuideVocal2 => 2

    /**
     * The channel contains guide melody 1.
     * Native name: DVD_Karaoke_GuideMelody1
     * @type {Integer (Int32)}
     */
    static GuideMelody1 => 4

    /**
     * The channel contains guide melody 2.
     * Native name: DVD_Karaoke_GuideMelody2
     * @type {Integer (Int32)}
     */
    static GuideMelody2 => 8

    /**
     * The channel contains guide melody A.
     * Native name: DVD_Karaoke_GuideMelodyA
     * @type {Integer (Int32)}
     */
    static GuideMelodyA => 16

    /**
     * The channel contains guide melody B.
     * Native name: DVD_Karaoke_GuideMelodyB
     * @type {Integer (Int32)}
     */
    static GuideMelodyB => 32

    /**
     * The channel contains sound effect A.
     * Native name: DVD_Karaoke_SoundEffectA
     * @type {Integer (Int32)}
     */
    static SoundEffectA => 64

    /**
     * The channel contains sound effect B.
     * Native name: DVD_Karaoke_SoundEffectB
     * @type {Integer (Int32)}
     */
    static SoundEffectB => 128
}
