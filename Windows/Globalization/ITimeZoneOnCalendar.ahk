#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ITimeZoneOnCalendar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimeZoneOnCalendar
     * @type {Guid}
     */
    static IID => Guid("{bb3c25e5-46cf-4317-a3f5-02621ad54478}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTimeZone", "ChangeTimeZone", "TimeZoneAsFullString", "TimeZoneAsString1"]

    /**
     * Retrieves the current time zone settings. These settings control the translations between Coordinated Universal Time (UTC) and local time.
     * @remarks
     * All translations between UTC time and local time are based on the following formula:
     * 
     * UTC = local time + bias
     * 
     * The bias is the difference, in minutes, between UTC time and local time.
     * 
     *  The <b>StandardName</b> and <b>DaylightName</b> members  of the resultant <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a>  structure are localized according to the current user default UI language.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/timezoneapi/nf-timezoneapi-gettimezoneinformation
     */
    GetTimeZone() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} timeZoneId 
     * @returns {HRESULT} 
     */
    ChangeTimeZone(timeZoneId) {
        if(timeZoneId is String) {
            pin := HSTRING.Create(timeZoneId)
            timeZoneId := pin.Value
        }
        timeZoneId := timeZoneId is Win32Handle ? NumGet(timeZoneId, "ptr") : timeZoneId

        result := ComCall(7, this, "ptr", timeZoneId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    TimeZoneAsFullString() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} idealLength 
     * @returns {HSTRING} 
     */
    TimeZoneAsString1(idealLength) {
        result_ := HSTRING()
        result := ComCall(9, this, "int", idealLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
