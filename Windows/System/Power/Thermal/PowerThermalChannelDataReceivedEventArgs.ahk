#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerThermalChannelDataReceivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data that contains one or more PowerThermalChannelData samples delivered to a consumer.
 * @remarks
 * Instances of this class are supplied to handlers of the [PowerThermalChannelDataConsumer.ChannelDataReceived](./powerthermalchanneldataconsumer_channeldatareceived.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldatareceivedeventargs
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalChannelDataReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerThermalChannelDataReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerThermalChannelDataReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the array of PowerThermalChannelData samples carried by the event.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [PowerThermalChannelData](./powerthermalchanneldata.md) structures representing the data included in the event.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldatareceivedeventargs.getdata
     */
    GetData(result_) {
        if (!this.HasProp("__IPowerThermalChannelDataReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataReceivedEventArgs := IPowerThermalChannelDataReceivedEventArgs(outPtr)
        }

        return this.__IPowerThermalChannelDataReceivedEventArgs.GetData(result_)
    }

;@endregion Instance Methods
}
