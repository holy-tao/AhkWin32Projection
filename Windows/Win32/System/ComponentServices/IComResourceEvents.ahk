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
     * Generated when a new resource is created and allocated.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ObjectID The just-in-time activated object.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier of the resource.
     * @param {BOOL} enlisted Indicates whether the resource is enlisted in a transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomresourceevents-onresourcecreate
     */
    OnResourceCreate(pInfo, ObjectID, pszType, resId, enlisted) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(3, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "HRESULT")
        return result
    }

    /**
     * Generated when an existing resource is allocated.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ObjectID The just-in-time activated object.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier for the resource.
     * @param {BOOL} enlisted Indicates whether the resource is enlisted in a transaction.
     * @param {Integer} NumRated The number of possible resources evaluated for a match.
     * @param {Integer} Rating The rating of the resource actually selected.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomresourceevents-onresourceallocate
     */
    OnResourceAllocate(pInfo, ObjectID, pszType, resId, enlisted, NumRated, Rating) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(4, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "uint", NumRated, "uint", Rating, "HRESULT")
        return result
    }

    /**
     * Generated when an object is finished with a resource.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ObjectID The just-in-time activated object.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier of the resource.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomresourceevents-onresourcerecycle
     */
    OnResourceRecycle(pInfo, ObjectID, pszType, resId) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(5, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "HRESULT")
        return result
    }

    /**
     * Generated when a resource is destroyed.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ObjectID The just-in-time activated object.
     * @param {HRESULT} hr The result from resource dispensers destroy call.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier of the resource.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomresourceevents-onresourcedestroy
     */
    OnResourceDestroy(pInfo, ObjectID, hr, pszType, resId) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(6, this, "ptr", pInfo, "uint", ObjectID, "int", hr, "ptr", pszType, "uint", resId, "HRESULT")
        return result
    }

    /**
     * Generated when a resource is tracked.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ObjectID The just-in-time activated object.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier of the resource.
     * @param {BOOL} enlisted Indicates whether the resource is enlisted in a transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomresourceevents-onresourcetrack
     */
    OnResourceTrack(pInfo, ObjectID, pszType, resId, enlisted) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(7, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "HRESULT")
        return result
    }
}
