#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RemoteSystemConnectionRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemConnectionRequestStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemConnectionRequestStatics2
     * @type {Guid}
     */
    static IID => Guid("{460f1027-64ec-598e-a800-4f2ee58def19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromConnectionToken", "CreateFromConnectionTokenForUser"]

    /**
     * 
     * @param {HSTRING} connectionToken 
     * @returns {RemoteSystemConnectionRequest} 
     */
    CreateFromConnectionToken(connectionToken) {
        if(connectionToken is String) {
            pin := HSTRING.Create(connectionToken)
            connectionToken := pin.Value
        }
        connectionToken := connectionToken is Win32Handle ? NumGet(connectionToken, "ptr") : connectionToken

        result := ComCall(6, this, "ptr", connectionToken, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemConnectionRequest(result_)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} connectionToken 
     * @returns {RemoteSystemConnectionRequest} 
     */
    CreateFromConnectionTokenForUser(user_, connectionToken) {
        if(connectionToken is String) {
            pin := HSTRING.Create(connectionToken)
            connectionToken := pin.Value
        }
        connectionToken := connectionToken is Win32Handle ? NumGet(connectionToken, "ptr") : connectionToken

        result := ComCall(7, this, "ptr", user_, "ptr", connectionToken, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemConnectionRequest(result_)
    }
}
