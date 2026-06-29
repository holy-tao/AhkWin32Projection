#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncMgrEvent.ahk" { ISyncMgrEvent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes sync event enumeration methods.
 * @remarks
 * An event store returns a pointer to an <b>IEnumSyncMgrEvents</b> interface from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgreventstore-geteventenumerator">ISyncMgrEventStore::GetEventEnumerator</a>.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-ienumsyncmgrevents
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumSyncMgrEvents extends IUnknown {
    /**
     * The interface identifier for IEnumSyncMgrEvents
     * @type {Guid}
     */
    static IID := Guid("{c81a1d4e-8cf7-4683-80e0-bcae88d677b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSyncMgrEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSyncMgrEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next batch of events from the event store.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * This value must be 1.
     * @param {Pointer<ISyncMgrEvent>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a> interface pointer.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to the number of events fetched.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrevents-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, ISyncMgrEvent.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips forward the specified number of events in the enumeration.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of events to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrevents-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the current location in the enumeration to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrevents-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones an IEnumSyncMgrEvents object.
     * @returns {IEnumSyncMgrEvents} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrevents">IEnumSyncMgrEvents</a>**</b>
     * 
     * The address of the cloned <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrevents">IEnumSyncMgrEvents</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-ienumsyncmgrevents-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSyncMgrEvents(ppenum)
    }

    Query(iid) {
        if (IEnumSyncMgrEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
