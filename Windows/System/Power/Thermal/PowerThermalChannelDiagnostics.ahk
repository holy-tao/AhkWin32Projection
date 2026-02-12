#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerThermalChannelDiagnostics.ahk
#Include .\IPowerThermalChannelDiagnosticsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides APIs for retrieving diagnostics, health indicators, and recent samples for power/thermal channels.
 * @remarks
 * Get an instance of this class from the singleton [PowerThermalChannelDiagnostics.Current](./powerthermalchanneldiagnostics_current.md).
 * 
 * The diagnostics class does not claim exclusive ownership of channels and should not be used as a replacement for a Consumer when exclusive ownership is required. Avoid using this class during tuning scenarios; if the backend driver is not running, methods may throw ERROR_SERVICE_NOT_ACTIVE.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldiagnostics
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalChannelDiagnostics extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerThermalChannelDiagnostics

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerThermalChannelDiagnostics.IID

    /**
     * Gets the singleton diagnostics object for querying current channel metrics and health.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldiagnostics.current
     * @type {PowerThermalChannelDiagnostics} 
     */
    static Current {
        get => PowerThermalChannelDiagnostics.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {PowerThermalChannelDiagnostics} 
     */
    static get_Current() {
        if (!PowerThermalChannelDiagnostics.HasProp("__IPowerThermalChannelDiagnosticsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Thermal.PowerThermalChannelDiagnostics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerThermalChannelDiagnosticsStatics.IID)
            PowerThermalChannelDiagnostics.__IPowerThermalChannelDiagnosticsStatics := IPowerThermalChannelDiagnosticsStatics(factoryPtr)
        }

        return PowerThermalChannelDiagnostics.__IPowerThermalChannelDiagnosticsStatics.get_Current()
    }

    /**
     * Retrieves diagnostic data samples for the specified channels.
     * @param {Integer} channelIds_length 
     * @param {Pointer<PowerThermalChannelId>} channelIds An array of [PowerThermalChannelId](./powerthermalchannelid.md) values specifying which channels to query.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [PowerThermalChannelData](./powerthermalchanneldata.md) structures containing diagnostic data for the requested channels.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldiagnostics.getdataforchannels
     */
    static GetDataForChannels(channelIds_length, channelIds, result_) {
        if (!PowerThermalChannelDiagnostics.HasProp("__IPowerThermalChannelDiagnosticsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Thermal.PowerThermalChannelDiagnostics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerThermalChannelDiagnosticsStatics.IID)
            PowerThermalChannelDiagnostics.__IPowerThermalChannelDiagnosticsStatics := IPowerThermalChannelDiagnosticsStatics(factoryPtr)
        }

        return PowerThermalChannelDiagnostics.__IPowerThermalChannelDiagnosticsStatics.GetDataForChannels(channelIds_length, channelIds, result_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
