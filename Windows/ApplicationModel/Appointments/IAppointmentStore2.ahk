#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\AppointmentCalendar.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointmentStore2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentStore2
     * @type {Guid}
     */
    static IID => Guid("{25c48c20-1c41-424f-8084-67c1cfe0a854}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_StoreChanged", "remove_StoreChanged", "CreateAppointmentCalendarInAccountAsync"]

    /**
     * 
     * @param {TypedEventHandler<AppointmentStore, AppointmentStoreChangedEventArgs>} pHandler 
     * @returns {EventRegistrationToken} 
     */
    add_StoreChanged(pHandler) {
        pToken := EventRegistrationToken()
        result := ComCall(6, this, "ptr", pHandler, "ptr", pToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pToken
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StoreChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<AppointmentCalendar>} 
     */
    CreateAppointmentCalendarInAccountAsync(name, userDataAccountId) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(userDataAccountId is String) {
            pin := HSTRING.Create(userDataAccountId)
            userDataAccountId := pin.Value
        }
        userDataAccountId := userDataAccountId is Win32Handle ? NumGet(userDataAccountId, "ptr") : userDataAccountId

        result := ComCall(8, this, "ptr", name, "ptr", userDataAccountId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppointmentCalendar, operation)
    }
}
