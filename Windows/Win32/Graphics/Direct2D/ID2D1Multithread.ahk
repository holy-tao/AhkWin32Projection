#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A locking mechanism from a Direct2D factory that Direct2D uses to control exclusive resource access in an app that is uses multiple threads.
 * @remarks
 * You can get an <b>ID2D1Multithread</b> object by querying for it from an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> 
 *         object.
 *       
 * 
 * You should use this lock while doing any operation on a Direct3D/DXGI surface. <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> will wait on any call until you 
 *         leave the critical section.
 *       
 * 
 * <div class="alert"><b>Note</b>  Normal rendering is guarded automatically by an internal <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> lock.
 *         </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1multithread
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Multithread extends IUnknown {
    /**
     * The interface identifier for ID2D1Multithread
     * @type {Guid}
     */
    static IID := Guid("{31e6e7bc-e0ff-4d46-8c64-a0a8c41c15d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Multithread interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMultithreadProtected : IntPtr
        Enter                   : IntPtr
        Leave                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Multithread.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns whether the Direct2D factory was created with the D2D1_FACTORY_TYPE_MULTI_THREADED flag.
     * @returns {BOOL} Returns true if the Direct2D factory was created as multi-threaded, or false if it was created as single-threaded.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1multithread-getmultithreadprotected
     */
    GetMultithreadProtected() {
        result := ComCall(3, this, BOOL)
        return result
    }

    /**
     * Enters the Direct2D API critical section, if it exists.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1multithread-enter
     */
    Enter() {
        ComCall(4, this)
    }

    /**
     * Leaves the Direct2D API critical section, if it exists.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1multithread-leave
     */
    Leave() {
        ComCall(5, this)
    }

    Query(iid) {
        if (ID2D1Multithread.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMultithreadProtected := CallbackCreate(GetMethod(implObj, "GetMultithreadProtected"), flags, 1)
        this.vtbl.Enter := CallbackCreate(GetMethod(implObj, "Enter"), flags, 1)
        this.vtbl.Leave := CallbackCreate(GetMethod(implObj, "Leave"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMultithreadProtected)
        CallbackFree(this.vtbl.Enter)
        CallbackFree(this.vtbl.Leave)
    }
}
