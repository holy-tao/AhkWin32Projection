#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to manage a COM+ object pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicepool
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServicePool extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServicePool
     * @type {Guid}
     */
    static IID => Guid("{b302df81-ea45-451e-99a2-09f9fd1b1e13}")

    /**
     * The class identifier for ServicePool
     * @type {Guid}
     */
    static CLSID => Guid("{ecabb0c9-7f19-11d2-978e-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetObject", "Shutdown"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IUnknown} pPoolConfig 
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
    Initialize(pPoolConfig) {
        result := ComCall(3, this, "ptr", pPoolConfig, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepool-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
