#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IAudioProcessingObjectVBR extends IUnknown {
    /**
     * The interface identifier for IAudioProcessingObjectVBR
     * @type {Guid}
     */
    static IID := Guid("{7ba1db8f-78ad-49cd-9591-f79d80a17c81}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioProcessingObjectVBR interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CalcMaxInputFrames  : IntPtr
        CalcMaxOutputFrames : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioProcessingObjectVBR.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} u32MaxOutputFrameCount 
     * @returns {Integer} 
     */
    CalcMaxInputFrames(u32MaxOutputFrameCount) {
        result := ComCall(3, this, "uint", u32MaxOutputFrameCount, "uint*", &pu32InputFrameCount := 0, "HRESULT")
        return pu32InputFrameCount
    }

    /**
     * 
     * @param {Integer} u32MaxInputFrameCount 
     * @returns {Integer} 
     */
    CalcMaxOutputFrames(u32MaxInputFrameCount) {
        result := ComCall(4, this, "uint", u32MaxInputFrameCount, "uint*", &pu32OutputFrameCount := 0, "HRESULT")
        return pu32OutputFrameCount
    }

    Query(iid) {
        if (IAudioProcessingObjectVBR.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CalcMaxInputFrames := CallbackCreate(GetMethod(implObj, "CalcMaxInputFrames"), flags, 3)
        this.vtbl.CalcMaxOutputFrames := CallbackCreate(GetMethod(implObj, "CalcMaxOutputFrames"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CalcMaxInputFrames)
        CallbackFree(this.vtbl.CalcMaxOutputFrames)
    }
}
