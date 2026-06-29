#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }

/**
 * Contains information about change notification. It is used by IShellMenuCallback::CallbackSM.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-smcshchangenotifystruct
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SMCSHCHANGENOTIFYSTRUCT {
    #StructPack 8

    /**
     * Type: <b>long</b>
     * 
     * An SHCNE value that specifies the type of change that took place. See <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shchangenotify">SHChangeNotify</a> for a complete list of these values.
     */
    lEvent : Int32

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * PIDL provided by the change notification. The target of this PIDL varies depending on the value of <b>lEvent</b>.
     */
    pidl1 : ITEMIDLIST.Ptr

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A second PIDL provided by the change notification. Not all <b>lEvent</b> values make use of this parameter, in which case its value is <b>NULL</b>.
     */
    pidl2 : ITEMIDLIST.Ptr

}
