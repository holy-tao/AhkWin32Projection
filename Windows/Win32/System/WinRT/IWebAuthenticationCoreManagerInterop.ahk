#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Contains core methods for obtaining tokens from web account providers.
 * @remarks
 * This interface is implemented by WebAuthenticationCoreManager's [activation factory](../activation/nn-activation-iactivationfactory.md).
 * To get an object of this interface, get a reference to the activation factory
 * and then call [IUnknown::QueryInterface](../unknwn/nf-unknwn-iunknown-queryinterface%28refiid_void%29.md)
 * on it:
 * 
 * ```cppwinrt
 * using winrt::Windows::Security::Authentication::Web::Core::WebAuthenticationCoreManager;
 * 
 * auto managerFactory = winrt::get_activation_factory<WebAuthenticationCoreManager>();
 * winrt::com_ptr<IWebAuthenticationCoreManagerInterop> managerInterop{ managerFactory.as<IWebAuthenticationCoreManagerInterop>() };
 * 
 * managerInterop->RequestTokenForWindowAsync(// ... )
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/webauthenticationcoremanagerinterop/nn-webauthenticationcoremanagerinterop-iwebauthenticationcoremanagerinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IWebAuthenticationCoreManagerInterop extends IInspectable {
    /**
     * The interface identifier for IWebAuthenticationCoreManagerInterop
     * @type {Guid}
     */
    static IID := Guid("{f4b8e804-811e-4436-b69c-44cb67b72084}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebAuthenticationCoreManagerInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        RequestTokenForWindowAsync               : IntPtr
        RequestTokenWithWebAccountForWindowAsync : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebAuthenticationCoreManagerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Asynchronously requests a token from a web account provider. If necessary, the user is prompted to enter their credentials. (IWebAuthenticationCoreManagerInterop::RequestTokenForWindowAsync)
     * @remarks
     * This method is the equivalent for desktop apps of
     * [WebAuthenticationCoreManager.RequestTokenAsync(WebTokenRequest)](/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.requesttokenasync#Windows_Security_Authentication_Web_Core_WebAuthenticationCoreManager_RequestTokenAsync_Windows_Security_Authentication_Web_Core_WebTokenRequest_).
     * @param {HWND} appWindow Type: **[HWND](/windows/win32/winprog/windows-data-types)**
     * 
     * The window to be used as the owner for the window prompting the user for credentials, in case such a window becomes necessary.
     * @param {IInspectable} request Type: **[IInspectable](../inspectable/nn-inspectable-iinspectable.md)\***
     * 
     * The web token request, given as an instance of the
     * [WebTokenRequest](/uwp/api/windows.security.authentication.web.core.webtokenrequest)
     * class type-casted to the [IInspectable](../inspectable/nn-inspectable-iinspectable.md)
     * interface.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * Must be a reference to the [interface identifier (IID)](/openspecs/windows_protocols/ms-oaut/5583e1b8-454c-4147-9f56-f72416a15bee#gt_76ad3105-3f05-479d-a40c-c9c8fa2ebd83) for the interface
     * [IAsyncOperation](/uwp/api/windows.foundation.iasyncoperation-1)\<[WebTokenRequestResult](/uwp/api/windows.security.authentication.web.core.webtokenrequestresult)\>.
     * This IID is automatically generated, and you can obtain it using code like this:
     * 
     * ```cppwinrt
     * using winrt::Windows::Foundation::IAsyncOperation;
     * using winrt::Windows::Security::Authentication::Web::Core::WebTokenRequestResult;
     * 
     * constexpr winrt::guid iidAsyncRequestResult{ winrt::guid_of<IAsyncOperation<WebTokenRequestResult>>() };
     * ```
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * The address of a pointer to [IAsyncOperation](/uwp/api/windows.foundation.iasyncoperation-1)\<[WebTokenRequestResult](/uwp/api/windows.security.authentication.web.core.webtokenrequestresult)\>. On successful return from this method, the pointer will be set to the asynchronous request operation object for the request operation just started.
     * @see https://learn.microsoft.com/windows/win32/api/webauthenticationcoremanagerinterop/nf-webauthenticationcoremanagerinterop-iwebauthenticationcoremanagerinterop-requesttokenforwindowasync
     */
    RequestTokenForWindowAsync(appWindow, request, riid) {
        result := ComCall(6, this, HWND, appWindow, "ptr", request, Guid.Ptr, riid, "ptr*", &asyncInfo := 0, "HRESULT")
        return asyncInfo
    }

    /**
     * Asynchronously requests a token from a web account provider. If necessary, the user is prompted to enter their credentials. (IWebAuthenticationCoreManagerInterop::RequestTokenWithWebAccountForWindowAsync)
     * @remarks
     * This method is the equivalent for desktop apps of
     * [WebAuthenticationCoreManager.RequestTokenAsync(WebTokenRequest, WebAccount)](/uwp/api/windows.security.authentication.web.core.webauthenticationcoremanager.requesttokenasync#Windows_Security_Authentication_Web_Core_WebAuthenticationCoreManager_RequestTokenAsync_Windows_Security_Authentication_Web_Core_WebTokenRequest_Windows_Security_Credentials_WebAccount_).
     * @param {HWND} appWindow Type: **[HWND](/windows/win32/winprog/windows-data-types)**
     * 
     * The window to be used as the owner for the window prompting the user for credentials, in case such a window becomes necessary.
     * @param {IInspectable} request Type: **[IInspectable](../inspectable/nn-inspectable-iinspectable.md)\***
     * 
     * The web token request, given as an instance of the
     * [WebTokenRequest](/uwp/api/windows.security.authentication.web.core.webtokenrequest)
     * class type-casted to the [IInspectable](../inspectable/nn-inspectable-iinspectable.md)
     * interface.
     * @param {IInspectable} webAccount Type: **[IInspectable](../inspectable/nn-inspectable-iinspectable.md)\***
     * 
     * The web account for the request, given as an instance of the
     * [WebAccount](/uwp/api/windows.security.credentials.webaccount)
     * class type-casted to the [IInspectable](../inspectable/nn-inspectable-iinspectable.md)
     * interface.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * Must refer to the [interface identifier (IID)](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)
     * for the interface
     * [IAsyncOperation](/uwp/api/windows.foundation.iasyncoperation-1)\<[WebTokenRequestResult](/uwp/api/windows.security.authentication.web.core.webtokenrequestresult)\>.
     * 
     * This IID is automatically generated, and you can obtain it using code like this:
     * 
     * ```cppwinrt
     * using winrt::Windows::Foundation::IAsyncOperation;
     * using winrt::Windows::Security::Authentication::Web::Core::WebTokenRequestResult;
     * 
     * constexpr winrt::guid iidAsyncRequestResult{ winrt::guid_of<IAsyncOperation<WebTokenRequestResult>>() };
     * ```
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * The address of a pointer to
     * [IAsyncOperation](/uwp/api/windows.foundation.iasyncoperation-1)\<[WebTokenRequestResult](/uwp/api/windows.security.authentication.web.core.webtokenrequestresult)\>.
     * On successful return from this method, the pointer will be set to the
     * asynchronous request operation object for the request operation just started.
     * @see https://learn.microsoft.com/windows/win32/api/webauthenticationcoremanagerinterop/nf-webauthenticationcoremanagerinterop-iwebauthenticationcoremanagerinterop-requesttokenwithwebaccountforwindowasync
     */
    RequestTokenWithWebAccountForWindowAsync(appWindow, request, webAccount, riid) {
        result := ComCall(7, this, HWND, appWindow, "ptr", request, "ptr", webAccount, Guid.Ptr, riid, "ptr*", &asyncInfo := 0, "HRESULT")
        return asyncInfo
    }

    Query(iid) {
        if (IWebAuthenticationCoreManagerInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestTokenForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestTokenForWindowAsync"), flags, 5)
        this.vtbl.RequestTokenWithWebAccountForWindowAsync := CallbackCreate(GetMethod(implObj, "RequestTokenWithWebAccountForWindowAsync"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestTokenForWindowAsync)
        CallbackFree(this.vtbl.RequestTokenWithWebAccountForWindowAsync)
    }
}
