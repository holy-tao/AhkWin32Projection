#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides info about a participant of an appointment in a calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.iappointmentparticipant
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentParticipant extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentParticipant
     * @type {Guid}
     */
    static IID => Guid("{615e2902-9718-467b-83fb-b293a19121de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "put_DisplayName", "get_Address", "put_Address"]

    /**
     * Gets or sets a string that communicates the display name of a participant of an appointment. The display name is optional, of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true), and a maximum of 256 characters in length.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.iappointmentparticipant.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets a string that communicates the address of a participant of an appointment. The address is required and is a Simple Mail Transfer Protocol (SMTP) e-mail address. It is also of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) and between 1 and 321 characters in length (non-empty).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appointments.iappointmentparticipant.address
     * @type {HSTRING} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_DisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Address() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_Address(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
