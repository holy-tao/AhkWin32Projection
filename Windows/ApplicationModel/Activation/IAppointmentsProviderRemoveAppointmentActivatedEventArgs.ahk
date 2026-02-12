#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Appointments\AppointmentsProvider\RemoveAppointmentOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to remove an appointment from the user’s calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsproviderremoveappointmentactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IAppointmentsProviderRemoveAppointmentActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentsProviderRemoveAppointmentActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{751f3ab8-0b8e-451c-9f15-966e699bac25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoveAppointmentOperation"]

    /**
     * Gets the appointment that is provided to the app when the user tries to remove it.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsproviderremoveappointmentactivatedeventargs.removeappointmentoperation
     * @type {RemoveAppointmentOperation} 
     */
    RemoveAppointmentOperation {
        get => this.get_RemoveAppointmentOperation()
    }

    /**
     * 
     * @returns {RemoveAppointmentOperation} 
     */
    get_RemoveAppointmentOperation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoveAppointmentOperation(value)
    }
}
