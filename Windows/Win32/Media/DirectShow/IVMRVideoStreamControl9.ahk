#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRVideoStreamControl9 interface is implemented on each input pin of the Video Mixing Renderer Filter 9.
 * @remarks
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrvideostreamcontrol9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRVideoStreamControl9 extends IUnknown {
    /**
     * The interface identifier for IVMRVideoStreamControl9
     * @type {Guid}
     */
    static IID := Guid("{d0cfe38b-93e7-4772-8957-0400c49a4485}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRVideoStreamControl9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetStreamActiveState : IntPtr
        GetStreamActiveState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRVideoStreamControl9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetStreamActiveState method activates or inactivates an input stream.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {BOOL} fActive Specifies the state of the stream. <b>TRUE</b> means active; <b>FALSE</b> means inactive.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrvideostreamcontrol9-setstreamactivestate
     */
    SetStreamActiveState(fActive) {
        result := ComCall(3, this, BOOL, fActive, "HRESULT")
        return result
    }

    /**
     * The GetStreamActiveState method retrieves the state of the stream.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @returns {BOOL} Receives the current state of the stream. <b>TRUE</b> means the stream is active; <b>FALSE</b> means that it is inactive.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrvideostreamcontrol9-getstreamactivestate
     */
    GetStreamActiveState() {
        result := ComCall(4, this, BOOL.Ptr, &lpfActive := 0, "HRESULT")
        return lpfActive
    }

    Query(iid) {
        if (IVMRVideoStreamControl9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStreamActiveState := CallbackCreate(GetMethod(implObj, "SetStreamActiveState"), flags, 2)
        this.vtbl.GetStreamActiveState := CallbackCreate(GetMethod(implObj, "GetStreamActiveState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStreamActiveState)
        CallbackFree(this.vtbl.GetStreamActiveState)
    }
}
