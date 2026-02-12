#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemNavigationCloseRequestedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [SystemNavigationManagerPreview.CloseRequested](systemnavigationmanagerpreview_closerequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.preview.systemnavigationcloserequestedprevieweventargs
 * @namespace Windows.UI.Core.Preview
 * @version WindowsRuntime 1.4
 */
class SystemNavigationCloseRequestedPreviewEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemNavigationCloseRequestedPreviewEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemNavigationCloseRequestedPreviewEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the close request is handled by the app.
     * @remarks
     * You can handle the close request to have your app perform another action, such as letting the user save data before closing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.preview.systemnavigationcloserequestedprevieweventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
    get_Handled() {
        if (!this.HasProp("__ISystemNavigationCloseRequestedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationCloseRequestedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationCloseRequestedPreviewEventArgs := ISystemNavigationCloseRequestedPreviewEventArgs(outPtr)
        }

        return this.__ISystemNavigationCloseRequestedPreviewEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ISystemNavigationCloseRequestedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationCloseRequestedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationCloseRequestedPreviewEventArgs := ISystemNavigationCloseRequestedPreviewEventArgs(outPtr)
        }

        return this.__ISystemNavigationCloseRequestedPreviewEventArgs.put_Handled(value)
    }

    /**
     * Returns a [Deferral](../windows.foundation/deferral.md) object for the [CloseRequested](systemnavigationmanagerpreview_closerequested.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.preview.systemnavigationcloserequestedprevieweventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ISystemNavigationCloseRequestedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationCloseRequestedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationCloseRequestedPreviewEventArgs := ISystemNavigationCloseRequestedPreviewEventArgs(outPtr)
        }

        return this.__ISystemNavigationCloseRequestedPreviewEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
