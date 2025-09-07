#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that indicate the reason that a docked accessibility app window has been undocked. Used by IAccessibilityDockingServiceCallback::Undocked.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-undock_reason
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class UNDOCK_REASON{

    /**
     * The accessibility window was undocked because the screen resolution has changed.
     * @type {Integer (Int32)}
     */
    static UR_RESOLUTION_CHANGE => 0

    /**
     * The monitor on which the accessibility window was docked has been disconnected.
     * @type {Integer (Int32)}
     */
    static UR_MONITOR_DISCONNECT => 1
}
