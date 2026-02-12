#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattLocalDescriptorResult.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GattLocalDescriptor.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\GattPresentationFormat.ahk
#Include .\GattSubscribedClient.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include .\GattClientNotificationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattLocalCharacteristic extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattLocalCharacteristic
     * @type {Guid}
     */
    static IID => Guid("{aede376d-5412-4d74-92a8-8deb8526829c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uuid", "get_StaticValue", "get_CharacteristicProperties", "get_ReadProtectionLevel", "get_WriteProtectionLevel", "CreateDescriptorAsync", "get_Descriptors", "get_UserDescription", "get_PresentationFormats", "get_SubscribedClients", "add_SubscribedClientsChanged", "remove_SubscribedClientsChanged", "add_ReadRequested", "remove_ReadRequested", "add_WriteRequested", "remove_WriteRequested", "NotifyValueAsync", "NotifyValueForSubscribedClientAsync"]

    /**
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * @type {IBuffer} 
     */
    StaticValue {
        get => this.get_StaticValue()
    }

    /**
     * @type {Integer} 
     */
    CharacteristicProperties {
        get => this.get_CharacteristicProperties()
    }

    /**
     * @type {Integer} 
     */
    ReadProtectionLevel {
        get => this.get_ReadProtectionLevel()
    }

    /**
     * @type {Integer} 
     */
    WriteProtectionLevel {
        get => this.get_WriteProtectionLevel()
    }

    /**
     * @type {IVectorView<GattLocalDescriptor>} 
     */
    Descriptors {
        get => this.get_Descriptors()
    }

    /**
     * @type {HSTRING} 
     */
    UserDescription {
        get => this.get_UserDescription()
    }

    /**
     * @type {IVectorView<GattPresentationFormat>} 
     */
    PresentationFormats {
        get => this.get_PresentationFormats()
    }

    /**
     * @type {IVectorView<GattSubscribedClient>} 
     */
    SubscribedClients {
        get => this.get_SubscribedClients()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_StaticValue() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacteristicProperties() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadProtectionLevel() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteProtectionLevel() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} descriptorUuid 
     * @param {GattLocalDescriptorParameters} parameters 
     * @returns {IAsyncOperation<GattLocalDescriptorResult>} 
     */
    CreateDescriptorAsync(descriptorUuid, parameters) {
        result := ComCall(11, this, "ptr", descriptorUuid, "ptr", parameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattLocalDescriptorResult, operation)
    }

    /**
     * 
     * @returns {IVectorView<GattLocalDescriptor>} 
     */
    get_Descriptors() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattLocalDescriptor, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDescription() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<GattPresentationFormat>} 
     */
    get_PresentationFormats() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattPresentationFormat, value)
    }

    /**
     * 
     * @returns {IVectorView<GattSubscribedClient>} 
     */
    get_SubscribedClients() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattSubscribedClient, value)
    }

    /**
     * 
     * @param {TypedEventHandler<GattLocalCharacteristic, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SubscribedClientsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_SubscribedClientsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GattLocalCharacteristic, GattReadRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
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
    remove_ReadRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GattLocalCharacteristic, GattWriteRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WriteRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", token, "int")
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
    remove_WriteRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {IAsyncOperation<IVectorView<GattClientNotificationResult>>} 
     */
    NotifyValueAsync(value) {
        result := ComCall(22, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, GattClientNotificationResult), operation)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @param {GattSubscribedClient} subscribedClient 
     * @returns {IAsyncOperation<GattClientNotificationResult>} 
     */
    NotifyValueForSubscribedClientAsync(value, subscribedClient) {
        result := ComCall(23, this, "ptr", value, "ptr", subscribedClient, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattClientNotificationResult, operation)
    }
}
