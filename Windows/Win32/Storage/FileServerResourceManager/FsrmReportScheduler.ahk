#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates a scheduled task that is used to trigger a report job.
 * @remarks
 * To run a report job on a schedule, the value of the <i>taskName</i> parameter and the value 
 *     of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_task">IFsrmReportJob::Task</a> property must be the 
 *     same.
 * 
 * Specify the same namespaces for this method that you specified for the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportjob-get_namespaceroots">IFsrmReportJob::NamespaceRoots</a> property. 
 *     This method validates the namespace paths. For validation details, see the Remarks section of 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-verifynamespaces">VerifyNamespaces</a>.
 * 
 * To generate the XML, you can use the Task Scheduler v2.0 interfaces to define the scheduled task; however, the 
 *     task definition must be v1.0 compatible. (Use the Task Scheduler API to define the task but not to register the 
 *     task—this method registers the task.) After defining the task, access the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskdefinition-get_xmltext">ITaskDefinition::XmlText</a> property to get 
 *     the XML.
 * 
 * Note that FSRM ignores triggers in the XML that FSRM does not support.  For the "MONTHLYDOW" 
 *     trigger, you cannot use the V2 extensions. For example,  if you specify "WeeksOfMonth", you can 
 *     specify only one week of the month and it cannot be the fifth week. Also, for "DaysOfWeek", you 
 *     can specify only one day.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmreports/nf-fsrmreports-ifsrmreportscheduler-createscheduletask
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmReportScheduler extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
