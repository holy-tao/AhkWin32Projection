#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LoggingChannel.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingActivity2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingActivity2
     * @type {Guid}
     */
    static IID => Guid("{26c29808-6322-456a-af82-80c8642f178b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Channel", "StopActivity", "StopActivityWithFields", "StopActivityWithFieldsAndOptions"]

    /**
     * @type {LoggingChannel} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * 
     * @returns {LoggingChannel} 
     */
    get_Channel() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingChannel(value)
    }

    /**
     * 
     * @param {HSTRING} stopEventName 
     * @returns {HRESULT} 
     */
    StopActivity(stopEventName) {
        if(stopEventName is String) {
            pin := HSTRING.Create(stopEventName)
            stopEventName := pin.Value
        }
        stopEventName := stopEventName is Win32Handle ? NumGet(stopEventName, "ptr") : stopEventName

        result := ComCall(7, this, "ptr", stopEventName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} stopEventName 
     * @param {LoggingFields} fields 
     * @returns {HRESULT} 
     */
    StopActivityWithFields(stopEventName, fields) {
        if(stopEventName is String) {
            pin := HSTRING.Create(stopEventName)
            stopEventName := pin.Value
        }
        stopEventName := stopEventName is Win32Handle ? NumGet(stopEventName, "ptr") : stopEventName

        result := ComCall(8, this, "ptr", stopEventName, "ptr", fields, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} stopEventName 
     * @param {LoggingFields} fields 
     * @param {LoggingOptions} options 
     * @returns {HRESULT} 
     */
    StopActivityWithFieldsAndOptions(stopEventName, fields, options) {
        if(stopEventName is String) {
            pin := HSTRING.Create(stopEventName)
            stopEventName := pin.Value
        }
        stopEventName := stopEventName is Win32Handle ? NumGet(stopEventName, "ptr") : stopEventName

        result := ComCall(9, this, "ptr", stopEventName, "ptr", fields, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
