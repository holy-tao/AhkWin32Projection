#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionAnimation.ahk
#Include .\INaturalMotionAnimation.ahk
#Include .\INaturalMotionAnimationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a physics-based animation that uses forces to dynamically move content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.naturalmotionanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class NaturalMotionAnimation extends CompositionAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INaturalMotionAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INaturalMotionAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The delay behavior of the NaturalMotionAnimation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.naturalmotionanimation.delaybehavior
     * @type {Integer} 
     */
    DelayBehavior {
        get => this.get_DelayBehavior()
        set => this.put_DelayBehavior(value)
    }

    /**
     * Delay before the animation starts after [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) is called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.naturalmotionanimation.delaytime
     * @type {TimeSpan} 
     */
    DelayTime {
        get => this.get_DelayTime()
        set => this.put_DelayTime(value)
    }

    /**
     * Specifies how to set the property value when [StopAnimation](compositionobject_stopanimation_1075337060.md) is called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.naturalmotionanimation.stopbehavior
     * @type {Integer} 
     */
    StopBehavior {
        get => this.get_StopBehavior()
        set => this.put_StopBehavior(value)
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
    get_DelayBehavior() {
        if (!this.HasProp("__INaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(INaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INaturalMotionAnimation := INaturalMotionAnimation(outPtr)
        }

        return this.__INaturalMotionAnimation.get_DelayBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DelayBehavior(value) {
        if (!this.HasProp("__INaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(INaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INaturalMotionAnimation := INaturalMotionAnimation(outPtr)
        }

        return this.__INaturalMotionAnimation.put_DelayBehavior(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DelayTime() {
        if (!this.HasProp("__INaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(INaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INaturalMotionAnimation := INaturalMotionAnimation(outPtr)
        }

        return this.__INaturalMotionAnimation.get_DelayTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DelayTime(value) {
        if (!this.HasProp("__INaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(INaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INaturalMotionAnimation := INaturalMotionAnimation(outPtr)
        }

        return this.__INaturalMotionAnimation.put_DelayTime(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StopBehavior() {
        if (!this.HasProp("__INaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(INaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INaturalMotionAnimation := INaturalMotionAnimation(outPtr)
        }

        return this.__INaturalMotionAnimation.get_StopBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StopBehavior(value) {
        if (!this.HasProp("__INaturalMotionAnimation")) {
            if ((queryResult := this.QueryInterface(INaturalMotionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INaturalMotionAnimation := INaturalMotionAnimation(outPtr)
        }

        return this.__INaturalMotionAnimation.put_StopBehavior(value)
    }

;@endregion Instance Methods
}
