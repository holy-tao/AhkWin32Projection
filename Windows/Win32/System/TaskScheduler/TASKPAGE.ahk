#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of task page to be retrieved.
 * @see https://docs.microsoft.com/windows/win32/api//mstask/ne-mstask-taskpage
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASKPAGE{

    /**
     * Specifies the Task page for the task. This page provides the following UI elements: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-run">Run</a>: This field specifies the name of the application associated with the task.</li>
     * <li>This property can also be set programmatically by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itask-setapplicationname">ITask::SetApplicationName</a>.</li>
     * <li><b>Start in</b>: This field specifies the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/w">working directory</a> for the task.</li>
     * <li>This property can also be set programmatically by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itask-setworkingdirectory">ITask::SetWorkingDirectory</a>.</li>
     * <li><b>Comments</b>: This field specifies any application-defined comments for the task.</li>
     * <li>This property can also be set programmatically by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-setcomment">IScheduledWorkItem::SetComment</a>.</li>
     * <li><b>Run as</b>: (Windows Server 2003, Windows XP, and  Windows 2000 only.) This field specifies the account name under which the task will run. To the right of this field is a <b>Password</b> button for specifying the password for the account.</li>
     * <li>This property can also be set programmatically by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-setaccountinformation">IScheduledWorkItem::SetAccountInformation</a>.</li>
     * <li><b>Enabled</b> (scheduled task runs at specific time): This checkbox specifies whether the TASK_TRIGGER_FLAG_DISABLED flag is set.</li>
     * <li>This property can also be set by setting this flag in the <b>rgFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static TASKPAGE_TASK => 0

    /**
     * Specifies the Schedule page for the task. This page is used to manage the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/t">triggers</a> for the task. The user can create triggers, edit triggers, and delete triggers from this page. 
     * 
     * 
     * 
     * 
     * This page provides the following UI elements:
     * 
     * <ul>
     * <li><b>Trigger</b> list box: This list box is displayed only if multiple triggers exist.</li>
     * <li><b>Schedule Task</b>: This field specifies how often the task will run: daily, weekly, monthly, once, at system startup, at logon, or when idle.</li>
     * <li><b>Start Time</b>: This field specifies the time of day the task will run.</li>
     * <li><b>Advanced</b>: This button allows you to set the start date and end date for running the task.</li>
     * <li><b>Schedule Task</b> group box: This group box is only displayed if the <b>Schedule Task</b> field specifies daily, weekly, monthly, or once.</li>
     * <li><b>Show multiple schedules</b>: Shows all triggers. When checked, Trigger list box is displayed.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static TASKPAGE_SCHEDULE => 1

    /**
     * Specifies the Settings page for the task. The user can specify what happens when the task is completed, <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/i">idle conditions</a>, and power management properties for the task. 
     * 
     * 
     * 
     * 
     * This page provides the following UI elements:
     * 
     * <ul>
     * <li><b>Scheduled Task Completed</b> group box: This group box includes check boxes for setting the TASK_FLAG_DELETE_WHEN_DONE flag and the maximum run time for the task.</li>
     * <li>The TASK_FLAG_DELETE_WHEN_DONE flag can also be set programmatically by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-setflags">IScheduledWorkItem::SetFlags</a>. The maximum run time can be set by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itask-setmaxruntime">ITask::SetMaxRunTime</a>.</li>
     * <li><b>Idle Time</b> group box: This group box includes fields for setting idle conditions.</li>
     * <li>The idle time can also be set programmatically by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-setidlewait">IScheduledWorkItem::SetIdleWait</a>. The TASK_FLAG_START_ONLY_IF_IDLE and TASK_FLAG_KILL_ON_IDLE_END flags can be set by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-setflags">IScheduledWorkItem::SetFlags</a>.</li>
     * <li><b>Power management</b> group box: (Windows 95 only) This group box includes check boxes for indicating how the task behaves when the system is losing power.</li>
     * <li>These properties can also be set programmatically by setting the TASK_FLAG_DONT_START_IF_ON_BATTERIES and TASK_FLAG_KILL_IF_GOING_ON_BATTERIES flags using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-setflags">IScheduledWorkItem::SetFlags</a>.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static TASKPAGE_SETTINGS => 2
}
