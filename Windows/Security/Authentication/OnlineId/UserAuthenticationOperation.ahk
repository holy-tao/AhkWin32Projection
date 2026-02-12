#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\UserIdentity.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IAsyncInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Asynchronously gets the user's identity and corresponding tickets and properties.
  * 
  * > [!NOTE]
  * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.userauthenticationoperation
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class UserAuthenticationOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAsyncOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAsyncOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a handler that's called when the operation completes.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.userauthenticationoperation.completed
     * @type {AsyncOperationCompletedHandler<Generic>} 
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
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.userauthenticationoperation.id
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
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.userauthenticationoperation.status
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
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.userauthenticationoperation.errorcode
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
     * @param {AsyncOperationCompletedHandler<Generic>} handler 
     * @returns {HRESULT} 
     */
    put_Completed(handler) {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{b8cc25e1-409f-57f4-bbe4-3b95b74b86c8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation(UserIdentity, outPtr)
        }

        return this.__IAsyncOperation.put_Completed(handler)
    }

    /**
     * 
     * @returns {AsyncOperationCompletedHandler<Generic>} 
     */
    get_Completed() {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{b8cc25e1-409f-57f4-bbe4-3b95b74b86c8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation(UserIdentity, outPtr)
        }

        return this.__IAsyncOperation.get_Completed()
    }

    /**
     * Returns a UserIdentity object that contains information about the user.
     * 
     * > [!NOTE]
     * > If you are developing for Windows 10 or greater, use the [Windows.Security.Authentication.Web.Core](../windows.security.authentication.web.core/windows_security_authentication_web_core.md) APIs instead. For more information, see [Web account manager](/windows/uwp/security/web-account-manager).
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.userauthenticationoperation.getresults
     */
    GetResults() {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{b8cc25e1-409f-57f4-bbe4-3b95b74b86c8}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation(UserIdentity, outPtr)
        }

        return this.__IAsyncOperation.GetResults()
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
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.userauthenticationoperation.cancel
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
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.userauthenticationoperation.close
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
