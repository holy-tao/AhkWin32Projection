#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVPManager interface is implemented on the Video Port Manager (VPM).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivpmanager
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVPManager extends IUnknown {
    /**
     * The interface identifier for IVPManager
     * @type {Guid}
     */
    static IID := Guid("{aac18c18-e186-46d2-825d-a1f8dc8e395a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVPManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetVideoPortIndex : IntPtr
        GetVideoPortIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVPManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetVideoPortIndex method instructs the Video Port Manager (VPM) to connect to the specified video port.
     * @remarks
     * Use this method on a multi-monitor system to specify to the Video Port Manager which video port index is being used.
     * @param {Integer} dwVideoPortIndex Double word containing the video port index.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivpmanager-setvideoportindex
     */
    SetVideoPortIndex(dwVideoPortIndex) {
        result := ComCall(3, this, "uint", dwVideoPortIndex, "HRESULT")
        return result
    }

    /**
     * The GetVideoPortIndex method returns the current video port index being used by the Video Port Manager (VPM).
     * @remarks
     * This method returns the current video port index being used by the Video Port Manager (VPM).
     * @returns {Integer} Pointer to a double word containing the index of the video port that the VPM is currently connected to.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivpmanager-getvideoportindex
     */
    GetVideoPortIndex() {
        result := ComCall(4, this, "uint*", &pdwVideoPortIndex := 0, "HRESULT")
        return pdwVideoPortIndex
    }

    Query(iid) {
        if (IVPManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetVideoPortIndex := CallbackCreate(GetMethod(implObj, "SetVideoPortIndex"), flags, 2)
        this.vtbl.GetVideoPortIndex := CallbackCreate(GetMethod(implObj, "GetVideoPortIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetVideoPortIndex)
        CallbackFree(this.vtbl.GetVideoPortIndex)
    }
}
