#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppointmentCalendar.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentStoreChange2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentStoreChange2
     * @type {Guid}
     */
    static IID => Guid("{b37d0dce-5211-4402-a608-a96fe70b8ee2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppointmentCalendar"]

    /**
     * @type {AppointmentCalendar} 
     */
    AppointmentCalendar {
        get => this.get_AppointmentCalendar()
    }

    /**
     * 
     * @returns {AppointmentCalendar} 
     */
    get_AppointmentCalendar() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentCalendar(value)
    }
}
