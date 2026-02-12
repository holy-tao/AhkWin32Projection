#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ScalarNaturalMotionAnimation.ahk
#Include .\IBounceScalarNaturalMotionAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * A bounce physics-based animation that targets any Scalar-based property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bouncescalarnaturalmotionanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class BounceScalarNaturalMotionAnimation extends ScalarNaturalMotionAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBounceScalarNaturalMotionAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBounceScalarNaturalMotionAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the rate at which the velocity increases.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bouncescalarnaturalmotionanimation.acceleration
     * @type {Float} 
     */
    Acceleration {
        get => this.get_Acceleration()
        set => this.put_Acceleration(value)
    }

    /**
     * Gets or sets the amount that an object rebounds after collision.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.bouncescalarnaturalmotionanimation.restitution
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
        if (!this.HasProp("__IBounceScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IBounceScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceScalarNaturalMotionAnimation := IBounceScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IBounceScalarNaturalMotionAnimation.get_Acceleration()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Acceleration(value) {
        if (!this.HasProp("__IBounceScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IBounceScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceScalarNaturalMotionAnimation := IBounceScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IBounceScalarNaturalMotionAnimation.put_Acceleration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Restitution() {
        if (!this.HasProp("__IBounceScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IBounceScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceScalarNaturalMotionAnimation := IBounceScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IBounceScalarNaturalMotionAnimation.get_Restitution()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Restitution(value) {
        if (!this.HasProp("__IBounceScalarNaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(IBounceScalarNaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceScalarNaturalMotionAnimation := IBounceScalarNaturalMotionAnimation(outPtr)
        }

        return this.__IBounceScalarNaturalMotionAnimation.put_Restitution(value)
    }

;@endregion Instance Methods
}
