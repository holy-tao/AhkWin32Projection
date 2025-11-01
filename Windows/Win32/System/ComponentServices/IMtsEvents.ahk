#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides methods for obtaining information about the running package and establishing event sinks.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imtsevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMtsEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMtsEvents
     * @type {Guid}
     */
    static IID => Guid("{bacedf4d-74ab-11d0-b162-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PackageName", "get_PackageGuid", "PostEvent", "get_FireEvents", "GetProcessID"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-get_packagename
     */
    get_PackageName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-get_packageguid
     */
    get_PackageGuid(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} vEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-postevent
     */
    PostEvent(vEvent) {
        result := ComCall(9, this, "ptr", vEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-get_fireevents
     */
    get_FireEvents(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-getprocessid
     */
    GetProcessID(id) {
        result := ComCall(11, this, "int*", id, "HRESULT")
        return result
    }
}
