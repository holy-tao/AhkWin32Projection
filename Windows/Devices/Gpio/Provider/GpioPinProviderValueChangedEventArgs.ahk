#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGpioPinProviderValueChangedEventArgs.ahk
#Include .\IGpioPinProviderValueChangedEventArgsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the [IGpioPinProvider.ValueChanged](igpiopinprovider_valuechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.gpiopinprovidervaluechangedeventargs
 * @namespace Windows.Devices.Gpio.Provider
 * @version WindowsRuntime 1.4
 */
class GpioPinProviderValueChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGpioPinProviderValueChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGpioPinProviderValueChangedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Contructs the [GpioPinProviderValueChangedEventArgs](gpiopinprovidervaluechangedeventargs.md) class with the specified edge value.
     * @param {Integer} edge The desired pin edge.
     * @returns {GpioPinProviderValueChangedEventArgs} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.gpiopinprovidervaluechangedeventargs.#ctor
     */
    static Create(edge) {
        if (!GpioPinProviderValueChangedEventArgs.HasProp("__IGpioPinProviderValueChangedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Gpio.Provider.GpioPinProviderValueChangedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGpioPinProviderValueChangedEventArgsFactory.IID)
            GpioPinProviderValueChangedEventArgs.__IGpioPinProviderValueChangedEventArgsFactory := IGpioPinProviderValueChangedEventArgsFactory(factoryPtr)
        }

        return GpioPinProviderValueChangedEventArgs.__IGpioPinProviderValueChangedEventArgsFactory.Create(edge)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the value the pin has changed to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.gpiopinprovidervaluechangedeventargs.edge
     * @type {Integer} 
     */
    Edge {
        get => this.get_Edge()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Edge() {
        if (!this.HasProp("__IGpioPinProviderValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGpioPinProviderValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPinProviderValueChangedEventArgs := IGpioPinProviderValueChangedEventArgs(outPtr)
        }

        return this.__IGpioPinProviderValueChangedEventArgs.get_Edge()
    }

;@endregion Instance Methods
}
