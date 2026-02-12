#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemSession.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionMessageChannel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionMessageChannel
     * @type {Guid}
     */
    static IID => Guid("{9524d12a-73d9-4c10-b751-c26784437127}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "BroadcastValueSetAsync", "SendValueSetAsync", "SendValueSetToParticipantsAsync", "add_ValueSetReceived", "remove_ValueSetReceived"]

    /**
     * @type {RemoteSystemSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * 
     * @returns {RemoteSystemSession} 
     */
    get_Session() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSession(value)
    }

    /**
     * 
     * @param {ValueSet} messageData 
     * @returns {IAsyncOperation<Boolean>} 
     */
    BroadcastValueSetAsync(messageData) {
        result := ComCall(7, this, "ptr", messageData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {ValueSet} messageData 
     * @param {RemoteSystemSessionParticipant} participant 
     * @returns {IAsyncOperation<Boolean>} 
     */
    SendValueSetAsync(messageData, participant) {
        result := ComCall(8, this, "ptr", messageData, "ptr", participant, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {ValueSet} messageData 
     * @param {IIterable<RemoteSystemSessionParticipant>} participants 
     * @returns {IAsyncOperation<Boolean>} 
     */
    SendValueSetToParticipantsAsync(messageData, participants) {
        result := ComCall(9, this, "ptr", messageData, "ptr", participants, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionMessageChannel, RemoteSystemSessionValueSetReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ValueSetReceived(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_ValueSetReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
