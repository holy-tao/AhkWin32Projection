#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the name of an HTML Help file and a topic in that file. Used with the SFVM_GETHELPTOPIC notification. This structure requires Unicode strings.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-sfvm_helptopic_data
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SFVM_HELPTOPIC_DATA extends Win32Struct
{
    static sizeof => 1040

    static packingSize => 2

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string containing the fully qualified path to the help file.
     * @type {String}
     */
    wszHelpFile {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string containing the name of the topic.
     * @type {String}
     */
    wszHelpTopic {
        get => StrGet(this.ptr + 520, 259, "UTF-16")
        set => StrPut(value, this.ptr + 520, 259, "UTF-16")
    }
}
