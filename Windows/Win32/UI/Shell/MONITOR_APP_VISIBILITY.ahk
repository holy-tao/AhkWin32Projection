#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a display is showing desktop windows instead of Windows Store apps.
 * @remarks
 * 
 * The <b>MONITOR_APP_VISIBILITY</b> enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iappvisibility-getappvisibilityonmonitor">GetAppVisibilityOnMonitor</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-monitor_app_visibility
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class MONITOR_APP_VISIBILITY extends Win32Enum{

    /**
     * The display state is not known.
     * @type {Integer (Int32)}
     */
    static MAV_UNKNOWN => 0

    /**
     * The display is showing desktop windows.
     * @type {Integer (Int32)}
     */
    static MAV_NO_APP_VISIBLE => 1

    /**
     * The display is not showing desktop windows.
     * @type {Integer (Int32)}
     */
    static MAV_APP_VISIBLE => 2
}
