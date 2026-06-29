#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Identifies a namespace to open or use.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nn-wcmconfig-isettingsidentity
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct ISettingsIdentity extends IUnknown {
    /**
     * The interface identifier for ISettingsIdentity
     * @type {Guid}
     */
    static IID := Guid("{9f7d7bb6-20b3-11da-81a5-0030f1642e3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISettingsIdentity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAttribute : IntPtr
        SetAttribute : IntPtr
        GetFlags     : IntPtr
        SetFlags     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISettingsIdentity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an identity attribute for a namespace identity.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @param {PWSTR} Name The name of the attribute.
     * @returns {BSTR} The value of the attribute.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsidentity-getattribute
     */
    GetAttribute(Reserved, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        Value := BSTR.Owned()
        result := ComCall(3, this, ReservedMarshal, Reserved, "ptr", Name, BSTR.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * Sets an identity attribute for a namespace identity.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @param {PWSTR} Name The name of the attribute.
     * @param {PWSTR} Value The value of the attribute.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. It returns <b>WCM_E_ATTRIBUTENOTALLOWED</b> if the attribute specified by Name is not recognized.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsidentity-setattribute
     */
    SetAttribute(Reserved, Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name
        Value := Value is String ? StrPtr(Value) : Value

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, ReservedMarshal, Reserved, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Returns the flags for a namespace identity.
     * @returns {Integer} The identity flags for the namespace identity.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsidentity-getflags
     */
    GetFlags() {
        result := ComCall(5, this, "uint*", &Flags := 0, "HRESULT")
        return Flags
    }

    /**
     * Sets the identity flags for a namespace identity.
     * @param {Integer} Flags The identity flags.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsidentity-setflags
     */
    SetFlags(Flags) {
        result := ComCall(6, this, "uint", Flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISettingsIdentity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAttribute := CallbackCreate(GetMethod(implObj, "GetAttribute"), flags, 4)
        this.vtbl.SetAttribute := CallbackCreate(GetMethod(implObj, "SetAttribute"), flags, 4)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.SetFlags := CallbackCreate(GetMethod(implObj, "SetFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAttribute)
        CallbackFree(this.vtbl.SetAttribute)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.SetFlags)
    }
}
