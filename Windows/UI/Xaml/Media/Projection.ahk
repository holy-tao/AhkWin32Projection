#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IProjection.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for projections, which describe how to transform an object in 3-D space using perspective transforms.
 * @remarks
 * A Projection is the property type used by the [UIElement.Projection](../windows.ui.xaml/uielement_projection.md) property. Use either a [Matrix3DProjection](matrix3dprojection.md) or [PlaneProjection](planeprojection.md) to supply this property value.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.projection
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Projection extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProjection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProjection.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
