#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\UI\Color.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\Appointment.ahk
#Include .\AppointmentException.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentCalendar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentCalendar
     * @type {Guid}
     */
    static IID => Guid("{5273819d-8339-3d4f-a02f-64084452bb5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayColor", "get_DisplayName", "put_DisplayName", "get_LocalId", "get_IsHidden", "get_OtherAppReadAccess", "put_OtherAppReadAccess", "get_OtherAppWriteAccess", "put_OtherAppWriteAccess", "get_SourceDisplayName", "get_SummaryCardView", "put_SummaryCardView", "FindAppointmentsAsync", "FindAppointmentsAsyncWithOptions", "FindExceptionsFromMasterAsync", "FindAllInstancesAsync", "FindAllInstancesAsyncWithOptions", "GetAppointmentAsync", "GetAppointmentInstanceAsync", "FindUnexpandedAppointmentsAsync", "FindUnexpandedAppointmentsAsyncWithOptions", "DeleteAsync", "SaveAsync", "DeleteAppointmentAsync", "DeleteAppointmentInstanceAsync", "SaveAppointmentAsync"]

    /**
     * @type {Color} 
     */
    DisplayColor {
        get => this.get_DisplayColor()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {HSTRING} 
     */
    LocalId {
        get => this.get_LocalId()
    }

    /**
     * @type {Boolean} 
     */
    IsHidden {
        get => this.get_IsHidden()
    }

    /**
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * @type {Integer} 
     */
    OtherAppWriteAccess {
        get => this.get_OtherAppWriteAccess()
        set => this.put_OtherAppWriteAccess(value)
    }

    /**
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * @type {Integer} 
     */
    SummaryCardView {
        get => this.get_SummaryCardView()
        set => this.put_SummaryCardView(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DisplayColor() {
        value := Color()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
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

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHidden() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppWriteAccess() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppWriteAccess(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SummaryCardView() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SummaryCardView(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DateTime} rangeStart 
     * @param {TimeSpan} rangeLength 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     */
    FindAppointmentsAsync(rangeStart, rangeLength) {
        result := ComCall(18, this, "ptr", rangeStart, "ptr", rangeLength, "ptr*", &result_ := 0, "int")
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
        result := ComCall(19, this, "ptr", rangeStart, "ptr", rangeLength, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Appointment), result_)
    }

    /**
     * 
     * @param {HSTRING} masterLocalId 
     * @returns {IAsyncOperation<IVectorView<AppointmentException>>} 
     */
    FindExceptionsFromMasterAsync(masterLocalId) {
        if(masterLocalId is String) {
            pin := HSTRING.Create(masterLocalId)
            masterLocalId := pin.Value
        }
        masterLocalId := masterLocalId is Win32Handle ? NumGet(masterLocalId, "ptr") : masterLocalId

        result := ComCall(20, this, "ptr", masterLocalId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppointmentException), value)
    }

    /**
     * 
     * @param {HSTRING} masterLocalId 
     * @param {DateTime} rangeStart 
     * @param {TimeSpan} rangeLength 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     */
    FindAllInstancesAsync(masterLocalId, rangeStart, rangeLength) {
        if(masterLocalId is String) {
            pin := HSTRING.Create(masterLocalId)
            masterLocalId := pin.Value
        }
        masterLocalId := masterLocalId is Win32Handle ? NumGet(masterLocalId, "ptr") : masterLocalId

        result := ComCall(21, this, "ptr", masterLocalId, "ptr", rangeStart, "ptr", rangeLength, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Appointment), value)
    }

    /**
     * 
     * @param {HSTRING} masterLocalId 
     * @param {DateTime} rangeStart 
     * @param {TimeSpan} rangeLength 
     * @param {FindAppointmentsOptions} pOptions 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     */
    FindAllInstancesAsyncWithOptions(masterLocalId, rangeStart, rangeLength, pOptions) {
        if(masterLocalId is String) {
            pin := HSTRING.Create(masterLocalId)
            masterLocalId := pin.Value
        }
        masterLocalId := masterLocalId is Win32Handle ? NumGet(masterLocalId, "ptr") : masterLocalId

        result := ComCall(22, this, "ptr", masterLocalId, "ptr", rangeStart, "ptr", rangeLength, "ptr", pOptions, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Appointment), value)
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

        result := ComCall(23, this, "ptr", localId, "ptr*", &result_ := 0, "int")
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

        result := ComCall(24, this, "ptr", localId, "ptr", instanceStartTime, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Appointment, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     */
    FindUnexpandedAppointmentsAsync() {
        result := ComCall(25, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Appointment), result_)
    }

    /**
     * 
     * @param {FindAppointmentsOptions} options 
     * @returns {IAsyncOperation<IVectorView<Appointment>>} 
     */
    FindUnexpandedAppointmentsAsyncWithOptions(options) {
        result := ComCall(26, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Appointment), result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(27, this, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(28, this, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @returns {IAsyncAction} 
     */
    DeleteAppointmentAsync(localId) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(29, this, "ptr", localId, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {HSTRING} localId 
     * @param {DateTime} instanceStartTime 
     * @returns {IAsyncAction} 
     */
    DeleteAppointmentInstanceAsync(localId, instanceStartTime) {
        if(localId is String) {
            pin := HSTRING.Create(localId)
            localId := pin.Value
        }
        localId := localId is Win32Handle ? NumGet(localId, "ptr") : localId

        result := ComCall(30, this, "ptr", localId, "ptr", instanceStartTime, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {Appointment} pAppointment 
     * @returns {IAsyncAction} 
     */
    SaveAppointmentAsync(pAppointment) {
        result := ComCall(31, this, "ptr", pAppointment, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }
}
