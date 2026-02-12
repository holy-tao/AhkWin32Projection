#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\Calendar.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ICalendarFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarFactory
     * @type {Guid}
     */
    static IID => Guid("{83f58412-e56b-4c75-a66e-0f63d57758a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCalendarDefaultCalendarAndClock", "CreateCalendar"]

    /**
     * 
     * @param {IIterable<HSTRING>} languages 
     * @returns {Calendar} 
     */
    CreateCalendarDefaultCalendarAndClock(languages) {
        result := ComCall(6, this, "ptr", languages, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Calendar(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} languages 
     * @param {HSTRING} calendar_ 
     * @param {HSTRING} clock 
     * @returns {Calendar} 
     */
    CreateCalendar(languages, calendar_, clock) {
        if(calendar_ is String) {
            pin := HSTRING.Create(calendar_)
            calendar_ := pin.Value
        }
        calendar_ := calendar_ is Win32Handle ? NumGet(calendar_, "ptr") : calendar_
        if(clock is String) {
            pin := HSTRING.Create(clock)
            clock := pin.Value
        }
        clock := clock is Win32Handle ? NumGet(clock, "ptr") : clock

        result := ComCall(7, this, "ptr", languages, "ptr", calendar_, "ptr", clock, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Calendar(result_)
    }
}
