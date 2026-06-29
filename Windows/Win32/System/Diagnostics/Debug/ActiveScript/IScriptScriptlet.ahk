#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IScriptEntry.ahk" { IScriptEntry }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IScriptScriptlet extends IScriptEntry {
    /**
     * The interface identifier for IScriptScriptlet
     * @type {Guid}
     */
    static IID := Guid("{0aee2a96-bcbb-11d0-8c72-00c04fc2b085}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScriptScriptlet interfaces
    */
    struct Vtbl extends IScriptEntry.Vtbl {
        GetSubItemName     : IntPtr
        SetSubItemName     : IntPtr
        GetEventName       : IntPtr
        SetEventName       : IntPtr
        GetSimpleEventName : IntPtr
        SetSimpleEventName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScriptScriptlet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSubItemName() {
        pbstr := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetSubItemName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(25, this, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetEventName() {
        pbstr := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetEventName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(27, this, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSimpleEventName() {
        pbstr := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetSimpleEventName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(29, this, "ptr", psz, "HRESULT")
        return result
    }

    Query(iid) {
        if (IScriptScriptlet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSubItemName := CallbackCreate(GetMethod(implObj, "GetSubItemName"), flags, 2)
        this.vtbl.SetSubItemName := CallbackCreate(GetMethod(implObj, "SetSubItemName"), flags, 2)
        this.vtbl.GetEventName := CallbackCreate(GetMethod(implObj, "GetEventName"), flags, 2)
        this.vtbl.SetEventName := CallbackCreate(GetMethod(implObj, "SetEventName"), flags, 2)
        this.vtbl.GetSimpleEventName := CallbackCreate(GetMethod(implObj, "GetSimpleEventName"), flags, 2)
        this.vtbl.SetSimpleEventName := CallbackCreate(GetMethod(implObj, "SetSimpleEventName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSubItemName)
        CallbackFree(this.vtbl.SetSubItemName)
        CallbackFree(this.vtbl.GetEventName)
        CallbackFree(this.vtbl.SetEventName)
        CallbackFree(this.vtbl.GetSimpleEventName)
        CallbackFree(this.vtbl.SetSimpleEventName)
    }
}
