#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IKsPin.ahk" { IKsPin }
#Import ".\ALLOCATOR_PROPERTIES_EX.ahk" { ALLOCATOR_PROPERTIES_EX }
#Import ".\IKsAllocator.ahk" { IKsAllocator }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsAllocatorEx extends IKsAllocator {
    /**
     * The interface identifier for IKsAllocatorEx
     * @type {Guid}
     */
    static IID := Guid("{091bb63a-603f-11d1-b067-00a0c9062802}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsAllocatorEx interfaces
    */
    struct Vtbl extends IKsAllocator.Vtbl {
        KsGetProperties               : IntPtr
        KsSetProperties               : IntPtr
        KsSetAllocatorHandle          : IntPtr
        KsCreateAllocatorAndGetHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsAllocatorEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<ALLOCATOR_PROPERTIES_EX>} 
     */
    KsGetProperties() {
        result := ComCall(7, this, ALLOCATOR_PROPERTIES_EX.Ptr)
        return result
    }

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES_EX>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    KsSetProperties(param0) {
        ComCall(8, this, ALLOCATOR_PROPERTIES_EX.Ptr, param0)
    }

    /**
     * 
     * @param {HANDLE} AllocatorHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    KsSetAllocatorHandle(AllocatorHandle) {
        ComCall(9, this, HANDLE, AllocatorHandle)
    }

    /**
     * 
     * @param {IKsPin} KsPin 
     * @returns {HANDLE} 
     */
    KsCreateAllocatorAndGetHandle(KsPin) {
        result := ComCall(10, this, "ptr", KsPin, HANDLE.Owned)
        return result
    }

    Query(iid) {
        if (IKsAllocatorEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsGetProperties := CallbackCreate(GetMethod(implObj, "KsGetProperties"), flags, 1)
        this.vtbl.KsSetProperties := CallbackCreate(GetMethod(implObj, "KsSetProperties"), flags, 2)
        this.vtbl.KsSetAllocatorHandle := CallbackCreate(GetMethod(implObj, "KsSetAllocatorHandle"), flags, 2)
        this.vtbl.KsCreateAllocatorAndGetHandle := CallbackCreate(GetMethod(implObj, "KsCreateAllocatorAndGetHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsGetProperties)
        CallbackFree(this.vtbl.KsSetProperties)
        CallbackFree(this.vtbl.KsSetAllocatorHandle)
        CallbackFree(this.vtbl.KsCreateAllocatorAndGetHandle)
    }
}
