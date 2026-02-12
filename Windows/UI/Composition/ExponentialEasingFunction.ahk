#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\IExponentialEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that accelerates and/or decelerates using an exponential formula.
 * @remarks
 * To create a new instance of `ExponentialEasingFunction`, call [CompositionEasingFunction.CreateExponentialEasingFunction.md](compositioneasingfunction_createexponentialeasingfunction_1386773538.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.exponentialeasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ExponentialEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExponentialEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExponentialEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies how the animation interpolates.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateExponentialEasingFunction.md](compositioneasingfunction_createexponentialeasingfunction_1386773538.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.exponentialeasingfunction.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * Gets the exponent used to determine the interpolation of the animation.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateExponentialEasingFunction.md](compositioneasingfunction_createexponentialeasingfunction_1386773538.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.exponentialeasingfunction.exponent
     * @type {Float} 
     */
    Exponent {
        get => this.get_Exponent()
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
        if (!this.HasProp("__IExponentialEasingFunction")) {
            if ((queryResult := this.QueryInterface(IExponentialEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExponentialEasingFunction := IExponentialEasingFunction(outPtr)
        }

        return this.__IExponentialEasingFunction.get_Mode()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Exponent() {
        if (!this.HasProp("__IExponentialEasingFunction")) {
            if ((queryResult := this.QueryInterface(IExponentialEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExponentialEasingFunction := IExponentialEasingFunction(outPtr)
        }

        return this.__IExponentialEasingFunction.get_Exponent()
    }

;@endregion Instance Methods
}
