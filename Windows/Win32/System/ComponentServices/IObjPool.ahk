#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the key to each object in the transaction resource pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iobjpool
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IObjPool extends IUnknown {
    /**
     * The interface identifier for IObjPool
     * @type {Guid}
     */
    static IID := Guid("{7d8805a0-2ea7-11d1-b1cc-00aa00ba3258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjPool interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reserved1 : IntPtr
        Reserved2 : IntPtr
        Reserved3 : IntPtr
        Reserved4 : IntPtr
        PutEndTx  : IntPtr
        Reserved5 : IntPtr
        Reserved6 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjPool.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved1() {
        ComCall(3, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved2() {
        ComCall(4, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved3() {
        ComCall(5, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved4() {
        ComCall(6, this)
    }

    /**
     * Destroys the pooled object when the transaction ends.
     * @param {IUnknown} pObj A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the pooled object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjpool-putendtx
     */
    PutEndTx(pObj) {
        ComCall(7, this, "ptr", pObj)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved5() {
        ComCall(8, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved6() {
        ComCall(9, this)
    }

    Query(iid) {
        if (IObjPool.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reserved1 := CallbackCreate(GetMethod(implObj, "Reserved1"), flags, 1)
        this.vtbl.Reserved2 := CallbackCreate(GetMethod(implObj, "Reserved2"), flags, 1)
        this.vtbl.Reserved3 := CallbackCreate(GetMethod(implObj, "Reserved3"), flags, 1)
        this.vtbl.Reserved4 := CallbackCreate(GetMethod(implObj, "Reserved4"), flags, 1)
        this.vtbl.PutEndTx := CallbackCreate(GetMethod(implObj, "PutEndTx"), flags, 2)
        this.vtbl.Reserved5 := CallbackCreate(GetMethod(implObj, "Reserved5"), flags, 1)
        this.vtbl.Reserved6 := CallbackCreate(GetMethod(implObj, "Reserved6"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reserved1)
        CallbackFree(this.vtbl.Reserved2)
        CallbackFree(this.vtbl.Reserved3)
        CallbackFree(this.vtbl.Reserved4)
        CallbackFree(this.vtbl.PutEndTx)
        CallbackFree(this.vtbl.Reserved5)
        CallbackFree(this.vtbl.Reserved6)
    }
}
