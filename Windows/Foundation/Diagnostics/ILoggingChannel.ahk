#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a source of log messages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingchannel
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingChannel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingChannel
     * @type {Guid}
     */
    static IID => Guid("{e9a50343-11d7-4f01-b5ca-cf495278c0a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Enabled", "get_Level", "LogMessage", "LogMessageWithLevel", "LogValuePair", "LogValuePairWithLevel", "add_LoggingEnabled", "remove_LoggingEnabled"]

    /**
     * Gets the name of the current [LoggingChannel](loggingchannel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingchannel.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets a value that indicates whether messages are being logged on the current [LoggingChannel](loggingchannel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingchannel.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * Gets the level of detail for messages from the current [LoggingChannel](loggingchannel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingchannel.level
     * @type {Integer} 
     */
    Level {
        get => this.get_Level()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Level() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Logs a message to the current [LoggingChannel](loggingchannel.md).
     * @param {HSTRING} eventString The message to log.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingchannel.logmessage
     */
    LogMessage(eventString) {
        if(eventString is String) {
            pin := HSTRING.Create(eventString)
            eventString := pin.Value
        }
        eventString := eventString is Win32Handle ? NumGet(eventString, "ptr") : eventString

        result := ComCall(9, this, "ptr", eventString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Logs a message to the current [LoggingChannel](loggingchannel.md) with the specified [LoggingLevel](logginglevel.md).
     * @param {HSTRING} eventString The message to log.
     * @param {Integer} level The logging level.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingchannel.logmessage
     */
    LogMessageWithLevel(eventString, level) {
        if(eventString is String) {
            pin := HSTRING.Create(eventString)
            eventString := pin.Value
        }
        eventString := eventString is Win32Handle ? NumGet(eventString, "ptr") : eventString

        result := ComCall(10, this, "ptr", eventString, "int", level, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Logs data to the current [LoggingChannel](loggingchannel.md).
     * @param {HSTRING} value1 The string to associate with *value2*.
     * @param {Integer} value2 The value to associate with *value1*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingchannel.logvaluepair
     */
    LogValuePair(value1, value2) {
        if(value1 is String) {
            pin := HSTRING.Create(value1)
            value1 := pin.Value
        }
        value1 := value1 is Win32Handle ? NumGet(value1, "ptr") : value1

        result := ComCall(11, this, "ptr", value1, "int", value2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Logs data to the current [LoggingChannel](loggingchannel.md) with the specified [LoggingLevel](logginglevel.md).
     * @param {HSTRING} value1 The string to associate with *value2*.
     * @param {Integer} value2 The value to associate with *value1*.
     * @param {Integer} level The logging level.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.iloggingchannel.logvaluepair
     */
    LogValuePairWithLevel(value1, value2, level) {
        if(value1 is String) {
            pin := HSTRING.Create(value1)
            value1 := pin.Value
        }
        value1 := value1 is Win32Handle ? NumGet(value1, "ptr") : value1

        result := ComCall(12, this, "ptr", value1, "int", value2, "int", level, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ILoggingChannel, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LoggingEnabled(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LoggingEnabled(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
