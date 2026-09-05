#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The action to send to the remote session.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/ne-rdpappcontainerclient-remoteactiontype
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class RemoteActionType extends Win32Enum {

    /**
     * Displays the charms in the remote session.
     * Native name: RemoteActionCharms
     * @type {Integer (Int32)}
     */
    static Charms => 0

    /**
     * Displays the app bar in the remote session.
     * Native name: RemoteActionAppbar
     * @type {Integer (Int32)}
     */
    static Appbar => 1

    /**
     * Docks the application in the remote session.
     * Native name: RemoteActionSnap
     * @type {Integer (Int32)}
     */
    static Snap => 2

    /**
     * Causes the start screen to be displayed in the remote session.
     * Native name: RemoteActionStartScreen
     * @type {Integer (Int32)}
     */
    static StartScreen => 3

    /**
     * Causes the application switch window to be displayed in the remote session. This is the same as the user pressing Alt+Tab.
     * Native name: RemoteActionAppSwitch
     * @type {Integer (Int32)}
     */
    static AppSwitch => 4
}
