#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines a subset of the DVD text-string types.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasunicode">IDvdInfo2::GetDVDTextStringAsUnicode</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasnative">IDvdInfo2::GetDVDTextStringAsNative</a> methods return this enumeration type. The value specifies how the text string is categorized. These methods can also return identifiers that are not defined in this enumeration. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/working-with-dvd-text-strings">Working with DVD Text Strings</a>.
 * 
 * Not every DVD text string identifier is included in this enumeration, so an authored DVD might include other values.
 * 
 * One important identifier that is not included in this enumeration is 0xF0, the code for sorting. You can use this string to sort the string data. It can be a unique number or a repetition of a previous string with the word order changed. For example, a DVD might have a string of 0x30 (DVD_General_Name) with the value "The Greatest Hits", which might be followed by another string of type 0xF0 with the value "Greatest Hits, The". As with content strings, however, the use of the sorting string is not strictly defined.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_textstringtype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_TextStringType{

    /**
     * Indicates the top-level of the logical hierarchy. Refers to the entire contents of a one-sided disc or one side of a two-sided disc.
     * @type {Integer (Int32)}
     */
    static DVD_Struct_Volume => 1

    /**
     * Indicates that all content strings, until the next <b>DVD_Struct_Title</b>, belong to one title.
     * @type {Integer (Int32)}
     */
    static DVD_Struct_Title => 2

    /**
     * Indicates the parental ID of the following strings.
     * @type {Integer (Int32)}
     */
    static DVD_Struct_ParentalID => 3

    /**
     * Indicates that all content strings, until the next <b>DVD_Struct_PartOfTitle</b>, belong to one chapter.
     * @type {Integer (Int32)}
     */
    static DVD_Struct_PartOfTitle => 4

    /**
     * Indicates that all content strings, until the next <b>DVD_Struct_Cell</b>, belong to one cell, which can be a scene from a chapter.
     * @type {Integer (Int32)}
     */
    static DVD_Struct_Cell => 5

    /**
     * Indicates that the following content strings refer to the audio stream.
     * @type {Integer (Int32)}
     */
    static DVD_Stream_Audio => 16

    /**
     * Indicates that the following content strings refer to the subpicture stream.
     * @type {Integer (Int32)}
     */
    static DVD_Stream_Subpicture => 17

    /**
     * Indicates that the following content strings refer to the angle.
     * @type {Integer (Int32)}
     */
    static DVD_Stream_Angle => 18

    /**
     * Indicates that the following content strings refer to the audio channel.
     * @type {Integer (Int32)}
     */
    static DVD_Channel_Audio => 32

    /**
     * Indicates the most important content string. Strings of this type contain the name of the volume, title, chapter, and so on, and can follow any structure identifiers.
     * @type {Integer (Int32)}
     */
    static DVD_General_Name => 48

    /**
     * Identifies a content string with additional information about the title, chapter, and so on, described by the <b>DVD_General_Name</b> string. The exact nature or structure of these comments is not defined.
     * @type {Integer (Int32)}
     */
    static DVD_General_Comments => 49

    /**
     * Identifies a content string containing the name of a series to which the title belongs.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Series => 56

    /**
     * Identifies a content string with the main movie title.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Movie => 57

    /**
     * Identifies a content string containing the name of the video title.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Video => 58

    /**
     * Identifies a content string containing the name of the album title.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Album => 59

    /**
     * Identifies a content string containing the name of the song title.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Song => 60

    /**
     * Identifies a content string containing the name of the title of some other genre.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Other => 63

    /**
     * Identifies a content string with the name of the series localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Sub_Series => 64

    /**
     * Identifies a content string with the movie title localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Sub_Movie => 65

    /**
     * Identifies a content string with the video title localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Sub_Video => 66

    /**
     * Identifies a content string with the album title localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Sub_Album => 67

    /**
     * Identifies a content string with the song title localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Sub_Song => 68

    /**
     * Identifies a content string with the title of some other genre localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Sub_Other => 71

    /**
     * Identifies a content string with the original name of the series.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Orig_Series => 72

    /**
     * Identifies a content string with the original name of the movie.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Orig_Movie => 73

    /**
     * Identifies a content string with the original name of the video.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Orig_Video => 74

    /**
     * Identifies a content string with the original name of the album.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Orig_Album => 75

    /**
     * Identifies a content string with the original name of the song.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Orig_Song => 76

    /**
     * Identifies a content string with the original name of the content.
     * @type {Integer (Int32)}
     */
    static DVD_Title_Orig_Other => 79

    /**
     * Identifies a content string pertaining to a particular scene in a movie or video.
     * @type {Integer (Int32)}
     */
    static DVD_Other_Scene => 80

    /**
     * Identifies a content string pertaining to a particular cut in a movie or video.
     * @type {Integer (Int32)}
     */
    static DVD_Other_Cut => 81

    /**
     * Identifies a content string pertaining to a particular take in a movie or video.
     * @type {Integer (Int32)}
     */
    static DVD_Other_Take => 82
}
