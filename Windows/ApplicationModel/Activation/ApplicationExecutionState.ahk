#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the execution state of the app.
 * @remarks
 * This table provides more detail about when you'll see each of these states and what your app should do in response.
 * 
 * | State | When this state is seen | What your app should do |
 * | --- | --- | --- |
 * | `NotRunning` | The user first activates the app after: 1) installing the app from the Store; 2) clicking **End task** in Task Manager while the app is running; 3) rebooting the computer; 4) logging off and back on.<br/>The user closes the app through the close gesture or Alt+F4 and activates it within about 10 seconds of closing it. | Display its initial UI and perform initialization tasks. |
 * | `Running` | The app is activated through a secondary tile or one of the [activation contracts and extensions](/previous-versions/windows/apps/hh464906(v=win.10)) while it is running. | Respond to the activation event as appropriate. |
 * | `Suspended` | The app is activated through a secondary tile or one of the [activation contracts and extensions](/previous-versions/windows/apps/hh464906(v=win.10)) while Windows is suspending it or after Windows has suspended it. | Respond to the activation event as appropriate. |
 * | `Terminated` | Windows successfully suspends the app and then it is terminated. For example, Windows can terminate a suspended app if the system is running low on resources. Some apps, such as games, can be pretty resource intensive. | Restore itself to the way the user left it, rather than starting fresh. Use data saved during app suspension. Refresh content or network connections that may have become stale. |
 * | `ClosedByUser` | The user closes the app through the close gesture or Alt+F4 and takes longer than 10 seconds to activate the app again. | Restore itself to the way the user left it, rather than starting fresh. Use data saved during app suspension. Refresh content or network connections that may have become stale. |
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.applicationexecutionstate
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ApplicationExecutionState extends Win32Enum{

    /**
     * The app is not running.
     * @type {Integer (Int32)}
     */
    static NotRunning => 0

    /**
     * The app is running.
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * The app is suspended.
     * @type {Integer (Int32)}
     */
    static Suspended => 2

    /**
     * The app was terminated after being suspended.
     * @type {Integer (Int32)}
     */
    static Terminated => 3

    /**
     * The app was closed by the user.
     * @type {Integer (Int32)}
     */
    static ClosedByUser => 4
}
