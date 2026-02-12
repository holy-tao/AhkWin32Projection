#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppointmentManagerForUser.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{2f9ae09c-b34c-4dc7-a35d-cafd88ae3ec6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForUser"]

    /**
     * 
     * @param {User} user_ 
     * @returns {AppointmentManagerForUser} 
     */
    GetForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppointmentManagerForUser(result_)
    }
}
