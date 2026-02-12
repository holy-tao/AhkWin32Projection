#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\AppointmentStore.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{0a81f60d-d04f-4034-af72-a36573b45ff0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowAppointmentDetailsAsync", "ShowAppointmentDetailsWithDateAsync", "ShowEditNewAppointmentAsync", "RequestStoreAsync"]

    /**
     * 
     * @param {HSTRING} appointmentId 
     * @returns {IAsyncAction} 
     */
    ShowAppointmentDetailsAsync(appointmentId) {
        if(appointmentId is String) {
            pin := HSTRING.Create(appointmentId)
            appointmentId := pin.Value
        }
        appointmentId := appointmentId is Win32Handle ? NumGet(appointmentId, "ptr") : appointmentId

        result := ComCall(6, this, "ptr", appointmentId, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {HSTRING} appointmentId 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncAction} 
     */
    ShowAppointmentDetailsWithDateAsync(appointmentId, instanceStartDate) {
        if(appointmentId is String) {
            pin := HSTRING.Create(appointmentId)
            appointmentId := pin.Value
        }
        appointmentId := appointmentId is Win32Handle ? NumGet(appointmentId, "ptr") : appointmentId

        result := ComCall(7, this, "ptr", appointmentId, "ptr", instanceStartDate, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowEditNewAppointmentAsync(appointment_) {
        result := ComCall(8, this, "ptr", appointment_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IAsyncOperation<AppointmentStore>} 
     */
    RequestStoreAsync(options) {
        result := ComCall(9, this, "int", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppointmentStore, operation)
    }
}
