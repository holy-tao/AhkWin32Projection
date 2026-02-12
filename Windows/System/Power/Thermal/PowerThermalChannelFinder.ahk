#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerThermalChannelFinderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides helper APIs to locate power/thermal channels exposed by the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchannelfinder
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalChannelFinder extends IInspectable {
;@region Static Methods
    /**
     * Searches the system for available power/thermal channels that match the specified interface type.
     * @param {Guid} channelInterfaceType A Guid that identifies the channel interface type to search for.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [PowerThermalChannelId](./powerthermalchannelid.md) values for channels that match the provided interface type.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchannelfinder.findchannels
     */
    static FindChannels(channelInterfaceType, result_) {
        if (!PowerThermalChannelFinder.HasProp("__IPowerThermalChannelFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Thermal.PowerThermalChannelFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerThermalChannelFinderStatics.IID)
            PowerThermalChannelFinder.__IPowerThermalChannelFinderStatics := IPowerThermalChannelFinderStatics(factoryPtr)
        }

        return PowerThermalChannelFinder.__IPowerThermalChannelFinderStatics.FindChannels(channelInterfaceType, result_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
