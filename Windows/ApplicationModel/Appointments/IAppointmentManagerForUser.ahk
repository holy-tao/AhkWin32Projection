#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\AppointmentStore.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentManagerForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentManagerForUser
     * @type {Guid}
     */
    static IID => Guid("{70261423-73cc-4660-b318-b01365302a03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowAddAppointmentAsync", "ShowAddAppointmentWithPlacementAsync", "ShowReplaceAppointmentAsync", "ShowReplaceAppointmentWithPlacementAsync", "ShowReplaceAppointmentWithPlacementAndDateAsync", "ShowRemoveAppointmentAsync", "ShowRemoveAppointmentWithPlacementAsync", "ShowRemoveAppointmentWithPlacementAndDateAsync", "ShowTimeFrameAsync", "ShowAppointmentDetailsAsync", "ShowAppointmentDetailsWithDateAsync", "ShowEditNewAppointmentAsync", "RequestStoreAsync", "get_User"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowAddAppointmentAsync(appointment_, selection) {
        result := ComCall(6, this, "ptr", appointment_, "ptr", selection, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowAddAppointmentWithPlacementAsync(appointment_, selection, preferredPlacement) {
        result := ComCall(7, this, "ptr", appointment_, "ptr", selection, "int", preferredPlacement, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
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

        result := ComCall(8, this, "ptr", appointmentId, "ptr", appointment_, "ptr", selection, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
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

        result := ComCall(9, this, "ptr", appointmentId, "ptr", appointment_, "ptr", selection, "int", preferredPlacement, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
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

        result := ComCall(10, this, "ptr", appointmentId, "ptr", appointment_, "ptr", selection, "int", preferredPlacement, "ptr", instanceStartDate, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
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

        result := ComCall(11, this, "ptr", appointmentId, "ptr", selection, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
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

        result := ComCall(12, this, "ptr", appointmentId, "ptr", selection, "int", preferredPlacement, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
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

        result := ComCall(13, this, "ptr", appointmentId, "ptr", selection, "int", preferredPlacement, "ptr", instanceStartDate, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {DateTime} timeToShow 
     * @param {TimeSpan} duration_ 
     * @returns {IAsyncAction} 
     */
    ShowTimeFrameAsync(timeToShow, duration_) {
        result := ComCall(14, this, "ptr", timeToShow, "ptr", duration_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

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

        result := ComCall(15, this, "ptr", appointmentId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
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

        result := ComCall(16, this, "ptr", appointmentId, "ptr", instanceStartDate, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowEditNewAppointmentAsync(appointment_) {
        result := ComCall(17, this, "ptr", appointment_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IAsyncOperation<AppointmentStore>} 
     */
    RequestStoreAsync(options) {
        result := ComCall(18, this, "int", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppointmentStore, result_)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }
}
