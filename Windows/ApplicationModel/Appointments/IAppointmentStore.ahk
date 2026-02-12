#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppointmentStoreChangeTracker.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\AppointmentCalendar.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Appointment.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppointmentConflictResult.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentStore
     * @type {Guid}
     */
    static IID => Guid("{a461918c-7a47-4d96-96c9-15cd8a05a735}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeTracker", "CreateAppointmentCalendarAsync", "GetAppointmentCalendarAsync", "GetAppointmentAsync", "GetAppointmentInstanceAsync", "FindAppointmentCalendarsAsync", "FindAppointmentCalendarsAsyncWithOptions", "FindAppointmentsAsync", "FindAppointmentsAsyncWithOptions", "FindConflictAsync", "FindConflictAsyncWithInstanceStart", "MoveAppointmentAsync", "ShowAddAppointmentAsync", "ShowReplaceAppointmentAsync", "ShowReplaceAppointmentWithPlacementAndDateAsync", "ShowRemoveAppointmentAsync", "ShowRemoveAppointmentWithPlacementAndDateAsync", "ShowAppointmentDetailsAsync", "ShowAppointmentDetailsWithDateAsync", "ShowEditNewAppointmentAsync", "FindLocalIdsFromRoamingIdAsync"]

    /**
     * @type {AppointmentStoreChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * 
     * @returns {AppointmentStoreChangeTracker} 
     */
    get_ChangeTracker() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentStoreChangeTracker(value)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IAsyncOperation<AppointmentCalendar>} 
     */
    CreateAppointmentCalendarAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppointmentCalendar, operation)
    }

    /**
     * 
     * @param {HSTRING} calendarId 
     * @returns {IAsyncOperation<AppointmentCalendar>} 
     */
    GetAppointmentCalendarAsync(calendarId) {
        if(calendarId is String) {
            pin := HSTRING.Create(calendarId)
            calendarId := pin.Value
        }
        calendarId := calendarId is Win32Handle ? NumGet(calendarId, "ptr") : calendarId

        result := ComCall(8, this, "ptr", calendarId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppointmentCalendar, result_)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @returns {IAsyncOperation<Appointment>} 
     */
    GetAppointmentAsync(localId) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(9, this, "ptr", localId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Appointment, result_)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @param {DateTime} instanceStartTime 
     * @returns {IAsyncOperation<Appointment>} 
     */
    GetAppointmentInstanceAsync(localId, instanceStartTime) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(10, this, "ptr", localId, "ptr", instanceStartTime, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Appointment, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<AppointmentCalendar>>} 
     */
    FindAppointmentCalendarsAsync() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppointmentCalendar), result_)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IAsyncOperation<IVectorView<AppointmentCalendar>>} 
     */
    FindAppointmentCalendarsAsyncWithOptions(options) {
        result := ComCall(12, this, "uint", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppointmentCalendar), result_)
    }

    /**
     * 
     * @param {DateTime} rangeStart 
     * @param {TimeSpan} rangeLength 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     */
    FindAppointmentsAsync(rangeStart, rangeLength) {
        result := ComCall(13, this, "ptr", rangeStart, "ptr", rangeLength, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Appointment), result_)
    }

    /**
     * 
     * @param {DateTime} rangeStart 
     * @param {TimeSpan} rangeLength 
     * @param {FindAppointmentsOptions} options 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     */
    FindAppointmentsAsyncWithOptions(rangeStart, rangeLength, options) {
        result := ComCall(14, this, "ptr", rangeStart, "ptr", rangeLength, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Appointment), result_)
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @returns {IAsyncOperation<AppointmentConflictResult>} 
     */
    FindConflictAsync(appointment_) {
        result := ComCall(15, this, "ptr", appointment_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppointmentConflictResult, result_)
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @param {DateTime} instanceStartTime 
     * @returns {IAsyncOperation<AppointmentConflictResult>} 
     */
    FindConflictAsyncWithInstanceStart(appointment_, instanceStartTime) {
        result := ComCall(16, this, "ptr", appointment_, "ptr", instanceStartTime, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppointmentConflictResult, result_)
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @param {AppointmentCalendar} destinationCalendar 
     * @returns {IAsyncAction} 
     */
    MoveAppointmentAsync(appointment_, destinationCalendar) {
        result := ComCall(17, this, "ptr", appointment_, "ptr", destinationCalendar, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowAddAppointmentAsync(appointment_, selection) {
        result := ComCall(18, this, "ptr", appointment_, "ptr", selection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowReplaceAppointmentAsync(localId, appointment_, selection) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(19, this, "ptr", localId, "ptr", appointment_, "ptr", selection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @param {Appointment} appointment_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ShowReplaceAppointmentWithPlacementAndDateAsync(localId, appointment_, selection, preferredPlacement, instanceStartDate) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(20, this, "ptr", localId, "ptr", appointment_, "ptr", selection, "int", preferredPlacement, "ptr", instanceStartDate, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ShowRemoveAppointmentAsync(localId, selection) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(21, this, "ptr", localId, "ptr", selection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ShowRemoveAppointmentWithPlacementAndDateAsync(localId, selection, preferredPlacement, instanceStartDate) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(22, this, "ptr", localId, "ptr", selection, "int", preferredPlacement, "ptr", instanceStartDate, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @returns {IAsyncAction} 
     */
    ShowAppointmentDetailsAsync(localId) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(23, this, "ptr", localId, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @param {DateTime} instanceStartDate 
     * @returns {IAsyncAction} 
     */
    ShowAppointmentDetailsWithDateAsync(localId, instanceStartDate) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(24, this, "ptr", localId, "ptr", instanceStartDate, "ptr*", &asyncAction := 0, "int")
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
        result := ComCall(25, this, "ptr", appointment_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} roamingId 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    FindLocalIdsFromRoamingIdAsync(roamingId) {
        if(roamingId is String) {
            pin := HSTRING.Create(roamingId)
            roamingId := pin.Value
        }
        roamingId := roamingId is Win32Handle ? NumGet(roamingId, "ptr") : roamingId

        result := ComCall(26, this, "ptr", roamingId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), operation)
    }
}
