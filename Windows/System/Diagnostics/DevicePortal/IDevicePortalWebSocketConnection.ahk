#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Networking\Sockets\ServerMessageWebSocket.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Networking\Sockets\ServerStreamWebSocket.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics.DevicePortal
 * @version WindowsRuntime 1.4
 */
class IDevicePortalWebSocketConnection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePortalWebSocketConnection
     * @type {Guid}
     */
    static IID => Guid("{67657920-d65a-42f0-aef4-787808098b7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetServerMessageWebSocketForRequest", "GetServerMessageWebSocketForRequest2", "GetServerMessageWebSocketForRequest3", "GetServerStreamWebSocketForRequest", "GetServerStreamWebSocketForRequest2"]

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @returns {ServerMessageWebSocket} 
     */
    GetServerMessageWebSocketForRequest(request) {
        result := ComCall(6, this, "ptr", request, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ServerMessageWebSocket(result_)
    }

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @param {Integer} messageType 
     * @param {HSTRING} protocol 
     * @returns {ServerMessageWebSocket} 
     */
    GetServerMessageWebSocketForRequest2(request, messageType, protocol) {
        if(protocol is String) {
            pin := HSTRING.Create(protocol)
            protocol := pin.Value
        }
        protocol := protocol is Win32Handle ? NumGet(protocol, "ptr") : protocol

        result := ComCall(7, this, "ptr", request, "int", messageType, "ptr", protocol, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ServerMessageWebSocket(result_)
    }

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @param {Integer} messageType 
     * @param {HSTRING} protocol 
     * @param {Integer} outboundBufferSizeInBytes 
     * @param {Integer} maxMessageSize 
     * @param {Integer} receiveMode 
     * @returns {ServerMessageWebSocket} 
     */
    GetServerMessageWebSocketForRequest3(request, messageType, protocol, outboundBufferSizeInBytes, maxMessageSize, receiveMode) {
        if(protocol is String) {
            pin := HSTRING.Create(protocol)
            protocol := pin.Value
        }
        protocol := protocol is Win32Handle ? NumGet(protocol, "ptr") : protocol

        result := ComCall(8, this, "ptr", request, "int", messageType, "ptr", protocol, "uint", outboundBufferSizeInBytes, "uint", maxMessageSize, "int", receiveMode, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ServerMessageWebSocket(result_)
    }

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @returns {ServerStreamWebSocket} 
     */
    GetServerStreamWebSocketForRequest(request) {
        result := ComCall(9, this, "ptr", request, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ServerStreamWebSocket(result_)
    }

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @param {HSTRING} protocol 
     * @param {Integer} outboundBufferSizeInBytes 
     * @param {Boolean} noDelay 
     * @returns {ServerStreamWebSocket} 
     */
    GetServerStreamWebSocketForRequest2(request, protocol, outboundBufferSizeInBytes, noDelay) {
        if(protocol is String) {
            pin := HSTRING.Create(protocol)
            protocol := pin.Value
        }
        protocol := protocol is Win32Handle ? NumGet(protocol, "ptr") : protocol

        result := ComCall(10, this, "ptr", request, "ptr", protocol, "uint", outboundBufferSizeInBytes, "int", noDelay, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ServerStreamWebSocket(result_)
    }
}
