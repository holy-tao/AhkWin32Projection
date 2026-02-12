#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentRecurrence2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentRecurrence2
     * @type {Guid}
     */
    static IID => Guid("{3df3a2e0-05a7-4f50-9f86-b03f9436254d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecurrenceType", "get_TimeZone", "put_TimeZone"]

    /**
     * @type {Integer} 
     */
    RecurrenceType {
        get => this.get_RecurrenceType()
    }

    /**
     * @type {HSTRING} 
     */
    TimeZone {
        get => this.get_TimeZone()
        set => this.put_TimeZone(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RecurrenceType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TimeZone() {
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
    put_TimeZone(value) {
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
