#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\ITransform3D.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * The base class for the [CompositeTransform3D](compositetransform3d.md) and [PerspectiveTransform3D](perspectivetransform3d.md) classes.
 * @remarks
 * Transform3D serves as a base class for the [CompositeTransform3D class](compositetransform3d.md) and the [PerspectiveTransform3D class](perspectivetransform3d.md), but it has no methods and cannot be publicly instantiated on its own.
 * 
 * For more info about using Transform3D, see the [UIElement.Transform3D](../windows.ui.xaml/uielement_transform3d.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.transform3d
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class Transform3D extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITransform3D

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITransform3D.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
