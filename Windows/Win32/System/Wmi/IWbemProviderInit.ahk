#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemProviderInit interface is called by Windows Management to initialize providers. All providers are required to implement IWbemProviderInit.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemproviderinit
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemProviderInit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemProviderInit
     * @type {Guid}
     */
    static IID => Guid("{1be41572-91dd-11d1-aeb2-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Called by Windows Management to initialize a provider to receive client requests. All types of providers must implement this method.
     * @param {PWSTR} wszUser A pointer to the user name, if per-user initialization was requested in the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--win32provider">__Win32Provider</a> registration instance for this provider. Otherwise, this is <b>NULL</b>.
     * 
     * Be aware that this parameter is set to <b>NULL</b> for event consumer providers regardless of the value of the <b>PerUserInitialization</b> property in the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--win32provider">__Win32Provider</a> instance for the provider.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {PWSTR} wszNamespace A namespace name for which the provider is initialized.
     * @param {PWSTR} wszLocale Locale name for which the provider is being initialized.
     * 
     * A string of the following format, where the hex value is a Microsoft standard LCID value:
     * 
     * <ul>
     * <li>"MS_409"</li>
     * </ul>
     * This parameter may be <b>NULL</b>.
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back into Windows Management. This pointer is can service any requests made by the provider. The provider should use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IWbemProviderInit::AddRef</a> method on this pointer if it is going to call back into Windows Management during its execution.
     * @param {IWbemContext} pCtx An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> pointer associated with initialization. This parameter may be <b>NULL</b>.
     * 
     * If the provider will perform requests back into Windows Management before completing initialization, it should use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IWbemProviderInit::AddRef</a> method on this pointer. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * 
     * In the event that a provider must make a dependent request on another provider, you must pass this context string back to WMI to avoid potential lockups. However, in the case of an independent request, this is not necessary, and WMI generates a new context string for it.
     * @param {IWbemProviderInitSink} pInitSink An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemproviderinitsink">IWbemProviderInitSink</a> pointer that is used by the provider to report initialization status.
     * @returns {HRESULT} The provider should return <b>WBEM_S_NO_ERROR</b> and indicate its status using the supplied object sink in the <i>pInitSink</i> parameter. However, if a provider returns <b>WBEM_E_FAILED</b> and does not use the sink, then the provider initialization is considered as failed.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemproviderinit-initialize
     */
    Initialize(wszUser, lFlags, wszNamespace, wszLocale, pNamespace, pCtx, pInitSink) {
        wszUser := wszUser is String ? StrPtr(wszUser) : wszUser
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace
        wszLocale := wszLocale is String ? StrPtr(wszLocale) : wszLocale

        result := ComCall(3, this, "ptr", wszUser, "int", lFlags, "ptr", wszNamespace, "ptr", wszLocale, "ptr", pNamespace, "ptr", pCtx, "ptr", pInitSink, "HRESULT")
        return result
    }
}
