#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\GattPresentationFormat.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattLocalCharacteristicParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattLocalCharacteristicParameters
     * @type {Guid}
     */
    static IID => Guid("{faf73db4-4cff-44c7-8445-040e6ead0063}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_StaticValue", "get_StaticValue", "put_CharacteristicProperties", "get_CharacteristicProperties", "put_ReadProtectionLevel", "get_ReadProtectionLevel", "put_WriteProtectionLevel", "get_WriteProtectionLevel", "put_UserDescription", "get_UserDescription", "get_PresentationFormats"]

    /**
     * @type {IBuffer} 
     */
    StaticValue {
        get => this.get_StaticValue()
        set => this.put_StaticValue(value)
    }

    /**
     * @type {Integer} 
     */
    CharacteristicProperties {
        get => this.get_CharacteristicProperties()
        set => this.put_CharacteristicProperties(value)
    }

    /**
     * @type {Integer} 
     */
    ReadProtectionLevel {
        get => this.get_ReadProtectionLevel()
        set => this.put_ReadProtectionLevel(value)
    }

    /**
     * @type {Integer} 
     */
    WriteProtectionLevel {
        get => this.get_WriteProtectionLevel()
        set => this.put_WriteProtectionLevel(value)
    }

    /**
     * @type {HSTRING} 
     */
    UserDescription {
        get => this.get_UserDescription()
        set => this.put_UserDescription(value)
    }

    /**
     * @type {IVector<GattPresentationFormat>} 
     */
    PresentationFormats {
        get => this.get_PresentationFormats()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_StaticValue(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacteristicProperties(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacteristicProperties() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
    put_ReadProtectionLevel(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadProtectionLevel() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_WriteProtectionLevel(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteProtectionLevel() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserDescription(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
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
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<GattPresentationFormat>} 
     */
    get_PresentationFormats() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(GattPresentationFormat, value)
    }
}
