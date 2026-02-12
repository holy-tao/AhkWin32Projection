#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScrollViewerView.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a view for a [ScrollViewer](scrollviewer.md) when its view is changing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ScrollViewerView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollViewerView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollViewerView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the distance the content has been scrolled horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerview.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
    }

    /**
     * Gets the distance the content has been scrolled vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerview.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
    }

    /**
     * Gets a value that indicates the current zoom factor engaged for content scaling.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerview.zoomfactor
     * @type {Float} 
     */
    ZoomFactor {
        get => this.get_ZoomFactor()
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
    get_HorizontalOffset() {
        if (!this.HasProp("__IScrollViewerView")) {
            if ((queryResult := this.QueryInterface(IScrollViewerView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewerView := IScrollViewerView(outPtr)
        }

        return this.__IScrollViewerView.get_HorizontalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IScrollViewerView")) {
            if ((queryResult := this.QueryInterface(IScrollViewerView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewerView := IScrollViewerView(outPtr)
        }

        return this.__IScrollViewerView.get_VerticalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZoomFactor() {
        if (!this.HasProp("__IScrollViewerView")) {
            if ((queryResult := this.QueryInterface(IScrollViewerView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewerView := IScrollViewerView(outPtr)
        }

        return this.__IScrollViewerView.get_ZoomFactor()
    }

;@endregion Instance Methods
}
