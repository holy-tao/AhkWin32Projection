#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\IElasticEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that resembles a spring oscillating back and forth until it comes to rest.
 * @remarks
 * To create a new instance of `ElasticEasingFunction`, call [CompositionEasingFunction.CreateElasticEasingFunction.md](compositioneasingfunction_createelasticeasingfunction_1168420068.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.elasticeasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ElasticEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IElasticEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IElasticEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies how the animation interpolates.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateElasticEasingFunction.md](compositioneasingfunction_createelasticeasingfunction_1168420068.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.elasticeasingfunction.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * Gets the number of times the target slides back and forth over the animation destination.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateElasticEasingFunction.md](compositioneasingfunction_createelasticeasingfunction_1168420068.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.elasticeasingfunction.oscillations
     * @type {Integer} 
     */
    Oscillations {
        get => this.get_Oscillations()
    }

    /**
     * Gets the stiffness of the spring. The smaller the `Springiness` value is, the stiffer the spring and the faster the elasticity decreases in intensity over each oscillation.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateElasticEasingFunction.md](compositioneasingfunction_createelasticeasingfunction_1168420068.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.elasticeasingfunction.springiness
     * @type {Float} 
     */
    Springiness {
        get => this.get_Springiness()
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
        if (!this.HasProp("__IElasticEasingFunction")) {
            if ((queryResult := this.QueryInterface(IElasticEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElasticEasingFunction := IElasticEasingFunction(outPtr)
        }

        return this.__IElasticEasingFunction.get_Mode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Oscillations() {
        if (!this.HasProp("__IElasticEasingFunction")) {
            if ((queryResult := this.QueryInterface(IElasticEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElasticEasingFunction := IElasticEasingFunction(outPtr)
        }

        return this.__IElasticEasingFunction.get_Oscillations()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Springiness() {
        if (!this.HasProp("__IElasticEasingFunction")) {
            if ((queryResult := this.QueryInterface(IElasticEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElasticEasingFunction := IElasticEasingFunction(outPtr)
        }

        return this.__IElasticEasingFunction.get_Springiness()
    }

;@endregion Instance Methods
}
