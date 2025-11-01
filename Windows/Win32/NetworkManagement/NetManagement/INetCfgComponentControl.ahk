#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentControl
     * @type {Guid}
     */
    static IID => Guid("{932238df-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "ApplyRegistryChanges", "ApplyPnpChanges", "CancelChanges"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {INetCfgComponent} pIComp 
     * @param {INetCfg} pINetCfg 
     * @param {BOOL} fInstalling 
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
    Initialize(pIComp, pINetCfg, fInstalling) {
        result := ComCall(3, this, "ptr", pIComp, "ptr", pINetCfg, "int", fInstalling, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ApplyRegistryChanges() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgPnpReconfigCallback} pICallback 
     * @returns {HRESULT} 
     */
    ApplyPnpChanges(pICallback) {
        result := ComCall(5, this, "ptr", pICallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelChanges() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
