#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumDebugStackFrames.ahk" { IEnumDebugStackFrames }
#Import ".\IDebugStackFrameSniffer.ahk" { IDebugStackFrameSniffer }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugStackFrameSnifferEx32 extends IDebugStackFrameSniffer {
    /**
     * The interface identifier for IDebugStackFrameSnifferEx32
     * @type {Guid}
     */
    static IID := Guid("{51973c19-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugStackFrameSnifferEx32 interfaces
    */
    struct Vtbl extends IDebugStackFrameSniffer.Vtbl {
        EnumStackFramesEx32 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugStackFrameSnifferEx32.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwSpMin 
     * @returns {IEnumDebugStackFrames} 
     */
    EnumStackFramesEx32(dwSpMin) {
        result := ComCall(4, this, "uint", dwSpMin, "ptr*", &ppedsf := 0, "HRESULT")
        return IEnumDebugStackFrames(ppedsf)
    }

    Query(iid) {
        if (IDebugStackFrameSnifferEx32.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumStackFramesEx32 := CallbackCreate(GetMethod(implObj, "EnumStackFramesEx32"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumStackFramesEx32)
    }
}
