#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISplitViewPaneClosingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [SplitView.PaneClosing](splitview_paneclosing.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitviewpaneclosingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SplitViewPaneClosingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplitViewPaneClosingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplitViewPaneClosingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the pane closing action should be canceled.
     * @remarks
     * Set this property to **true** in an event handler in order to cancel a [SplitView](splitview.md) pane closing action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitviewpaneclosingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__ISplitViewPaneClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(ISplitViewPaneClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitViewPaneClosingEventArgs := ISplitViewPaneClosingEventArgs(outPtr)
        }

        return this.__ISplitViewPaneClosingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__ISplitViewPaneClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(ISplitViewPaneClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitViewPaneClosingEventArgs := ISplitViewPaneClosingEventArgs(outPtr)
        }

        return this.__ISplitViewPaneClosingEventArgs.put_Cancel(value)
    }

;@endregion Instance Methods
}
