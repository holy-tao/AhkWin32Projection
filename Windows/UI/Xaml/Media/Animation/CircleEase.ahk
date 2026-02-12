#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EasingFunctionBase.ahk
#Include .\ICircleEase.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that accelerates and/or decelerates using a circular function.
 * @remarks
 * CircleEase is an easing function that has a function-over-time formula that resembles a cosine curve when represented as a function-time graph. When [EasingMode](easingfunctionbase_easingmode.md) is **EaseIn** (the default), this easing function starts slow and accelerates gradually as it reaches the end. It reaches about 15% value halfway through the duration.
 * 
 * An easing function can be applied to the **EasingFunction** properties of **From*/*To*/*By** animations, or to the **EasingFunction** properties of key-frame types used for the **Easing** variants of key-frame animations. For more info, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * 
 * The formula used for this function is:
 * 
 * <img src="images/circleease_ft.png" alt="Formula of f(t) equals 1 minus square root of1 minus t squared" />
 * 
 * An easing function can be applied to the **EasingFunction** properties of **From*/*To*/*By** animations, or to the **EasingFunction** properties of key-frame types used for the **Easing** variants of key-frame animations. For more info, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.circleease
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class CircleEase extends EasingFunctionBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICircleEase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICircleEase.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CircleEase](circleease.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.CircleEase")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
