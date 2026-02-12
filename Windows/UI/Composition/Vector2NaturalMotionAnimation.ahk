#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NaturalMotionAnimation.ahk
#Include .\IVector2NaturalMotionAnimation.ahk
#Include .\IVector2NaturalMotionAnimationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * The base Vector2 NaturalMotionAnimation used to target a Vector2 property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.vector2naturalmotionanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class Vector2NaturalMotionAnimation extends NaturalMotionAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVector2NaturalMotionAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVector2NaturalMotionAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates where the animation ends.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.vector2naturalmotionanimation.finalvalue
     * @type {IReference<Vector2>} 
     */
    FinalValue {
        get => this.get_FinalValue()
        set => this.put_FinalValue(value)
    }

    /**
     * Gets or sets a value that indicates where the animation starts.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.vector2naturalmotionanimation.initialvalue
     * @type {IReference<Vector2>} 
     */
    InitialValue {
        get => this.get_InitialValue()
        set => this.put_InitialValue(value)
    }

    /**
     * Gets or sets the velocity that the animation starts with.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.vector2naturalmotionanimation.initialvelocity
     * @type {Vector2} 
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
     * @returns {IReference<Vector2>} 
     */
    get_FinalValue() {
        if (!this.HasProp("__IVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector2NaturalMotionAnimation := IVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IVector2NaturalMotionAnimation.get_FinalValue()
    }

    /**
     * 
     * @param {IReference<Vector2>} value 
     * @returns {HRESULT} 
     */
    put_FinalValue(value) {
        if (!this.HasProp("__IVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector2NaturalMotionAnimation := IVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IVector2NaturalMotionAnimation.put_FinalValue(value)
    }

    /**
     * 
     * @returns {IReference<Vector2>} 
     */
    get_InitialValue() {
        if (!this.HasProp("__IVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector2NaturalMotionAnimation := IVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IVector2NaturalMotionAnimation.get_InitialValue()
    }

    /**
     * 
     * @param {IReference<Vector2>} value 
     * @returns {HRESULT} 
     */
    put_InitialValue(value) {
        if (!this.HasProp("__IVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector2NaturalMotionAnimation := IVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IVector2NaturalMotionAnimation.put_InitialValue(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_InitialVelocity() {
        if (!this.HasProp("__IVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector2NaturalMotionAnimation := IVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IVector2NaturalMotionAnimation.get_InitialVelocity()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_InitialVelocity(value) {
        if (!this.HasProp("__IVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector2NaturalMotionAnimation := IVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IVector2NaturalMotionAnimation.put_InitialVelocity(value)
    }

;@endregion Instance Methods
}
