#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAnchorRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ScrollViewer.AnchorRequested](scrollviewer_anchorrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.anchorrequestedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AnchorRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAnchorRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAnchorRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the *anchor element* to use when performing scroll anchoring.
     * @remarks
     * The element must be a descendent of the scrolling control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.anchorrequestedeventargs.anchor
     * @type {UIElement} 
     */
    Anchor {
        get => this.get_Anchor()
        set => this.put_Anchor(value)
    }

    /**
     * Gets the set of anchor candidates that are currently registered with the scrolling control (for example, ScrollViewer).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.anchorrequestedeventargs.anchorcandidates
     * @type {IVector<UIElement>} 
     */
    AnchorCandidates {
        get => this.get_AnchorCandidates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Anchor() {
        if (!this.HasProp("__IAnchorRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAnchorRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnchorRequestedEventArgs := IAnchorRequestedEventArgs(outPtr)
        }

        return this.__IAnchorRequestedEventArgs.get_Anchor()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Anchor(value) {
        if (!this.HasProp("__IAnchorRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAnchorRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnchorRequestedEventArgs := IAnchorRequestedEventArgs(outPtr)
        }

        return this.__IAnchorRequestedEventArgs.put_Anchor(value)
    }

    /**
     * 
     * @returns {IVector<UIElement>} 
     */
    get_AnchorCandidates() {
        if (!this.HasProp("__IAnchorRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAnchorRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnchorRequestedEventArgs := IAnchorRequestedEventArgs(outPtr)
        }

        return this.__IAnchorRequestedEventArgs.get_AnchorCandidates()
    }

;@endregion Instance Methods
}
