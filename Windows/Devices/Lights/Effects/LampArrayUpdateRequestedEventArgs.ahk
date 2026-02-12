#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampArrayUpdateRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [UpdateRequested](lamparraycustomeffect_updaterequested.md) event.
 * @remarks
 * Cannot call any methods on the object given by the event handler, outside of the event handler.
 * 
 * No effect progress cannot continue until the event handler has returned, so ensure the minimal is spent within it.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayupdaterequestedeventargs
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayUpdateRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArrayUpdateRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArrayUpdateRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time since the effect was started.
     * @remarks
     * Will always be 0 at the start of a playlist iteration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayupdaterequestedeventargs.sincestarted
     * @type {TimeSpan} 
     */
    SinceStarted {
        get => this.get_SinceStarted()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SinceStarted() {
        if (!this.HasProp("__ILampArrayUpdateRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILampArrayUpdateRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayUpdateRequestedEventArgs := ILampArrayUpdateRequestedEventArgs(outPtr)
        }

        return this.__ILampArrayUpdateRequestedEventArgs.get_SinceStarted()
    }

    /**
     * Sets every lamp index specified in the effect to the desired color.
     * @remarks
     * If a lamp doesn't support the desired color, it is set to the [NearestSupportedColor](../windows.devices.lights/lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Color} desiredColor Desired color to set every lamp to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayupdaterequestedeventargs.setcolor
     */
    SetColor(desiredColor) {
        if (!this.HasProp("__ILampArrayUpdateRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILampArrayUpdateRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayUpdateRequestedEventArgs := ILampArrayUpdateRequestedEventArgs(outPtr)
        }

        return this.__ILampArrayUpdateRequestedEventArgs.SetColor(desiredColor)
    }

    /**
     * Sets the lamp corresponding to the index to the desired color.
     * @remarks
     * If the lamp at the index doesn't support the desired color, it is set to the [NearestSupportedColor](../windows.devices.lights/lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * If the index does not exist on the device or was not specified in the effect, the call fails silently.
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Integer} lampIndex The lamp index.
     * @param {Color} desiredColor The desired color.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayupdaterequestedeventargs.setcolorforindex
     */
    SetColorForIndex(lampIndex, desiredColor) {
        if (!this.HasProp("__ILampArrayUpdateRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILampArrayUpdateRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayUpdateRequestedEventArgs := ILampArrayUpdateRequestedEventArgs(outPtr)
        }

        return this.__ILampArrayUpdateRequestedEventArgs.SetColorForIndex(lampIndex, desiredColor)
    }

    /**
     * Sets all lamps specified to the same color.
     * @remarks
     * If the lamp doesn't support the desired color, it is set to the [NearestSupportedColor](../windows.devices.lights/lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * If an index does not exist on the device or was not specified in the effect, it is ignored and the remaining are still applied.
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Color} desiredColor The desired color.
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes Array of lamp indexes to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayupdaterequestedeventargs.setsinglecolorforindices
     */
    SetSingleColorForIndices(desiredColor, lampIndexes_length, lampIndexes) {
        if (!this.HasProp("__ILampArrayUpdateRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILampArrayUpdateRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayUpdateRequestedEventArgs := ILampArrayUpdateRequestedEventArgs(outPtr)
        }

        return this.__ILampArrayUpdateRequestedEventArgs.SetSingleColorForIndices(desiredColor, lampIndexes_length, lampIndexes)
    }

    /**
     * Sets the color for multiple lamps. Position within each array maps lamp index to desired color.
     * @remarks
     * Size of desiredColors and lampIndexes arrays must be identical or call will fail.
     * 
     * If the lamp doesn't support the desired color, it is set to the [NearestSupportedColor](../windows.devices.lights/lampinfo_getnearestsupportedcolor_1689565521.md)
     * 
     * If an index does not exist on the device or was not specified in the effect, it is ignored and the remaining are still applied.
     * 
     * [Black](../windows.ui/colors_black.md) is equivalent to a lamp being 'off'.
     * @param {Integer} desiredColors_length 
     * @param {Pointer<Color>} desiredColors Array of desired colors.
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes Array of corresponding lamp indexes to modify.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayupdaterequestedeventargs.setcolorsforindices
     */
    SetColorsForIndices(desiredColors_length, desiredColors, lampIndexes_length, lampIndexes) {
        if (!this.HasProp("__ILampArrayUpdateRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILampArrayUpdateRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayUpdateRequestedEventArgs := ILampArrayUpdateRequestedEventArgs(outPtr)
        }

        return this.__ILampArrayUpdateRequestedEventArgs.SetColorsForIndices(desiredColors_length, desiredColors, lampIndexes_length, lampIndexes)
    }

;@endregion Instance Methods
}
