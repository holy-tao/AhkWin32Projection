#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a resource is created, allocated, tracked, or destroyed.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomresourceevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComResourceEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComResourceEvents
     * @type {Guid}
     */
    static IID => Guid("{683130ab-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnResourceCreate", "OnResourceAllocate", "OnResourceRecycle", "OnResourceDestroy", "OnResourceTrack"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ObjectID 
     * @param {PWSTR} pszType 
     * @param {Integer} resId 
     * @param {BOOL} enlisted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourcecreate
     */
    OnResourceCreate(pInfo, ObjectID, pszType, resId, enlisted) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(3, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ObjectID 
     * @param {PWSTR} pszType 
     * @param {Integer} resId 
     * @param {BOOL} enlisted 
     * @param {Integer} NumRated 
     * @param {Integer} Rating 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourceallocate
     */
    OnResourceAllocate(pInfo, ObjectID, pszType, resId, enlisted, NumRated, Rating) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(4, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "uint", NumRated, "uint", Rating, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ObjectID 
     * @param {PWSTR} pszType 
     * @param {Integer} resId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourcerecycle
     */
    OnResourceRecycle(pInfo, ObjectID, pszType, resId) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(5, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ObjectID 
     * @param {HRESULT} hr 
     * @param {PWSTR} pszType 
     * @param {Integer} resId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourcedestroy
     */
    OnResourceDestroy(pInfo, ObjectID, hr, pszType, resId) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(6, this, "ptr", pInfo, "uint", ObjectID, "int", hr, "ptr", pszType, "uint", resId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ObjectID 
     * @param {PWSTR} pszType 
     * @param {Integer} resId 
     * @param {BOOL} enlisted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourcetrack
     */
    OnResourceTrack(pInfo, ObjectID, pszType, resId, enlisted) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(7, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "HRESULT")
        return result
    }
}
