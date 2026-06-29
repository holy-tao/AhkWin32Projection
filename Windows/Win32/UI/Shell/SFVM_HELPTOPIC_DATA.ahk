#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains the name of an HTML Help file and a topic in that file. Used with the SFVM_GETHELPTOPIC notification. This structure requires Unicode strings.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-sfvm_helptopic_data
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SFVM_HELPTOPIC_DATA {
    #StructPack 2

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string containing the fully qualified path to the help file.
     */
    wszHelpFile : WCHAR[260]

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string containing the name of the topic.
     */
    wszHelpTopic : WCHAR[260]

}
