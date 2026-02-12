#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Appointment.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments.AppointmentsProvider
 * @version WindowsRuntime 1.4
 */
class IAddAppointmentOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAddAppointmentOperation
     * @type {Guid}
     */
    static IID => Guid("{ec4a9af3-620d-4c69-add7-9794e918081f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppointmentInformation", "get_SourcePackageFamilyName", "ReportCompleted", "ReportCanceled", "ReportError", "DismissUI"]

    /**
     * @type {Appointment} 
     */
    AppointmentInformation {
        get => this.get_AppointmentInformation()
    }

    /**
     * @type {HSTRING} 
     */
    SourcePackageFamilyName {
        get => this.get_SourcePackageFamilyName()
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_AppointmentInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Appointment(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourcePackageFamilyName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} itemId 
     * @returns {HRESULT} 
     */
    ReportCompleted(itemId) {
        if(itemId is String) {
            pin := HSTRING.Create(itemId)
            itemId := pin.Value
        }
        itemId := itemId is Win32Handle ? NumGet(itemId, "ptr") : itemId

        result := ComCall(8, this, "ptr", itemId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReportCanceled() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    ReportError(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DismissUI() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
