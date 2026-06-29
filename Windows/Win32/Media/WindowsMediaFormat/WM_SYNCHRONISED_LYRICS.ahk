#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WM_SYNCHRONISED_LYRICS structure is used as the data item for the WM/Lyrics_Synchronised complex metadata attribute.
 * @remarks
 * The objects of the Windows Media Format SDK do not validate the values of time stamps for synchronized lyrics. However, the data is checked to ensure that there is a time stamp for every string, and that the data alternates between strings and integers.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_synchronised_lyrics
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_SYNCHRONISED_LYRICS {
    #StructPack 8

    bTimeStampFormat : Int8

    bContentType : Int8

    /**
     * Pointer to a wide-character null-terminated string containing data from the encoding application. An individual application can use this member in any way desired.
     */
    pwszContentDescriptor : PWSTR

    /**
     * <b>DWORD</b> containing the length, in bytes, of the lyric data pointed to by <b>pbLyrics</b>.
     */
    dwLyricsLen : UInt32

    /**
     * Pointer to a <b>BYTE</b> array containing the lyrics. You can break the lyrics into syllables, or divide them in some other way that suits the needs of your application. Each syllable or part is included as a null-terminated, wide-character string followed by a 32-bit time stamp. The unit of measurement for the time stamp is determined by the value of <b>bTimeStampFormat</b>.
     */
    pbLyrics : IntPtr

}
