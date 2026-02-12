#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RoutedEvent.ahk
#Include .\TriggerActionCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a trigger that starts a task when a system event occurs.
 * @remarks
 * A maximum of 500 tasks with event subscriptions can be created. An event subscription that queries for a variety of events can be used to trigger a task that uses the same action in response to the events being logged.
 * 
 * When reading or writing your own XML for a task, an event trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-eventtrigger-triggergroup-element">EventTrigger</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nn-taskschd-ieventtrigger
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IEventTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventTrigger
     * @type {Guid}
     */
    static IID => Guid("{def8f855-0b49-4087-b1a9-b8b38488f786}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RoutedEvent", "put_RoutedEvent", "get_Actions"]

    /**
     * @type {RoutedEvent} 
     */
    RoutedEvent {
        get => this.get_RoutedEvent()
        set => this.put_RoutedEvent(value)
    }

    /**
     * @type {TriggerActionCollection} 
     */
    Actions {
        get => this.get_Actions()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_RoutedEvent() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @param {RoutedEvent} value 
     * @returns {HRESULT} 
     */
    put_RoutedEvent(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TriggerActionCollection} 
     */
    get_Actions() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TriggerActionCollection(value)
    }
}
