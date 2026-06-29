#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MediaLabelInfo structure conveys information to the RSM database about a tape OMID. The media label library fills in this structure for all media labels the library recognizes.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsmli/ns-ntmsmli-medialabelinfo
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct MediaLabelInfo {
    #StructPack 4

    /**
     * Unicode string that identifies the source of the media label. Often this is the name of the backup application or Windows command that wrote the label,
     * for example, "Microsoft Windows Wbadmin".
     */
    LabelType : WCHAR[64]

    /**
     * Number of bytes that are used in the <b>LabelID</b> member.
     */
    LabelIDSize : UInt32

    /**
     * Unique identifier for the media label.
     */
    LabelID : Int8[256]

    /**
     * Unicode string that describes the media. For example, the description for a backup media label would be similar to "Tape created on 04/14/97".
     */
    LabelAppDescr : WCHAR[256]

}
