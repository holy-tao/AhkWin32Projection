#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountMonitor.ahk
#Include .\IWebAccountMonitor2.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\WebAccountMonitor.ahk
#Include .\WebAccountEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Allows an app to monitor specific web accounts and raises events when those web accounts change.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webaccountmonitor
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebAccountMonitor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountMonitor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountMonitor.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnUpdatedToken")) {
            this.remove_Updated(this.__OnUpdatedToken)
            this.__OnUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnRemovedToken")) {
            this.remove_Removed(this.__OnRemovedToken)
            this.__OnRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnDefaultSignInAccountChangedToken")) {
            this.remove_DefaultSignInAccountChanged(this.__OnDefaultSignInAccountChangedToken)
            this.__OnDefaultSignInAccountChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAccountPictureUpdatedToken")) {
            this.remove_AccountPictureUpdated(this.__OnAccountPictureUpdatedToken)
            this.__OnAccountPictureUpdated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<WebAccountMonitor, WebAccountEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IWebAccountMonitor")) {
            if ((queryResult := this.QueryInterface(IWebAccountMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountMonitor := IWebAccountMonitor(outPtr)
        }

        return this.__IWebAccountMonitor.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IWebAccountMonitor")) {
            if ((queryResult := this.QueryInterface(IWebAccountMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountMonitor := IWebAccountMonitor(outPtr)
        }

        return this.__IWebAccountMonitor.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebAccountMonitor, WebAccountEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IWebAccountMonitor")) {
            if ((queryResult := this.QueryInterface(IWebAccountMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountMonitor := IWebAccountMonitor(outPtr)
        }

        return this.__IWebAccountMonitor.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IWebAccountMonitor")) {
            if ((queryResult := this.QueryInterface(IWebAccountMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountMonitor := IWebAccountMonitor(outPtr)
        }

        return this.__IWebAccountMonitor.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebAccountMonitor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DefaultSignInAccountChanged(handler) {
        if (!this.HasProp("__IWebAccountMonitor")) {
            if ((queryResult := this.QueryInterface(IWebAccountMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountMonitor := IWebAccountMonitor(outPtr)
        }

        return this.__IWebAccountMonitor.add_DefaultSignInAccountChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DefaultSignInAccountChanged(token) {
        if (!this.HasProp("__IWebAccountMonitor")) {
            if ((queryResult := this.QueryInterface(IWebAccountMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountMonitor := IWebAccountMonitor(outPtr)
        }

        return this.__IWebAccountMonitor.remove_DefaultSignInAccountChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WebAccountMonitor, WebAccountEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccountPictureUpdated(handler) {
        if (!this.HasProp("__IWebAccountMonitor2")) {
            if ((queryResult := this.QueryInterface(IWebAccountMonitor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountMonitor2 := IWebAccountMonitor2(outPtr)
        }

        return this.__IWebAccountMonitor2.add_AccountPictureUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AccountPictureUpdated(token) {
        if (!this.HasProp("__IWebAccountMonitor2")) {
            if ((queryResult := this.QueryInterface(IWebAccountMonitor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountMonitor2 := IWebAccountMonitor2(outPtr)
        }

        return this.__IWebAccountMonitor2.remove_AccountPictureUpdated(token)
    }

;@endregion Instance Methods
}
