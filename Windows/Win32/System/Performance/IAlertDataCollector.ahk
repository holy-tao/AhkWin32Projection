#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IDataCollector.ahk" { IDataCollector }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Monitors performance counters and performs actions each time a counter value crosses the specified threshold.To create the alert data collector, call the IDataCollectorCollection::CreateDataCollector or IDataCollectorCollection::CreateDataCollectorFromXml method. For details on the XML that you pass to CreateDataCollectorFromXml, see Remarks.
 * @remarks
 * The following example shows the XML that you can use to initialize this object if you call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml">CreateDataCollectorFromXml</a> to create it. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_xml">IDataCollector::Xml</a> property also returns this XML.
 * 
 * 
 * ```xml
 * <AlertDataCollector>
 *     <Alert/>              <!-- Specify an <Alert> element for each alert -->
 *     <AlertDisplayName/>   <!-- Read-only. Contains the contents of -->
 *                           <!-- <Alert/> in the user's locale -->
 *     <EventLog/>           <!-- nonzero (true), 0 (false) -->
 *     <SampleInterval/>
 *     <Task/>
 *     <TaskArguments/>
 *     <TaskRunAsSelf/>
 *     <TaskUserTextArguments/>
 *     <tr>
 * </AlertDataCollector>
 * ```
 * 
 * 
 * Note that the example does not show the property elements inherited from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> that you also need to specify.
 * 
 * When you specify the XML to create the collector, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the collector, the XML provides all elements, including those from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ialertdatacollector
 * @namespace Windows.Win32.System.Performance
 */
export default struct IAlertDataCollector extends IDataCollector {
    /**
     * The interface identifier for IAlertDataCollector
     * @type {Guid}
     */
    static IID := Guid("{03837516-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAlertDataCollector interfaces
    */
    struct Vtbl extends IDataCollector.Vtbl {
        get_AlertThresholds         : IntPtr
        put_AlertThresholds         : IntPtr
        get_EventLog                : IntPtr
        put_EventLog                : IntPtr
        get_SampleInterval          : IntPtr
        put_SampleInterval          : IntPtr
        get_Task                    : IntPtr
        put_Task                    : IntPtr
        get_TaskRunAsSelf           : IntPtr
        put_TaskRunAsSelf           : IntPtr
        get_TaskArguments           : IntPtr
        put_TaskArguments           : IntPtr
        get_TaskUserTextArguments   : IntPtr
        put_TaskUserTextArguments   : IntPtr
        get_TriggerDataCollectorSet : IntPtr
        put_TriggerDataCollectorSet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAlertDataCollector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    AlertThresholds {
        get => this.get_AlertThresholds()
        set => this.put_AlertThresholds(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EventLog {
        get => this.get_EventLog()
        set => this.put_EventLog(value)
    }

    /**
     * @type {Integer} 
     */
    SampleInterval {
        get => this.get_SampleInterval()
        set => this.put_SampleInterval(value)
    }

    /**
     * @type {BSTR} 
     */
    Task {
        get => this.get_Task()
        set => this.put_Task(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    TaskRunAsSelf {
        get => this.get_TaskRunAsSelf()
        set => this.put_TaskRunAsSelf(value)
    }

    /**
     * @type {BSTR} 
     */
    TaskArguments {
        get => this.get_TaskArguments()
        set => this.put_TaskArguments(value)
    }

    /**
     * @type {BSTR} 
     */
    TaskUserTextArguments {
        get => this.get_TaskUserTextArguments()
        set => this.put_TaskUserTextArguments(value)
    }

    /**
     * @type {BSTR} 
     */
    TriggerDataCollectorSet {
        get => this.get_TriggerDataCollectorSet()
        set => this.put_TriggerDataCollectorSet(value)
    }

    /**
     * Retrieves or sets a list of performance counters and thresholds to monitor. (Get)
     * @remarks
     * You must specify at least one alert threshold. If the counter value crosses the specified threshold value, PLA performs one or more of the following actions:
     * 
     * <ul>
     * <li>Logs event 2031 to the  Microsoft-Windows-Diagnosis-PLA/Operational event log if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_eventlog">IAlertDataCollector::EventLog</a>  property is true.</li>
     * <li>Starts the task in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_task">IAlertDataCollector::Task</a>  property, if specified.</li>
     * <li>Triggers the data collector set specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_triggerdatacollectorset">IAlertDataCollector::TriggerDataCollectorSet</a>  property to run, if specified.</li>
     * </ul>
     * If you use XML to define the alert, you must use "&amp;gt;" for the greater than sign (&gt;) and "&amp;lt;" for the less than sign (&lt;).
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_alertthresholds
     */
    get_AlertThresholds() {
        result := ComCall(32, this, "ptr*", &alerts := 0, "HRESULT")
        return alerts
    }

    /**
     * Retrieves or sets a list of performance counters and thresholds to monitor. (Put)
     * @remarks
     * You must specify at least one alert threshold. If the counter value crosses the specified threshold value, PLA performs one or more of the following actions:
     * 
     * <ul>
     * <li>Logs event 2031 to the  Microsoft-Windows-Diagnosis-PLA/Operational event log if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_eventlog">IAlertDataCollector::EventLog</a>  property is true.</li>
     * <li>Starts the task in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_task">IAlertDataCollector::Task</a>  property, if specified.</li>
     * <li>Triggers the data collector set specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_triggerdatacollectorset">IAlertDataCollector::TriggerDataCollectorSet</a>  property to run, if specified.</li>
     * </ul>
     * If you use XML to define the alert, you must use "&amp;gt;" for the greater than sign (&gt;) and "&amp;lt;" for the less than sign (&lt;).
     * @param {Pointer<SAFEARRAY>} alerts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_alertthresholds
     */
    put_AlertThresholds(alerts) {
        result := ComCall(33, this, SAFEARRAY.Ptr, alerts, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates if PLA should log an event each time the counter value crosses the threshold. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_eventlog
     */
    get_EventLog() {
        result := ComCall(34, this, VARIANT_BOOL.Ptr, &log := 0, "HRESULT")
        return log
    }

    /**
     * Retrieves or sets a value that indicates if PLA should log an event each time the counter value crosses the threshold. (Put)
     * @param {VARIANT_BOOL} log 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_eventlog
     */
    put_EventLog(log) {
        result := ComCall(35, this, VARIANT_BOOL, log, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the time interval to wait between sampling counter data. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_sampleinterval
     */
    get_SampleInterval() {
        result := ComCall(36, this, "uint*", &_interval := 0, "HRESULT")
        return _interval
    }

    /**
     * Retrieves or sets the time interval to wait between sampling counter data. (Put)
     * @param {Integer} _interval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_sampleinterval
     */
    put_SampleInterval(_interval) {
        result := ComCall(37, this, "uint", _interval, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of a Task Scheduler job to start each time the counter value crosses the threshold. (Get)
     * @remarks
     * To specify command-line arguments for the task, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskarguments">IAlertDataCollector::TaskArguments</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskusertextarguments">IAlertDataCollector::TaskUserTextArguments</a> properties. 
     * 
     * To start the task in the directory where PLA is collecting the data, set the task's <b>Start in</b> field to $(Arg1).
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_task
     */
    get_Task() {
        task := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, task, "HRESULT")
        return task
    }

    /**
     * Retrieves or sets the name of a Task Scheduler job to start each time the counter value crosses the threshold. (Put)
     * @remarks
     * To specify command-line arguments for the task, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskarguments">IAlertDataCollector::TaskArguments</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskusertextarguments">IAlertDataCollector::TaskUserTextArguments</a> properties. 
     * 
     * To start the task in the directory where PLA is collecting the data, set the task's <b>Start in</b> field to $(Arg1).
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_task
     */
    put_Task(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(39, this, BSTR, task, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether the task runs as the data collector set user or as the user specified in the task. (IAlertDataCollector.get_TaskRunAsSelf)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_taskrunasself
     */
    get_TaskRunAsSelf() {
        result := ComCall(40, this, VARIANT_BOOL.Ptr, &RunAsSelf := 0, "HRESULT")
        return RunAsSelf
    }

    /**
     * Retrieves or sets a value that determines whether the task runs as the data collector set user or as the user specified in the task. (IAlertDataCollector.put_TaskRunAsSelf)
     * @param {VARIANT_BOOL} RunAsSelf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_taskrunasself
     */
    put_TaskRunAsSelf(RunAsSelf) {
        result := ComCall(41, this, VARIANT_BOOL, RunAsSelf, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the command-line arguments to pass to the Task Scheduler job specified in the IAlertDataCollector::Task property. (IAlertDataCollector.get_TaskArguments)
     * @remarks
     * If the task to run is a script, you must set the task arguments in the Task Scheduler to $(Arg0); otherwise, the arguments that you specify with this property will not be passed to the script.
     * 
     * PLA provides the following substitution variables that you can include in your arguments string. PLA provides the values for the substitution variables when the alert is triggered. You must escape the braces, for example, \{name\}.
     * 
     * <table>
     * <tr>
     * <th>Variable</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>{counter}</td>
     * <td> Path of the performance counter that crossed the threshold.</td>
     * </tr>
     * <tr>
     * <td>{date}</td>
     * <td>Time that the threshold was crossed.</td>
     * </tr>
     * <tr>
     * <td>{name}</td>
     * <td>Name of the alert data collector.</td>
     * </tr>
     * <tr>
     * <td>{threshold}</td>
     * <td>Value of the threshold.</td>
     * </tr>
     * <tr>
     * <td>{usertext}</td>
     * <td>String from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskusertextarguments">IAlertDataCollector::TaskUserTextArguments</a> property.</td>
     * </tr>
     * <tr>
     * <td>{value}</td>
     * <td>Value of the performance counter.</td>
     * </tr>
     * </table>
     *  
     * 
     * Typically, if you use the substitution variables, you specify them in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskusertextarguments">TaskUserTextArguments</a>, where you do not have to escape the braces, and then specify {usertext} in this property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_taskarguments
     */
    get_TaskArguments() {
        task := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, task, "HRESULT")
        return task
    }

    /**
     * Retrieves or sets the command-line arguments to pass to the Task Scheduler job specified in the IAlertDataCollector::Task property. (IAlertDataCollector.put_TaskArguments)
     * @remarks
     * If the task to run is a script, you must set the task arguments in the Task Scheduler to $(Arg0); otherwise, the arguments that you specify with this property will not be passed to the script.
     * 
     * PLA provides the following substitution variables that you can include in your arguments string. PLA provides the values for the substitution variables when the alert is triggered. You must escape the braces, for example, \{name\}.
     * 
     * <table>
     * <tr>
     * <th>Variable</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>{counter}</td>
     * <td> Path of the performance counter that crossed the threshold.</td>
     * </tr>
     * <tr>
     * <td>{date}</td>
     * <td>Time that the threshold was crossed.</td>
     * </tr>
     * <tr>
     * <td>{name}</td>
     * <td>Name of the alert data collector.</td>
     * </tr>
     * <tr>
     * <td>{threshold}</td>
     * <td>Value of the threshold.</td>
     * </tr>
     * <tr>
     * <td>{usertext}</td>
     * <td>String from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskusertextarguments">IAlertDataCollector::TaskUserTextArguments</a> property.</td>
     * </tr>
     * <tr>
     * <td>{value}</td>
     * <td>Value of the performance counter.</td>
     * </tr>
     * </table>
     *  
     * 
     * Typically, if you use the substitution variables, you specify them in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskusertextarguments">TaskUserTextArguments</a>, where you do not have to escape the braces, and then specify {usertext} in this property.
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_taskarguments
     */
    put_TaskArguments(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(43, this, BSTR, task, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the command-line arguments to pass to the Task Scheduler job specified in the IAlertDataCollector::Task property. (IAlertDataCollector.get_TaskUserTextArguments)
     * @remarks
     * These arguments are included in the command-line arguments passed to the Task Scheduler job only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskarguments">IAlertDataCollector::TaskArguments</a> property includes the  {usertext} substitution variable. 
     * 
     * PLA provides the following substitution variables that you can include in your arguments string. PLA provides the values for the substitution variables when the alert is triggered. You do not escape the braces.
     * 
     * <table>
     * <tr>
     * <th>Variable</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>{counter}</td>
     * <td> Path of the performance counter that crossed the threshold.</td>
     * </tr>
     * <tr>
     * <td>{date}</td>
     * <td>Time that the threshold was crossed.</td>
     * </tr>
     * <tr>
     * <td>{name}</td>
     * <td>Name of the alert data collector.</td>
     * </tr>
     * <tr>
     * <td>{threshold}</td>
     * <td>Value of the threshold.</td>
     * </tr>
     * <tr>
     * <td>{value}</td>
     * <td>Value of the performance counter.</td>
     * </tr>
     * </table>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_taskusertextarguments
     */
    get_TaskUserTextArguments() {
        task := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, task, "HRESULT")
        return task
    }

    /**
     * Retrieves or sets the command-line arguments to pass to the Task Scheduler job specified in the IAlertDataCollector::Task property. (IAlertDataCollector.put_TaskUserTextArguments)
     * @remarks
     * These arguments are included in the command-line arguments passed to the Task Scheduler job only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_taskarguments">IAlertDataCollector::TaskArguments</a> property includes the  {usertext} substitution variable. 
     * 
     * PLA provides the following substitution variables that you can include in your arguments string. PLA provides the values for the substitution variables when the alert is triggered. You do not escape the braces.
     * 
     * <table>
     * <tr>
     * <th>Variable</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>{counter}</td>
     * <td> Path of the performance counter that crossed the threshold.</td>
     * </tr>
     * <tr>
     * <td>{date}</td>
     * <td>Time that the threshold was crossed.</td>
     * </tr>
     * <tr>
     * <td>{name}</td>
     * <td>Name of the alert data collector.</td>
     * </tr>
     * <tr>
     * <td>{threshold}</td>
     * <td>Value of the threshold.</td>
     * </tr>
     * <tr>
     * <td>{value}</td>
     * <td>Value of the performance counter.</td>
     * </tr>
     * </table>
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_taskusertextarguments
     */
    put_TaskUserTextArguments(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(45, this, BSTR, task, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of a data collector set to start each time the counter value crosses the threshold. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_triggerdatacollectorset
     */
    get_TriggerDataCollectorSet() {
        name := BSTR.Owned()
        result := ComCall(46, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the name of a data collector set to start each time the counter value crosses the threshold. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_triggerdatacollectorset
     */
    put_TriggerDataCollectorSet(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(47, this, BSTR, name, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAlertDataCollector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AlertThresholds := CallbackCreate(GetMethod(implObj, "get_AlertThresholds"), flags, 2)
        this.vtbl.put_AlertThresholds := CallbackCreate(GetMethod(implObj, "put_AlertThresholds"), flags, 2)
        this.vtbl.get_EventLog := CallbackCreate(GetMethod(implObj, "get_EventLog"), flags, 2)
        this.vtbl.put_EventLog := CallbackCreate(GetMethod(implObj, "put_EventLog"), flags, 2)
        this.vtbl.get_SampleInterval := CallbackCreate(GetMethod(implObj, "get_SampleInterval"), flags, 2)
        this.vtbl.put_SampleInterval := CallbackCreate(GetMethod(implObj, "put_SampleInterval"), flags, 2)
        this.vtbl.get_Task := CallbackCreate(GetMethod(implObj, "get_Task"), flags, 2)
        this.vtbl.put_Task := CallbackCreate(GetMethod(implObj, "put_Task"), flags, 2)
        this.vtbl.get_TaskRunAsSelf := CallbackCreate(GetMethod(implObj, "get_TaskRunAsSelf"), flags, 2)
        this.vtbl.put_TaskRunAsSelf := CallbackCreate(GetMethod(implObj, "put_TaskRunAsSelf"), flags, 2)
        this.vtbl.get_TaskArguments := CallbackCreate(GetMethod(implObj, "get_TaskArguments"), flags, 2)
        this.vtbl.put_TaskArguments := CallbackCreate(GetMethod(implObj, "put_TaskArguments"), flags, 2)
        this.vtbl.get_TaskUserTextArguments := CallbackCreate(GetMethod(implObj, "get_TaskUserTextArguments"), flags, 2)
        this.vtbl.put_TaskUserTextArguments := CallbackCreate(GetMethod(implObj, "put_TaskUserTextArguments"), flags, 2)
        this.vtbl.get_TriggerDataCollectorSet := CallbackCreate(GetMethod(implObj, "get_TriggerDataCollectorSet"), flags, 2)
        this.vtbl.put_TriggerDataCollectorSet := CallbackCreate(GetMethod(implObj, "put_TriggerDataCollectorSet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AlertThresholds)
        CallbackFree(this.vtbl.put_AlertThresholds)
        CallbackFree(this.vtbl.get_EventLog)
        CallbackFree(this.vtbl.put_EventLog)
        CallbackFree(this.vtbl.get_SampleInterval)
        CallbackFree(this.vtbl.put_SampleInterval)
        CallbackFree(this.vtbl.get_Task)
        CallbackFree(this.vtbl.put_Task)
        CallbackFree(this.vtbl.get_TaskRunAsSelf)
        CallbackFree(this.vtbl.put_TaskRunAsSelf)
        CallbackFree(this.vtbl.get_TaskArguments)
        CallbackFree(this.vtbl.put_TaskArguments)
        CallbackFree(this.vtbl.get_TaskUserTextArguments)
        CallbackFree(this.vtbl.put_TaskUserTextArguments)
        CallbackFree(this.vtbl.get_TriggerDataCollectorSet)
        CallbackFree(this.vtbl.put_TriggerDataCollectorSet)
    }
}
