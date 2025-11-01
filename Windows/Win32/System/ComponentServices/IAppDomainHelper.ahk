#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Binds a managed object to an application domain, which is an isolated environment where applications execute.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iappdomainhelper
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IAppDomainHelper extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppDomainHelper
     * @type {Guid}
     */
    static IID => Guid("{c7b67079-8255-42c6-9ec0-6994a3548780}")

    /**
     * The class identifier for AppDomainHelper
     * @type {Guid}
     */
    static CLSID => Guid("{ef24f689-14f8-4d92-b4af-d7b1f0e70fd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "DoCallback"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IUnknown} pUnkAD 
     * @param {Pointer} __MIDL__IAppDomainHelper0000 
     * @param {Pointer<Void>} pPool 
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
    Initialize(pUnkAD, __MIDL__IAppDomainHelper0000, pPool) {
        result := ComCall(7, this, "ptr", pUnkAD, "ptr", __MIDL__IAppDomainHelper0000, "ptr", pPool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkAD 
     * @param {Pointer} __MIDL__IAppDomainHelper0001 
     * @param {Pointer<Void>} pPool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iappdomainhelper-docallback
     */
    DoCallback(pUnkAD, __MIDL__IAppDomainHelper0001, pPool) {
        result := ComCall(8, this, "ptr", pUnkAD, "ptr", __MIDL__IAppDomainHelper0001, "ptr", pPool, "HRESULT")
        return result
    }
}
