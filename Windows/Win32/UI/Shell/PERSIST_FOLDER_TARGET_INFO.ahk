#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a folder shortcut's target folder and its attributes. This structure is used by IPersistFolder3::GetFolderTargetInfo and IPersistFolder3::InitializeEx.
 * @remarks
 * 
  * Any or all of the <b>pidlTargetFolder</b>, <b>szTargetParsingName</b>, and <b>csidl</b> members can be used to specify the target folder's location.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-persist_folder_target_info
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PERSIST_FOLDER_TARGET_INFO extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    /**
     * Type: <b>PIDLIST_ABSOLUTE</b>
     * 
     * A fully qualified PIDL of the target folder. Set <b>pidlTargetFolder</b> to <b>NULL</b> if not specified.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidlTargetFolder {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string with the target folder's parsing name. Set <b>szTargetParsingName</b> to an empty string if not specified.
     * @type {String}
     */
    szTargetParsingName {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string that specifies the type of network provider that will be used when binding to the target folder. The format is the same as that used by the <a href="https://docs.microsoft.com/windows/desktop/WNet/windows-networking-wnet-">WNet API</a>. Set <b>szNetworkProvider</b> to an empty string if not specified.
     * @type {String}
     */
    szNetworkProvider {
        get => StrGet(this.ptr + 528, 259, "UTF-16")
        set => StrPut(value, this.ptr + 528, 259, "UTF-16")
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> value that contains FILE_ATTRIBUTE_* flags as defined in Winnt.h. Set <b>dwAttributes</b> to -1 if not specified.
     * @type {Integer}
     */
    dwAttributes {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * Type: <b>int</b>
     * 
     * The target folder's <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value, if it has one. Set <b>csidl</b> to -1 if the target folder does not have a CSIDL. In addition to the CSIDL value, you can also set the following two flags.
     * @type {Integer}
     */
    csidl {
        get => NumGet(this, 1052, "int")
        set => NumPut("int", value, this, 1052)
    }
}
