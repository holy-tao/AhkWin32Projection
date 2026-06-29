#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether a display is showing desktop windows instead of Windows Store apps.
 * @remarks
 * The <b>MONITOR_APP_VISIBILITY</b> enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iappvisibility-getappvisibilityonmonitor">GetAppVisibilityOnMonitor</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-monitor_app_visibility
 * @namespace Windows.Win32.UI.Shell
 */
export default struct MONITOR_APP_VISIBILITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
