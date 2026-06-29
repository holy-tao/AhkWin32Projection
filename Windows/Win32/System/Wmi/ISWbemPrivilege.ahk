#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\WbemPrivilegeEnum.ahk" { WbemPrivilegeEnum }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemPrivilege extends IDispatch {
    /**
     * The interface identifier for ISWbemPrivilege
     * @type {Guid}
     */
    static IID := Guid("{26ee67bd-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The class identifier for SWbemPrivilege
     * @type {Guid}
     */
    static CLSID := Guid("{26ee67bc-5804-11d2-8b4a-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemPrivilege interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_IsEnabled   : IntPtr
        put_IsEnabled   : IntPtr
        get_Name        : IntPtr
        get_DisplayName : IntPtr
        get_Identifier  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemPrivilege.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {WbemPrivilegeEnum} 
     */
    Identifier {
        get => this.get_Identifier()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsEnabled() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &bIsEnabled := 0, "HRESULT")
        return bIsEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {HRESULT} 
     */
    put_IsEnabled(bIsEnabled) {
        result := ComCall(8, this, VARIANT_BOOL, bIsEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strDisplayName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, strDisplayName, "HRESULT")
        return strDisplayName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        strDisplayName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, strDisplayName, "HRESULT")
        return strDisplayName
    }

    /**
     * 
     * @returns {WbemPrivilegeEnum} 
     */
    get_Identifier() {
        result := ComCall(11, this, "int*", &iPrivilege := 0, "HRESULT")
        return iPrivilege
    }

    Query(iid) {
        if (ISWbemPrivilege.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IsEnabled := CallbackCreate(GetMethod(implObj, "get_IsEnabled"), flags, 2)
        this.vtbl.put_IsEnabled := CallbackCreate(GetMethod(implObj, "put_IsEnabled"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.get_Identifier := CallbackCreate(GetMethod(implObj, "get_Identifier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IsEnabled)
        CallbackFree(this.vtbl.put_IsEnabled)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.get_Identifier)
    }
}
