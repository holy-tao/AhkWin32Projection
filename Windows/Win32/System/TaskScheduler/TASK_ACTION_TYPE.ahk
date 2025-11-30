#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of actions that a task can perform.
 * @remarks
 * 
 * The action type is defined when the action is created and cannot be changed later. For C++ development, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iactioncollection-create">IActionCollection::Create</a>. For scripting development, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/actioncollection-create">ActionCollection.Create</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/ne-taskschd-task_action_type
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_ACTION_TYPE extends Win32Enum{

    /**
     * This action performs a command-line operation. For example, the action can run a script, launch an executable, or, if the name of a document is provided, find its associated application and launch the application with the document.
     * @type {Integer (Int32)}
     */
    static TASK_ACTION_EXEC => 0

    /**
     * This action fires a handler. This action can only be used if the task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_compatibility">Compatibility</a> property is set to TASK_COMPATIBILITY_V2.
     * @type {Integer (Int32)}
     */
    static TASK_ACTION_COM_HANDLER => 5

    /**
     * This action sends email message. This action can only be used if the task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_compatibility">Compatibility</a> property is set to TASK_COMPATIBILITY_V2.
     * @type {Integer (Int32)}
     */
    static TASK_ACTION_SEND_EMAIL => 6

    /**
     * This action shows a message box. This action can only be used if the task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_compatibility">Compatibility</a> property is set to TASK_COMPATIBILITY_V2.
     * @type {Integer (Int32)}
     */
    static TASK_ACTION_SHOW_MESSAGE => 7
}
