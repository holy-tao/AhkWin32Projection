#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICastingController extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingController
     * @type {Guid}
     */
    static IID => Guid("{f0a56423-a664-4fbd-8b43-409a45e8d9a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Connect", "Disconnect", "Advise", "UnAdvise"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IUnknown} castingEngine 
     * @param {IUnknown} castingSource 
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
    Initialize(castingEngine, castingSource) {
        result := ComCall(3, this, "ptr", castingEngine, "ptr", castingSource, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Connect() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICastingEventHandler} eventHandler 
     * @param {Pointer<Integer>} cookie 
     * @returns {HRESULT} 
     */
    Advise(eventHandler, cookie) {
        result := ComCall(6, this, "ptr", eventHandler, "uint*", cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     */
    UnAdvise(cookie) {
        result := ComCall(7, this, "uint", cookie, "HRESULT")
        return result
    }
}
