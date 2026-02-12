#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\ISineEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that accelerates and/or decelerates using a sine formula.
 * @remarks
 * To create a new instance of `SineEasingFunction`, call [CompositionEasingFunction.CreateSineEasingFunction.md](compositioneasingfunction_createsineeasingfunction_1604392907.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.sineeasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class SineEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISineEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISineEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies how the animation interpolates.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateSineEasingFunction.md](compositioneasingfunction_createsineeasingfunction_1604392907.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.sineeasingfunction.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
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
        if (!this.HasProp("__ISineEasingFunction")) {
            if ((queryResult := this.QueryInterface(ISineEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISineEasingFunction := ISineEasingFunction(outPtr)
        }

        return this.__ISineEasingFunction.get_Mode()
    }

;@endregion Instance Methods
}
