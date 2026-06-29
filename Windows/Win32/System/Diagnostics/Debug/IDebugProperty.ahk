#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumDebugPropertyInfo.ahk" { IEnumDebugPropertyInfo }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DebugPropertyInfo.ahk" { DebugPropertyInfo }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IDebugProperty extends IUnknown {
    /**
     * The interface identifier for IDebugProperty
     * @type {Guid}
     */
    static IID := Guid("{51973c50-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugProperty interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPropertyInfo  : IntPtr
        GetExtendedInfo  : IntPtr
        SetValueAsString : IntPtr
        EnumMembers      : IntPtr
        GetParent        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPropertyInfo function returns a pointer to the property information of a given protocol.
     * @remarks
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetPropertyInfo** function.
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @returns {DebugPropertyInfo} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getpropertyinfo
     */
    GetPropertyInfo(dwFieldSpec, nRadix) {
        pPropertyInfo := DebugPropertyInfo()
        result := ComCall(3, this, "uint", dwFieldSpec, "uint", nRadix, DebugPropertyInfo.Ptr, pPropertyInfo, "HRESULT")
        return pPropertyInfo
    }

    /**
     * 
     * @param {Integer} cInfos 
     * @param {Pointer<Guid>} rgguidExtendedInfo 
     * @returns {VARIANT} 
     */
    GetExtendedInfo(cInfos, rgguidExtendedInfo) {
        rgvar := VARIANT()
        result := ComCall(4, this, "uint", cInfos, Guid.Ptr, rgguidExtendedInfo, VARIANT.Ptr, rgvar, "HRESULT")
        return rgvar
    }

    /**
     * 
     * @param {PWSTR} pszValue 
     * @param {Integer} nRadix 
     * @returns {HRESULT} 
     */
    SetValueAsString(pszValue, nRadix) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(5, this, "ptr", pszValue, "uint", nRadix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @param {Pointer<Guid>} refiid 
     * @returns {IEnumDebugPropertyInfo} 
     */
    EnumMembers(dwFieldSpec, nRadix, refiid) {
        result := ComCall(6, this, "uint", dwFieldSpec, "uint", nRadix, Guid.Ptr, refiid, "ptr*", &ppepi := 0, "HRESULT")
        return IEnumDebugPropertyInfo(ppepi)
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @returns {IDebugProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(7, this, "ptr*", &ppDebugProp := 0, "HRESULT")
        return IDebugProperty(ppDebugProp)
    }

    Query(iid) {
        if (IDebugProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyInfo := CallbackCreate(GetMethod(implObj, "GetPropertyInfo"), flags, 4)
        this.vtbl.GetExtendedInfo := CallbackCreate(GetMethod(implObj, "GetExtendedInfo"), flags, 4)
        this.vtbl.SetValueAsString := CallbackCreate(GetMethod(implObj, "SetValueAsString"), flags, 3)
        this.vtbl.EnumMembers := CallbackCreate(GetMethod(implObj, "EnumMembers"), flags, 5)
        this.vtbl.GetParent := CallbackCreate(GetMethod(implObj, "GetParent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyInfo)
        CallbackFree(this.vtbl.GetExtendedInfo)
        CallbackFree(this.vtbl.SetValueAsString)
        CallbackFree(this.vtbl.EnumMembers)
        CallbackFree(this.vtbl.GetParent)
    }
}
