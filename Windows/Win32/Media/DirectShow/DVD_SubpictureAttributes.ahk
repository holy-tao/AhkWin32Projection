#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_SubpictureAttributes structure contains information about the DVD subpicture. The IDvdInfo2::GetSubpictureAttributes method fills in a DVD_SubpictureAttributes structure for a specified stream.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_subpictureattributes
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_SubpictureAttributes extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Variable of type [DVD_SUBPICTURE_TYPE](/windows/desktop/api/strmif/ne-strmif-dvd_subpicture_type) that indicates whether the subpicture contains language-related content.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Variable of type [DVD_SUBPICTURE_CODING](/windows/desktop/api/strmif/ne-strmif-dvd_subpicture_coding) that indicates how the subpicture graphics stream is encoded.
     * @type {Integer}
     */
    CodingMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Variable of type LCID that identifies the subpicture language if Type equals DVD_SPType_Language.
     * @type {Integer}
     */
    Language {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Variable of type [DVD_SUBPICTURE_LANG_EXT](/windows/desktop/api/strmif/ne-strmif-dvd_subpicture_lang_ext) that identifies the subpicture language extension if Type equals DVD_SPType_Language.
     * @type {Integer}
     */
    LanguageExtension {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
