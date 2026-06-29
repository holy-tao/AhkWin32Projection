#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DDKERNELCAPS.ahk" { DDKERNELCAPS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * IDirectDrawKernel interface
 * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nn-ddkernel-idirectdrawkernel
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IDirectDrawKernel extends IUnknown {
    /**
     * The interface identifier for IDirectDrawKernel
     * @type {Guid}
     */
    static IID := Guid("{8d56c120-6a08-11d0-9b06-00a0c903a3b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawKernel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCaps             : IntPtr
        GetKernelHandle     : IntPtr
        ReleaseKernelHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawKernel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirectDrawKernel::GetCaps method returns the capabilities of this kernel-mode device.
     * @param {Pointer<DDKERNELCAPS>} param0 
     * @returns {HRESULT} The method must return one of the following values:
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nf-ddkernel-idirectdrawkernel-getcaps
     */
    GetCaps(param0) {
        result := ComCall(3, this, DDKERNELCAPS.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * The IDirectDrawKernel::GetKernelHandle method returns a kernel-mode handle to the DirectDraw object.
     * @param {Pointer<Pointer>} param0 
     * @returns {HRESULT} The method must return one of the following values:
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nf-ddkernel-idirectdrawkernel-getkernelhandle
     */
    GetKernelHandle(param0) {
        param0Marshal := param0 is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * The IDirectDrawKernel::ReleaseKernelHandle method releases a kernel-mode handle to the DirectDraw object.
     * @returns {HRESULT} The method must return one of the following values:
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ddkernel/nf-ddkernel-idirectdrawkernel-releasekernelhandle
     */
    ReleaseKernelHandle() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawKernel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCaps := CallbackCreate(GetMethod(implObj, "GetCaps"), flags, 2)
        this.vtbl.GetKernelHandle := CallbackCreate(GetMethod(implObj, "GetKernelHandle"), flags, 2)
        this.vtbl.ReleaseKernelHandle := CallbackCreate(GetMethod(implObj, "ReleaseKernelHandle"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCaps)
        CallbackFree(this.vtbl.GetKernelHandle)
        CallbackFree(this.vtbl.ReleaseKernelHandle)
    }
}
