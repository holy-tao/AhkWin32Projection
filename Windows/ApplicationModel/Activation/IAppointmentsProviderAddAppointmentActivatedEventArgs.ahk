#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Appointments\AppointmentsProvider\AddAppointmentOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to add an appointment to the user’s calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovideraddappointmentactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IAppointmentsProviderAddAppointmentActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentsProviderAddAppointmentActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a2861367-cee5-4e4d-9ed7-41c34ec18b02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AddAppointmentOperation"]

    /**
     * Gets the appointment that is provided to the app when the user tries to add it.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsprovideraddappointmentactivatedeventargs.addappointmentoperation
     * @type {AddAppointmentOperation} 
     */
    AddAppointmentOperation {
        get => this.get_AddAppointmentOperation()
    }

    /**
     * 
     * @returns {AddAppointmentOperation} 
     */
    get_AddAppointmentOperation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AddAppointmentOperation(value)
    }
}
