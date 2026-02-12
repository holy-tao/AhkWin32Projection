#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectInformationElement.ahk
#Include .\IWiFiDirectInformationElementStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information elements in a Wi-Fi Direct packet.
 * @remarks
 * An information element (IE) is a form of structured data which can be included in Wi-Fi Direct packets. IEs are formatted as a variable length value field preceded by type and length fields.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectinformationelement
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectInformationElement extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectInformationElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectInformationElement.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Create an array of information elements from a data buffer.
     * @param {IBuffer} buffer_ The data buffer that contains a information element.
     * @returns {IVector<WiFiDirectInformationElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectinformationelement.createfrombuffer
     */
    static CreateFromBuffer(buffer_) {
        if (!WiFiDirectInformationElement.HasProp("__IWiFiDirectInformationElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectInformationElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectInformationElementStatics.IID)
            WiFiDirectInformationElement.__IWiFiDirectInformationElementStatics := IWiFiDirectInformationElementStatics(factoryPtr)
        }

        return WiFiDirectInformationElement.__IWiFiDirectInformationElementStatics.CreateFromBuffer(buffer_)
    }

    /**
     * Create an array of information elements from a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object.
     * @param {DeviceInformation} deviceInformation_ The device information object that contains the information elements.
     * @returns {IVector<WiFiDirectInformationElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectinformationelement.createfromdeviceinformation
     */
    static CreateFromDeviceInformation(deviceInformation_) {
        if (!WiFiDirectInformationElement.HasProp("__IWiFiDirectInformationElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectInformationElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectInformationElementStatics.IID)
            WiFiDirectInformationElement.__IWiFiDirectInformationElementStatics := IWiFiDirectInformationElementStatics(factoryPtr)
        }

        return WiFiDirectInformationElement.__IWiFiDirectInformationElementStatics.CreateFromDeviceInformation(deviceInformation_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * A three-byte organization identifier used to indicate the organization that defined a vendor extension information element (IE).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectinformationelement.oui
     * @type {IBuffer} 
     */
    Oui {
        get => this.get_Oui()
        set => this.put_Oui(value)
    }

    /**
     * A one byte type value used in a vendor extension information element (IE) to distinguish between different IE formats defined by the same organization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectinformationelement.ouitype
     * @type {Integer} 
     */
    OuiType {
        get => this.get_OuiType()
        set => this.put_OuiType(value)
    }

    /**
     * The value of the information element.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectinformationelement.value
     * @type {IBuffer} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [WiFiDirectInformationElement](wifidirectinformationelement.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectInformationElement")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Oui() {
        if (!this.HasProp("__IWiFiDirectInformationElement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectInformationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectInformationElement := IWiFiDirectInformationElement(outPtr)
        }

        return this.__IWiFiDirectInformationElement.get_Oui()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Oui(value) {
        if (!this.HasProp("__IWiFiDirectInformationElement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectInformationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectInformationElement := IWiFiDirectInformationElement(outPtr)
        }

        return this.__IWiFiDirectInformationElement.put_Oui(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OuiType() {
        if (!this.HasProp("__IWiFiDirectInformationElement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectInformationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectInformationElement := IWiFiDirectInformationElement(outPtr)
        }

        return this.__IWiFiDirectInformationElement.get_OuiType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OuiType(value) {
        if (!this.HasProp("__IWiFiDirectInformationElement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectInformationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectInformationElement := IWiFiDirectInformationElement(outPtr)
        }

        return this.__IWiFiDirectInformationElement.put_OuiType(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Value() {
        if (!this.HasProp("__IWiFiDirectInformationElement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectInformationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectInformationElement := IWiFiDirectInformationElement(outPtr)
        }

        return this.__IWiFiDirectInformationElement.get_Value()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IWiFiDirectInformationElement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectInformationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectInformationElement := IWiFiDirectInformationElement(outPtr)
        }

        return this.__IWiFiDirectInformationElement.put_Value(value)
    }

;@endregion Instance Methods
}
