#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IDragOverThemeAnimation.ahk
#Include .\IDragOverThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that applies to the elements underneath an element being dragged.
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragoverthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DragOverThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragOverThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragOverThemeAnimation.IID

    /**
     * Identifies the [TargetName](dragoverthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragoverthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => DragOverThemeAnimation.get_TargetNameProperty()
    }

    /**
     * Identifies the [ToOffset](dragoverthemeanimation_tooffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragoverthemeanimation.tooffsetproperty
     * @type {DependencyProperty} 
     */
    static ToOffsetProperty {
        get => DragOverThemeAnimation.get_ToOffsetProperty()
    }

    /**
     * Identifies the [Direction](dragoverthemeanimation_direction.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragoverthemeanimation.directionproperty
     * @type {DependencyProperty} 
     */
    static DirectionProperty {
        get => DragOverThemeAnimation.get_DirectionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!DragOverThemeAnimation.HasProp("__IDragOverThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DragOverThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragOverThemeAnimationStatics.IID)
            DragOverThemeAnimation.__IDragOverThemeAnimationStatics := IDragOverThemeAnimationStatics(factoryPtr)
        }

        return DragOverThemeAnimation.__IDragOverThemeAnimationStatics.get_TargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ToOffsetProperty() {
        if (!DragOverThemeAnimation.HasProp("__IDragOverThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DragOverThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragOverThemeAnimationStatics.IID)
            DragOverThemeAnimation.__IDragOverThemeAnimationStatics := IDragOverThemeAnimationStatics(factoryPtr)
        }

        return DragOverThemeAnimation.__IDragOverThemeAnimationStatics.get_ToOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DirectionProperty() {
        if (!DragOverThemeAnimation.HasProp("__IDragOverThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DragOverThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragOverThemeAnimationStatics.IID)
            DragOverThemeAnimation.__IDragOverThemeAnimationStatics := IDragOverThemeAnimationStatics(factoryPtr)
        }

        return DragOverThemeAnimation.__IDragOverThemeAnimationStatics.get_DirectionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragoverthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

    /**
     * Gets or sets the distance by which the target is translated when the animation is active.
     * @remarks
     * The direction of the offset is controlled by [Direction](dragoverthemeanimation_direction.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragoverthemeanimation.tooffset
     * @type {Float} 
     */
    ToOffset {
        get => this.get_ToOffset()
        set => this.put_ToOffset(value)
    }

    /**
     * Gets or sets the direction that the target should translate, when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragoverthemeanimation.direction
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DragOverThemeAnimation](dragoverthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DragOverThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IDragOverThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDragOverThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragOverThemeAnimation := IDragOverThemeAnimation(outPtr)
        }

        return this.__IDragOverThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IDragOverThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDragOverThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragOverThemeAnimation := IDragOverThemeAnimation(outPtr)
        }

        return this.__IDragOverThemeAnimation.put_TargetName(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ToOffset() {
        if (!this.HasProp("__IDragOverThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDragOverThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragOverThemeAnimation := IDragOverThemeAnimation(outPtr)
        }

        return this.__IDragOverThemeAnimation.get_ToOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ToOffset(value) {
        if (!this.HasProp("__IDragOverThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDragOverThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragOverThemeAnimation := IDragOverThemeAnimation(outPtr)
        }

        return this.__IDragOverThemeAnimation.put_ToOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        if (!this.HasProp("__IDragOverThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDragOverThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragOverThemeAnimation := IDragOverThemeAnimation(outPtr)
        }

        return this.__IDragOverThemeAnimation.get_Direction()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Direction(value) {
        if (!this.HasProp("__IDragOverThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDragOverThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragOverThemeAnimation := IDragOverThemeAnimation(outPtr)
        }

        return this.__IDragOverThemeAnimation.put_Direction(value)
    }

;@endregion Instance Methods
}
