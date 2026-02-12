#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AppointmentCalendarCancelMeetingRequest.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments.DataProvider
 * @version WindowsRuntime 1.4
 */
class IAppointmentCalendarCancelMeetingRequestEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentCalendarCancelMeetingRequestEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1a79be16-7f30-4e35-beef-9d2c7b6dcae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request", "GetDeferral"]

    /**
     * @type {AppointmentCalendarCancelMeetingRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {AppointmentCalendarCancelMeetingRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentCalendarCancelMeetingRequest(value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }
}
