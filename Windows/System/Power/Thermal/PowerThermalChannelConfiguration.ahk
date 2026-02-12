#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerThermalChannelConfiguration.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the configuration of a power/thermal channel, including its identifier, configuration string, and numeric parameters.
 * @remarks
 * Get an instance of this class by calling [PowerThermalChannelDataConsumer.GetChannelConfigurations](./powerthermalchanneldataconsumer_getchannelconfigurations_1473707459.md) or [PowerThermalChannelDataProducer.GetChannelConfigurations](./powerthermalchanneldataproducer_getchannelconfigurations_1473707459.md) and selecting the configuration for a channel.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchannelconfiguration
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalChannelConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerThermalChannelConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerThermalChannelConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier for the channel associated with this configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchannelconfiguration.id
     * @type {PowerThermalChannelId} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a human-readable configuration string that fully describes the settings for a [PowerThermalChannelConfiguration](./powerthermalchannelconfiguration.md).
     * @remarks
     * The **ConfigurationString** is part of the config blob and typically encodes the channel-specific string (for example, the ACPI name for a sensor). It is intended to be readable and interpreted by OEMs.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchannelconfiguration.configurationstring
     * @type {HSTRING} 
     */
    ConfigurationString {
        get => this.get_ConfigurationString()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PowerThermalChannelId} 
     */
    get_Id() {
        if (!this.HasProp("__IPowerThermalChannelConfiguration")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelConfiguration := IPowerThermalChannelConfiguration(outPtr)
        }

        return this.__IPowerThermalChannelConfiguration.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConfigurationString() {
        if (!this.HasProp("__IPowerThermalChannelConfiguration")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelConfiguration := IPowerThermalChannelConfiguration(outPtr)
        }

        return this.__IPowerThermalChannelConfiguration.get_ConfigurationString()
    }

    /**
     * Returns the numeric configuration parameters for the channel, such as thresholds or scaling factors defined on the [PowerThermalChannelConfiguration](./powerthermalchannelconfiguration.md).
     * @remarks
     * Example usages include clamping ranges, polling rates, and other channel-specific numeric settings.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of integers representing numeric parameters for the channel configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchannelconfiguration.getconfigurationnumericparameters
     */
    GetConfigurationNumericParameters(result_) {
        if (!this.HasProp("__IPowerThermalChannelConfiguration")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelConfiguration := IPowerThermalChannelConfiguration(outPtr)
        }

        return this.__IPowerThermalChannelConfiguration.GetConfigurationNumericParameters(result_)
    }

;@endregion Instance Methods
}
