#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Shape.ahk
#Include .\IEllipse.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Draws an ellipse with a given [Height](../windows.ui.xaml/frameworkelement_height.md) and [Width](../windows.ui.xaml/frameworkelement_width.md) specified in device-independent pixel (DIP).
 * @remarks
 * You can set the [Fill](shape_fill.md) property to give the shape a background fill, like a solid color, gradient, or image. You can set the [Stroke](shape_stroke.md) and other related stroke properties to specify the look of the shape's outline.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.ellipse
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class Ellipse extends Shape {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEllipse

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEllipse.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Ellipse](ellipse.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Ellipse")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
