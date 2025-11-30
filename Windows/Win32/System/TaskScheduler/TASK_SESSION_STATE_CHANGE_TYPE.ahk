#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines what kind of Terminal Server session state change you can use to trigger a task to start.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/ne-taskschd-task_session_state_change_type
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_SESSION_STATE_CHANGE_TYPE extends Win32Enum{

    /**
     * Terminal Server console connection state change. For example, when you connect to a user session on the local computer by switching users on the computer.
     * @type {Integer (Int32)}
     */
    static TASK_CONSOLE_CONNECT => 1

    /**
     * Terminal Server console disconnection state change. For example, when you disconnect to a user session on the local computer by switching users on the computer.
     * @type {Integer (Int32)}
     */
    static TASK_CONSOLE_DISCONNECT => 2

    /**
     * Terminal Server remote connection state change. For example, when a user connects to a user session by using the Remote Desktop Connection program from a remote computer.
     * @type {Integer (Int32)}
     */
    static TASK_REMOTE_CONNECT => 3

    /**
     * Terminal Server remote disconnection state change. For example, when a user disconnects from a user session while using the Remote Desktop Connection program from a remote computer.
     * @type {Integer (Int32)}
     */
    static TASK_REMOTE_DISCONNECT => 4

    /**
     * Terminal Server session locked state change. For example, this state change causes the task to run when the computer is locked.
     * @type {Integer (Int32)}
     */
    static TASK_SESSION_LOCK => 7

    /**
     * Terminal Server session unlocked state change. For example, this state change causes the task to run when the computer is unlocked.
     * @type {Integer (Int32)}
     */
    static TASK_SESSION_UNLOCK => 8
}
