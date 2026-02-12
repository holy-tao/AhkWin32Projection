#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScrollViewerViewChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ViewChanging](scrollviewer_viewchanging.md) event and similar control-specific events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerviewchangingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ScrollViewerViewChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollViewerViewChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollViewerViewChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the view that the [ScrollViewer](scrollviewer.md) will show next.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerviewchangingeventargs.nextview
     * @type {ScrollViewerView} 
     */
    NextView {
        get => this.get_NextView()
    }

    /**
     * Gets the view that the [ScrollViewer](scrollviewer.md) will show when the view comes to rest after a pan/zoom manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerviewchangingeventargs.finalview
     * @type {ScrollViewerView} 
     */
    FinalView {
        get => this.get_FinalView()
    }

    /**
     * Gets a value that indicates whether the pan/zoom manipulation has an inertial component.
     * @remarks
     * IsInertial is **true** for manipulations that occur:
     * 
     * + using a mouse wheel.
     * + using key strokes on [ScrollViewer](scrollviewer.md) and other controls that support direct manipulation.
     * + by calling [ChangeView](scrollviewer_changeview_579623452.md) with animation enabled.
     * 
     * IsInertial is **false** for manipulations that occur:
     * 
     * + by dragging the [Thumb](../windows.ui.xaml.controls.primitives/thumb.md) on a scrollbar.
     * + using key strokes on controls that don't support direct manipulation.
     * + by calling [ChangeView](scrollviewer_changeview_579623452.md) with animation disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerviewchangingeventargs.isinertial
     * @type {Boolean} 
     */
    IsInertial {
        get => this.get_IsInertial()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ScrollViewerView} 
     */
    get_NextView() {
        if (!this.HasProp("__IScrollViewerViewChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IScrollViewerViewChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewerViewChangingEventArgs := IScrollViewerViewChangingEventArgs(outPtr)
        }

        return this.__IScrollViewerViewChangingEventArgs.get_NextView()
    }

    /**
     * 
     * @returns {ScrollViewerView} 
     */
    get_FinalView() {
        if (!this.HasProp("__IScrollViewerViewChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IScrollViewerViewChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewerViewChangingEventArgs := IScrollViewerViewChangingEventArgs(outPtr)
        }

        return this.__IScrollViewerViewChangingEventArgs.get_FinalView()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertial() {
        if (!this.HasProp("__IScrollViewerViewChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IScrollViewerViewChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewerViewChangingEventArgs := IScrollViewerViewChangingEventArgs(outPtr)
        }

        return this.__IScrollViewerViewChangingEventArgs.get_IsInertial()
    }

;@endregion Instance Methods
}
