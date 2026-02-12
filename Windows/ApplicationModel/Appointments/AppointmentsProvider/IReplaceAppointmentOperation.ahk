#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Appointment.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments.AppointmentsProvider
 * @version WindowsRuntime 1.4
 */
class IReplaceAppointmentOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReplaceAppointmentOperation
     * @type {Guid}
     */
    static IID => Guid("{f4903d9b-9e61-4de2-a732-2687c07d1de8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppointmentId", "get_AppointmentInformation", "get_InstanceStartDate", "get_SourcePackageFamilyName", "ReportCompleted", "ReportCanceled", "ReportError", "DismissUI"]

    /**
     * @type {HSTRING} 
     */
    AppointmentId {
        get => this.get_AppointmentId()
    }

    /**
     * @type {Appointment} 
     */
    AppointmentInformation {
        get => this.get_AppointmentInformation()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    InstanceStartDate {
        get => this.get_InstanceStartDate()
    }

    /**
     * @type {HSTRING} 
     */
    SourcePackageFamilyName {
        get => this.get_SourcePackageFamilyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Appointment} 
     */
    get_AppointmentInformation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Appointment(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_InstanceStartDate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourcePackageFamilyName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
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

        result := ComCall(10, this, "ptr", itemId, "int")
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
        result := ComCall(11, this, "int")
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

        result := ComCall(12, this, "ptr", value, "int")
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
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
