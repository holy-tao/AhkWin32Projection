#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of assignment for a personal desktop resolution.
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/ne-tspubplugin2com-tspub_plugin_pd_assignment_type
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TSPUB_PLUGIN_PD_ASSIGNMENT_TYPE extends Win32Enum{

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
