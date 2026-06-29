#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of assignment for a personal desktop resolution.
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/ne-tspubplugin2com-tspub_plugin_pd_assignment_type
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A new personal desktop was created for the user.
     * @type {Integer (Int32)}
     */
    static TSPUB_PLUGIN_PD_ASSIGNMENT_NEW => 0

    /**
     * An existing personal desktop was used for the user.
     * @type {Integer (Int32)}
     */
    static TSPUB_PLUGIN_PD_ASSIGNMENT_EXISTING => 1
}
