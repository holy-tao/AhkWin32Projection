#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\LoggingActivity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Logs events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingTarget extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingTarget
     * @type {Guid}
     */
    static IID => Guid("{65f16c35-e388-4e26-b17a-f51cd3a83916}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsEnabled", "IsEnabledWithLevel", "IsEnabledWithLevelAndKeywords", "LogEvent", "LogEventWithFields", "LogEventWithFieldsAndLevel", "LogEventWithFieldsAndOptions", "StartActivity", "StartActivityWithFields", "StartActivityWithFieldsAndLevel", "StartActivityWithFieldsAndOptions"]

    /**
     * Indicates whether at least one session is listening for events with the specified event severity level from the channel.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.isenabled
     */
    IsEnabled() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Indicates whether at least one session is listening for events with the specified level and keywords from this channel.
     * @param {Integer} level The event severity level.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.isenabled
     */
    IsEnabledWithLevel(level) {
        result := ComCall(7, this, "int", level, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Indicates whether at least one session is listening for events from the channel.
     * @param {Integer} level 
     * @param {Integer} keywords 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.isenabled
     */
    IsEnabledWithLevelAndKeywords(level, keywords) {
        result := ComCall(8, this, "int", level, "int64", keywords, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Logs an event with the specified name.
     * @param {HSTRING} eventName The name for this event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.logevent
     */
    LogEvent(eventName) {
        if(eventName is String) {
            pin := HSTRING.Create(eventName)
            eventName := pin.Value
        }
        eventName := eventName is Win32Handle ? NumGet(eventName, "ptr") : eventName

        result := ComCall(9, this, "ptr", eventName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Logs an event with the specified name and fields.
     * @param {HSTRING} eventName The name for this event.
     * @param {LoggingFields} fields The fields for this event. May be **null**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.logevent
     */
    LogEventWithFields(eventName, fields) {
        if(eventName is String) {
            pin := HSTRING.Create(eventName)
            eventName := pin.Value
        }
        eventName := eventName is Win32Handle ? NumGet(eventName, "ptr") : eventName

        result := ComCall(10, this, "ptr", eventName, "ptr", fields, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Logs an event with the specified name, fields, and level.
     * @param {HSTRING} eventName The name for this event.
     * @param {LoggingFields} fields The fields for this event. May be **null**.
     * @param {Integer} level The level of detail for this event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.logevent
     */
    LogEventWithFieldsAndLevel(eventName, fields, level) {
        if(eventName is String) {
            pin := HSTRING.Create(eventName)
            eventName := pin.Value
        }
        eventName := eventName is Win32Handle ? NumGet(eventName, "ptr") : eventName

        result := ComCall(11, this, "ptr", eventName, "ptr", fields, "int", level, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Logs an event with the specified name, fields, level, and options.
     * @param {HSTRING} eventName The name for this event.
     * @param {LoggingFields} fields The fields for this event. May be **null**.
     * @param {Integer} level The level of detail for this event.
     * @param {LoggingOptions} options The options for this event. Pass **null** to use the default options. The options are for advanced scenarios. The default values are designed to work well for most events.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.logevent
     */
    LogEventWithFieldsAndOptions(eventName, fields, level, options) {
        if(eventName is String) {
            pin := HSTRING.Create(eventName)
            eventName := pin.Value
        }
        eventName := eventName is Win32Handle ? NumGet(eventName, "ptr") : eventName

        result := ComCall(12, this, "ptr", eventName, "ptr", fields, "int", level, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes an activity start event with fields and creates a **LoggingActivity** object.
     * @param {HSTRING} startEventName The name for this event.
     * @returns {LoggingActivity} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.startactivity
     */
    StartActivity(startEventName) {
        if(startEventName is String) {
            pin := HSTRING.Create(startEventName)
            startEventName := pin.Value
        }
        startEventName := startEventName is Win32Handle ? NumGet(startEventName, "ptr") : startEventName

        result := ComCall(13, this, "ptr", startEventName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingActivity(result_)
    }

    /**
     * Writes an activity start event with the specified fields and level and creates a **LoggingActivity** object.
     * @param {HSTRING} startEventName The name for this event.
     * @param {LoggingFields} fields The fields for this event. May be **null **.
     * @returns {LoggingActivity} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.startactivity
     */
    StartActivityWithFields(startEventName, fields) {
        if(startEventName is String) {
            pin := HSTRING.Create(startEventName)
            startEventName := pin.Value
        }
        startEventName := startEventName is Win32Handle ? NumGet(startEventName, "ptr") : startEventName

        result := ComCall(14, this, "ptr", startEventName, "ptr", fields, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingActivity(result_)
    }

    /**
     * Writes an activity start event with the specified fields, level, and options, and creates a **LoggingActivity** object.
     * @param {HSTRING} startEventName The name for this event.
     * @param {LoggingFields} fields The fields for this event. May be **null**.
     * @param {Integer} level The level of detail for this event.
     * @returns {LoggingActivity} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.startactivity
     */
    StartActivityWithFieldsAndLevel(startEventName, fields, level) {
        if(startEventName is String) {
            pin := HSTRING.Create(startEventName)
            startEventName := pin.Value
        }
        startEventName := startEventName is Win32Handle ? NumGet(startEventName, "ptr") : startEventName

        result := ComCall(15, this, "ptr", startEventName, "ptr", fields, "int", level, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingActivity(result_)
    }

    /**
     * Writes an activity start event and creates a **LoggingActivity** object.
     * @param {HSTRING} startEventName The name for this event.
     * @param {LoggingFields} fields 
     * @param {Integer} level 
     * @param {LoggingOptions} options 
     * @returns {LoggingActivity} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingtarget.startactivity
     */
    StartActivityWithFieldsAndOptions(startEventName, fields, level, options) {
        if(startEventName is String) {
            pin := HSTRING.Create(startEventName)
            startEventName := pin.Value
        }
        startEventName := startEventName is Win32Handle ? NumGet(startEventName, "ptr") : startEventName

        result := ComCall(16, this, "ptr", startEventName, "ptr", fields, "int", level, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingActivity(result_)
    }
}
