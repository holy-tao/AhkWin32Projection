#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectConnectionParameters.ahk
#Include .\IWiFiDirectConnectionParameters2.ahk
#Include .\IWiFiDirectConnectionParametersStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used by an app to specify the connection parameters for a Wi-Fi Direct connect/pairing operation.
  * 
  * Sample applications that use this class include the [Wi-Fi Direct sample](/samples/microsoft/windows-universal-samples/wifidirect/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionparameters
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectConnectionParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectConnectionParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectConnectionParameters.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a list of the [DevicePairingKinds](../windows.devices.enumeration/devicepairingkinds.md) supporting the given configuration method.
     * @param {Integer} configurationMethod A value specifying a configuration method.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionparameters.getdevicepairingkinds
     */
    static GetDevicePairingKinds(configurationMethod) {
        if (!WiFiDirectConnectionParameters.HasProp("__IWiFiDirectConnectionParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectConnectionParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiDirectConnectionParametersStatics.IID)
            WiFiDirectConnectionParameters.__IWiFiDirectConnectionParametersStatics := IWiFiDirectConnectionParametersStatics(factoryPtr)
        }

        return WiFiDirectConnectionParameters.__IWiFiDirectConnectionParametersStatics.GetDevicePairingKinds(configurationMethod)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The group owner intent value used for group owner negotiation in a Wi-Fi Direct connect/pairing operation.
     * @remarks
     * The default value for this property is 14. So the [WiFiDirectConnectionListener](wifidirectconnectionlistener.md) will try hard to be the group owner without forcing the issue.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionparameters.groupownerintent
     * @type {Integer} 
     */
    GroupOwnerIntent {
        get => this.get_GroupOwnerIntent()
        set => this.put_GroupOwnerIntent(value)
    }

    /**
     * Gets a list of supported configuration methods, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionparameters.preferenceorderedconfigurationmethods
     * @type {IVector<Integer>} 
     */
    PreferenceOrderedConfigurationMethods {
        get => this.get_PreferenceOrderedConfigurationMethods()
    }

    /**
     * Gets or sets a value specifying a device's preferred pairing procedure.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectconnectionparameters.preferredpairingprocedure
     * @type {Integer} 
     */
    PreferredPairingProcedure {
        get => this.get_PreferredPairingProcedure()
        set => this.put_PreferredPairingProcedure(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [WiFiDirectConnectionParameters](wifidirectconnectionparameters.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectConnectionParameters")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GroupOwnerIntent() {
        if (!this.HasProp("__IWiFiDirectConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionParameters := IWiFiDirectConnectionParameters(outPtr)
        }

        return this.__IWiFiDirectConnectionParameters.get_GroupOwnerIntent()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_GroupOwnerIntent(value) {
        if (!this.HasProp("__IWiFiDirectConnectionParameters")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionParameters := IWiFiDirectConnectionParameters(outPtr)
        }

        return this.__IWiFiDirectConnectionParameters.put_GroupOwnerIntent(value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_PreferenceOrderedConfigurationMethods() {
        if (!this.HasProp("__IWiFiDirectConnectionParameters2")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionParameters2 := IWiFiDirectConnectionParameters2(outPtr)
        }

        return this.__IWiFiDirectConnectionParameters2.get_PreferenceOrderedConfigurationMethods()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredPairingProcedure() {
        if (!this.HasProp("__IWiFiDirectConnectionParameters2")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionParameters2 := IWiFiDirectConnectionParameters2(outPtr)
        }

        return this.__IWiFiDirectConnectionParameters2.get_PreferredPairingProcedure()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PreferredPairingProcedure(value) {
        if (!this.HasProp("__IWiFiDirectConnectionParameters2")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectConnectionParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectConnectionParameters2 := IWiFiDirectConnectionParameters2(outPtr)
        }

        return this.__IWiFiDirectConnectionParameters2.put_PreferredPairingProcedure(value)
    }

;@endregion Instance Methods
}
