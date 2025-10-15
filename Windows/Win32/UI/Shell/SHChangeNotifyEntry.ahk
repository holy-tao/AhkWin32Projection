#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains and receives information for change notifications. This structure is used with the SHChangeNotifyRegister function and the SFVM_QUERYFSNOTIFY notification.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-shchangenotifyentry
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHChangeNotifyEntry extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * @type {BOOL}
     */
    fRecursive{
        get {
            if(!this.HasProp("__fRecursive"))
                this.__fRecursive := BOOL(this.ptr + 8)
            return this.__fRecursive
        }
    }
}
