#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\RemoteSystemSessionCreationResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionController
     * @type {Guid}
     */
    static IID => Guid("{e48b2dd2-6820-4867-b425-d89c0a3ef7ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_JoinRequested", "remove_JoinRequested", "RemoveParticipantAsync", "CreateSessionAsync"]

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionController, RemoteSystemSessionJoinRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_JoinRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_JoinRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RemoteSystemSessionParticipant} pParticipant 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RemoveParticipantAsync(pParticipant) {
        result := ComCall(8, this, "ptr", pParticipant, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<RemoteSystemSessionCreationResult>} 
     */
    CreateSessionAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RemoteSystemSessionCreationResult, operation)
    }
}
