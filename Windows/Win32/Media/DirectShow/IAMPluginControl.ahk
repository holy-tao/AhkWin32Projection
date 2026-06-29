#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls the preferred and blocked filter lists.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamplugincontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMPluginControl extends IUnknown {
    /**
     * The interface identifier for IAMPluginControl
     * @type {Guid}
     */
    static IID := Guid("{0e26a181-f40c-4635-8786-976284b52981}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMPluginControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPreferredClsid        : IntPtr
        GetPreferredClsidByIndex : IntPtr
        SetPreferredClsid        : IntPtr
        IsDisabled               : IntPtr
        GetDisabledByIndex       : IntPtr
        SetDisabled              : IntPtr
        IsLegacyDisabled         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMPluginControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Searches the preferred list for a class identifier (CLSID) that matches a specified subtype.
     * @param {Pointer<Guid>} subType A media subtype GUID to match.
     * @returns {Guid} Receives a CLSID from the preferred list.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-getpreferredclsid
     */
    GetPreferredClsid(subType) {
        clsid := Guid()
        result := ComCall(3, this, Guid.Ptr, subType, Guid.Ptr, clsid, "HRESULT")
        return clsid
    }

    /**
     * IAMPluginControl::GetPreferredClsidByIndex (strmif.h) gets a class identifier (CLSID) from the preferred list, specified by index value.
     * @param {Integer} index The zero-based index of the CLSID to retrieve.
     * @param {Pointer<Guid>} subType Receives the subtype GUID associated with the CLSID.
     * @param {Pointer<Guid>} clsid Receives the CLSID at the specified index.
     * @returns {HRESULT} This method can return one of these values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>index</i> parameter is out of range.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-getpreferredclsidbyindex
     */
    GetPreferredClsidByIndex(index, subType, clsid) {
        result := ComCall(4, this, "uint", index, Guid.Ptr, subType, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * Adds a class identifier (CLSID) to the preferred list or removes a CLSID from the list. (IAMPluginControl.SetPreferredClsid)
     * @param {Pointer<Guid>} subType A media subtype GUID to associate with the CLSID.
     * @param {Pointer<Guid>} clsid Pointer to the CLSID to add to the list. If this parameter is <b>NULL</b>, the entry associated with <i>subType</i> is removed from the list
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-setpreferredclsid
     */
    SetPreferredClsid(subType, clsid) {
        result := ComCall(5, this, Guid.Ptr, subType, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * Queries whether a class identifier (CLSID) appears in the blocked list. (IAMPluginControl.IsDisabled)
     * @param {Pointer<Guid>} clsid The CLSID to search for.
     * @returns {HRESULT} This method can return one of these values.
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
     * The specified CLSID appears in the blocked list.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified CLSID is not in the blocked list.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-isdisabled
     */
    IsDisabled(clsid) {
        result := ComCall(6, this, Guid.Ptr, clsid, "HRESULT")
        return result
    }

    /**
     * IAMPluginControl::GetDisabledByIndex (strmif.h) gets a class identifier (CLSID) from the blocked list.
     * @param {Integer} index The zero-based index of the CLSID to retrieve.
     * @returns {Guid} Receives the CLSID at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-getdisabledbyindex
     */
    GetDisabledByIndex(index) {
        clsid := Guid()
        result := ComCall(7, this, "uint", index, Guid.Ptr, clsid, "HRESULT")
        return clsid
    }

    /**
     * Adds a class identifier (CLSID) to the blocked list, or removes a CLSID from the list. (IAMPluginControl.SetDisabled)
     * @param {Pointer<Guid>} clsid The CLSID to add or remove.
     * @param {BOOL} disabled Specifies whether to add or remove the CSLID. If the value is <b>TRUE</b>, the method adds the CLSID to the blocked list. Otherwise, the method removes it from the list.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-setdisabled
     */
    SetDisabled(clsid, disabled) {
        result := ComCall(8, this, Guid.Ptr, clsid, BOOL, disabled, "HRESULT")
        return result
    }

    /**
     * Queries whether an Audio Compression Manager (ACM) or Video Compression Manager (VCM) codec appears in the blocked list.
     * @param {PWSTR} dllName The name of the DLL that implements the codec.
     * @returns {HRESULT} This method can return one of these values.
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
     * The specified DLL appears in the blocked list.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DLL is not in the blocked list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamplugincontrol-islegacydisabled
     */
    IsLegacyDisabled(dllName) {
        dllName := dllName is String ? StrPtr(dllName) : dllName

        result := ComCall(9, this, "ptr", dllName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMPluginControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPreferredClsid := CallbackCreate(GetMethod(implObj, "GetPreferredClsid"), flags, 3)
        this.vtbl.GetPreferredClsidByIndex := CallbackCreate(GetMethod(implObj, "GetPreferredClsidByIndex"), flags, 4)
        this.vtbl.SetPreferredClsid := CallbackCreate(GetMethod(implObj, "SetPreferredClsid"), flags, 3)
        this.vtbl.IsDisabled := CallbackCreate(GetMethod(implObj, "IsDisabled"), flags, 2)
        this.vtbl.GetDisabledByIndex := CallbackCreate(GetMethod(implObj, "GetDisabledByIndex"), flags, 3)
        this.vtbl.SetDisabled := CallbackCreate(GetMethod(implObj, "SetDisabled"), flags, 3)
        this.vtbl.IsLegacyDisabled := CallbackCreate(GetMethod(implObj, "IsLegacyDisabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPreferredClsid)
        CallbackFree(this.vtbl.GetPreferredClsidByIndex)
        CallbackFree(this.vtbl.SetPreferredClsid)
        CallbackFree(this.vtbl.IsDisabled)
        CallbackFree(this.vtbl.GetDisabledByIndex)
        CallbackFree(this.vtbl.SetDisabled)
        CallbackFree(this.vtbl.IsLegacyDisabled)
    }
}
