#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IPathSegment.ahk
#Include .\IPathSegmentFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a segment of a [PathFigure](pathfigure.md) object. Derived classes of [PathFigure](pathfigure.md) describe different types of segments.
 * @remarks
 * [PathSegmentCollection](pathsegmentcollection.md) is a strongly typed collection for PathSegment items. [PathSegmentCollection](pathsegmentcollection.md) is the type used by the [PathFigure.Segments](pathfigure_segments.md) property. In XAML, specify one or more of the element types that derive from PathSegment for this property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathsegment
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PathSegment extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPathSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPathSegment.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
