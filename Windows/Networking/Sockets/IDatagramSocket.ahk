#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DatagramSocketControl.ahk
#Include .\DatagramSocketInformation.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IDatagramSocket extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatagramSocket
     * @type {Guid}
     */
    static IID => Guid("{7fe25bbb-c3bc-4677-8446-ca28a465a3af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Control", "get_Information", "get_OutputStream", "ConnectAsync", "ConnectWithEndpointPairAsync", "BindServiceNameAsync", "BindEndpointAsync", "JoinMulticastGroup", "GetOutputStreamAsync", "GetOutputStreamWithEndpointPairAsync", "add_MessageReceived", "remove_MessageReceived"]

    /**
     * @type {DatagramSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * @type {DatagramSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * 
     * @returns {DatagramSocketControl} 
     */
    get_Control() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DatagramSocketControl(value)
    }

    /**
     * 
     * @returns {DatagramSocketInformation} 
     */
    get_Information() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DatagramSocketInformation(value)
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
    }

    /**
     * 
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @returns {IAsyncAction} 
     */
    ConnectAsync(remoteHostName, remoteServiceName) {
        if(remoteServiceName is String) {
            pin := HSTRING.Create(remoteServiceName)
            remoteServiceName := pin.Value
        }
        remoteServiceName := remoteServiceName is Win32Handle ? NumGet(remoteServiceName, "ptr") : remoteServiceName

        result := ComCall(9, this, "ptr", remoteHostName, "ptr", remoteServiceName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {EndpointPair} endpointPair_ 
     * @returns {IAsyncAction} 
     */
    ConnectWithEndpointPairAsync(endpointPair_) {
        result := ComCall(10, this, "ptr", endpointPair_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} localServiceName 
     * @returns {IAsyncAction} 
     */
    BindServiceNameAsync(localServiceName) {
        if(localServiceName is String) {
            pin := HSTRING.Create(localServiceName)
            localServiceName := pin.Value
        }
        localServiceName := localServiceName is Win32Handle ? NumGet(localServiceName, "ptr") : localServiceName

        result := ComCall(11, this, "ptr", localServiceName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HostName} localHostName 
     * @param {HSTRING} localServiceName 
     * @returns {IAsyncAction} 
     */
    BindEndpointAsync(localHostName, localServiceName) {
        if(localServiceName is String) {
            pin := HSTRING.Create(localServiceName)
            localServiceName := pin.Value
        }
        localServiceName := localServiceName is Win32Handle ? NumGet(localServiceName, "ptr") : localServiceName

        result := ComCall(12, this, "ptr", localHostName, "ptr", localServiceName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HostName} host 
     * @returns {HRESULT} 
     */
    JoinMulticastGroup(host) {
        result := ComCall(13, this, "ptr", host, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @returns {IAsyncOperation<IOutputStream>} 
     */
    GetOutputStreamAsync(remoteHostName, remoteServiceName) {
        if(remoteServiceName is String) {
            pin := HSTRING.Create(remoteServiceName)
            remoteServiceName := pin.Value
        }
        remoteServiceName := remoteServiceName is Win32Handle ? NumGet(remoteServiceName, "ptr") : remoteServiceName

        result := ComCall(14, this, "ptr", remoteHostName, "ptr", remoteServiceName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IOutputStream, value)
    }

    /**
     * 
     * @param {EndpointPair} endpointPair_ 
     * @returns {IAsyncOperation<IOutputStream>} 
     */
    GetOutputStreamWithEndpointPairAsync(endpointPair_) {
        result := ComCall(15, this, "ptr", endpointPair_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IOutputStream, value)
    }

    /**
     * 
     * @param {TypedEventHandler<DatagramSocket, DatagramSocketMessageReceivedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(16, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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

        result := ComCall(17, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
