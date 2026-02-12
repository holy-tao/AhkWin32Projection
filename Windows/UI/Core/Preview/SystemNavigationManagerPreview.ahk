#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemNavigationManagerPreview.ahk
#Include .\ISystemNavigationManagerPreviewStatics.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include .\SystemNavigationCloseRequestedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a way for an app to respond to system provided close events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.preview.systemnavigationmanagerpreview
 * @namespace Windows.UI.Core.Preview
 * @version WindowsRuntime 1.4
 */
class SystemNavigationManagerPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemNavigationManagerPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemNavigationManagerPreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the SystemNavigationManagerPreview object associated with the current window.
     * @returns {SystemNavigationManagerPreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.preview.systemnavigationmanagerpreview.getforcurrentview
     */
    static GetForCurrentView() {
        if (!SystemNavigationManagerPreview.HasProp("__ISystemNavigationManagerPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.Preview.SystemNavigationManagerPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemNavigationManagerPreviewStatics.IID)
            SystemNavigationManagerPreview.__ISystemNavigationManagerPreviewStatics := ISystemNavigationManagerPreviewStatics(factoryPtr)
        }

        return SystemNavigationManagerPreview.__ISystemNavigationManagerPreviewStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCloseRequestedToken")) {
            this.remove_CloseRequested(this.__OnCloseRequestedToken)
            this.__OnCloseRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {EventHandler<SystemNavigationCloseRequestedPreviewEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CloseRequested(handler) {
        if (!this.HasProp("__ISystemNavigationManagerPreview")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationManagerPreview := ISystemNavigationManagerPreview(outPtr)
        }

        return this.__ISystemNavigationManagerPreview.add_CloseRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CloseRequested(token) {
        if (!this.HasProp("__ISystemNavigationManagerPreview")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationManagerPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationManagerPreview := ISystemNavigationManagerPreview(outPtr)
        }

        return this.__ISystemNavigationManagerPreview.remove_CloseRequested(token)
    }

;@endregion Instance Methods
}
