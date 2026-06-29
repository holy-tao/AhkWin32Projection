#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains and receives information for change notifications. This structure is used with the SHChangeNotifyRegister function and the SFVM_QUERYFSNOTIFY notification.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shchangenotifyentry
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHChangeNotifyEntry {
    #StructPack 8

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * PIDL for which to receive notifications.
     */
    pidl : ITEMIDLIST.Ptr

    /**
     * Type: <b>BOOL</b>
     * 
     * A flag indicating whether to post notifications for children of this PIDL. For example, if the PIDL points to a folder, then file notifications would come from the folder's children if this flag was <b>TRUE</b>.
     */
    fRecursive : BOOL

}
