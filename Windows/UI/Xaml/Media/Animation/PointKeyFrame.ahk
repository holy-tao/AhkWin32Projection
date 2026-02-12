#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IPointKeyFrame.ahk
#Include .\IPointKeyFrameStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Defines an animation segment with its own target value and interpolation method for a [PointAnimationUsingKeyFrames](pointanimationusingkeyframes.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointkeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PointKeyFrame extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointKeyFrame.IID

    /**
     * Identifies the [Value](pointkeyframe_value.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointkeyframe.valueproperty
     * @type {DependencyProperty} 
     */
    static ValueProperty {
        get => PointKeyFrame.get_ValueProperty()
    }

    /**
     * Identifies the [KeyTime](pointkeyframe_keytime.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointkeyframe.keytimeproperty
     * @type {DependencyProperty} 
     */
    static KeyTimeProperty {
        get => PointKeyFrame.get_KeyTimeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ValueProperty() {
        if (!PointKeyFrame.HasProp("__IPointKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointKeyFrameStatics.IID)
            PointKeyFrame.__IPointKeyFrameStatics := IPointKeyFrameStatics(factoryPtr)
        }

        return PointKeyFrame.__IPointKeyFrameStatics.get_ValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTimeProperty() {
        if (!PointKeyFrame.HasProp("__IPointKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointKeyFrameStatics.IID)
            PointKeyFrame.__IPointKeyFrameStatics := IPointKeyFrameStatics(factoryPtr)
        }

        return PointKeyFrame.__IPointKeyFrameStatics.get_KeyTimeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the key frame's target value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointkeyframe.value
     * @type {POINT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the time at which the key frame's target [Value](pointkeyframe_value.md) should be reached.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointkeyframe.keytime
     * @type {KeyTime} 
     */
    KeyTime {
        get => this.get_KeyTime()
        set => this.put_KeyTime(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Value() {
        if (!this.HasProp("__IPointKeyFrame")) {
            if ((queryResult := this.QueryInterface(IPointKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointKeyFrame := IPointKeyFrame(outPtr)
        }

        return this.__IPointKeyFrame.get_Value()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IPointKeyFrame")) {
            if ((queryResult := this.QueryInterface(IPointKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointKeyFrame := IPointKeyFrame(outPtr)
        }

        return this.__IPointKeyFrame.put_Value(value)
    }

    /**
     * 
     * @returns {KeyTime} 
     */
    get_KeyTime() {
        if (!this.HasProp("__IPointKeyFrame")) {
            if ((queryResult := this.QueryInterface(IPointKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointKeyFrame := IPointKeyFrame(outPtr)
        }

        return this.__IPointKeyFrame.get_KeyTime()
    }

    /**
     * 
     * @param {KeyTime} value 
     * @returns {HRESULT} 
     */
    put_KeyTime(value) {
        if (!this.HasProp("__IPointKeyFrame")) {
            if ((queryResult := this.QueryInterface(IPointKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointKeyFrame := IPointKeyFrame(outPtr)
        }

        return this.__IPointKeyFrame.put_KeyTime(value)
    }

;@endregion Instance Methods
}
