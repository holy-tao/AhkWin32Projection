#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PointKeyFrame.ahk
#Include .\ISplinePointKeyFrame.ahk
#Include .\ISplinePointKeyFrameStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates from the [Point](../windows.foundation/point.md) value of the previous key frame to its own [Value](pointkeyframe_value.md) using splined interpolation.
 * @remarks
 * Key-frame animations permit more than one target value that is reached at a point along the animation timeline. In other words each key frame can specify a different intermediate value, and the last key frame reached is the final animation value. By specifying multiple values to animate, you can make more complex animations. You can mix discrete, linear, and spline keyframes in the same keyframe collection.
 * 
 * For more info on how to use key-frame animations, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splinepointkeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class SplinePointKeyFrame extends PointKeyFrame {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplinePointKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplinePointKeyFrame.IID

    /**
     * Identifies the [KeySpline](splinepointkeyframe_keyspline.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splinepointkeyframe.keysplineproperty
     * @type {DependencyProperty} 
     */
    static KeySplineProperty {
        get => SplinePointKeyFrame.get_KeySplineProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeySplineProperty() {
        if (!SplinePointKeyFrame.HasProp("__ISplinePointKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplinePointKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplinePointKeyFrameStatics.IID)
            SplinePointKeyFrame.__ISplinePointKeyFrameStatics := ISplinePointKeyFrameStatics(factoryPtr)
        }

        return SplinePointKeyFrame.__ISplinePointKeyFrameStatics.get_KeySplineProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the two control points that define animation progress for this key frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.splinepointkeyframe.keyspline
     * @type {KeySpline} 
     */
    KeySpline {
        get => this.get_KeySpline()
        set => this.put_KeySpline(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SplinePointKeyFrame](splinepointkeyframe.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SplinePointKeyFrame")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {KeySpline} 
     */
    get_KeySpline() {
        if (!this.HasProp("__ISplinePointKeyFrame")) {
            if ((queryResult := this.QueryInterface(ISplinePointKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplinePointKeyFrame := ISplinePointKeyFrame(outPtr)
        }

        return this.__ISplinePointKeyFrame.get_KeySpline()
    }

    /**
     * 
     * @param {KeySpline} value 
     * @returns {HRESULT} 
     */
    put_KeySpline(value) {
        if (!this.HasProp("__ISplinePointKeyFrame")) {
            if ((queryResult := this.QueryInterface(ISplinePointKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplinePointKeyFrame := ISplinePointKeyFrame(outPtr)
        }

        return this.__ISplinePointKeyFrame.put_KeySpline(value)
    }

;@endregion Instance Methods
}
