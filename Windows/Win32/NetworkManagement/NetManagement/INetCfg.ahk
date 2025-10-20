#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfg extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfg
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae93-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Uninitialize", "Apply", "Cancel", "EnumComponents", "FindComponent", "QueryNetCfgClass"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
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
    Initialize() {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pvReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Uninitialize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Apply() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClass 
     * @param {Pointer<IEnumNetCfgComponent>} ppenumComponent 
     * @returns {HRESULT} 
     */
    EnumComponents(pguidClass, ppenumComponent) {
        result := ComCall(7, this, "ptr", pguidClass, "ptr*", ppenumComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwInfId 
     * @param {Pointer<INetCfgComponent>} pComponent 
     * @returns {HRESULT} 
     */
    FindComponent(pszwInfId, pComponent) {
        pszwInfId := pszwInfId is String ? StrPtr(pszwInfId) : pszwInfId

        result := ComCall(8, this, "ptr", pszwInfId, "ptr*", pComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClass 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    QueryNetCfgClass(pguidClass, riid, ppvObject) {
        result := ComCall(9, this, "ptr", pguidClass, "ptr", riid, "ptr*", ppvObject, "HRESULT")
        return result
    }
}
