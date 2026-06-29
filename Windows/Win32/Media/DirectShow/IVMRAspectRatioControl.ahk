#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRAspectRatioControl interface controls whether the Video Mixing Renderer Filter 7 (VMR-7) preserves the aspect ratio of the source video.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmraspectratiocontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRAspectRatioControl extends IUnknown {
    /**
     * The interface identifier for IVMRAspectRatioControl
     * @type {Guid}
     */
    static IID := Guid("{ede80b5c-bad6-4623-b537-65586c9f8dfd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRAspectRatioControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAspectRatioMode : IntPtr
        SetAspectRatioMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRAspectRatioControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetAspectRatioMode method queries whether the VMR will preserve the aspect ratio of the source video. (IVMRAspectRatioControl.GetAspectRatioMode)
     * @returns {Integer} Pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmr_aspect_ratio_mode">VMR_ASPECT_RATIO_MODE</a> value indicating the aspect ratio mode.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmraspectratiocontrol-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(3, this, "uint*", &lpdwARMode := 0, "HRESULT")
        return lpdwARMode
    }

    /**
     * The SetAspectRatioMode method specifies whether the VMR will preserve the aspect ratio of the source video. (IVMRAspectRatioControl.SetAspectRatioMode)
     * @param {Integer} dwARMode Specifies a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmr_aspect_ratio_mode">VMR_ASPECT_RATIO_MODE</a> enumeration type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmraspectratiocontrol-setaspectratiomode
     */
    SetAspectRatioMode(dwARMode) {
        result := ComCall(4, this, "uint", dwARMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRAspectRatioControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAspectRatioMode := CallbackCreate(GetMethod(implObj, "GetAspectRatioMode"), flags, 2)
        this.vtbl.SetAspectRatioMode := CallbackCreate(GetMethod(implObj, "SetAspectRatioMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAspectRatioMode)
        CallbackFree(this.vtbl.SetAspectRatioMode)
    }
}
