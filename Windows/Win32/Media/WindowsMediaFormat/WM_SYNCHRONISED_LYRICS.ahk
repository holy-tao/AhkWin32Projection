#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_SYNCHRONISED_LYRICS structure is used as the data item for the WM/Lyrics_Synchronised complex metadata attribute.
 * @remarks
 * The objects of the Windows Media Format SDK do not validate the values of time stamps for synchronized lyrics. However, the data is checked to ensure that there is a time stamp for every string, and that the data alternates between strings and integers.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_synchronised_lyrics
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_SYNCHRONISED_LYRICS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    bTimeStampFormat {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    bContentType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Pointer to a wide-character null-terminated string containing data from the encoding application. An individual application can use this member in any way desired.
     * @type {Pointer<PWSTR>}
     */
    pwszContentDescriptor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * <b>DWORD</b> containing the length, in bytes, of the lyric data pointed to by <b>pbLyrics</b>.
     * @type {Integer}
     */
    dwLyricsLen {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a <b>BYTE</b> array containing the lyrics. You can break the lyrics into syllables, or divide them in some other way that suits the needs of your application. Each syllable or part is included as a null-terminated, wide-character string followed by a 32-bit time stamp. The unit of measurement for the time stamp is determined by the value of <b>bTimeStampFormat</b>.
     * @type {Pointer<Byte>}
     */
    pbLyrics {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
