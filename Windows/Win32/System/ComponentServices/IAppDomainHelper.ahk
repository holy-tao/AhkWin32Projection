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
     * Binds the calling object to the current application domain and provides a callback function for shutdown that is executed when the application domain is unloaded.
     * @param {IUnknown} pUnkAD Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the current application domain.
     * @param {Pointer} __MIDL__IAppDomainHelper0000 Reference to the shutdown function that is executed when the application domain is unloaded. The parameter of this function, <i>pv</i>, comes from the <i>pPool</i> parameter, which is defined next.
     * @param {Pointer<Void>} pPool This parameter is used to provide any data that the shutdown function might need.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iappdomainhelper-initialize
     */
    Initialize(pUnkAD, __MIDL__IAppDomainHelper0000, pPool) {
        pPoolMarshal := pPool is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", pUnkAD, "ptr", __MIDL__IAppDomainHelper0000, pPoolMarshal, pPool, "HRESULT")
        return result
    }

    /**
     * Switches into a given application domain (which the calling object must be bound to), executes the supplied callback function in that application domain, and then returns to the original application domain.
     * @param {IUnknown} pUnkAD Reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the application domain that you want to switch to. The object calling <b>DoCallback</b> must be bound to that application domain.
     * @param {Pointer} __MIDL__IAppDomainHelper0001 Reference to the callback function. This function is executed in the application domain that you switched to. The parameter of this function, <i>pv</i>, comes from the <i>pPool</i> parameter, which is defined next.
     * @param {Pointer<Void>} pPool This parameter is used to provide any data that the callback function might need.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iappdomainhelper-docallback
     */
    DoCallback(pUnkAD, __MIDL__IAppDomainHelper0001, pPool) {
        pPoolMarshal := pPool is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", pUnkAD, "ptr", __MIDL__IAppDomainHelper0001, pPoolMarshal, pPool, "HRESULT")
        return result
    }
}
