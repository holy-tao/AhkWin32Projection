#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITaskNamedValueCollection.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task when a system event occurs.
 * @remarks
 * 
 * A maximum of 500 tasks with event subscriptions can be created. An event subscription that queries for a variety of events can be used to trigger a task that uses the same action in response to the events being logged.
 * 
 * When reading or writing your own XML for a task, an event trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-eventtrigger-triggergroup-element">EventTrigger</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-ieventtrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IEventTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventTrigger
     * @type {Guid}
     */
    static IID => Guid("{d45b0167-9653-4eef-b94f-0732ca7af251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Subscription", "put_Subscription", "get_Delay", "put_Delay", "get_ValueQueries", "put_ValueQueries"]

    /**
     */
    Subscription {
        get => this.get_Subscription()
        set => this.put_Subscription(value)
    }

    /**
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * @type {ITaskNamedValueCollection} 
     */
    ValueQueries {
        get => this.get_ValueQueries()
        set => this.put_ValueQueries(value)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ieventtrigger-get_subscription
     */
    get_Subscription(pQuery) {
        result := ComCall(20, this, "ptr", pQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} query 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ieventtrigger-put_subscription
     */
    put_Subscription(query) {
        query := query is String ? BSTR.Alloc(query).Value : query

        result := ComCall(21, this, "ptr", query, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ieventtrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(22, this, "ptr", pDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ieventtrigger-put_delay
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(23, this, "ptr", delay, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITaskNamedValueCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ieventtrigger-get_valuequeries
     */
    get_ValueQueries() {
        result := ComCall(24, this, "ptr*", &ppNamedXPaths := 0, "HRESULT")
        return ITaskNamedValueCollection(ppNamedXPaths)
    }

    /**
     * 
     * @param {ITaskNamedValueCollection} pNamedXPaths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ieventtrigger-put_valuequeries
     */
    put_ValueQueries(pNamedXPaths) {
        result := ComCall(25, this, "ptr", pNamedXPaths, "HRESULT")
        return result
    }
}
