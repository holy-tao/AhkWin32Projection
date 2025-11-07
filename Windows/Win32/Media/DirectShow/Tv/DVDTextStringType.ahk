#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DVDTextStringType enumeration type indicates the type of information contained in a DVD text string.
 * @remarks
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_textstringtype">DVD_TextStringType</a> value is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/segment/ne-segment-dvdtextstringtype">DVDTextStringType</a> method to identify how the disc authors have categorized the specified text string. 
 * 
 * Not every DVD text string identifier is included in this enumeration, so an authored DVD might include other values.
 * 
 * One important text string type not defined in this enumeration is 0xF0, the extension-sorting text string type. You can use this type of string in many ways to enable players to sort the string data. It can be a unique number or a repetition of a previous string with the word order changed. For example, a string of type 0x30 that has the name "The Greatest Hits" might be followed by a string of type 0xF0 that says "Greatest Hits, The." As with content strings, the use of the sorting string is not strictly defined.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/ne-segment-dvdtextstringtype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DVDTextStringType{

    /**
     * Indicates the top level of the logical hierarchy. Refers to the entire contents of a one-sided disc or one side of a two-sided disc.
     * @type {Integer (Int32)}
     */
    static dvdStruct_Volume => 1

    /**
     * Indicates that all content strings, until the next dvd_Struct_Title, belong to one title.
     * @type {Integer (Int32)}
     */
    static dvdStruct_Title => 2

    /**
     * Indicates the parental ID of the following strings.
     * @type {Integer (Int32)}
     */
    static dvdStruct_ParentalID => 3

    /**
     * Indicates that all content strings, until the next dvd_Struct_PartOfTitle, belong to one chapter.
     * @type {Integer (Int32)}
     */
    static dvdStruct_PartOfTitle => 4

    /**
     * Indicates that all content strings, until the next dvd_Struct_Cell, belong to one cell, which can be a scene from a chapter.
     * @type {Integer (Int32)}
     */
    static dvdStruct_Cell => 5

    /**
     * Indicates that the following content strings refer to the audio stream.
     * @type {Integer (Int32)}
     */
    static dvdStream_Audio => 16

    /**
     * Indicates that the following content strings refer to the subpicture stream.
     * @type {Integer (Int32)}
     */
    static dvdStream_Subpicture => 17

    /**
     * Indicates that the following content strings refer to the angle.
     * @type {Integer (Int32)}
     */
    static dvdStream_Angle => 18

    /**
     * Indicates that the following content strings refer to the audio channel.
     * @type {Integer (Int32)}
     */
    static dvdChannel_Audio => 32

    /**
     * Indicates the most important content string. Strings of this type contain the name of the volume, title, chapter, and so on, and can follow any structure identifiers.
     * @type {Integer (Int32)}
     */
    static dvdGeneral_Name => 48

    /**
     * Identifies a content string with additional information about the title, chapter, and so on, described by the dvd_General_Name string. The exact nature or structure of these comments is not defined.
     * @type {Integer (Int32)}
     */
    static dvdGeneral_Comments => 49

    /**
     * Identifies a content string containing the name of a series to which the title belongs.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Series => 56

    /**
     * Identifies a content string with the main movie title.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Movie => 57

    /**
     * Identifies a content string containing the name of the video title.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Video => 58

    /**
     * Identifies a content string containing the name of the album title.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Album => 59

    /**
     * Identifies a content string containing the name of the song title.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Song => 60

    /**
     * Identifies a content string containing the name of the title of some other genre.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Other => 63

    /**
     * Identifies a content string with the name of the series localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Sub_Series => 64

    /**
     * Identifies a content string with the movie title localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Sub_Movie => 65

    /**
     * Identifies a content string with the video title localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Sub_Video => 66

    /**
     * Identifies a content string with the album title localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Sub_Album => 67

    /**
     * Identifies a content string with the song title localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Sub_Song => 68

    /**
     * Identifies a content string with the title of some other genre localized to a particular country/region.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Sub_Other => 71

    /**
     * Identifies a content string with the original name of the series.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Orig_Series => 72

    /**
     * Identifies a content string with the original name of the movie.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Orig_Movie => 73

    /**
     * Identifies a content string with the original name of the video.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Orig_Video => 74

    /**
     * Identifies a content string with the original name of the album.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Orig_Album => 75

    /**
     * Identifies a content string with the original name of the song.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Orig_Song => 76

    /**
     * Identifies a content string with the original name of the content.
     * @type {Integer (Int32)}
     */
    static dvdTitle_Orig_Other => 79

    /**
     * Identifies a content string pertaining to a particular scene in a movie or video.
     * @type {Integer (Int32)}
     */
    static dvdOther_Scene => 80

    /**
     * Identifies a content string pertaining to a particular cut in a movie or video.
     * @type {Integer (Int32)}
     */
    static dvdOther_Cut => 81

    /**
     * Identifies a content string pertaining to a particular take in a movie or video.
     * @type {Integer (Int32)}
     */
    static dvdOther_Take => 82
}
