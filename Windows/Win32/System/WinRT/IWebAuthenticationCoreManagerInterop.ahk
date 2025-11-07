#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Contains core methods for obtaining tokens from web account providers.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webauthenticationcoremanagerinterop/nn-webauthenticationcoremanagerinterop-iwebauthenticationcoremanagerinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IWebAuthenticationCoreManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationCoreManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{f4b8e804-811e-4436-b69c-44cb67b72084}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestTokenForWindowAsync", "RequestTokenWithWebAccountForWindowAsync"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IInspectable} request 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthenticationcoremanagerinterop/nf-webauthenticationcoremanagerinterop-iwebauthenticationcoremanagerinterop-requesttokenforwindowasync
     */
    RequestTokenForWindowAsync(appWindow, request, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", request, "ptr", riid, "ptr*", &asyncInfo := 0, "HRESULT")
        return asyncInfo
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IInspectable} request 
     * @param {IInspectable} webAccount 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthenticationcoremanagerinterop/nf-webauthenticationcoremanagerinterop-iwebauthenticationcoremanagerinterop-requesttokenwithwebaccountforwindowasync
     */
    RequestTokenWithWebAccountForWindowAsync(appWindow, request, webAccount, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", request, "ptr", webAccount, "ptr", riid, "ptr*", &asyncInfo := 0, "HRESULT")
        return asyncInfo
    }
}
