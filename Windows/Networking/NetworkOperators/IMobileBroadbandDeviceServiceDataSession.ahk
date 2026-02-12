#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandDeviceServiceDataSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandDeviceServiceDataSession
     * @type {Guid}
     */
    static IID => Guid("{dad62333-8bcf-4289-8a37-045c2169486a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteDataAsync", "CloseSession", "add_DataReceived", "remove_DataReceived"]

    /**
     * 
     * @param {IBuffer} value 
     * @returns {IAsyncAction} 
     */
    WriteDataAsync(value) {
        result := ComCall(6, this, "ptr", value, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @returns {HRESULT} **xlHpcRetSuccess** if the session closed; **xlHpcRetInvalidSessionId** if the _SessionId_ argument is invalid; **xlHpcRetCallFailed** on other failures.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/excel/closesession
     */
    CloseSession() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandDeviceServiceDataSession, MobileBroadbandDeviceServiceDataReceivedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_DataReceived(eventHandler) {
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
    remove_DataReceived(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(9, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
