#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattDescriptorUuidsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattDescriptorUuidsStatics
     * @type {Guid}
     */
    static IID => Guid("{a6f862ce-9cfc-42f1-9185-ff37b75181d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CharacteristicAggregateFormat", "get_CharacteristicExtendedProperties", "get_CharacteristicPresentationFormat", "get_CharacteristicUserDescription", "get_ClientCharacteristicConfiguration", "get_ServerCharacteristicConfiguration"]

    /**
     * @type {Guid} 
     */
    CharacteristicAggregateFormat {
        get => this.get_CharacteristicAggregateFormat()
    }

    /**
     * @type {Guid} 
     */
    CharacteristicExtendedProperties {
        get => this.get_CharacteristicExtendedProperties()
    }

    /**
     * @type {Guid} 
     */
    CharacteristicPresentationFormat {
        get => this.get_CharacteristicPresentationFormat()
    }

    /**
     * @type {Guid} 
     */
    CharacteristicUserDescription {
        get => this.get_CharacteristicUserDescription()
    }

    /**
     * @type {Guid} 
     */
    ClientCharacteristicConfiguration {
        get => this.get_ClientCharacteristicConfiguration()
    }

    /**
     * @type {Guid} 
     */
    ServerCharacteristicConfiguration {
        get => this.get_ServerCharacteristicConfiguration()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CharacteristicAggregateFormat() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CharacteristicExtendedProperties() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CharacteristicPresentationFormat() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CharacteristicUserDescription() {
        value := Guid()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ClientCharacteristicConfiguration() {
        value := Guid()
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
    get_ServerCharacteristicConfiguration() {
        value := Guid()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
