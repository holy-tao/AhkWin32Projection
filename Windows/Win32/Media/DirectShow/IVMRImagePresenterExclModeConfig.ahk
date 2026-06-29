#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVMRImagePresenterConfig.ahk" { IVMRImagePresenterConfig }
#Import "..\..\Graphics\DirectDraw\IDirectDraw7.ahk" { IDirectDraw7 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface7.ahk" { IDirectDrawSurface7 }

/**
 * The IVMRImagePresenterExclModeConfig interface inherits from IVMRImagePresenterConfig and provides methods for setting and retrieving the rendering preferences on the Exclusive Mode Allocator-Presenter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrimagepresenterexclmodeconfig
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRImagePresenterExclModeConfig extends IVMRImagePresenterConfig {
    /**
     * The interface identifier for IVMRImagePresenterExclModeConfig
     * @type {Guid}
     */
    static IID := Guid("{e6f7ce40-4673-44f1-8f77-5499d68cb4ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRImagePresenterExclModeConfig interfaces
    */
    struct Vtbl extends IVMRImagePresenterConfig.Vtbl {
        SetXlcModeDDObjAndPrimarySurface : IntPtr
        GetXlcModeDDObjAndPrimarySurface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRImagePresenterExclModeConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetXlcModeDDObjAndPrimarySurface method informs the VMR of the DirectDraw object and primary surface that were created by the application.
     * @remarks
     * The procedure for configuring and using an application-defined DirectDraw Exclusive Mode object is described in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/directdraw-exclusive-mode">DirectDraw Exclusive Mode</a>.
     * @param {IDirectDraw7} lpDDObj Specifies the Exclusive Mode DirectDraw object created by the application.
     * @param {IDirectDrawSurface7} lpPrimarySurf Specifies the primary surface associated with the DirectDraw object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenterexclmodeconfig-setxlcmodeddobjandprimarysurface
     */
    SetXlcModeDDObjAndPrimarySurface(lpDDObj, lpPrimarySurf) {
        result := ComCall(5, this, "ptr", lpDDObj, "ptr", lpPrimarySurf, "HRESULT")
        return result
    }

    /**
     * The GetXlcModeDDObjAndPrimarySurface method retrieves the DirectDraw object and primary surface currently being used by a VMR that has been configured for DirectDraw Exclusive Mode using the SetXlcModeDDObjAndPrimarySurface method.
     * @remarks
     * The procedure for configuring and using an application-defined DirectDraw Exclusive Mode object is described in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/directdraw-exclusive-mode">DirectDraw Exclusive Mode</a>.
     * @param {Pointer<IDirectDraw7>} lpDDObj Retrieves the Exclusive Mode DirectDraw object created by the application.
     * @param {Pointer<IDirectDrawSurface7>} lpPrimarySurf Retrieves the primary surface associated with the DirectDraw object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenterexclmodeconfig-getxlcmodeddobjandprimarysurface
     */
    GetXlcModeDDObjAndPrimarySurface(lpDDObj, lpPrimarySurf) {
        result := ComCall(6, this, IDirectDraw7.Ptr, lpDDObj, IDirectDrawSurface7.Ptr, lpPrimarySurf, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRImagePresenterExclModeConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetXlcModeDDObjAndPrimarySurface := CallbackCreate(GetMethod(implObj, "SetXlcModeDDObjAndPrimarySurface"), flags, 3)
        this.vtbl.GetXlcModeDDObjAndPrimarySurface := CallbackCreate(GetMethod(implObj, "GetXlcModeDDObjAndPrimarySurface"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetXlcModeDDObjAndPrimarySurface)
        CallbackFree(this.vtbl.GetXlcModeDDObjAndPrimarySurface)
    }
}
