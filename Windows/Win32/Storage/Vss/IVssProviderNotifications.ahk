#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVssProviderNotifications interface manages providers registered with VSS.
 * @see https://learn.microsoft.com/windows/win32/api/vsprov/nn-vsprov-ivssprovidernotifications
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssProviderNotifications extends IUnknown {
    /**
     * The interface identifier for IVssProviderNotifications
     * @type {Guid}
     */
    static IID := Guid("{e561901f-03a5-4afe-86d0-72baeece7004}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssProviderNotifications interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnLoad   : IntPtr
        OnUnload : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssProviderNotifications.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies a provider that it was loaded.
     * @param {IUnknown} pCallback This parameter is reserved.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
     * <dt>0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_VETO</b></b></dt>
     * <dt>0x80042306L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected provider error occurred. If this is returned, the error must be described in an entry in 
     *         the application event log, giving the user information on how to resolve the problem.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidernotifications-onload
     */
    OnLoad(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Notifies the provider to prepare to be unloaded.
     * @remarks
     * If <i>bForceUnload</i> is <b>TRUE</b>, the return value must be 
     *    <b>S_OK</b>.
     * @param {BOOL} bForceUnload If <b>TRUE</b>, the provider must prepare to be released.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no pending operations and the  provider is ready to be released.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * <dt>0x00000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider should not be unloaded. This value can only be returned if <i>bForceUnload</i> is <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidernotifications-onunload
     */
    OnUnload(bForceUnload) {
        result := ComCall(4, this, BOOL, bForceUnload, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVssProviderNotifications.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLoad := CallbackCreate(GetMethod(implObj, "OnLoad"), flags, 2)
        this.vtbl.OnUnload := CallbackCreate(GetMethod(implObj, "OnUnload"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLoad)
        CallbackFree(this.vtbl.OnUnload)
    }
}
