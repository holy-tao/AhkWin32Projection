#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that provides an object's creator with the means to notify the object that it may be subject to subsequent reconciliation. The briefcase reconciler is responsible for implementing this interface.
 * @see https://learn.microsoft.com/windows/win32/api/reconcil/nn-reconcil-inotifyreplica
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INotifyReplica extends IUnknown {
    /**
     * The interface identifier for INotifyReplica
     * @type {Guid}
     */
    static IID := Guid("{99180163-da16-101a-935c-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INotifyReplica interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        YouAreAReplica : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INotifyReplica.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies an object that it may be subject to subsequent reconciliation through the Reconcile method.
     * @remarks
     * An object may be notified that it is a replica more than once. Briefcase reconcilers are not required to implement this interface. Initiators are not required to call this interface if it is implemented. However, an object's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/reconcil/nf-reconcil-ireconcilableobject-reconcile">Reconcile</a> may fail if that object has not previously been notified through <b>INotifyReplica::YouAreAReplica</b> that it may be subject to reconciliation.
     * 
     * The briefcase calls the <a href="https://docs.microsoft.com/windows/desktop/api/reconcil/nn-reconcil-inotifyreplica">INotifyReplica</a> interface when objects are added to it.
     * @param {Integer} ulcOtherReplicas Type: <b>ULONG</b>
     * 
     * The number of other replicas of the object. This parameter must not be zero.
     * @param {Pointer<IMoniker>} rgpmkOtherReplicas Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>**</b>
     * 
     * The address of an array that contains the addresses of the monikers to use to access the other replicas.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or <b>E_UNEXPECTED</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/reconcil/nf-reconcil-inotifyreplica-youareareplica
     */
    YouAreAReplica(ulcOtherReplicas, rgpmkOtherReplicas) {
        result := ComCall(3, this, "uint", ulcOtherReplicas, IMoniker.Ptr, rgpmkOtherReplicas, "HRESULT")
        return result
    }

    Query(iid) {
        if (INotifyReplica.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.YouAreAReplica := CallbackCreate(GetMethod(implObj, "YouAreAReplica"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.YouAreAReplica)
    }
}
