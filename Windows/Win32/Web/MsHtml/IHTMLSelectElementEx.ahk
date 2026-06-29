#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLSelectElementEx extends IUnknown {
    /**
     * The interface identifier for IHTMLSelectElementEx
     * @type {Guid}
     */
    static IID := Guid("{3050f2d1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLSelectElementEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShowDropdown     : IntPtr
        SetSelectExFlags : IntPtr
        GetSelectExFlags : IntPtr
        GetDropdownOpen  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLSelectElementEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    ShowDropdown(fShow) {
        result := ComCall(3, this, BOOL, fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    SetSelectExFlags(lFlags) {
        result := ComCall(4, this, "uint", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSelectExFlags() {
        result := ComCall(5, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetDropdownOpen() {
        result := ComCall(6, this, BOOL.Ptr, &pfOpen := 0, "HRESULT")
        return pfOpen
    }

    Query(iid) {
        if (IHTMLSelectElementEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowDropdown := CallbackCreate(GetMethod(implObj, "ShowDropdown"), flags, 2)
        this.vtbl.SetSelectExFlags := CallbackCreate(GetMethod(implObj, "SetSelectExFlags"), flags, 2)
        this.vtbl.GetSelectExFlags := CallbackCreate(GetMethod(implObj, "GetSelectExFlags"), flags, 2)
        this.vtbl.GetDropdownOpen := CallbackCreate(GetMethod(implObj, "GetDropdownOpen"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowDropdown)
        CallbackFree(this.vtbl.SetSelectExFlags)
        CallbackFree(this.vtbl.GetSelectExFlags)
        CallbackFree(this.vtbl.GetDropdownOpen)
    }
}
