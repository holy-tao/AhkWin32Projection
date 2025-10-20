#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if an instance of a just-in-time (JIT) activated object has been created or freed.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomobjectevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComObjectEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComObjectEvents
     * @type {Guid}
     */
    static IID => Guid("{683130aa-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnObjectActivate", "OnObjectDeactivate", "OnDisableCommit", "OnEnableCommit", "OnSetComplete", "OnSetAbort"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} CtxtID 
     * @param {Integer} ObjectID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-onobjectactivate
     */
    OnObjectActivate(pInfo, CtxtID, ObjectID) {
        result := ComCall(3, this, "ptr", pInfo, "uint", CtxtID, "uint", ObjectID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} CtxtID 
     * @param {Integer} ObjectID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-onobjectdeactivate
     */
    OnObjectDeactivate(pInfo, CtxtID, ObjectID) {
        result := ComCall(4, this, "ptr", pInfo, "uint", CtxtID, "uint", ObjectID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} CtxtID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-ondisablecommit
     */
    OnDisableCommit(pInfo, CtxtID) {
        result := ComCall(5, this, "ptr", pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} CtxtID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-onenablecommit
     */
    OnEnableCommit(pInfo, CtxtID) {
        result := ComCall(6, this, "ptr", pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} CtxtID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectevents-onsetcomplete
     */
    OnSetComplete(pInfo, CtxtID) {
        result := ComCall(7, this, "ptr", pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} CtxtID 
     * @returns {HRESULT} 
     */
    OnSetAbort(pInfo, CtxtID) {
        result := ComCall(8, this, "ptr", pInfo, "uint", CtxtID, "HRESULT")
        return result
    }
}
