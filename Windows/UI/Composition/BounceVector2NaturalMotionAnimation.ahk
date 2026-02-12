#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Vector2NaturalMotionAnimation.ahk
#Include .\IBounceVector2NaturalMotionAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * A bounce physics-based animation that targets any Vector2-based property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bouncevector2naturalmotionanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class BounceVector2NaturalMotionAnimation extends Vector2NaturalMotionAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBounceVector2NaturalMotionAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBounceVector2NaturalMotionAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the rate at which the velocity increases.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bouncevector2naturalmotionanimation.acceleration
     * @type {Float} 
     */
    Acceleration {
        get => this.get_Acceleration()
        set => this.put_Acceleration(value)
    }

    /**
     * Gets or sets the amount that an object rebounds after collision.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bouncevector2naturalmotionanimation.restitution
     * @type {Float} 
     */
    Restitution {
        get => this.get_Restitution()
        set => this.put_Restitution(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Acceleration() {
        if (!this.HasProp("__IBounceVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IBounceVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceVector2NaturalMotionAnimation := IBounceVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IBounceVector2NaturalMotionAnimation.get_Acceleration()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Acceleration(value) {
        if (!this.HasProp("__IBounceVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IBounceVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceVector2NaturalMotionAnimation := IBounceVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IBounceVector2NaturalMotionAnimation.put_Acceleration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Restitution() {
        if (!this.HasProp("__IBounceVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IBounceVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceVector2NaturalMotionAnimation := IBounceVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IBounceVector2NaturalMotionAnimation.get_Restitution()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Restitution(value) {
        if (!this.HasProp("__IBounceVector2NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IBounceVector2NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceVector2NaturalMotionAnimation := IBounceVector2NaturalMotionAnimation(outPtr)
        }

        return this.__IBounceVector2NaturalMotionAnimation.put_Restitution(value)
    }

;@endregion Instance Methods
}
