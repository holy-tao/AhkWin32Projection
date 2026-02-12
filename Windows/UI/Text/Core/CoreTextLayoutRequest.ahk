#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextLayoutRequest.ahk
#Include .\ICoreTextLayoutRequest2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information about a [LayoutRequested](coretexteditcontext_layoutrequested.md) event.
 * @remarks
 * An object of this type can be obtained from the [CoreTextLayoutRequestedEventArgs.Request](coretextlayoutrequestedeventargs_request.md) property inside a handler for the [CoreTextEditContext.LayoutRequested](coretexteditcontext_layoutrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutrequest
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextLayoutRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextLayoutRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextLayoutRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the range of text whose bounding box is being requested by the text input server. The server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutrequest.range
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * Gets the screen coordinates of the bounding box for a range of text, or a text input control.
     * @remarks
     * Your application should populate the requested layout properties of this object before returning from the event handler.
     * 
     * Use the [LayoutBoundsVisualPixels](coretextlayoutrequest_layoutboundsvisualpixels.md) method to get the layout properties relative to the viewport of your application.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutrequest.layoutbounds
     * @type {CoreTextLayoutBounds} 
     */
    LayoutBounds {
        get => this.get_LayoutBounds()
    }

    /**
     * Gets a value that indicates whether the layout request operation is canceled.
     * @remarks
     * If the app defers the operation, it is possible for it to be canceled before the app responds to it. For this reason, you should read this property, only once, immediately before responding to a deferred operation. 
     * 
     * > [!NOTE]
     * > The "getter" for the **IsCanceled** property notifies Windows that the app is beginning the deferred operation. You should consider reading this property as a required step before you perform the deferred operation. Use the pattern shown in the example when reading **IsCanceled**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutrequest.iscanceled
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

    /**
     * Gets the coordinates of the bounding box for a range of text, or a text input control, relative to viewport of your application.
     * @remarks
     * Your application should populate the requested layout properties of this object before returning from the event handler.
     * 
     * Visual pixels are defined as coordinate values relative to the position, scale, and rotation of a specific UI element (such as the application's core window, a XAML island, or other edit control/visible element).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutrequest.layoutboundsvisualpixels
     * @type {CoreTextLayoutBounds} 
     */
    LayoutBoundsVisualPixels {
        get => this.get_LayoutBoundsVisualPixels()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_Range() {
        if (!this.HasProp("__ICoreTextLayoutRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutRequest := ICoreTextLayoutRequest(outPtr)
        }

        return this.__ICoreTextLayoutRequest.get_Range()
    }

    /**
     * 
     * @returns {CoreTextLayoutBounds} 
     */
    get_LayoutBounds() {
        if (!this.HasProp("__ICoreTextLayoutRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutRequest := ICoreTextLayoutRequest(outPtr)
        }

        return this.__ICoreTextLayoutRequest.get_LayoutBounds()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__ICoreTextLayoutRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutRequest := ICoreTextLayoutRequest(outPtr)
        }

        return this.__ICoreTextLayoutRequest.get_IsCanceled()
    }

    /**
     * Requests that the layout request operation be delayed. Call this method if your text input control is hosted on a worker thread rather than on the UI thread.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICoreTextLayoutRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutRequest := ICoreTextLayoutRequest(outPtr)
        }

        return this.__ICoreTextLayoutRequest.GetDeferral()
    }

    /**
     * 
     * @returns {CoreTextLayoutBounds} 
     */
    get_LayoutBoundsVisualPixels() {
        if (!this.HasProp("__ICoreTextLayoutRequest2")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutRequest2 := ICoreTextLayoutRequest2(outPtr)
        }

        return this.__ICoreTextLayoutRequest2.get_LayoutBoundsVisualPixels()
    }

;@endregion Instance Methods
}
