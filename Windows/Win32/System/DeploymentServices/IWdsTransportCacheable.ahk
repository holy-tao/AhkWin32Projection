#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Provides caching for objects that handle persistent data. This interface can be inherited by other interfaces that represent persisted objects.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcacheable
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportCacheable extends IDispatch {
    /**
     * The interface identifier for IWdsTransportCacheable
     * @type {Guid}
     */
    static IID := Guid("{46ad894b-0bab-47dc-84b2-7b553f1d8f80}")

    /**
     * The class identifier for WdsTransportCacheable
     * @type {Guid}
     */
    static CLSID := Guid("{70590b16-f146-46bd-bd9d-4aaa90084bf5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportCacheable interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Dirty : IntPtr
        Discard   : IntPtr
        Refresh   : IntPtr
        Commit    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportCacheable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Dirty {
        get => this.get_Dirty()
    }

    /**
     * Receives a value that indicates whether object data has been modified.
     * @remarks
     * All objects of the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcacheable">IWdsTransportCacheable</a> interface start with the <b>Dirty</b> property cleared. After any property is modified, <b>Dirty</b> is set to indicate that the object now contains changes not yet committed to its backing store. The <b>Dirty</b> property is cleared if the changes are committed or explicitly discarded via the appropriate methods.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-get_dirty
     */
    get_Dirty() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pbDirty := 0, "HRESULT")
        return pbDirty
    }

    /**
     * Discards all changes made to the object data members by clearing the IWdsTransportCacheable::Dirty property and then calling the object's IWdsTransportCacheable::Refresh method to reread the current object data.
     * @remarks
     * This method can be called on any object. 
     * 
     * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-refresh">Refresh</a>, which always refreshes object data (as long as the object's <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-get_dirty">Dirty</a> property has been set), this method checks first that the object's <b>Dirty</b> property has been set. If it has, the method resets the <b>Dirty</b> property and then rereads the current values of all data members. If <b>Dirty</b> has not been set, this method takes no action and returns immediately.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-discard
     */
    Discard() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Refreshes the object data members by rereading their values from the underlying data store. This is allowed only if the object's IWdsTransportCacheable::Dirty property has been set.
     * @remarks
     * When called on an object whose <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-get_dirty">Dirty</a> property has been set, this method fails in order to avoid inadvertently losing changes made to the object. If the caller wants to ignore current changes and reread the stored data, the caller should call the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-discard">IWdsTransportCacheable::Discard</a> method instead.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Commits object data members to the underlying data store if the IWdsTransportCacheable::Dirty property has been set. Otherwise, the method returns with no action.
     * @remarks
     * Upon successful completion, this method clears the <a href="https://docs.microsoft.com/windows/desktop/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-get_dirty">Dirty</a> property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcacheable-commit
     */
    Commit() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportCacheable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Dirty := CallbackCreate(GetMethod(implObj, "get_Dirty"), flags, 2)
        this.vtbl.Discard := CallbackCreate(GetMethod(implObj, "Discard"), flags, 1)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Dirty)
        CallbackFree(this.vtbl.Discard)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Commit)
    }
}
