#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TRACKING_COLL_TYPE.ahk" { TRACKING_COLL_TYPE }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves information about a tracking information collection.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomtrackinginfocollection
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComTrackingInfoCollection extends IUnknown {
    /**
     * The interface identifier for IComTrackingInfoCollection
     * @type {Guid}
     */
    static IID := Guid("{c266c677-c9ad-49ab-9fd9-d9661078588a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComTrackingInfoCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Type  : IntPtr
        Count : IntPtr
        Item  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComTrackingInfoCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the type of a tracking information collection.
     * @returns {TRACKING_COLL_TYPE} The type of tracking information. For a list of values, see the <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-tracking_coll_type">TRACKING_COLL_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-type
     */
    Type() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves the number of objects in a tracking information collection.
     * @returns {Integer} The number of objects in the tracking information collection.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-count
     */
    Count() {
        result := ComCall(4, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Retrieves the specified interface from a specified member of a tracking information collection.
     * @param {Integer} ulIndex The index of the object in the collection.
     * @param {Pointer<Guid>} riid The identifier of the interface to be requested.
     * @returns {Pointer<Void>} A pointer to the requested interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-item
     */
    Item(ulIndex, riid) {
        result := ComCall(5, this, "uint", ulIndex, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IComTrackingInfoCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Type := CallbackCreate(GetMethod(implObj, "Type"), flags, 2)
        this.vtbl.Count := CallbackCreate(GetMethod(implObj, "Count"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Type)
        CallbackFree(this.vtbl.Count)
        CallbackFree(this.vtbl.Item)
    }
}
