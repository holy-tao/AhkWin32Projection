#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class IPrintNotificationEventDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintNotificationEventDetails
     * @type {Guid}
     */
    static IID => Guid("{e00e4c8a-4828-4da1-8bb8-8672df8515e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrinterName", "get_EventData", "put_EventData"]

    /**
     * @type {HSTRING} 
     */
    PrinterName {
        get => this.get_PrinterName()
    }

    /**
     * @type {HSTRING} 
     */
    EventData {
        get => this.get_EventData()
        set => this.put_EventData(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrinterName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EventData() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EventData(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
