#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NaturalMotionAnimation.ahk
#Include .\IScalarNaturalMotionAnimation.ahk
#Include .\IScalarNaturalMotionAnimationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * The base Scalar NaturalMotionAnimation used to target a Scalar property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scalarnaturalmotionanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ScalarNaturalMotionAnimation extends NaturalMotionAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScalarNaturalMotionAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScalarNaturalMotionAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates where the animation ends.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scalarnaturalmotionanimation.finalvalue
     * @type {IReference<Float>} 
     */
    FinalValue {
        get => this.get_FinalValue()
        set => this.put_FinalValue(value)
    }

    /**
     * Gets or sets a value that indicates where the animation starts.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scalarnaturalmotionanimation.initialvalue
     * @type {IReference<Float>} 
     */
    InitialValue {
        get => this.get_InitialValue()
        set => this.put_InitialValue(value)
    }

    /**
     * Gets or sets the velocity that the animation starts with.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scalarnaturalmotionanimation.initialvelocity
     * @type {Float} 
     */
    InitialVelocity {
        get => this.get_InitialVelocity()
        set => this.put_InitialVelocity(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_FinalValue() {
        if (!this.HasProp("__IScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarNaturalMotionAnimation := IScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IScalarNaturalMotionAnimation.get_FinalValue()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_FinalValue(value) {
        if (!this.HasProp("__IScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarNaturalMotionAnimation := IScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IScalarNaturalMotionAnimation.put_FinalValue(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_InitialValue() {
        if (!this.HasProp("__IScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarNaturalMotionAnimation := IScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IScalarNaturalMotionAnimation.get_InitialValue()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_InitialValue(value) {
        if (!this.HasProp("__IScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarNaturalMotionAnimation := IScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IScalarNaturalMotionAnimation.put_InitialValue(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InitialVelocity() {
        if (!this.HasProp("__IScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarNaturalMotionAnimation := IScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IScalarNaturalMotionAnimation.get_InitialVelocity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InitialVelocity(value) {
        if (!this.HasProp("__IScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarNaturalMotionAnimation := IScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IScalarNaturalMotionAnimation.put_InitialVelocity(value)
    }

;@endregion Instance Methods
}
