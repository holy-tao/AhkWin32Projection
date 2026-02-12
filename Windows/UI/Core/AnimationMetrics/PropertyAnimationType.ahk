#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the animation type represented by a [PropertyAnimation](propertyanimation.md) object.
 * @remarks
 * All of the animation objects inherit from [IPropertyAnimation](ipropertyanimation.md). When they are retrieved through [AnimationDescription.Animations](animationdescription_animations.md), they are retrieved as generic [IPropertyAnimation](ipropertyanimation.md) objects. The caller then checks the [Type](ipropertyanimation_type.md) property, which provides one of the type values defined in this topic. The caller can then cast the [IPropertyAnimation](ipropertyanimation.md) object to the specific animation object to access any additional properties it provides.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.propertyanimationtype
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class PropertyAnimationType extends Win32Enum{

    /**
     * Animate the size of the object, magnifying or shrinking. The corresponding object is the [ScaleAnimation](scaleanimation.md).
     * @type {Integer (Int32)}
     */
    static Scale => 0

    /**
     * Move the object. The corresponding object is the [TranslationAnimation](translationanimation.md).
     * @type {Integer (Int32)}
     */
    static Translation => 1

    /**
     * Animate the object's transparency. The corresponding object is the [OpacityAnimation](opacityanimation.md).
     * @type {Integer (Int32)}
     */
    static Opacity => 2
}
