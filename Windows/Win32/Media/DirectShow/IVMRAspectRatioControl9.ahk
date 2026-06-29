#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRAspectRatioControl9 interface controls whether the Video Mixing Renderer Filter 9 (VMR-9) preserves the aspect ratio of the source video.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmraspectratiocontrol9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRAspectRatioControl9 extends IUnknown {
    /**
     * The interface identifier for IVMRAspectRatioControl9
     * @type {Guid}
     */
    static IID := Guid("{00d96c29-bbde-4efc-9901-bb5036392146}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRAspectRatioControl9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAspectRatioMode : IntPtr
        SetAspectRatioMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRAspectRatioControl9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetAspectRatioMode method queries whether the VMR preserves the aspect ratio of the source video.
     * @returns {Integer} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmr_aspect_ratio_mode">VMR_ASPECT_RATIO_MODE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmraspectratiocontrol9-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(3, this, "uint*", &lpdwARMode := 0, "HRESULT")
        return lpdwARMode
    }

    /**
     * The SetAspectRatioMode method specifies whether the VMR preserves the aspect ratio of the source video.
     * @param {Integer} dwARMode Specifies a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmr_aspect_ratio_mode">VMR_ASPECT_RATIO_MODE</a> enumeration type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmraspectratiocontrol9-setaspectratiomode
     */
    SetAspectRatioMode(dwARMode) {
        result := ComCall(4, this, "uint", dwARMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRAspectRatioControl9.IID.Equals(iid)) {
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
