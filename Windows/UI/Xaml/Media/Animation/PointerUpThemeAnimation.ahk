#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IPointerUpThemeAnimation.ahk
#Include .\IPointerUpThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a preconfigured animation that runs after a pointer down is detected on an item or element and the tap action is released.
 * @remarks
 * Setting the [Duration](timeline_duration.md) property has no effect on this object as the duration is preconfigured.
 * 
 * PointerUpThemeAnimation overrides the current values of [Projection](../windows.ui.xaml/uielement_projection.md) and [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) and sets them to their default values.
 * 
 * > **Windows 8.1 and prior**
 * > [Projection](../windows.ui.xaml/uielement_projection.md) and [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) are not affected by [PointerDownThemeAnimation](pointerdownthemeanimation.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointerupthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PointerUpThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointerUpThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointerUpThemeAnimation.IID

    /**
     * Identifies the [TargetName](pointerupthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointerupthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => PointerUpThemeAnimation.get_TargetNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!PointerUpThemeAnimation.HasProp("__IPointerUpThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointerUpThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerUpThemeAnimationStatics.IID)
            PointerUpThemeAnimation.__IPointerUpThemeAnimationStatics := IPointerUpThemeAnimationStatics(factoryPtr)
        }

        return PointerUpThemeAnimation.__IPointerUpThemeAnimationStatics.get_TargetNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointerupthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PointerDownThemeAnimation](pointerdownthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointerUpThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IPointerUpThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPointerUpThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerUpThemeAnimation := IPointerUpThemeAnimation(outPtr)
        }

        return this.__IPointerUpThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IPointerUpThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPointerUpThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerUpThemeAnimation := IPointerUpThemeAnimation(outPtr)
        }

        return this.__IPointerUpThemeAnimation.put_TargetName(value)
    }

;@endregion Instance Methods
}
