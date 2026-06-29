#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpenServiceActivityInput.ahk" { IOpenServiceActivityInput }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IOpenServiceActivity.ahk" { IOpenServiceActivity }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IOpenServiceActivityOutputContext.ahk" { IOpenServiceActivityOutputContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumOpenServiceActivity.ahk" { IEnumOpenServiceActivity }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IOpenServiceActivityCategory extends IUnknown {
    /**
     * The interface identifier for IOpenServiceActivityCategory
     * @type {Guid}
     */
    static IID := Guid("{850af9d6-7309-40b5-bdb8-786c106b2153}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpenServiceActivityCategory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HasDefaultActivity    : IntPtr
        GetDefaultActivity    : IntPtr
        SetDefaultActivity    : IntPtr
        GetName               : IntPtr
        GetActivityEnumerator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpenServiceActivityCategory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    HasDefaultActivity() {
        result := ComCall(3, this, BOOL.Ptr, &pfHasDefaultActivity := 0, "HRESULT")
        return pfHasDefaultActivity
    }

    /**
     * 
     * @returns {IOpenServiceActivity} 
     */
    GetDefaultActivity() {
        result := ComCall(4, this, "ptr*", &ppDefaultActivity := 0, "HRESULT")
        return IOpenServiceActivity(ppDefaultActivity)
    }

    /**
     * 
     * @param {IOpenServiceActivity} pActivity 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    SetDefaultActivity(pActivity, _hwnd) {
        result := ComCall(5, this, "ptr", pActivity, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        pbstrName := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {IEnumOpenServiceActivity} 
     */
    GetActivityEnumerator(pInput, pOutput) {
        result := ComCall(7, this, "ptr", pInput, "ptr", pOutput, "ptr*", &ppEnumActivity := 0, "HRESULT")
        return IEnumOpenServiceActivity(ppEnumActivity)
    }

    Query(iid) {
        if (IOpenServiceActivityCategory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HasDefaultActivity := CallbackCreate(GetMethod(implObj, "HasDefaultActivity"), flags, 2)
        this.vtbl.GetDefaultActivity := CallbackCreate(GetMethod(implObj, "GetDefaultActivity"), flags, 2)
        this.vtbl.SetDefaultActivity := CallbackCreate(GetMethod(implObj, "SetDefaultActivity"), flags, 3)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetActivityEnumerator := CallbackCreate(GetMethod(implObj, "GetActivityEnumerator"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HasDefaultActivity)
        CallbackFree(this.vtbl.GetDefaultActivity)
        CallbackFree(this.vtbl.SetDefaultActivity)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetActivityEnumerator)
    }
}
