#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerCallback4.ahk" { ICorProfilerCallback4 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback5 extends ICorProfilerCallback4 {
    /**
     * The interface identifier for ICorProfilerCallback5
     * @type {Guid}
     */
    static IID := Guid("{8dfba405-8c9f-45f8-bffa-83b14cef78b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback5 interfaces
    */
    struct Vtbl extends ICorProfilerCallback4.Vtbl {
        ConditionalWeakTableElementReferences : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cRootRefs 
     * @param {Pointer<Pointer>} keyRefIds 
     * @param {Pointer<Pointer>} valueRefIds 
     * @param {Pointer<Pointer>} rootIds 
     * @returns {HRESULT} 
     */
    ConditionalWeakTableElementReferences(cRootRefs, keyRefIds, valueRefIds, rootIds) {
        keyRefIdsMarshal := keyRefIds is VarRef ? "ptr*" : "ptr"
        valueRefIdsMarshal := valueRefIds is VarRef ? "ptr*" : "ptr"
        rootIdsMarshal := rootIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(89, this, "uint", cRootRefs, keyRefIdsMarshal, keyRefIds, valueRefIdsMarshal, valueRefIds, rootIdsMarshal, rootIds, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConditionalWeakTableElementReferences := CallbackCreate(GetMethod(implObj, "ConditionalWeakTableElementReferences"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConditionalWeakTableElementReferences)
    }
}
