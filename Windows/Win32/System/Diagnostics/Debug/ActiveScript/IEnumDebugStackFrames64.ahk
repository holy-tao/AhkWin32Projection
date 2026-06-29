#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DebugStackFrameDescriptor64.ahk" { DebugStackFrameDescriptor64 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumDebugStackFrames.ahk" { IEnumDebugStackFrames }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IEnumDebugStackFrames64 extends IEnumDebugStackFrames {
    /**
     * The interface identifier for IEnumDebugStackFrames64
     * @type {Guid}
     */
    static IID := Guid("{0dc38853-c1b0-4176-a984-b298361027af}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumDebugStackFrames64 interfaces
    */
    struct Vtbl extends IEnumDebugStackFrames.Vtbl {
        Next64 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumDebugStackFrames64.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<DebugStackFrameDescriptor64>} prgdsfd 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next64(celt, prgdsfd, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", celt, DebugStackFrameDescriptor64.Ptr, prgdsfd, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnumDebugStackFrames64.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next64 := CallbackCreate(GetMethod(implObj, "Next64"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next64)
    }
}
