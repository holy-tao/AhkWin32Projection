#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains and receives information for change notifications. This structure is used with the SHChangeNotifyRegister function and the SFVM_QUERYFSNOTIFY notification.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shchangenotifyentry
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHChangeNotifyEntry extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * PIDL for which to receive notifications.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A flag indicating whether to post notifications for children of this PIDL. For example, if the PIDL points to a folder, then file notifications would come from the folder's children if this flag was <b>TRUE</b>.
     * @type {Integer}
     */
    fRecursive {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
