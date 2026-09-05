#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines how the Task Scheduler service creates, updates, or disables the task.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_creation
 * @namespace Windows.Win32.System.TaskScheduler
 */
class TASK_CREATION extends Win32Enum {

    /**
     * The Task Scheduler service checks the syntax of the XML that describes the task but does not register the task. This constant cannot be combined with the <b>TASK_CREATE</b>, <b>TASK_UPDATE</b>, or  <b>TASK_CREATE_OR_UPDATE</b> values.
     * Native name: TASK_VALIDATE_ONLY
     * @type {Integer (Int32)}
     */
    static VALIDATE_ONLY => 1

    /**
     * The Task Scheduler service registers the task as a new task.
     * Native name: TASK_CREATE
     * @type {Integer (Int32)}
     */
    static CREATE => 2

    /**
     * The Task Scheduler service registers the task as an updated version of an existing task. When a task with a registration trigger is updated, the task will execute after the update occurs.
     * Native name: TASK_UPDATE
     * @type {Integer (Int32)}
     */
    static UPDATE => 4

    /**
     * The Task Scheduler service either registers the task as a new task or as an updated version if the task already exists. Equivalent to TASK_CREATE \| TASK_UPDATE.
     * Native name: TASK_CREATE_OR_UPDATE
     * @type {Integer (Int32)}
     */
    static CREATE_OR_UPDATE => 6

    /**
     * The Task Scheduler service registers the disabled task. A disabled task cannot run until it is enabled. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_enabled">Enabled Property of ITaskSettings</a> and <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iregisteredtask-get_enabled">Enabled Property of IRegisteredTask</a>.
     * Native name: TASK_DISABLE
     * @type {Integer (Int32)}
     */
    static DISABLE => 8

    /**
     * The Task Scheduler service is prevented from adding the allow access-control entry (ACE) for the context principal. When the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertaskdefinition">ITaskFolder::RegisterTaskDefinition</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertask">ITaskFolder::RegisterTask</a> functions are called with this flag to update a task, the Task Scheduler service does not add the ACE for the new context principal and does not remove the ACE from the old context principal.
     * Native name: TASK_DONT_ADD_PRINCIPAL_ACE
     * @type {Integer (Int32)}
     */
    static DONT_ADD_PRINCIPAL_ACE => 16

    /**
     * The Task Scheduler service creates the task, but ignores the registration triggers in the task. By ignoring the registration triggers, the task will not execute when it is registered unless a time-based trigger causes it to execute on registration.
     * Native name: TASK_IGNORE_REGISTRATION_TRIGGERS
     * @type {Integer (Int32)}
     */
    static IGNORE_REGISTRATION_TRIGGERS => 32
}
