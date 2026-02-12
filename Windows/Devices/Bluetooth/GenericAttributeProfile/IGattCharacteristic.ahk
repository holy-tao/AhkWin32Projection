#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GattDescriptor.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\GattPresentationFormat.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattReadResult.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\GattReadClientCharacteristicConfigurationDescriptorResult.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristic extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristic
     * @type {Guid}
     */
    static IID => Guid("{59cb50c1-5934-4f68-a198-eb864fa44e6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescriptors", "get_CharacteristicProperties", "get_ProtectionLevel", "put_ProtectionLevel", "get_UserDescription", "get_Uuid", "get_AttributeHandle", "get_PresentationFormats", "ReadValueAsync", "ReadValueWithCacheModeAsync", "WriteValueAsync", "WriteValueWithOptionAsync", "ReadClientCharacteristicConfigurationDescriptorAsync", "WriteClientCharacteristicConfigurationDescriptorAsync", "add_ValueChanged", "remove_ValueChanged"]

    /**
     * @type {Integer} 
     */
    CharacteristicProperties {
        get => this.get_CharacteristicProperties()
    }

    /**
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
        set => this.put_ProtectionLevel(value)
    }

    /**
     * @type {HSTRING} 
     */
    UserDescription {
        get => this.get_UserDescription()
    }

    /**
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * @type {Integer} 
     */
    AttributeHandle {
        get => this.get_AttributeHandle()
    }

    /**
     * @type {IVectorView<GattPresentationFormat>} 
     */
    PresentationFormats {
        get => this.get_PresentationFormats()
    }

    /**
     * 
     * @param {Guid} descriptorUuid 
     * @returns {IVectorView<GattDescriptor>} 
     */
    GetDescriptors(descriptorUuid) {
        result := ComCall(6, this, "ptr", descriptorUuid, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattDescriptor, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacteristicProperties() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProtectionLevel(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDescription() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        value := Guid()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttributeHandle() {
        result := ComCall(12, this, "ushort*", &value := 0, "int")
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
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattPresentationFormat, value)
    }

    /**
     * 
     * @returns {IAsyncOperation<GattReadResult>} 
     */
    ReadValueAsync() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattReadResult, value)
    }

    /**
     * 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattReadResult>} 
     */
    ReadValueWithCacheModeAsync(cacheMode_) {
        result := ComCall(15, this, "int", cacheMode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattReadResult, value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {IAsyncOperation<Integer>} 
     */
    WriteValueAsync(value) {
        result := ComCall(16, this, "ptr", value, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOp)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @param {Integer} writeOption 
     * @returns {IAsyncOperation<Integer>} 
     */
    WriteValueWithOptionAsync(value, writeOption) {
        result := ComCall(17, this, "ptr", value, "int", writeOption, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOp)
    }

    /**
     * 
     * @returns {IAsyncOperation<GattReadClientCharacteristicConfigurationDescriptorResult>} 
     */
    ReadClientCharacteristicConfigurationDescriptorAsync() {
        result := ComCall(18, this, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattReadClientCharacteristicConfigurationDescriptorResult, asyncOp)
    }

    /**
     * 
     * @param {Integer} clientCharacteristicConfigurationDescriptorValue 
     * @returns {IAsyncOperation<Integer>} 
     */
    WriteClientCharacteristicConfigurationDescriptorAsync(clientCharacteristicConfigurationDescriptorValue) {
        result := ComCall(19, this, "int", clientCharacteristicConfigurationDescriptorValue, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), asyncOp)
    }

    /**
     * 
     * @param {TypedEventHandler<GattCharacteristic, GattValueChangedEventArgs>} valueChangedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ValueChanged(valueChangedHandler) {
        valueChangedEventCookie := EventRegistrationToken()
        result := ComCall(20, this, "ptr", valueChangedHandler, "ptr", valueChangedEventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return valueChangedEventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} valueChangedEventCookie 
     * @returns {HRESULT} 
     */
    remove_ValueChanged(valueChangedEventCookie) {
        valueChangedEventCookie := valueChangedEventCookie is Win32Handle ? NumGet(valueChangedEventCookie, "ptr") : valueChangedEventCookie

        result := ComCall(21, this, "ptr", valueChangedEventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
