#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IObjectKeyFrame.ahk
#Include .\IObjectKeyFrameStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Defines an animation segment with its own target value and interpolation method for an [ObjectAnimationUsingKeyFrames](objectanimationusingkeyframes.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectkeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ObjectKeyFrame extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IObjectKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IObjectKeyFrame.IID

    /**
     * Identifies the [Value](objectkeyframe_value.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectkeyframe.valueproperty
     * @type {DependencyProperty} 
     */
    static ValueProperty {
        get => ObjectKeyFrame.get_ValueProperty()
    }

    /**
     * Identifies the [KeyTime](objectkeyframe_keytime.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectkeyframe.keytimeproperty
     * @type {DependencyProperty} 
     */
    static KeyTimeProperty {
        get => ObjectKeyFrame.get_KeyTimeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ValueProperty() {
        if (!ObjectKeyFrame.HasProp("__IObjectKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ObjectKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IObjectKeyFrameStatics.IID)
            ObjectKeyFrame.__IObjectKeyFrameStatics := IObjectKeyFrameStatics(factoryPtr)
        }

        return ObjectKeyFrame.__IObjectKeyFrameStatics.get_ValueProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyTimeProperty() {
        if (!ObjectKeyFrame.HasProp("__IObjectKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ObjectKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IObjectKeyFrameStatics.IID)
            ObjectKeyFrame.__IObjectKeyFrameStatics := IObjectKeyFrameStatics(factoryPtr)
        }

        return ObjectKeyFrame.__IObjectKeyFrameStatics.get_KeyTimeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the key frame's target value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectkeyframe.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the time at which the key frame's target [Value](objectkeyframe_value.md) should be reached.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectkeyframe.keytime
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
     * @returns {IInspectable} 
     */
    get_Value() {
        if (!this.HasProp("__IObjectKeyFrame")) {
            if ((queryResult := this.QueryInterface(IObjectKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObjectKeyFrame := IObjectKeyFrame(outPtr)
        }

        return this.__IObjectKeyFrame.get_Value()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IObjectKeyFrame")) {
            if ((queryResult := this.QueryInterface(IObjectKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObjectKeyFrame := IObjectKeyFrame(outPtr)
        }

        return this.__IObjectKeyFrame.put_Value(value)
    }

    /**
     * 
     * @returns {KeyTime} 
     */
    get_KeyTime() {
        if (!this.HasProp("__IObjectKeyFrame")) {
            if ((queryResult := this.QueryInterface(IObjectKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObjectKeyFrame := IObjectKeyFrame(outPtr)
        }

        return this.__IObjectKeyFrame.get_KeyTime()
    }

    /**
     * 
     * @param {KeyTime} value 
     * @returns {HRESULT} 
     */
    put_KeyTime(value) {
        if (!this.HasProp("__IObjectKeyFrame")) {
            if ((queryResult := this.QueryInterface(IObjectKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObjectKeyFrame := IObjectKeyFrame(outPtr)
        }

        return this.__IObjectKeyFrame.put_KeyTime(value)
    }

;@endregion Instance Methods
}
