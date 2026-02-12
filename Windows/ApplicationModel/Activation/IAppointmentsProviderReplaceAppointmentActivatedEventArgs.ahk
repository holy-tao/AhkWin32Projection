#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Appointments\AppointmentsProvider\ReplaceAppointmentOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to replace an appointment in the user’s calendar.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsproviderreplaceappointmentactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IAppointmentsProviderReplaceAppointmentActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentsProviderReplaceAppointmentActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1551b7d4-a981-4067-8a62-0524e4ade121}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReplaceAppointmentOperation"]

    /**
     * Gets the appointment that is provided to the app when the user tries to replace it.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iappointmentsproviderreplaceappointmentactivatedeventargs.replaceappointmentoperation
     * @type {ReplaceAppointmentOperation} 
     */
    ReplaceAppointmentOperation {
        get => this.get_ReplaceAppointmentOperation()
    }

    /**
     * 
     * @returns {ReplaceAppointmentOperation} 
     */
    get_ReplaceAppointmentOperation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ReplaceAppointmentOperation(value)
    }
}
