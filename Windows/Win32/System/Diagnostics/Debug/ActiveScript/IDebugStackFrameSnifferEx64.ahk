#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumDebugStackFrames64.ahk" { IEnumDebugStackFrames64 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugStackFrameSniffer.ahk" { IDebugStackFrameSniffer }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugStackFrameSnifferEx64 extends IDebugStackFrameSniffer {
    /**
     * The interface identifier for IDebugStackFrameSnifferEx64
     * @type {Guid}
     */
    static IID := Guid("{8cd12af4-49c1-4d52-8d8a-c146f47581aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugStackFrameSnifferEx64 interfaces
    */
    struct Vtbl extends IDebugStackFrameSniffer.Vtbl {
        EnumStackFramesEx64 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugStackFrameSnifferEx64.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwSpMin 
     * @returns {IEnumDebugStackFrames64} 
     */
    EnumStackFramesEx64(dwSpMin) {
        result := ComCall(4, this, "uint", dwSpMin, "ptr*", &ppedsf := 0, "HRESULT")
        return IEnumDebugStackFrames64(ppedsf)
    }

    Query(iid) {
        if (IDebugStackFrameSnifferEx64.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumStackFramesEx64 := CallbackCreate(GetMethod(implObj, "EnumStackFramesEx64"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumStackFramesEx64)
    }
}
