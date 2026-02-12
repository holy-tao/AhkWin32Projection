#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandModemIsolation.ahk
#Include .\IMobileBroadbandModemIsolationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class with methods for disallowing and allowing certain types of data traffic through the mobile broadband modem; essentially isolating the user equipment (UE), or device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemisolation
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandModemIsolation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandModemIsolation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandModemIsolation.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of a [MobileBroadbandModemIsolation](mobilebroadbandmodemisolation.md).
     * @param {HSTRING} modemDeviceId The [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) of the mobile broadband device.
     * @param {HSTRING} ruleGroupId An Id used to track the configuration set by the [MobileBroadbandModemIsolation](mobilebroadbandmodemisolation.md) instance being constructed.
     * @returns {MobileBroadbandModemIsolation} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemisolation.#ctor
     */
    static Create(modemDeviceId, ruleGroupId) {
        if (!MobileBroadbandModemIsolation.HasProp("__IMobileBroadbandModemIsolationFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.MobileBroadbandModemIsolation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMobileBroadbandModemIsolationFactory.IID)
            MobileBroadbandModemIsolation.__IMobileBroadbandModemIsolationFactory := IMobileBroadbandModemIsolationFactory(factoryPtr)
        }

        return MobileBroadbandModemIsolation.__IMobileBroadbandModemIsolationFactory.Create(modemDeviceId, ruleGroupId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Adds an allowed host. You can call this method multiple times to add multiple allowed hosts. Traffic to the added host(s) will be allowed after you call [ApplyConfigurationAsync](mobilebroadbandmodemisolation_applyconfigurationasync_10015633.md).
     * @remarks
     * You should add hosts before you call [ApplyConfigurationAsync](mobilebroadbandmodemisolation_applyconfigurationasync_10015633.md). The allowed hosts will be cleared after you call [ClearConfigurationAsync](mobilebroadbandmodemisolation_clearconfigurationasync_491705556.md).
     * @param {HostName} host The allowed host, whose type must be either IPv4 or IPv6.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemisolation.addallowedhost
     */
    AddAllowedHost(host) {
        if (!this.HasProp("__IMobileBroadbandModemIsolation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModemIsolation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModemIsolation := IMobileBroadbandModemIsolation(outPtr)
        }

        return this.__IMobileBroadbandModemIsolation.AddAllowedHost(host)
    }

    /**
     * Adds a range of allowed hosts. You can call this method multiple times to add multiple ranges of allowed hosts. Traffic to the added host(s) will be allowed after you call [ApplyConfigurationAsync](mobilebroadbandmodemisolation_applyconfigurationasync_10015633.md).
     * @remarks
     * You should add hosts before you call [ApplyConfigurationAsync](mobilebroadbandmodemisolation_applyconfigurationasync_10015633.md). The allowed hosts will be cleared after you call [ClearConfigurationAsync](mobilebroadbandmodemisolation_clearconfigurationasync_491705556.md).
     * @param {HostName} first The first allowed host in the range. Its type must be either IPv4 or IPv6.
     * @param {HostName} last The last allowed host in the range. Its type must be the same as that of *first*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemisolation.addallowedhostrange
     */
    AddAllowedHostRange(first, last) {
        if (!this.HasProp("__IMobileBroadbandModemIsolation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModemIsolation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModemIsolation := IMobileBroadbandModemIsolation(outPtr)
        }

        return this.__IMobileBroadbandModemIsolation.AddAllowedHostRange(first, last)
    }

    /**
     * Asynchronously isolates the modem to allow only core networking traffic (such as DHCP, DNS, and ICMP) or traffic to a set of allowed hosts as specified by [AddAllowedHost](mobilebroadbandmodemisolation_addallowedhost_1366538889.md) or [AddAllowedHostRange](mobilebroadbandmodemisolation_addallowedhostrange_316209766.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemisolation.applyconfigurationasync
     */
    ApplyConfigurationAsync() {
        if (!this.HasProp("__IMobileBroadbandModemIsolation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModemIsolation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModemIsolation := IMobileBroadbandModemIsolation(outPtr)
        }

        return this.__IMobileBroadbandModemIsolation.ApplyConfigurationAsync()
    }

    /**
     * Asynchronously allows all traffic through the modem.
     * @remarks
     * If you called [ApplyConfigurationAsync](mobilebroadbandmodemisolation_applyconfigurationasync_10015633.md) to isolate the modem, then calling this method clears that isolation configuration.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemisolation.clearconfigurationasync
     */
    ClearConfigurationAsync() {
        if (!this.HasProp("__IMobileBroadbandModemIsolation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModemIsolation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModemIsolation := IMobileBroadbandModemIsolation(outPtr)
        }

        return this.__IMobileBroadbandModemIsolation.ClearConfigurationAsync()
    }

;@endregion Instance Methods
}
