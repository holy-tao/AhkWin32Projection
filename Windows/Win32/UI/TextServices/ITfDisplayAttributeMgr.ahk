#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfDisplayAttributeInfo.ahk" { ITfDisplayAttributeInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumTfDisplayAttributeInfo.ahk" { IEnumTfDisplayAttributeInfo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfDisplayAttributeMgr interface is implemented by the TSF manager and used by an application to obtain and enumerate display attributes. Individual display attributes are accessed through the ITfDisplayAttributeInfo interface.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfdisplayattributemgr
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfDisplayAttributeMgr extends IUnknown {
    /**
     * The interface identifier for ITfDisplayAttributeMgr
     * @type {Guid}
     */
    static IID := Guid("{8ded7393-5db1-475c-9e71-a39111b0ff67}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfDisplayAttributeMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUpdateInfo             : IntPtr
        EnumDisplayAttributeInfo : IntPtr
        GetDisplayAttributeInfo  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfDisplayAttributeMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfDisplayAttributeMgr::OnUpdateInfo method
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributemgr-onupdateinfo
     */
    OnUpdateInfo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfDisplayAttributeMgr::EnumDisplayAttributeInfo method
     * @returns {IEnumTfDisplayAttributeInfo} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfdisplayattributeinfo">IEnumTfDisplayAttributeInfo</a> interface pointer that receives the enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributemgr-enumdisplayattributeinfo
     */
    EnumDisplayAttributeInfo() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDisplayAttributeInfo(ppEnum)
    }

    /**
     * ITfDisplayAttributeMgr::GetDisplayAttributeInfo method
     * @param {Pointer<Guid>} guid Contains a GUID that identifies the display attribute data requested. This value is obtained by obtaining the GUID_PROP_ATTRIBUTE property for the range of text. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getproperty">ITfContext::GetProperty</a> and <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-trackproperties">ITfContext::TrackProperties</a>.
     * @param {Pointer<ITfDisplayAttributeInfo>} ppInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdisplayattributeinfo">ITfDisplayAttributeInfo</a> interface pointer that receives the object.
     * @param {Pointer<Guid>} pclsidOwner Pointer to a CLSID value that receives the CLSID of the display attribute provider. This parameter can be <b>NULL</b> if the CLSID is not required.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributemgr-getdisplayattributeinfo
     */
    GetDisplayAttributeInfo(guid, ppInfo, pclsidOwner) {
        result := ComCall(5, this, Guid.Ptr, guid, ITfDisplayAttributeInfo.Ptr, ppInfo, Guid.Ptr, pclsidOwner, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfDisplayAttributeMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUpdateInfo := CallbackCreate(GetMethod(implObj, "OnUpdateInfo"), flags, 1)
        this.vtbl.EnumDisplayAttributeInfo := CallbackCreate(GetMethod(implObj, "EnumDisplayAttributeInfo"), flags, 2)
        this.vtbl.GetDisplayAttributeInfo := CallbackCreate(GetMethod(implObj, "GetDisplayAttributeInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUpdateInfo)
        CallbackFree(this.vtbl.EnumDisplayAttributeInfo)
        CallbackFree(this.vtbl.GetDisplayAttributeInfo)
    }
}
