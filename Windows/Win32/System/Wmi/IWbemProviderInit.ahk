#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemProviderInit interface is called by Windows Management to initialize providers. All providers are required to implement IWbemProviderInit.
 * @see https://learn.microsoft.com/windows/win32/api//content/wbemprov/nn-wbemprov-iwbemproviderinit
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
     * @remarks
     * Typically, the provider implements a COM object using multiple inheritance to support both the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemproviderinit">IWbemProviderInit</a> interface as well as its primary interface, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemeventprovider">IWbemEventProvider</a>.
     * 
     * Initialization status is reported by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemproviderinitsink-setstatus">IWbemProviderInitSink::SetStatus</a>. This method can be called repeatedly to report incremental status if necessary. The provider must increment the reference count on this pointer by calling its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IWbemProviderInit::AddRef</a> method before using it to communicate status to Windows Management.
     * 
     * The provider may use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemproviderinitsink">IWbemProviderInitSink</a> pointer synchronously, as in the following code example.
     * 
     * 
     * ```cpp
     * HRESULT SampleProvider::Initialize( 
     *     // [unique][in]   LPWSTR wszUser,
     *     // [in]           LONG lFlags,
     *     // [in]           LPWSTR wszNamespace,
     *     // [unique][in]   LPWSTR wszLocale,
     *     // [in]           IWbemServices __RPC_FAR *pNamespace,
     *     // [in]           IWbemContext __RPC_FAR *pCtx,
     *     // [in]           IWbemProviderInitSink __RPC_FAR *pInitSink
     *     )
     * {
     *     // Use AddRef on the pNamespace pointer, if required.
     * 
     *     // Analyze other parameters.
     * 
     *     // Tell Windows Management that you are initialized.
     *     pInitSink->SetStatus(WBEM_S_INITIALIZED, 0);
     *     return WBEM_S_NO_ERROR;
     * }
     * ```
     * 
     * 
     * The provider may also use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the pointer and create a separate thread to complete its initialization and immediately return from the call.
     * 
     * The initialization process of some providers can involve calling back into WMI. A provider that calls back into WMI and must wait for that call to complete is called a dependent provider. Similarly, a call into WMI is called a dependent request. When implementing 
     * <b>Initialize</b>, WMI requires that a dependent provider obey the following rules:
     * 
     * <ul>
     * <li>
     * Dependent requests must reuse the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> pointer that WMI passed to 
     * <b>Initialize</b>.
     * 
     * This means that any calls into WMI made during initialization must reuse the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> pointer that WMI passed in. Failure to do so can result in deadlock.
     * 
     * </li>
     * <li>Non-dependent requests must not reuse the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> pointer.</li>
     * <li>
     * Dependent providers must make requests to WMI by using one of the following two strategies:
     * 
     * <ol>
     * <li>Make dependent requests with the thread received from WMI.</li>
     * <li>Make dependent requests with a new thread created by the provider.</li>
     * </ol>
     * </li>
     * <li>All providers must return the thread received from WMI.</li>
     * <li>
     * Under no circumstances does WMI allow a provider to block a thread received from WMI.
     * 
     * The danger in not carefully handling the threads delivered by WMI is that a provider may acquire all the threads in the WMI thread pool and proceed to block those threads. This would result in a deadlocked system.
     * 
     * </li>
     * </ul>
     * You may choose to implement your provider in-process. An in-process provider that must connect to WMI separately from the initialization process must use the <b>CLSID_WbemAdministrativeLocator</b> class identifier to access 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemlocator">IWbemLocator</a> in a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>.
     * 
     * The following code example describes how to use the <b>CLSID_WbemAdministrativeLocator</b> identifier in such a call.
     * 
     * 
     * ```cpp
     *   IWbemLocator *pLoc = 0;
     * 
     *   DWORD dwRes = CoCreateInstance(CLSID_WbemAdministrativeLocator, 0, 
     *       CLSCTX_INPROC_SERVER, IID_IWbemLocator, (LPVOID *) &pLoc);
     * ```
     * 
     * 
     * Failure to use the <b>CLSID_WbemAdministrativeLocator</b> identifier results in an Access Denied error. For more information about making a connection to WMI, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/creating-a-wmi-application-or-script">Creating a WMI Application or Script</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemprov/nf-wbemprov-iwbemproviderinit-initialize
     */
    Initialize(wszUser, lFlags, wszNamespace, wszLocale, pNamespace, pCtx, pInitSink) {
        wszUser := wszUser is String ? StrPtr(wszUser) : wszUser
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace
        wszLocale := wszLocale is String ? StrPtr(wszLocale) : wszLocale

        result := ComCall(3, this, "ptr", wszUser, "int", lFlags, "ptr", wszNamespace, "ptr", wszLocale, "ptr", pNamespace, "ptr", pCtx, "ptr", pInitSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
