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
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ObjectID 
     * @param {PWSTR} pszType 
     * @param {Integer} resId 
     * @param {BOOL} enlisted 
     * @returns {HRESULT} 
     */
    OnResourceCreate(pInfo, ObjectID, pszType, resId, enlisted) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(3, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    OnResourceAllocate(pInfo, ObjectID, pszType, resId, enlisted, NumRated, Rating) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(4, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "uint", NumRated, "uint", Rating, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ObjectID 
     * @param {PWSTR} pszType 
     * @param {Integer} resId 
     * @returns {HRESULT} 
     */
    OnResourceRecycle(pInfo, ObjectID, pszType, resId) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(5, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    OnResourceDestroy(pInfo, ObjectID, hr, pszType, resId) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(6, this, "ptr", pInfo, "uint", ObjectID, "int", hr, "ptr", pszType, "uint", resId, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    OnResourceTrack(pInfo, ObjectID, pszType, resId, enlisted) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(7, this, "ptr", pInfo, "uint", ObjectID, "ptr", pszType, "uint", resId, "int", enlisted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
