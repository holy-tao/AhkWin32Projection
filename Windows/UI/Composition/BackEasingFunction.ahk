#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\IBackEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an easing function that changes a value in the opposite direction of the main function during part of a duration, then reverses and finishes the function-over-time behavior in a conventional way.
 * @remarks
 * To create a new instance of `BackEasingFunction`, call [CompositionEasingFunction.CreateBackEasingFunction.md](compositioneasingfunction_createbackeasingfunction_1362788343.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.backeasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class BackEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies how the animation interpolates.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateBackEasingFunction.md](compositioneasingfunction_createbackeasingfunction_1362788343.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.backeasingfunction.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * Gets the amplitude of retraction associated with this `BackEasingFunction`.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateBackEasingFunction.md](compositioneasingfunction_createbackeasingfunction_1362788343.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.backeasingfunction.amplitude
     * @type {Float} 
     */
    Amplitude {
        get => this.get_Amplitude()
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
        if (!this.HasProp("__IBackEasingFunction")) {
            if ((queryResult := this.QueryInterface(IBackEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackEasingFunction := IBackEasingFunction(outPtr)
        }

        return this.__IBackEasingFunction.get_Mode()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Amplitude() {
        if (!this.HasProp("__IBackEasingFunction")) {
            if ((queryResult := this.QueryInterface(IBackEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackEasingFunction := IBackEasingFunction(outPtr)
        }

        return this.__IBackEasingFunction.get_Amplitude()
    }

;@endregion Instance Methods
}
