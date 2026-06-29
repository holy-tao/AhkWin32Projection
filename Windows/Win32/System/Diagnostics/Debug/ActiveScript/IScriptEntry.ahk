#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\ITypeInfo.ahk" { ITypeInfo }
#Import ".\IScriptNode.ahk" { IScriptNode }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IScriptEntry extends IScriptNode {
    /**
     * The interface identifier for IScriptEntry
     * @type {Guid}
     */
    static IID := Guid("{0aee2a95-bcbb-11d0-8c72-00c04fc2b085}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScriptEntry interfaces
    */
    struct Vtbl extends IScriptNode.Vtbl {
        GetText      : IntPtr
        SetText      : IntPtr
        GetBody      : IntPtr
        SetBody      : IntPtr
        GetName      : IntPtr
        SetName      : IntPtr
        GetItemName  : IntPtr
        SetItemName  : IntPtr
        GetSignature : IntPtr
        SetSignature : IntPtr
        GetRange     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScriptEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetText() {
        pbstr := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetText(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(14, this, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetBody() {
        pbstr := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetBody(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(16, this, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        pbstr := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(18, this, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetItemName() {
        pbstr := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetItemName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(20, this, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITypeInfo>} ppti 
     * @param {Pointer<Integer>} piMethod 
     * @returns {HRESULT} 
     */
    GetSignature(ppti, piMethod) {
        piMethodMarshal := piMethod is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, ITypeInfo.Ptr, ppti, piMethodMarshal, piMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITypeInfo} pti 
     * @param {Integer} iMethod 
     * @returns {HRESULT} 
     */
    SetSignature(pti, iMethod) {
        result := ComCall(22, this, "ptr", pti, "uint", iMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pichMin 
     * @param {Pointer<Integer>} pcch 
     * @returns {HRESULT} 
     */
    GetRange(pichMin, pcch) {
        pichMinMarshal := pichMin is VarRef ? "uint*" : "ptr"
        pcchMarshal := pcch is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, pichMinMarshal, pichMin, pcchMarshal, pcch, "HRESULT")
        return result
    }

    Query(iid) {
        if (IScriptEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 2)
        this.vtbl.SetText := CallbackCreate(GetMethod(implObj, "SetText"), flags, 2)
        this.vtbl.GetBody := CallbackCreate(GetMethod(implObj, "GetBody"), flags, 2)
        this.vtbl.SetBody := CallbackCreate(GetMethod(implObj, "SetBody"), flags, 2)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.SetName := CallbackCreate(GetMethod(implObj, "SetName"), flags, 2)
        this.vtbl.GetItemName := CallbackCreate(GetMethod(implObj, "GetItemName"), flags, 2)
        this.vtbl.SetItemName := CallbackCreate(GetMethod(implObj, "SetItemName"), flags, 2)
        this.vtbl.GetSignature := CallbackCreate(GetMethod(implObj, "GetSignature"), flags, 3)
        this.vtbl.SetSignature := CallbackCreate(GetMethod(implObj, "SetSignature"), flags, 3)
        this.vtbl.GetRange := CallbackCreate(GetMethod(implObj, "GetRange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetText)
        CallbackFree(this.vtbl.SetText)
        CallbackFree(this.vtbl.GetBody)
        CallbackFree(this.vtbl.SetBody)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.SetName)
        CallbackFree(this.vtbl.GetItemName)
        CallbackFree(this.vtbl.SetItemName)
        CallbackFree(this.vtbl.GetSignature)
        CallbackFree(this.vtbl.SetSignature)
        CallbackFree(this.vtbl.GetRange)
    }
}
