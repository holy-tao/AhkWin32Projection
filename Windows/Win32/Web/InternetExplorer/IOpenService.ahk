#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IOpenService extends IUnknown {
    /**
     * The interface identifier for IOpenService
     * @type {Guid}
     */
    static IID := Guid("{c2952ed1-6a89-4606-925f-1ed8b4be0630}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpenService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsDefault  : IntPtr
        SetDefault : IntPtr
        GetID      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpenService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IsDefault
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-isdefault
     */
    IsDefault() {
        result := ComCall(3, this, BOOL.Ptr, &pfIsDefault := 0, "HRESULT")
        return pfIsDefault
    }

    /**
     * 
     * @param {BOOL} fDefault 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    SetDefault(fDefault, _hwnd) {
        result := ComCall(4, this, BOOL, fDefault, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetID() {
        pbstrID := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrID, "HRESULT")
        return pbstrID
    }

    Query(iid) {
        if (IOpenService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsDefault := CallbackCreate(GetMethod(implObj, "IsDefault"), flags, 2)
        this.vtbl.SetDefault := CallbackCreate(GetMethod(implObj, "SetDefault"), flags, 3)
        this.vtbl.GetID := CallbackCreate(GetMethod(implObj, "GetID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsDefault)
        CallbackFree(this.vtbl.SetDefault)
        CallbackFree(this.vtbl.GetID)
    }
}
