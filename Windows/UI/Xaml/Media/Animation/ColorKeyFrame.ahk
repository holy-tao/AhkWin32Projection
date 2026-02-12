#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IColorKeyFrame.ahk
#Include .\IColorKeyFrameStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides a base class for specific animation key-frame techniques that define an animation segment with a [Color](../windows.ui/color.md) target value. Derived classes each provide a different key-frame interpolation method for a [Color](../windows.ui/color.md) value that is provided for a [ColorAnimationUsingKeyFrames](coloranimationusingkeyframes.md) animation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.colorkeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ColorKeyFrame extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorKeyFrame.IID

    /**
     * Identifies the [Value](colorkeyframe_value.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.colorkeyframe.valueproperty
     * @type {DependencyProperty} 
     */
    static ValueProperty {
        get => ColorKeyFrame.get_ValueProperty()
    }

    /**
     * Identifies the [KeyTime](colorkeyframe_keytime.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.colorkeyframe.keytimeproperty
     * @type {DependencyProperty} 
     */
    static KeyTimeProperty {
        get => ColorKeyFrame.get_KeyTimeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ValueProperty() {
        if (!ColorKeyFrame.HasProp("__IColorKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorKeyFrameStatics.IID)
            ColorKeyFrame.__IColorKeyFrameStatics := IColorKeyFrameStatics(factoryPtr)
        }

        return ColorKeyFrame.__IColorKeyFrameStatics.get_ValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTimeProperty() {
        if (!ColorKeyFrame.HasProp("__IColorKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorKeyFrameStatics.IID)
            ColorKeyFrame.__IColorKeyFrameStatics := IColorKeyFrameStatics(factoryPtr)
        }

        return ColorKeyFrame.__IColorKeyFrameStatics.get_KeyTimeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the key frame's target value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.colorkeyframe.value
     * @type {Color} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the time at which the key frame's target [Value](colorkeyframe_value.md) should be reached.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.colorkeyframe.keytime
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
     * @returns {Color} 
     */
    get_Value() {
        if (!this.HasProp("__IColorKeyFrame")) {
            if ((queryResult := this.QueryInterface(IColorKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorKeyFrame := IColorKeyFrame(outPtr)
        }

        return this.__IColorKeyFrame.get_Value()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IColorKeyFrame")) {
            if ((queryResult := this.QueryInterface(IColorKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorKeyFrame := IColorKeyFrame(outPtr)
        }

        return this.__IColorKeyFrame.put_Value(value)
    }

    /**
     * 
     * @returns {KeyTime} 
     */
    get_KeyTime() {
        if (!this.HasProp("__IColorKeyFrame")) {
            if ((queryResult := this.QueryInterface(IColorKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorKeyFrame := IColorKeyFrame(outPtr)
        }

        return this.__IColorKeyFrame.get_KeyTime()
    }

    /**
     * 
     * @param {KeyTime} value 
     * @returns {HRESULT} 
     */
    put_KeyTime(value) {
        if (!this.HasProp("__IColorKeyFrame")) {
            if ((queryResult := this.QueryInterface(IColorKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorKeyFrame := IColorKeyFrame(outPtr)
        }

        return this.__IColorKeyFrame.put_KeyTime(value)
    }

;@endregion Instance Methods
}
