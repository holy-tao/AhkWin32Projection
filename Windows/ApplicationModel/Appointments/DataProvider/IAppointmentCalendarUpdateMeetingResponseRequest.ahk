#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class IAppointmentCalendarUpdateMeetingResponseRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentCalendarUpdateMeetingResponseRequest
     * @type {Guid}
     */
    static IID => Guid("{a36d608c-c29d-4b94-b086-7e9ff7bd84a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppointmentCalendarLocalId", "get_AppointmentLocalId", "get_AppointmentOriginalStartTime", "get_Response", "get_Subject", "get_Comment", "get_SendUpdate", "ReportCompletedAsync", "ReportFailedAsync"]

    /**
     * @type {HSTRING} 
     */
    AppointmentCalendarLocalId {
        get => this.get_AppointmentCalendarLocalId()
    }

    /**
     * @type {HSTRING} 
     */
    AppointmentLocalId {
        get => this.get_AppointmentLocalId()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    AppointmentOriginalStartTime {
        get => this.get_AppointmentOriginalStartTime()
    }

    /**
     * @type {Integer} 
     */
    Response {
        get => this.get_Response()
    }

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * @type {Boolean} 
     */
    SendUpdate {
        get => this.get_SendUpdate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppointmentCalendarLocalId() {
        value := HSTRING()
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
    get_AppointmentLocalId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_AppointmentOriginalStartTime() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Response() {
        result := ComCall(9, this, "int*", &response := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return response
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SendUpdate() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ReportCompletedAsync() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ReportFailedAsync() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
