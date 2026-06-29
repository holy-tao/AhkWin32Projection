#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Deprecated. Exposes methods to identify, invoke, and update an individual item in the browser's travel history.
 * @remarks
 * Travel entries represented by <b>ITravelEntry</b> are created and maintained internally by the travel log (<a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>). Calling applications rarely use <b>ITravelEntry</b> directly.
 * 
 * <div class="alert"><b>Note</b>  <b>ITravelEntry</b> may not be supported in versions of Windows later than Windows XP.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-itravelentry
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITravelEntry extends IUnknown {
    /**
     * The interface identifier for ITravelEntry
     * @type {Guid}
     */
    static IID := Guid("{f46edb3b-bc2f-11d0-9412-00aa00a3ebd3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITravelEntry interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke  : IntPtr
        Update  : IntPtr
        GetPidl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITravelEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deprecated. Invokes the travel entry, navigating to that page.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the browser or frame within which the travel operation generating the entry is taking place.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravelentry-invoke
     */
    Invoke(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Deprecated. Updates the travel entry.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> representing the browser or frame within which the travel operation generating the entry is taking place.
     * @param {BOOL} fIsLocalAnchor Type: <b>BOOL</b>
     * 
     * The value specifying whether the new entry is a local anchor.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravelentry-update
     */
    Update(punk, fIsLocalAnchor) {
        result := ComCall(4, this, "ptr", punk, BOOL, fIsLocalAnchor, "HRESULT")
        return result
    }

    /**
     * Deprecated. Gets the pointer to an item identifier list (PIDL) associated with the travel entry.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>LPITEMIDLIST*</b>
     * 
     * The travel entry's PIDL.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravelentry-getpidl
     */
    GetPidl() {
        result := ComCall(5, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    Query(iid) {
        if (ITravelEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 2)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 3)
        this.vtbl.GetPidl := CallbackCreate(GetMethod(implObj, "GetPidl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
        CallbackFree(this.vtbl.Update)
        CallbackFree(this.vtbl.GetPidl)
    }
}
