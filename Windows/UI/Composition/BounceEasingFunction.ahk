#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\IBounceEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animated bouncing effect.
 * @remarks
 * To create a new instance of `BounceEasingFunction`, call [CompositionEasingFunction.CreateBounceEasingFunction.md](compositioneasingfunction_createbounceeasingfunction_258225085.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bounceeasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class BounceEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBounceEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBounceEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies how the animation interpolates.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateBounceEasingFunction.md](compositioneasingfunction_createbounceeasingfunction_258225085.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bounceeasingfunction.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * Gets the number of bounces.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateBounceEasingFunction.md](compositioneasingfunction_createbounceeasingfunction_258225085.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bounceeasingfunction.bounces
     * @type {Integer} 
     */
    Bounces {
        get => this.get_Bounces()
    }

    /**
     * Gets a value that specifies how bouncy the bounce animation is. Low values of this property result in bounces with little loss of height between bounces (more bouncy) while high values result in dampened bounces (less bouncy).
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateBounceEasingFunction.md](compositioneasingfunction_createbounceeasingfunction_258225085.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bounceeasingfunction.bounciness
     * @type {Float} 
     */
    Bounciness {
        get => this.get_Bounciness()
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
        if (!this.HasProp("__IBounceEasingFunction")) {
            if ((queryResult := this.QueryInterface(IBounceEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceEasingFunction := IBounceEasingFunction(outPtr)
        }

        return this.__IBounceEasingFunction.get_Mode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bounces() {
        if (!this.HasProp("__IBounceEasingFunction")) {
            if ((queryResult := this.QueryInterface(IBounceEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceEasingFunction := IBounceEasingFunction(outPtr)
        }

        return this.__IBounceEasingFunction.get_Bounces()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Bounciness() {
        if (!this.HasProp("__IBounceEasingFunction")) {
            if ((queryResult := this.QueryInterface(IBounceEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceEasingFunction := IBounceEasingFunction(outPtr)
        }

        return this.__IBounceEasingFunction.get_Bounciness()
    }

;@endregion Instance Methods
}
