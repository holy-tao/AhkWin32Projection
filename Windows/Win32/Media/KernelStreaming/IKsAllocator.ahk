#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\KSSTREAMALLOCATOR_STATUS.ahk" { KSSTREAMALLOCATOR_STATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\KSALLOCATORMODE.ahk" { KSALLOCATORMODE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsAllocator extends IUnknown {
    /**
     * The interface identifier for IKsAllocator
     * @type {Guid}
     */
    static IID := Guid("{8da64899-c0d9-11d0-8413-0000f822fe8a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsAllocator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsGetAllocatorHandle : IntPtr
        KsGetAllocatorMode   : IntPtr
        KsGetAllocatorStatus : IntPtr
        KsSetAllocatorMode   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsAllocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    KsGetAllocatorHandle() {
        result := ComCall(3, this, HANDLE.Owned)
        return result
    }

    /**
     * 
     * @returns {KSALLOCATORMODE} 
     */
    KsGetAllocatorMode() {
        result := ComCall(4, this, KSALLOCATORMODE)
        return result
    }

    /**
     * 
     * @returns {KSSTREAMALLOCATOR_STATUS} 
     */
    KsGetAllocatorStatus() {
        AllocatorStatus := KSSTREAMALLOCATOR_STATUS()
        result := ComCall(5, this, KSSTREAMALLOCATOR_STATUS.Ptr, AllocatorStatus, "HRESULT")
        return AllocatorStatus
    }

    /**
     * 
     * @param {KSALLOCATORMODE} _Mode 
     * @returns {String} Nothing - always returns an empty string
     */
    KsSetAllocatorMode(_Mode) {
        ComCall(6, this, KSALLOCATORMODE, _Mode)
    }

    Query(iid) {
        if (IKsAllocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsGetAllocatorHandle := CallbackCreate(GetMethod(implObj, "KsGetAllocatorHandle"), flags, 1)
        this.vtbl.KsGetAllocatorMode := CallbackCreate(GetMethod(implObj, "KsGetAllocatorMode"), flags, 1)
        this.vtbl.KsGetAllocatorStatus := CallbackCreate(GetMethod(implObj, "KsGetAllocatorStatus"), flags, 2)
        this.vtbl.KsSetAllocatorMode := CallbackCreate(GetMethod(implObj, "KsSetAllocatorMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsGetAllocatorHandle)
        CallbackFree(this.vtbl.KsGetAllocatorMode)
        CallbackFree(this.vtbl.KsGetAllocatorStatus)
        CallbackFree(this.vtbl.KsSetAllocatorMode)
    }
}
