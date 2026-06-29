#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncMgrConflictItems.ahk" { ISyncMgrConflictItems }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SYNCMGR_CONFLICT_ID_INFO.ahk" { SYNCMGR_CONFLICT_ID_INFO }
#Import ".\ISyncMgrConflictResolveInfo.ahk" { ISyncMgrConflictResolveInfo }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }

/**
 * Exposes methods that provide information about a conflict retrieved from a conflict store, and allows the conflict to be resolved.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflict
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrConflict extends IUnknown {
    /**
     * The interface identifier for ISyncMgrConflict
     * @type {Guid}
     */
    static IID := Guid("{9c204249-c443-4ba4-85ed-c972681db137}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrConflict interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperty          : IntPtr
        GetConflictIdInfo    : IntPtr
        GetItemsArray        : IntPtr
        Resolve              : IntPtr
        GetResolutionHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrConflict.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a conflict property, given a property key.
     * @remarks
     * The properties returned are properties of the conflict and not of the <b>IShellItems</b> that are in conflict.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> referenced in <i>propkey</i> is not present in the property store, this method returns S_OK and the <b>vt</b> member of the structure pointed to by <i>ppropvar</i> is set to VT_EMPTY.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the property key for which the property is being requested. Any property key is valid here, including but not limited to the following values.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the requested property.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-getproperty
     */
    GetProperty(propkey) {
        ppropvar := PROPVARIANT()
        result := ComCall(3, this, PROPERTYKEY.Ptr, propkey, PROPVARIANT.Ptr, ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * Gets information that identifies a conflict within a conflict store.
     * @remarks
     * <div class="alert"><b>Note</b>  Each member should be allocated using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Free each member using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.</div>
     * <div> </div>
     * This method contains two opaque blobs: One is the ID uniquely identifying a conflict within a conflict store. The other is optional extra information stored with the conflict that may be used by the implementation when creating conflict objects in <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictstore-bindtoconflict">BindToConflict</a> and <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrconflictstore-removeconflicts">RemoveConflicts</a>.
     * 
     * The size of of the ID blob must be kept short so that the ID may be embedded inside the conflict's pointer to an item identifier list (PIDL) or parsing name.
     * @returns {SYNCMGR_CONFLICT_ID_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-syncmgr_conflict_id_info">SYNCMGR_CONFLICT_ID_INFO</a>*</b>
     * 
     * A pointer to a conflict ID info structure. See <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ns-syncmgr-syncmgr_conflict_id_info">SYNCMGR_CONFLICT_ID_INFO</a>.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-getconflictidinfo
     */
    GetConflictIdInfo() {
        pConflictIdInfo := SYNCMGR_CONFLICT_ID_INFO()
        result := ComCall(4, this, SYNCMGR_CONFLICT_ID_INFO.Ptr, pConflictIdInfo, "HRESULT")
        return pConflictIdInfo
    }

    /**
     * Retrieves a conflict items array.
     * @returns {ISyncMgrConflictItems} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictitems">ISyncMgrConflictItems</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictitems">ISyncMgrConflictItems</a> array.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-getitemsarray
     */
    GetItemsArray() {
        result := ComCall(5, this, "ptr*", &ppArray := 0, "HRESULT")
        return ISyncMgrConflictItems(ppArray)
    }

    /**
     * Resolves the conflict using its own sync handler, controls UI.
     * @remarks
     * Note that the store must tell the sync center if the conflict was removed by calling <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateconflicts">UpdateConflicts</a> after the conflict is resolved. The conflict is assumed to still exist until the store notifies the sync center of changes. The resolution choices for user selection are available through <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo">ISyncMgrConflictResolveInfo</a>.
     * @param {ISyncMgrConflictResolveInfo} pResolveInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo">ISyncMgrConflictResolveInfo</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo">ISyncMgrConflictResolveInfo</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-resolve
     */
    Resolve(pResolveInfo) {
        result := ComCall(6, this, "ptr", pResolveInfo, "HRESULT")
        return result
    }

    /**
     * Gets the resolution handler for the conflict.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the ID for the resolution handler.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrconflict-getresolutionhandler
     */
    GetResolutionHandler(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &ppvResolutionHandler := 0, "HRESULT")
        return ppvResolutionHandler
    }

    Query(iid) {
        if (ISyncMgrConflict.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.GetConflictIdInfo := CallbackCreate(GetMethod(implObj, "GetConflictIdInfo"), flags, 2)
        this.vtbl.GetItemsArray := CallbackCreate(GetMethod(implObj, "GetItemsArray"), flags, 2)
        this.vtbl.Resolve := CallbackCreate(GetMethod(implObj, "Resolve"), flags, 2)
        this.vtbl.GetResolutionHandler := CallbackCreate(GetMethod(implObj, "GetResolutionHandler"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.GetConflictIdInfo)
        CallbackFree(this.vtbl.GetItemsArray)
        CallbackFree(this.vtbl.Resolve)
        CallbackFree(this.vtbl.GetResolutionHandler)
    }
}
