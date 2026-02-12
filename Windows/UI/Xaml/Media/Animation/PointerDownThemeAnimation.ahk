#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IPointerDownThemeAnimation.ahk
#Include .\IPointerDownThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a preconfigured animation that runs when a pointer down is detected on an item or element.
 * @remarks
 * Setting the [Duration](timeline_duration.md) property has no effect on this object as the duration is preconfigured.
 * 
 * PointerDownThemeAnimation overrides the current values of [Projection](../windows.ui.xaml/uielement_projection.md) and [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md).
 * 
 * > **Windows 8.1 and prior**
 * > [Projection](../windows.ui.xaml/uielement_projection.md) and [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) are not affected by PointerDownThemeAnimation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointerdownthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PointerDownThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointerDownThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointerDownThemeAnimation.IID

    /**
     * Identifies the [TargetName](pointerdownthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointerdownthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => PointerDownThemeAnimation.get_TargetNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!PointerDownThemeAnimation.HasProp("__IPointerDownThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointerDownThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerDownThemeAnimationStatics.IID)
            PointerDownThemeAnimation.__IPointerDownThemeAnimationStatics := IPointerDownThemeAnimationStatics(factoryPtr)
        }

        return PointerDownThemeAnimation.__IPointerDownThemeAnimationStatics.get_TargetNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointerdownthemeanimation.targetname
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
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointerDownThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IPointerDownThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPointerDownThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDownThemeAnimation := IPointerDownThemeAnimation(outPtr)
        }

        return this.__IPointerDownThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IPointerDownThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPointerDownThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerDownThemeAnimation := IPointerDownThemeAnimation(outPtr)
        }

        return this.__IPointerDownThemeAnimation.put_TargetName(value)
    }

;@endregion Instance Methods
}
