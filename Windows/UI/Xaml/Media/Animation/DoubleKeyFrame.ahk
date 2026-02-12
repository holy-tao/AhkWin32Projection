#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IDoubleKeyFrame.ahk
#Include .\IDoubleKeyFrameStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * An abstract class that defines an animation segment with its own target value and interpolation method for a [DoubleAnimationUsingKeyFrames](DoubleAnimationUsingKeyFrames.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doublekeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DoubleKeyFrame extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDoubleKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDoubleKeyFrame.IID

    /**
     * Identifies the [Value](doublekeyframe_value.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doublekeyframe.valueproperty
     * @type {DependencyProperty} 
     */
    static ValueProperty {
        get => DoubleKeyFrame.get_ValueProperty()
    }

    /**
     * Identifies the [KeyTime](colorkeyframe_keytime.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doublekeyframe.keytimeproperty
     * @type {DependencyProperty} 
     */
    static KeyTimeProperty {
        get => DoubleKeyFrame.get_KeyTimeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ValueProperty() {
        if (!DoubleKeyFrame.HasProp("__IDoubleKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DoubleKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDoubleKeyFrameStatics.IID)
            DoubleKeyFrame.__IDoubleKeyFrameStatics := IDoubleKeyFrameStatics(factoryPtr)
        }

        return DoubleKeyFrame.__IDoubleKeyFrameStatics.get_ValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTimeProperty() {
        if (!DoubleKeyFrame.HasProp("__IDoubleKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DoubleKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDoubleKeyFrameStatics.IID)
            DoubleKeyFrame.__IDoubleKeyFrameStatics := IDoubleKeyFrameStatics(factoryPtr)
        }

        return DoubleKeyFrame.__IDoubleKeyFrameStatics.get_KeyTimeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the key frame's target value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doublekeyframe.value
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the time at which the key frame's target [Value](doublekeyframe_value.md) should be reached.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.doublekeyframe.keytime
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
     * @returns {Float} 
     */
    get_Value() {
        if (!this.HasProp("__IDoubleKeyFrame")) {
            if ((queryResult := this.QueryInterface(IDoubleKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleKeyFrame := IDoubleKeyFrame(outPtr)
        }

        return this.__IDoubleKeyFrame.get_Value()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IDoubleKeyFrame")) {
            if ((queryResult := this.QueryInterface(IDoubleKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleKeyFrame := IDoubleKeyFrame(outPtr)
        }

        return this.__IDoubleKeyFrame.put_Value(value)
    }

    /**
     * 
     * @returns {KeyTime} 
     */
    get_KeyTime() {
        if (!this.HasProp("__IDoubleKeyFrame")) {
            if ((queryResult := this.QueryInterface(IDoubleKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleKeyFrame := IDoubleKeyFrame(outPtr)
        }

        return this.__IDoubleKeyFrame.get_KeyTime()
    }

    /**
     * 
     * @param {KeyTime} value 
     * @returns {HRESULT} 
     */
    put_KeyTime(value) {
        if (!this.HasProp("__IDoubleKeyFrame")) {
            if ((queryResult := this.QueryInterface(IDoubleKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDoubleKeyFrame := IDoubleKeyFrame(outPtr)
        }

        return this.__IDoubleKeyFrame.put_KeyTime(value)
    }

;@endregion Instance Methods
}
