#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The result of the request to trigger a background task. The [RequestAsync](applicationtrigger_requestasync_1234533424.md) method returns a value of this enumeration type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.applicationtriggerresult
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ApplicationTriggerResult extends Win32Enum{

    /**
     * The trigger has been set. The task will run, unless an exception is thrown in the background infrastructure.
     * @type {Integer (Int32)}
     */
    static Allowed => 0

    /**
     * The system denied triggering the background task because it is currently running.
     * @type {Integer (Int32)}
     */
    static CurrentlyRunning => 1

    /**
     * A system policy doesn't allow this background task to be triggered.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 2

    /**
     * The background task cannot be triggered because of an unknown issue.
     * @type {Integer (Int32)}
     */
    static UnknownError => 3
}
