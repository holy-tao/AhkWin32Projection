#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Foundation\IAsyncInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Allows users to sign out of your app.
  * 
  * > [!NOTE]
  * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.signoutuseroperation
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class SignOutUserOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAsyncAction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAsyncAction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a handler that is called when the operation completes.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.signoutuseroperation.completed
     * @type {AsyncActionCompletedHandler} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    /**
     * Gets a unique identifier that represents the operation.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.signoutuseroperation.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the current status of the operation.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.signoutuseroperation.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the error code should the operation fail.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.signoutuseroperation.errorcode
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {AsyncActionCompletedHandler} handler 
     * @returns {HRESULT} 
     */
    put_Completed(handler) {
        if (!this.HasProp("__IAsyncAction")) {
            if ((queryResult := this.QueryInterface(IAsyncAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncAction := IAsyncAction(outPtr)
        }

        return this.__IAsyncAction.put_Completed(handler)
    }

    /**
     * 
     * @returns {AsyncActionCompletedHandler} 
     */
    get_Completed() {
        if (!this.HasProp("__IAsyncAction")) {
            if ((queryResult := this.QueryInterface(IAsyncAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncAction := IAsyncAction(outPtr)
        }

        return this.__IAsyncAction.get_Completed()
    }

    /**
     * Returns the results of the operation. For this class, there are no results to return if the operation succeeds.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.signoutuseroperation.getresults
     */
    GetResults() {
        if (!this.HasProp("__IAsyncAction")) {
            if ((queryResult := this.QueryInterface(IAsyncAction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncAction := IAsyncAction(outPtr)
        }

        return this.__IAsyncAction.GetResults()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_ErrorCode()
    }

    /**
     * Requests the cancellation of the operation.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.signoutuseroperation.cancel
     */
    Cancel() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.Cancel()
    }

    /**
     * Requests that work associated with the operation should terminate.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.signoutuseroperation.close
     */
    Close() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.Close()
    }

;@endregion Instance Methods
}
