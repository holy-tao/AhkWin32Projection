#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} pQuery 
     * @returns {HRESULT} 
     */
    get_Subscription(pQuery) {
        result := ComCall(20, this, "ptr", pQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} query 
     * @returns {HRESULT} 
     */
    put_Subscription(query) {
        query := query is String ? BSTR.Alloc(query).Value : query

        result := ComCall(21, this, "ptr", query, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     */
    get_Delay(pDelay) {
        result := ComCall(22, this, "ptr", pDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(23, this, "ptr", delay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITaskNamedValueCollection>} ppNamedXPaths 
     * @returns {HRESULT} 
     */
    get_ValueQueries(ppNamedXPaths) {
        result := ComCall(24, this, "ptr", ppNamedXPaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITaskNamedValueCollection>} pNamedXPaths 
     * @returns {HRESULT} 
     */
    put_ValueQueries(pNamedXPaths) {
        result := ComCall(25, this, "ptr", pNamedXPaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
