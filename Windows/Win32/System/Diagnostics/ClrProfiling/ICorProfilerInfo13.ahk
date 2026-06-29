#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerInfo12.ahk" { ICorProfilerInfo12 }
#Import ".\COR_PRF_HANDLE_TYPE.ahk" { COR_PRF_HANDLE_TYPE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo13 extends ICorProfilerInfo12 {
    /**
     * The interface identifier for ICorProfilerInfo13
     * @type {Guid}
     */
    static IID := Guid("{6e6c7ee2-0701-4ec2-9d29-2e8733b66934}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo13 interfaces
    */
    struct Vtbl extends ICorProfilerInfo12.Vtbl {
        CreateHandle          : IntPtr
        DestroyHandle         : IntPtr
        GetObjectIDFromHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo13.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} _object 
     * @param {COR_PRF_HANDLE_TYPE} type 
     * @returns {Pointer<Pointer<Void>>} 
     */
    CreateHandle(_object, type) {
        result := ComCall(108, this, "ptr", _object, COR_PRF_HANDLE_TYPE, type, "ptr*", &pHandle := 0, "HRESULT")
        return pHandle
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} _handle 
     * @returns {HRESULT} 
     */
    DestroyHandle(_handle) {
        _handleMarshal := _handle is VarRef ? "ptr*" : "ptr"

        result := ComCall(109, this, _handleMarshal, _handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} _handle 
     * @returns {Pointer} 
     */
    GetObjectIDFromHandle(_handle) {
        _handleMarshal := _handle is VarRef ? "ptr*" : "ptr"

        result := ComCall(110, this, _handleMarshal, _handle, "ptr*", &pObject := 0, "HRESULT")
        return pObject
    }

    Query(iid) {
        if (ICorProfilerInfo13.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateHandle := CallbackCreate(GetMethod(implObj, "CreateHandle"), flags, 4)
        this.vtbl.DestroyHandle := CallbackCreate(GetMethod(implObj, "DestroyHandle"), flags, 2)
        this.vtbl.GetObjectIDFromHandle := CallbackCreate(GetMethod(implObj, "GetObjectIDFromHandle"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateHandle)
        CallbackFree(this.vtbl.DestroyHandle)
        CallbackFree(this.vtbl.GetObjectIDFromHandle)
    }
}
