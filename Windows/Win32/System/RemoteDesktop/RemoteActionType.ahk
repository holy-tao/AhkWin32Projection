#Requires AutoHotkey v2.0.0 64-bit

/**
 * The action to send to the remote session.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/ne-rdpappcontainerclient-remoteactiontype
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class RemoteActionType{

    /**
     * Displays the charms in the remote session.
     * @type {Integer (Int32)}
     */
    static RemoteActionCharms => 0

    /**
     * Displays the app bar in the remote session.
     * @type {Integer (Int32)}
     */
    static RemoteActionAppbar => 1

    /**
     * Docks the application in the remote session.
     * @type {Integer (Int32)}
     */
    static RemoteActionSnap => 2

    /**
     * Causes the start screen to be displayed in the remote session.
     * @type {Integer (Int32)}
     */
    static RemoteActionStartScreen => 3

    /**
     * Causes the application switch window to be displayed in the remote session. This is the same as the user pressing Alt+Tab.
     * @type {Integer (Int32)}
     */
    static RemoteActionAppSwitch => 4
}
