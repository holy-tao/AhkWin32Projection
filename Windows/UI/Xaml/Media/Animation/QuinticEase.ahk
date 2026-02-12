#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EasingFunctionBase.ahk
#Include .\IQuinticEase.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that accelerates and/or decelerates using the formula *f* (*t*) = *t*<sup>5</sup>.
 * @remarks
 * QuinticEase has the same behavior as does a [PowerEase](powerease.md) with [Power](powerease_power.md) value of 5. When [EasingMode](easingfunctionbase_easingmode.md) is **EaseIn** (the default), this easing function starts slow, remains slow for most of the duration, and accelerates very rapidly very near the end of the duration time.
 * 
 * An easing function can be applied to the **EasingFunction** properties of **From*/*To*/*By** animations, or to the **EasingFunction** properties of key-frame types used for the **Easing** variants of key-frame animations. For more info, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.quinticease
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class QuinticEase extends EasingFunctionBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IQuinticEase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IQuinticEase.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [QuinticEase](quinticease.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.QuinticEase")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
