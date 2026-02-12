#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{3a30fa01-5c40-499d-b33f-a43050f74fc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowAddAppointmentAsync", "ShowAddAppointmentWithPlacementAsync", "ShowReplaceAppointmentAsync", "ShowReplaceAppointmentWithPlacementAsync", "ShowReplaceAppointmentWithPlacementAndDateAsync", "ShowRemoveAppointmentAsync", "ShowRemoveAppointmentWithPlacementAsync", "ShowRemoveAppointmentWithPlacementAndDateAsync", "ShowTimeFrameAsync"]

    /**
     * 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowAddAppointmentAsync(appointment_, selection) {
        result := ComCall(6, this, "ptr", appointment_, "ptr", selection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowAddAppointmentWithPlacementAsync(appointment_, selection, preferredPlacement) {
        result := ComCall(7, this, "ptr", appointment_, "ptr", selection, "int", preferredPlacement, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} appointmentId 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowReplaceAppointmentAsync(appointmentId, appointment_, selection) {
        if(appointmentId is String) {
            pin := HSTRING.Create(appointmentId)
            appointmentId := pin.Value
        }
        appointmentId := appointmentId is Win32Handle ? NumGet(appointmentId, "ptr") : appointmentId

        result := ComCall(8, this, "ptr", appointmentId, "ptr", appointment_, "ptr", selection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} appointmentId 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowReplaceAppointmentWithPlacementAsync(appointmentId, appointment_, selection, preferredPlacement) {
        if(appointmentId is String) {
            pin := HSTRING.Create(appointmentId)
            appointmentId := pin.Value
        }
        appointmentId := appointmentId is Win32Handle ? NumGet(appointmentId, "ptr") : appointmentId

        result := ComCall(9, this, "ptr", appointmentId, "ptr", appointment_, "ptr", selection, "int", preferredPlacement, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} appointmentId 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowReplaceAppointmentWithPlacementAndDateAsync(appointmentId, appointment_, selection, preferredPlacement, instanceStartDate) {
        if(appointmentId is String) {
            pin := HSTRING.Create(appointmentId)
            appointmentId := pin.Value
        }
        appointmentId := appointmentId is Win32Handle ? NumGet(appointmentId, "ptr") : appointmentId

        result := ComCall(10, this, "ptr", appointmentId, "ptr", appointment_, "ptr", selection, "int", preferredPlacement, "ptr", instanceStartDate, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} appointmentId 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ShowRemoveAppointmentAsync(appointmentId, selection) {
        if(appointmentId is String) {
            pin := HSTRING.Create(appointmentId)
            appointmentId := pin.Value
        }
        appointmentId := appointmentId is Win32Handle ? NumGet(appointmentId, "ptr") : appointmentId

        result := ComCall(11, this, "ptr", appointmentId, "ptr", selection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} appointmentId 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ShowRemoveAppointmentWithPlacementAsync(appointmentId, selection, preferredPlacement) {
        if(appointmentId is String) {
            pin := HSTRING.Create(appointmentId)
            appointmentId := pin.Value
        }
        appointmentId := appointmentId is Win32Handle ? NumGet(appointmentId, "ptr") : appointmentId

        result := ComCall(12, this, "ptr", appointmentId, "ptr", selection, "int", preferredPlacement, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} appointmentId 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ShowRemoveAppointmentWithPlacementAndDateAsync(appointmentId, selection, preferredPlacement, instanceStartDate) {
        if(appointmentId is String) {
            pin := HSTRING.Create(appointmentId)
            appointmentId := pin.Value
        }
        appointmentId := appointmentId is Win32Handle ? NumGet(appointmentId, "ptr") : appointmentId

        result := ComCall(13, this, "ptr", appointmentId, "ptr", selection, "int", preferredPlacement, "ptr", instanceStartDate, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {DateTime} timeToShow 
     * @param {TimeSpan} duration_ 
     * @returns {IAsyncAction} 
     */
    ShowTimeFrameAsync(timeToShow, duration_) {
        result := ComCall(14, this, "ptr", timeToShow, "ptr", duration_, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }
}
