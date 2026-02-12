#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionAnimation.ahk
#Include .\IExpressionAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * A Composition Animation that uses a mathematical equation to calculate the value for an animating property every frame.
 * @remarks
 * The core of ExpressionAnimations allows a developer to define a mathematical equation that can be used to calculate the value of a targeted animating property each frame. This contrasts [KeyFrameAnimation](keyframeanimation.md) s, which use an interpolator to define how the animating property changes over time. The mathematical equation can be defined using references to properties of Composition objects, mathematical functions and operators and Input. Expression Animations open the door to making experiences such as sticky headers and parallax easily describable.
 * 
 * For a detailed walkthrough of using Composition ExpressionAnimation, check out the [Animations Overview document](/windows/uwp/graphics/composition-animation).
 * 
 * Use the [CompostionObject.StartAnimation](compositionobject_startanimation_709050842.md) and [CompostionObject.StopAnimation](compositionobject_stopanimation_1075337060.md) methods to start and stop the animation.
 * 
 * For a list of animatable properties, see the remarks on [CompostionObject.StartAnimation](compositionobject_startanimation_709050842.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.expressionanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ExpressionAnimation extends CompositionAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExpressionAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExpressionAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The mathematical equation specifying how the animated value is calculated each frame. The Expression is the core of an [ExpressionAnimation](expressionanimation.md) and represents the equation the system will use to calculate the value of the animation property each frame. The equation is set on this property in the form of a string. Although expressions can be defined by simple mathematical equations such as “2+2”, the real power lies in creating mathematical relationships where the input values can change frame over frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.expressionanimation.expression
     * @type {HSTRING} 
     */
    Expression {
        get => this.get_Expression()
        set => this.put_Expression(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Expression() {
        if (!this.HasProp("__IExpressionAnimation")) {
            if ((queryResult := this.QueryInterface(IExpressionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpressionAnimation := IExpressionAnimation(outPtr)
        }

        return this.__IExpressionAnimation.get_Expression()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Expression(value) {
        if (!this.HasProp("__IExpressionAnimation")) {
            if ((queryResult := this.QueryInterface(IExpressionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpressionAnimation := IExpressionAnimation(outPtr)
        }

        return this.__IExpressionAnimation.put_Expression(value)
    }

;@endregion Instance Methods
}
