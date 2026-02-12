#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsMessageRegistration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsMessageRegistration
     * @type {Guid}
     */
    static IID => Guid("{1720503e-f34f-446b-83b3-0ff19923b409}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "Unregister", "add_MessageReceived", "remove_MessageReceived"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Removes the active instance of an application from the recovery list.
     * @remarks
     * You do not need to call this function before exiting. You need to remove the registration only if you choose to not recover data.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-unregisterapplicationrecoverycallback
     */
    Unregister() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SmsMessageRegistration, SmsMessageReceivedTriggerDetails>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", eventHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_MessageReceived(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(9, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
