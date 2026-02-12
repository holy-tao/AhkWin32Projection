#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\IPowerEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that accelerates and/or decelerates using the formula *f* (*t*) = *t**<sup>p</sup>* where *p* is equal to the [Power](powereasingfunction_power.md) property.
 * @remarks
 * To create a new instance of `PowerEasingFunction`, call [CompositionEasingFunction.CreatePowerEasingFunction.md](compositioneasingfunction_createpowereasingfunction_938448542.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.powereasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class PowerEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies how the animation interpolates.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreatePowerEasingFunction.md](compositioneasingfunction_createpowereasingfunction_938448542.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.powereasingfunction.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * Gets the exponential power of the animation interpolation. For example, a value of 7 creates an animation interpolation curve that follows the formula *f* (*t*) = *t*<sup>7</sup>.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreatePowerEasingFunction.md](compositioneasingfunction_createpowereasingfunction_938448542.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.powereasingfunction.power
     * @type {Float} 
     */
    Power {
        get => this.get_Power()
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
    get_Mode() {
        if (!this.HasProp("__IPowerEasingFunction")) {
            if ((queryResult := this.QueryInterface(IPowerEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerEasingFunction := IPowerEasingFunction(outPtr)
        }

        return this.__IPowerEasingFunction.get_Mode()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Power() {
        if (!this.HasProp("__IPowerEasingFunction")) {
            if ((queryResult := this.QueryInterface(IPowerEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerEasingFunction := IPowerEasingFunction(outPtr)
        }

        return this.__IPowerEasingFunction.get_Power()
    }

;@endregion Instance Methods
}
