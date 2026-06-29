#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBrowserService3.ahk" { IBrowserService3 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Deprecated. (IBrowserService4)
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice">IBrowserService</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice2">IBrowserService2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice3">IBrowserService3</a> interfaces, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ibrowserservice4
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IBrowserService4 extends IBrowserService3 {
    /**
     * The interface identifier for IBrowserService4
     * @type {Guid}
     */
    static IID := Guid("{639f1bff-e135-4096-abd8-e0f504d649a4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBrowserService4 interfaces
    */
    struct Vtbl extends IBrowserService3.Vtbl {
        ActivateView      : IntPtr
        SaveViewState     : IntPtr
        _ResizeAllBorders : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBrowserService4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deprecated. (IBrowserService4.ActivateView)
     * @param {BOOL} fPendingView Type: <b>BOOL</b>
     * 
     * Specifies whether the view is pending.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice4-activateview
     */
    ActivateView(fPendingView) {
        result := ComCall(97, this, BOOL, fPendingView, "HRESULT")
        return result
    }

    /**
     * Deprecated. (IBrowserService4.SaveViewState)
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice4-saveviewstate
     */
    SaveViewState() {
        result := ComCall(98, this, "HRESULT")
        return result
    }

    /**
     * Deprecated. (IBrowserService4._ResizeAllBorders)
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-ibrowserservice4-_resizeallborders
     */
    _ResizeAllBorders() {
        result := ComCall(99, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBrowserService4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ActivateView := CallbackCreate(GetMethod(implObj, "ActivateView"), flags, 2)
        this.vtbl.SaveViewState := CallbackCreate(GetMethod(implObj, "SaveViewState"), flags, 1)
        this.vtbl._ResizeAllBorders := CallbackCreate(GetMethod(implObj, "_ResizeAllBorders"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ActivateView)
        CallbackFree(this.vtbl.SaveViewState)
        CallbackFree(this.vtbl._ResizeAllBorders)
    }
}
