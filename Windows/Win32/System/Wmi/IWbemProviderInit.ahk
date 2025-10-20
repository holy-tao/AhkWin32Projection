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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} wszUser 
     * @param {Integer} lFlags 
     * @param {PWSTR} wszNamespace 
     * @param {PWSTR} wszLocale 
     * @param {IWbemServices} pNamespace 
     * @param {IWbemContext} pCtx 
     * @param {IWbemProviderInitSink} pInitSink 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(wszUser, lFlags, wszNamespace, wszLocale, pNamespace, pCtx, pInitSink) {
        wszUser := wszUser is String ? StrPtr(wszUser) : wszUser
        wszNamespace := wszNamespace is String ? StrPtr(wszNamespace) : wszNamespace
        wszLocale := wszLocale is String ? StrPtr(wszLocale) : wszLocale

        result := ComCall(3, this, "ptr", wszUser, "int", lFlags, "ptr", wszNamespace, "ptr", wszLocale, "ptr", pNamespace, "ptr", pCtx, "ptr", pInitSink, "HRESULT")
        return result
    }
}
