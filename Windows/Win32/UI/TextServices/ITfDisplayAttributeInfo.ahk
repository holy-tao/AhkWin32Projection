#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\TF_DISPLAYATTRIBUTE.ahk" { TF_DISPLAYATTRIBUTE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfDisplayAttributeInfo interface is implemented by a text service to provide display attribute data. This interface is used by any component, most often an application, that must determine how text displays.
 * @remarks
 * An application obtains an instance of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributemgr-getdisplayattributeinfo">ITfDisplayAttributeMgr::GetDisplayAttributeInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-ienumtfdisplayattributeinfo-next">IEnumTfDisplayAttributeInfo::Next</a>.
 * 
 * A text service supplies an instance of this interface in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributeprovider-getdisplayattributeinfo">ITfDisplayAttributeProvider::GetDisplayAttributeInfo</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfdisplayattributeinfo
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfDisplayAttributeInfo extends IUnknown {
    /**
     * The interface identifier for ITfDisplayAttributeInfo
     * @type {Guid}
     */
    static IID := Guid("{70528852-2f26-4aea-8c96-215150578932}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfDisplayAttributeInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGUID          : IntPtr
        GetDescription   : IntPtr
        GetAttributeInfo : IntPtr
        SetAttributeInfo : IntPtr
        Reset            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfDisplayAttributeInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfDisplayAttributeInfo::GetGUID method
     * @returns {Guid} Pointer to a GUID value that receives the GUID for the display attribute.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-getguid
     */
    GetGUID() {
        pguid := Guid()
        result := ComCall(3, this, Guid.Ptr, pguid, "HRESULT")
        return pguid
    }

    /**
     * ITfDisplayAttributeInfo::GetDescription method
     * @returns {BSTR} Pointer to a BSTR value that receives the description string. This value must be allocated using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The caller must free this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-getdescription
     */
    GetDescription() {
        pbstrDesc := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrDesc, "HRESULT")
        return pbstrDesc
    }

    /**
     * ITfDisplayAttributeInfo::GetAttributeInfo method
     * @returns {TF_DISPLAYATTRIBUTE} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_displayattribute">TF_DISPLAYATTRIBUTE</a> structure that receives display attribute data.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-getattributeinfo
     */
    GetAttributeInfo() {
        pda := TF_DISPLAYATTRIBUTE()
        result := ComCall(5, this, TF_DISPLAYATTRIBUTE.Ptr, pda, "HRESULT")
        return pda
    }

    /**
     * ITfDisplayAttributeInfo::SetAttributeInfo method
     * @remarks
     * The implementation of this method should not call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributemgr-onupdateinfo">ITfDisplayAttributeMgr::OnUpdateInfo</a> in response to this method. The caller must do so. This avoids redundant notifications if more than one attribute is modified. The caller must eventually call <b>ITfDisplayAttributeMgr::OnUpdateInfo</b> so that other clients will receive an attribute update notification.
     * @param {Pointer<TF_DISPLAYATTRIBUTE>} pda Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_displayattribute">TF_DISPLAYATTRIBUTE</a> structure that contains the new display attribute data.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * The display attribute provider does not support attribute modification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pda</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-setattributeinfo
     */
    SetAttributeInfo(pda) {
        result := ComCall(6, this, TF_DISPLAYATTRIBUTE.Ptr, pda, "HRESULT")
        return result
    }

    /**
     * ITfDisplayAttributeInfo::Reset method
     * @remarks
     * The implementation of this method should not call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributemgr-onupdateinfo">ITfDisplayAttributeMgr::OnUpdateInfo</a> in response to this method. The caller must do so. This avoids redundant notifications if more than one attribute is modified. The caller must eventually call <b>ITfDisplayAttributeMgr::OnUpdateInfo</b> so that other clients will receive an attribute update notification.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * The display attribute provider does not support attribute modification.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfDisplayAttributeInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGUID := CallbackCreate(GetMethod(implObj, "GetGUID"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.GetAttributeInfo := CallbackCreate(GetMethod(implObj, "GetAttributeInfo"), flags, 2)
        this.vtbl.SetAttributeInfo := CallbackCreate(GetMethod(implObj, "SetAttributeInfo"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGUID)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetAttributeInfo)
        CallbackFree(this.vtbl.SetAttributeInfo)
        CallbackFree(this.vtbl.Reset)
    }
}
