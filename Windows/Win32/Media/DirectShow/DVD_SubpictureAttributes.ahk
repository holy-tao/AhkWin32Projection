#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_SUBPICTURE_TYPE.ahk" { DVD_SUBPICTURE_TYPE }
#Import ".\DVD_SUBPICTURE_CODING.ahk" { DVD_SUBPICTURE_CODING }
#Import ".\DVD_SUBPICTURE_LANG_EXT.ahk" { DVD_SUBPICTURE_LANG_EXT }

/**
 * The DVD_SubpictureAttributes structure contains information about the DVD subpicture. The IDvdInfo2::GetSubpictureAttributes method fills in a DVD_SubpictureAttributes structure for a specified stream.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_subpictureattributes
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_SubpictureAttributes {
    #StructPack 4

    /**
     * Variable of type [DVD_SUBPICTURE_TYPE](/windows/desktop/api/strmif/ne-strmif-dvd_subpicture_type) that indicates whether the subpicture contains language-related content.
     */
    Type : DVD_SUBPICTURE_TYPE

    /**
     * Variable of type [DVD_SUBPICTURE_CODING](/windows/desktop/api/strmif/ne-strmif-dvd_subpicture_coding) that indicates how the subpicture graphics stream is encoded.
     */
    CodingMode : DVD_SUBPICTURE_CODING

    /**
     * Variable of type LCID that identifies the subpicture language if Type equals DVD_SPType_Language.
     */
    Language : UInt32

    /**
     * Variable of type [DVD_SUBPICTURE_LANG_EXT](/windows/desktop/api/strmif/ne-strmif-dvd_subpicture_lang_ext) that identifies the subpicture language extension if Type equals DVD_SPType_Language.
     */
    LanguageExtension : DVD_SUBPICTURE_LANG_EXT

}
