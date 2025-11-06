#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Determines the security identifier of the current object's original caller or direct caller. However, the preferred way to get information about an object's callers is to use the ISecurityCallContext interface.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isecurityproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISecurityProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityProperty
     * @type {Guid}
     */
    static IID => Guid("{51372aea-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The class identifier for SecurityProperty
     * @type {Guid}
     */
    static CLSID => Guid("{e74a7215-014d-11d1-a63c-00a0c911b4e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDirectCreatorSID", "GetOriginalCreatorSID", "GetDirectCallerSID", "GetOriginalCallerSID", "ReleaseSID"]

    /**
     * 
     * @param {Pointer<PSID>} pSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-getdirectcreatorsid
     */
    GetDirectCreatorSID(pSID) {
        pSIDMarshal := pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pSIDMarshal, pSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PSID>} pSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-getoriginalcreatorsid
     */
    GetOriginalCreatorSID(pSID) {
        pSIDMarshal := pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pSIDMarshal, pSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PSID>} pSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-getdirectcallersid
     */
    GetDirectCallerSID(pSID) {
        pSIDMarshal := pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pSIDMarshal, pSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PSID>} pSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-getoriginalcallersid
     */
    GetOriginalCallerSID(pSID) {
        pSIDMarshal := pSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pSIDMarshal, pSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSID} pSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecurityproperty-releasesid
     */
    ReleaseSID(pSID) {
        result := ComCall(7, this, "ptr", pSID, "HRESULT")
        return result
    }
}
