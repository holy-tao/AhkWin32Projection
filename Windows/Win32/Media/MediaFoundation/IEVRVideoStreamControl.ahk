#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is not supported. (IEVRVideoStreamControl)
 * @see https://learn.microsoft.com/windows/win32/api/evr9/nn-evr9-ievrvideostreamcontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IEVRVideoStreamControl extends IUnknown {
    /**
     * The interface identifier for IEVRVideoStreamControl
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
     * used for IEVRVideoStreamControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetStreamActiveState : IntPtr
        GetStreamActiveState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEVRVideoStreamControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IEVRVideoStreamControl::SetStreamActiveState method
     * @param {BOOL} fActive 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-ievrvideostreamcontrol-setstreamactivestate
     */
    SetStreamActiveState(fActive) {
        result := ComCall(3, this, BOOL, fActive, "HRESULT")
        return result
    }

    /**
     * IEVRVideoStreamControl::GetStreamActiveState method
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/evr9/nf-evr9-ievrvideostreamcontrol-getstreamactivestate
     */
    GetStreamActiveState() {
        result := ComCall(4, this, BOOL.Ptr, &lpfActive := 0, "HRESULT")
        return lpfActive
    }

    Query(iid) {
        if (IEVRVideoStreamControl.IID.Equals(iid)) {
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
