#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollector.ahk

/**
 * Monitors performance counters and performs actions each time a counter value crosses the specified threshold.To create the alert data collector, call the IDataCollectorCollection::CreateDataCollector or IDataCollectorCollection::CreateDataCollectorFromXml method. For details on the XML that you pass to CreateDataCollectorFromXml, see Remarks.
 * @remarks
 * 
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
  *     <TriggerDataCollectorSet/>
  * </AlertDataCollector>
  * ```
  * 
  * 
  * Note that the example does not show the property elements inherited from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> that you also need to specify.
  * 
  * When you specify the XML to create the collector, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the collector, the XML provides all elements, including those from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-ialertdatacollector
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IAlertDataCollector extends IDataCollector{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAlertDataCollector
     * @type {Guid}
     */
    static IID => Guid("{03837516-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlertThresholds", "put_AlertThresholds", "get_EventLog", "put_EventLog", "get_SampleInterval", "put_SampleInterval", "get_Task", "put_Task", "get_TaskRunAsSelf", "put_TaskRunAsSelf", "get_TaskArguments", "put_TaskArguments", "get_TaskUserTextArguments", "put_TaskUserTextArguments", "get_TriggerDataCollectorSet", "put_TriggerDataCollectorSet"]

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} alerts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_alertthresholds
     */
    get_AlertThresholds(alerts) {
        result := ComCall(32, this, "ptr*", alerts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} alerts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_alertthresholds
     */
    put_AlertThresholds(alerts) {
        result := ComCall(33, this, "ptr", alerts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} log 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_eventlog
     */
    get_EventLog(log) {
        result := ComCall(34, this, "ptr", log, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} log 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_eventlog
     */
    put_EventLog(log) {
        result := ComCall(35, this, "short", log, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} interval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_sampleinterval
     */
    get_SampleInterval(interval) {
        result := ComCall(36, this, "uint*", interval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} interval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_sampleinterval
     */
    put_SampleInterval(interval) {
        result := ComCall(37, this, "uint", interval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_task
     */
    get_Task(task) {
        result := ComCall(38, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_task
     */
    put_Task(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(39, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} RunAsSelf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_taskrunasself
     */
    get_TaskRunAsSelf(RunAsSelf) {
        result := ComCall(40, this, "ptr", RunAsSelf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} RunAsSelf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_taskrunasself
     */
    put_TaskRunAsSelf(RunAsSelf) {
        result := ComCall(41, this, "short", RunAsSelf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_taskarguments
     */
    get_TaskArguments(task) {
        result := ComCall(42, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_taskarguments
     */
    put_TaskArguments(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(43, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_taskusertextarguments
     */
    get_TaskUserTextArguments(task) {
        result := ComCall(44, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_taskusertextarguments
     */
    put_TaskUserTextArguments(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(45, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-get_triggerdatacollectorset
     */
    get_TriggerDataCollectorSet(name) {
        result := ComCall(46, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ialertdatacollector-put_triggerdatacollectorset
     */
    put_TriggerDataCollectorSet(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(47, this, "ptr", name, "HRESULT")
        return result
    }
}
