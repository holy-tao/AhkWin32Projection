#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about change notification. It is used by IShellMenuCallback::CallbackSM.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-smcshchangenotifystruct
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SMCSHCHANGENOTIFYSTRUCT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>long</b>
     * 
     * An SHCNE value that specifies the type of change that took place. See <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shchangenotify">SHChangeNotify</a> for a complete list of these values.
     * @type {Integer}
     */
    lEvent {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * PIDL provided by the change notification. The target of this PIDL varies depending on the value of <b>lEvent</b>.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A second PIDL provided by the change notification. Not all <b>lEvent</b> values make use of this parameter, in which case its value is <b>NULL</b>.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
