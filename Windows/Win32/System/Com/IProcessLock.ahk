#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Used by ISurrogateService to prevent the process from terminating due to a time-out.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iprocesslock
 * @namespace Windows.Win32.System.Com
 */
export default struct IProcessLock extends IUnknown {
    /**
     * The interface identifier for IProcessLock
     * @type {Guid}
     */
    static IID := Guid("{000001d5-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProcessLock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddRefOnProcess     : IntPtr
        ReleaseRefOnProcess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProcessLock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Increments the reference count of the process.
     * @returns {Integer} This method returns the new reference count.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iprocesslock-addrefonprocess
     */
    AddRefOnProcess() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * Decrements the reference count of the process.
     * @returns {Integer} This method returns the new reference count.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iprocesslock-releaserefonprocess
     */
    ReleaseRefOnProcess() {
        result := ComCall(4, this, UInt32)
        return result
    }

    Query(iid) {
        if (IProcessLock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddRefOnProcess := CallbackCreate(GetMethod(implObj, "AddRefOnProcess"), flags, 1)
        this.vtbl.ReleaseRefOnProcess := CallbackCreate(GetMethod(implObj, "ReleaseRefOnProcess"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddRefOnProcess)
        CallbackFree(this.vtbl.ReleaseRefOnProcess)
    }
}
