#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CalendarViewDayItem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICalendarViewDayItemChangingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarViewDayItemChangingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{73146666-1fb1-44f9-b7ad-4de859ecc565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InRecycleQueue", "get_Item", "get_Phase", "RegisterUpdateCallback", "RegisterUpdateCallbackWithPhase"]

    /**
     * @type {Boolean} 
     */
    InRecycleQueue {
        get => this.get_InRecycleQueue()
    }

    /**
     * @type {CalendarViewDayItem} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * @type {Integer} 
     */
    Phase {
        get => this.get_Phase()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InRecycleQueue() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CalendarViewDayItem} 
     */
    get_Item() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CalendarViewDayItem(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Phase() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<CalendarView, CalendarViewDayItemChangingEventArgs>} callback 
     * @returns {HRESULT} 
     */
    RegisterUpdateCallback(callback) {
        result := ComCall(9, this, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} callbackPhase 
     * @param {TypedEventHandler<CalendarView, CalendarViewDayItemChangingEventArgs>} callback 
     * @returns {HRESULT} 
     */
    RegisterUpdateCallbackWithPhase(callbackPhase, callback) {
        result := ComCall(10, this, "uint", callbackPhase, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
