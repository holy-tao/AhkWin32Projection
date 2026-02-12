#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DateTimeFormatter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class IDateTimeFormatterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDateTimeFormatterFactory
     * @type {Guid}
     */
    static IID => Guid("{ec8d8a53-1a2e-412d-8815-3b745fb1a2a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDateTimeFormatter", "CreateDateTimeFormatterLanguages", "CreateDateTimeFormatterContext", "CreateDateTimeFormatterDate", "CreateDateTimeFormatterTime", "CreateDateTimeFormatterDateTimeLanguages", "CreateDateTimeFormatterDateTimeContext"]

    /**
     * 
     * @param {HSTRING} formatTemplate 
     * @returns {DateTimeFormatter} 
     */
    CreateDateTimeFormatter(formatTemplate) {
        if(formatTemplate is String) {
            pin := HSTRING.Create(formatTemplate)
            formatTemplate := pin.Value
        }
        formatTemplate := formatTemplate is Win32Handle ? NumGet(formatTemplate, "ptr") : formatTemplate

        result := ComCall(6, this, "ptr", formatTemplate, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(result_)
    }

    /**
     * 
     * @param {HSTRING} formatTemplate 
     * @param {IIterable<HSTRING>} languages 
     * @returns {DateTimeFormatter} 
     */
    CreateDateTimeFormatterLanguages(formatTemplate, languages) {
        if(formatTemplate is String) {
            pin := HSTRING.Create(formatTemplate)
            formatTemplate := pin.Value
        }
        formatTemplate := formatTemplate is Win32Handle ? NumGet(formatTemplate, "ptr") : formatTemplate

        result := ComCall(7, this, "ptr", formatTemplate, "ptr", languages, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(result_)
    }

    /**
     * 
     * @param {HSTRING} formatTemplate 
     * @param {IIterable<HSTRING>} languages 
     * @param {HSTRING} geographicRegion_ 
     * @param {HSTRING} calendar_ 
     * @param {HSTRING} clock 
     * @returns {DateTimeFormatter} 
     */
    CreateDateTimeFormatterContext(formatTemplate, languages, geographicRegion_, calendar_, clock) {
        if(formatTemplate is String) {
            pin := HSTRING.Create(formatTemplate)
            formatTemplate := pin.Value
        }
        formatTemplate := formatTemplate is Win32Handle ? NumGet(formatTemplate, "ptr") : formatTemplate
        if(geographicRegion_ is String) {
            pin := HSTRING.Create(geographicRegion_)
            geographicRegion_ := pin.Value
        }
        geographicRegion_ := geographicRegion_ is Win32Handle ? NumGet(geographicRegion_, "ptr") : geographicRegion_
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

        result := ComCall(8, this, "ptr", formatTemplate, "ptr", languages, "ptr", geographicRegion_, "ptr", calendar_, "ptr", clock, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(result_)
    }

    /**
     * 
     * @param {Integer} yearFormat_ 
     * @param {Integer} monthFormat_ 
     * @param {Integer} dayFormat_ 
     * @param {Integer} dayOfWeekFormat_ 
     * @returns {DateTimeFormatter} 
     */
    CreateDateTimeFormatterDate(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_) {
        result := ComCall(9, this, "int", yearFormat_, "int", monthFormat_, "int", dayFormat_, "int", dayOfWeekFormat_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(result_)
    }

    /**
     * 
     * @param {Integer} hourFormat_ 
     * @param {Integer} minuteFormat_ 
     * @param {Integer} secondFormat_ 
     * @returns {DateTimeFormatter} 
     */
    CreateDateTimeFormatterTime(hourFormat_, minuteFormat_, secondFormat_) {
        result := ComCall(10, this, "int", hourFormat_, "int", minuteFormat_, "int", secondFormat_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(result_)
    }

    /**
     * 
     * @param {Integer} yearFormat_ 
     * @param {Integer} monthFormat_ 
     * @param {Integer} dayFormat_ 
     * @param {Integer} dayOfWeekFormat_ 
     * @param {Integer} hourFormat_ 
     * @param {Integer} minuteFormat_ 
     * @param {Integer} secondFormat_ 
     * @param {IIterable<HSTRING>} languages 
     * @returns {DateTimeFormatter} 
     */
    CreateDateTimeFormatterDateTimeLanguages(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_, hourFormat_, minuteFormat_, secondFormat_, languages) {
        result := ComCall(11, this, "int", yearFormat_, "int", monthFormat_, "int", dayFormat_, "int", dayOfWeekFormat_, "int", hourFormat_, "int", minuteFormat_, "int", secondFormat_, "ptr", languages, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(result_)
    }

    /**
     * 
     * @param {Integer} yearFormat_ 
     * @param {Integer} monthFormat_ 
     * @param {Integer} dayFormat_ 
     * @param {Integer} dayOfWeekFormat_ 
     * @param {Integer} hourFormat_ 
     * @param {Integer} minuteFormat_ 
     * @param {Integer} secondFormat_ 
     * @param {IIterable<HSTRING>} languages 
     * @param {HSTRING} geographicRegion_ 
     * @param {HSTRING} calendar_ 
     * @param {HSTRING} clock 
     * @returns {DateTimeFormatter} 
     */
    CreateDateTimeFormatterDateTimeContext(yearFormat_, monthFormat_, dayFormat_, dayOfWeekFormat_, hourFormat_, minuteFormat_, secondFormat_, languages, geographicRegion_, calendar_, clock) {
        if(geographicRegion_ is String) {
            pin := HSTRING.Create(geographicRegion_)
            geographicRegion_ := pin.Value
        }
        geographicRegion_ := geographicRegion_ is Win32Handle ? NumGet(geographicRegion_, "ptr") : geographicRegion_
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

        result := ComCall(12, this, "int", yearFormat_, "int", monthFormat_, "int", dayFormat_, "int", dayOfWeekFormat_, "int", hourFormat_, "int", minuteFormat_, "int", secondFormat_, "ptr", languages, "ptr", geographicRegion_, "ptr", calendar_, "ptr", clock, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DateTimeFormatter(result_)
    }
}
