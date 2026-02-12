#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class IProximityDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProximityDevice
     * @type {Guid}
     */
    static IID => Guid("{efa8a552-f6e1-4329-a0fc-ab6b0fd28262}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SubscribeForMessage", "PublishMessage", "PublishMessageWithCallback", "PublishBinaryMessage", "PublishBinaryMessageWithCallback", "PublishUriMessage", "PublishUriMessageWithCallback", "StopSubscribingForMessage", "StopPublishingMessage", "add_DeviceArrived", "remove_DeviceArrived", "add_DeviceDeparted", "remove_DeviceDeparted", "get_MaxMessageBytes", "get_BitsPerSecond", "get_DeviceId"]

    /**
     * @type {Integer} 
     */
    MaxMessageBytes {
        get => this.get_MaxMessageBytes()
    }

    /**
     * @type {Integer} 
     */
    BitsPerSecond {
        get => this.get_BitsPerSecond()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * 
     * @param {HSTRING} messageType 
     * @param {MessageReceivedHandler} messageReceivedHandler_ 
     * @returns {Integer} 
     */
    SubscribeForMessage(messageType, messageReceivedHandler_) {
        if(messageType is String) {
            pin := HSTRING.Create(messageType)
            messageType := pin.Value
        }
        messageType := messageType is Win32Handle ? NumGet(messageType, "ptr") : messageType

        result := ComCall(6, this, "ptr", messageType, "ptr", messageReceivedHandler_, "int64*", &subscriptionId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return subscriptionId
    }

    /**
     * 
     * @param {HSTRING} messageType 
     * @param {HSTRING} message 
     * @returns {Integer} 
     */
    PublishMessage(messageType, message) {
        if(messageType is String) {
            pin := HSTRING.Create(messageType)
            messageType := pin.Value
        }
        messageType := messageType is Win32Handle ? NumGet(messageType, "ptr") : messageType
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(7, this, "ptr", messageType, "ptr", message, "int64*", &messageId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return messageId
    }

    /**
     * 
     * @param {HSTRING} messageType 
     * @param {HSTRING} message 
     * @param {MessageTransmittedHandler} messageTransmittedHandler_ 
     * @returns {Integer} 
     */
    PublishMessageWithCallback(messageType, message, messageTransmittedHandler_) {
        if(messageType is String) {
            pin := HSTRING.Create(messageType)
            messageType := pin.Value
        }
        messageType := messageType is Win32Handle ? NumGet(messageType, "ptr") : messageType
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(8, this, "ptr", messageType, "ptr", message, "ptr", messageTransmittedHandler_, "int64*", &messageId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return messageId
    }

    /**
     * 
     * @param {HSTRING} messageType 
     * @param {IBuffer} message 
     * @returns {Integer} 
     */
    PublishBinaryMessage(messageType, message) {
        if(messageType is String) {
            pin := HSTRING.Create(messageType)
            messageType := pin.Value
        }
        messageType := messageType is Win32Handle ? NumGet(messageType, "ptr") : messageType

        result := ComCall(9, this, "ptr", messageType, "ptr", message, "int64*", &messageId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return messageId
    }

    /**
     * 
     * @param {HSTRING} messageType 
     * @param {IBuffer} message 
     * @param {MessageTransmittedHandler} messageTransmittedHandler_ 
     * @returns {Integer} 
     */
    PublishBinaryMessageWithCallback(messageType, message, messageTransmittedHandler_) {
        if(messageType is String) {
            pin := HSTRING.Create(messageType)
            messageType := pin.Value
        }
        messageType := messageType is Win32Handle ? NumGet(messageType, "ptr") : messageType

        result := ComCall(10, this, "ptr", messageType, "ptr", message, "ptr", messageTransmittedHandler_, "int64*", &messageId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return messageId
    }

    /**
     * 
     * @param {Uri} message 
     * @returns {Integer} 
     */
    PublishUriMessage(message) {
        result := ComCall(11, this, "ptr", message, "int64*", &messageId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return messageId
    }

    /**
     * 
     * @param {Uri} message 
     * @param {MessageTransmittedHandler} messageTransmittedHandler_ 
     * @returns {Integer} 
     */
    PublishUriMessageWithCallback(message, messageTransmittedHandler_) {
        result := ComCall(12, this, "ptr", message, "ptr", messageTransmittedHandler_, "int64*", &messageId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return messageId
    }

    /**
     * 
     * @param {Integer} subscriptionId 
     * @returns {HRESULT} 
     */
    StopSubscribingForMessage(subscriptionId) {
        result := ComCall(13, this, "int64", subscriptionId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} messageId 
     * @returns {HRESULT} 
     */
    StopPublishingMessage(messageId) {
        result := ComCall(14, this, "int64", messageId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DeviceArrivedEventHandler} arrivedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_DeviceArrived(arrivedHandler) {
        cookie := EventRegistrationToken()
        result := ComCall(15, this, "ptr", arrivedHandler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_DeviceArrived(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(16, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DeviceDepartedEventHandler} departedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_DeviceDeparted(departedHandler) {
        cookie := EventRegistrationToken()
        result := ComCall(17, this, "ptr", departedHandler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_DeviceDeparted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(18, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessageBytes() {
        result := ComCall(19, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerSecond() {
        result := ComCall(20, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
