#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\XboxLiveEndpointPairTemplate.ahk
#Include .\XboxLiveDeviceAddress.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveEndpointPair extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveEndpointPair
     * @type {Guid}
     */
    static IID => Guid("{1e9a839b-813e-44e0-b87f-c87a093475e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_StateChanged", "remove_StateChanged", "DeleteAsync", "GetRemoteSocketAddressBytes", "GetLocalSocketAddressBytes", "get_State", "get_Template", "get_RemoteDeviceAddress", "get_RemoteHostName", "get_RemotePort", "get_LocalHostName", "get_LocalPort"]

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {XboxLiveEndpointPairTemplate} 
     */
    Template {
        get => this.get_Template()
    }

    /**
     * @type {XboxLiveDeviceAddress} 
     */
    RemoteDeviceAddress {
        get => this.get_RemoteDeviceAddress()
    }

    /**
     * @type {HostName} 
     */
    RemoteHostName {
        get => this.get_RemoteHostName()
    }

    /**
     * @type {HSTRING} 
     */
    RemotePort {
        get => this.get_RemotePort()
    }

    /**
     * @type {HostName} 
     */
    LocalHostName {
        get => this.get_LocalHostName()
    }

    /**
     * @type {HSTRING} 
     */
    LocalPort {
        get => this.get_LocalPort()
    }

    /**
     * 
     * @param {TypedEventHandler<XboxLiveEndpointPair, XboxLiveEndpointPairStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
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
    remove_StateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(8, this, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {Pointer<Integer>} socketAddress_length 
     * @param {Pointer<Pointer<Integer>>} socketAddress 
     * @returns {HRESULT} 
     */
    GetRemoteSocketAddressBytes(socketAddress_length, socketAddress) {
        socketAddress_lengthMarshal := socketAddress_length is VarRef ? "uint*" : "ptr"
        socketAddressMarshal := socketAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, socketAddress_lengthMarshal, socketAddress_length, socketAddressMarshal, socketAddress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} socketAddress_length 
     * @param {Pointer<Pointer<Integer>>} socketAddress 
     * @returns {HRESULT} 
     */
    GetLocalSocketAddressBytes(socketAddress_length, socketAddress) {
        socketAddress_lengthMarshal := socketAddress_length is VarRef ? "uint*" : "ptr"
        socketAddressMarshal := socketAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, socketAddress_lengthMarshal, socketAddress_length, socketAddressMarshal, socketAddress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {XboxLiveEndpointPairTemplate} 
     */
    get_Template() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveEndpointPairTemplate(value)
    }

    /**
     * 
     * @returns {XboxLiveDeviceAddress} 
     */
    get_RemoteDeviceAddress() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveDeviceAddress(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteHostName() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemotePort() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalHostName() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalPort() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
