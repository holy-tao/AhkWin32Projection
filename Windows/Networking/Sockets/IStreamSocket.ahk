#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StreamSocketControl.ahk
#Include .\StreamSocketInformation.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocket extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocket
     * @type {Guid}
     */
    static IID => Guid("{69a22cf3-fc7b-4857-af38-f6e7de6a5b49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Control", "get_Information", "get_InputStream", "get_OutputStream", "ConnectWithEndpointPairAsync", "ConnectAsync1", "ConnectWithEndpointPairAndProtectionLevelAsync", "ConnectWithProtectionLevelAsync", "UpgradeToSslAsync"]

    /**
     * @type {StreamSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * @type {StreamSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * 
     * @returns {StreamSocketControl} 
     */
    get_Control() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamSocketControl(value)
    }

    /**
     * 
     * @returns {StreamSocketInformation} 
     */
    get_Information() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamSocketInformation(value)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(value)
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
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
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @returns {IAsyncAction} 
     */
    ConnectAsync1(remoteHostName, remoteServiceName) {
        if(remoteServiceName is String) {
            pin := HSTRING.Create(remoteServiceName)
            remoteServiceName := pin.Value
        }
        remoteServiceName := remoteServiceName is Win32Handle ? NumGet(remoteServiceName, "ptr") : remoteServiceName

        result := ComCall(11, this, "ptr", remoteHostName, "ptr", remoteServiceName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {EndpointPair} endpointPair_ 
     * @param {Integer} protectionLevel 
     * @returns {IAsyncAction} 
     */
    ConnectWithEndpointPairAndProtectionLevelAsync(endpointPair_, protectionLevel) {
        result := ComCall(12, this, "ptr", endpointPair_, "int", protectionLevel, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HostName} remoteHostName 
     * @param {HSTRING} remoteServiceName 
     * @param {Integer} protectionLevel 
     * @returns {IAsyncAction} 
     */
    ConnectWithProtectionLevelAsync(remoteHostName, remoteServiceName, protectionLevel) {
        if(remoteServiceName is String) {
            pin := HSTRING.Create(remoteServiceName)
            remoteServiceName := pin.Value
        }
        remoteServiceName := remoteServiceName is Win32Handle ? NumGet(remoteServiceName, "ptr") : remoteServiceName

        result := ComCall(13, this, "ptr", remoteHostName, "ptr", remoteServiceName, "int", protectionLevel, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} protectionLevel 
     * @param {HostName} validationHostName 
     * @returns {IAsyncAction} 
     */
    UpgradeToSslAsync(protectionLevel, validationHostName) {
        result := ComCall(14, this, "int", protectionLevel, "ptr", validationHostName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
