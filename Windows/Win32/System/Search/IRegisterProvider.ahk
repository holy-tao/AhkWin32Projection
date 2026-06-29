#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRegisterProvider extends IUnknown {
    /**
     * The interface identifier for IRegisterProvider
     * @type {Guid}
     */
    static IID := Guid("{0c733ab9-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegisterProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetURLMapping      : IntPtr
        SetURLMapping      : IntPtr
        UnregisterProvider : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegisterProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer} dwReserved 
     * @returns {Guid} 
     */
    GetURLMapping(pwszURL, dwReserved) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pclsidProvider := Guid()
        result := ComCall(3, this, "ptr", pwszURL, "ptr", dwReserved, Guid.Ptr, pclsidProvider, "HRESULT")
        return pclsidProvider
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer} dwReserved 
     * @param {Pointer<Guid>} rclsidProvider 
     * @returns {HRESULT} 
     */
    SetURLMapping(pwszURL, dwReserved, rclsidProvider) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(4, this, "ptr", pwszURL, "ptr", dwReserved, Guid.Ptr, rclsidProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer} dwReserved 
     * @param {Pointer<Guid>} rclsidProvider 
     * @returns {HRESULT} 
     */
    UnregisterProvider(pwszURL, dwReserved, rclsidProvider) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(5, this, "ptr", pwszURL, "ptr", dwReserved, Guid.Ptr, rclsidProvider, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRegisterProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetURLMapping := CallbackCreate(GetMethod(implObj, "GetURLMapping"), flags, 4)
        this.vtbl.SetURLMapping := CallbackCreate(GetMethod(implObj, "SetURLMapping"), flags, 4)
        this.vtbl.UnregisterProvider := CallbackCreate(GetMethod(implObj, "UnregisterProvider"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetURLMapping)
        CallbackFree(this.vtbl.SetURLMapping)
        CallbackFree(this.vtbl.UnregisterProvider)
    }
}
