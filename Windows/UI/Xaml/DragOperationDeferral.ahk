#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDragOperationDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables you to drag-and-drop content with a target app asynchronously.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragoperationdeferral
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DragOperationDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragOperationDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragOperationDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates that the content for an asynchronous drag-and-drop operation is ready for a target app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragoperationdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IDragOperationDeferral")) {
            if ((queryResult := this.QueryInterface(IDragOperationDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragOperationDeferral := IDragOperationDeferral(outPtr)
        }

        return this.__IDragOperationDeferral.Complete()
    }

;@endregion Instance Methods
}
