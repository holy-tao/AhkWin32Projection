#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Specifies a folder shortcut's target folder and its attributes. This structure is used by IPersistFolder3::GetFolderTargetInfo and IPersistFolder3::InitializeEx.
 * @remarks
 * Any or all of the <b>pidlTargetFolder</b>, <b>szTargetParsingName</b>, and <b>csidl</b> members can be used to specify the target folder's location.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PERSIST_FOLDER_TARGET_INFO {
    #StructPack 8

    /**
     * Type: <b>PIDLIST_ABSOLUTE</b>
     * 
     * A fully qualified PIDL of the target folder. Set <b>pidlTargetFolder</b> to <b>NULL</b> if not specified.
     */
    pidlTargetFolder : ITEMIDLIST.Ptr

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string with the target folder's parsing name. Set <b>szTargetParsingName</b> to an empty string if not specified.
     */
    szTargetParsingName : WCHAR[260]

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string that specifies the type of network provider that will be used when binding to the target folder. The format is the same as that used by the <a href="https://docs.microsoft.com/windows/desktop/WNet/windows-networking-wnet-">WNet API</a>. Set <b>szNetworkProvider</b> to an empty string if not specified.
     */
    szNetworkProvider : WCHAR[260]

    /**
     * Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> value that contains FILE_ATTRIBUTE_* flags as defined in Winnt.h. Set <b>dwAttributes</b> to -1 if not specified.
     */
    dwAttributes : UInt32

    /**
     * Type: <b>int</b>
     * 
     * The target folder's <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> value, if it has one. Set <b>csidl</b> to -1 if the target folder does not have a CSIDL. In addition to the CSIDL value, you can also set the following two flags.
     */
    csidl : Int32

}
