#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\Calendar.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ICalendarFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICalendarFactory2
     * @type {Guid}
     */
    static IID => Guid("{b44b378c-ca7e-4590-9e72-ea2bec1a5115}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCalendarWithTimeZone"]

    /**
     * 
     * @param {IIterable<HSTRING>} languages 
     * @param {HSTRING} calendar_ 
     * @param {HSTRING} clock 
     * @param {HSTRING} timeZoneId 
     * @returns {Calendar} 
     */
    CreateCalendarWithTimeZone(languages, calendar_, clock, timeZoneId) {
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
        if(timeZoneId is String) {
            pin := HSTRING.Create(timeZoneId)
            timeZoneId := pin.Value
        }
        timeZoneId := timeZoneId is Win32Handle ? NumGet(timeZoneId, "ptr") : timeZoneId

        result := ComCall(6, this, "ptr", languages, "ptr", calendar_, "ptr", clock, "ptr", timeZoneId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Calendar(result_)
    }
}
