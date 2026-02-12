#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\ICircleEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that accelerates and/or decelerates using a circular function.
 * @remarks
 * To create a new instance of `CircleEasingFunction`, call [CompositionEasingFunction.CreateCircleEasingFunction.md](compositioneasingfunction_createcircleeasingfunction_267582094.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.circleeasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CircleEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICircleEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICircleEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies how the animation interpolates.
     * @remarks
     * The value of this property is set as a parameter of the [CompositionEasingFunction.CreateCircleEasingFunction.md](compositioneasingfunction_createcircleeasingfunction_267582094.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.circleeasingfunction.mode
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
        if (!this.HasProp("__ICircleEasingFunction")) {
            if ((queryResult := this.QueryInterface(ICircleEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICircleEasingFunction := ICircleEasingFunction(outPtr)
        }

        return this.__ICircleEasingFunction.get_Mode()
    }

;@endregion Instance Methods
}
