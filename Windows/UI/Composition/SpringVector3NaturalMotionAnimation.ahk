#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Vector3NaturalMotionAnimation.ahk
#Include .\ISpringVector3NaturalMotionAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * A spring physics-based animation that targets any Vector3-based property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.springvector3naturalmotionanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class SpringVector3NaturalMotionAnimation extends Vector3NaturalMotionAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpringVector3NaturalMotionAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpringVector3NaturalMotionAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates how much damping is applied to the spring.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.springvector3naturalmotionanimation.dampingratio
     * @type {Float} 
     */
    DampingRatio {
        get => this.get_DampingRatio()
        set => this.put_DampingRatio(value)
    }

    /**
     * Gets or sets the time for the Spring to complete a single oscillation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.springvector3naturalmotionanimation.period
     * @type {TimeSpan} 
     */
    Period {
        get => this.get_Period()
        set => this.put_Period(value)
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
    get_DampingRatio() {
        if (!this.HasProp("__ISpringVector3NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(ISpringVector3NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpringVector3NaturalMotionAnimation := ISpringVector3NaturalMotionAnimation(outPtr)
        }

        return this.__ISpringVector3NaturalMotionAnimation.get_DampingRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DampingRatio(value) {
        if (!this.HasProp("__ISpringVector3NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(ISpringVector3NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpringVector3NaturalMotionAnimation := ISpringVector3NaturalMotionAnimation(outPtr)
        }

        return this.__ISpringVector3NaturalMotionAnimation.put_DampingRatio(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Period() {
        if (!this.HasProp("__ISpringVector3NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(ISpringVector3NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpringVector3NaturalMotionAnimation := ISpringVector3NaturalMotionAnimation(outPtr)
        }

        return this.__ISpringVector3NaturalMotionAnimation.get_Period()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Period(value) {
        if (!this.HasProp("__ISpringVector3NaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(ISpringVector3NaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpringVector3NaturalMotionAnimation := ISpringVector3NaturalMotionAnimation(outPtr)
        }

        return this.__ISpringVector3NaturalMotionAnimation.put_Period(value)
    }

;@endregion Instance Methods
}
