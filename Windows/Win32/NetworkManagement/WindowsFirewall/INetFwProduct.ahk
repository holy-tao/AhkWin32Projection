#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * To access the properties of a third-party firewall registration.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwproduct
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwProduct extends IDispatch {
    /**
     * The interface identifier for INetFwProduct
     * @type {Guid}
     */
    static IID := Guid("{71881699-18f4-458b-b892-3ffce5e07f75}")

    /**
     * The class identifier for NetFwProduct
     * @type {Guid}
     */
    static CLSID := Guid("{9d745ed8-c514-4d1d-bf42-751fed2d5ac7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwProduct interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RuleCategories         : IntPtr
        put_RuleCategories         : IntPtr
        get_DisplayName            : IntPtr
        put_DisplayName            : IntPtr
        get_PathToSignedProductExe : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwProduct.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    RuleCategories {
        get => this.get_RuleCategories()
        set => this.put_RuleCategories(value)
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {BSTR} 
     */
    PathToSignedProductExe {
        get => this.get_PathToSignedProductExe()
    }

    /**
     * For a third-party firewall product registration, indicates the rule categories for which the third-party firewall wishes to take ownership from Windows Firewall. (Get)
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-get_rulecategories
     */
    get_RuleCategories() {
        ruleCategories := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, ruleCategories, "HRESULT")
        return ruleCategories
    }

    /**
     * For a third-party firewall product registration, indicates the rule categories for which the third-party firewall wishes to take ownership from Windows Firewall. (Put)
     * @param {VARIANT} ruleCategories 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-put_rulecategories
     */
    put_RuleCategories(ruleCategories) {
        result := ComCall(8, this, VARIANT, ruleCategories, "HRESULT")
        return result
    }

    /**
     * Indicates the display name for a third-party firewall product registration. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-get_displayname
     */
    get_DisplayName() {
        displayName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, displayName, "HRESULT")
        return displayName
    }

    /**
     * Indicates the display name for a third-party firewall product registration. (Put)
     * @param {BSTR} displayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-put_displayname
     */
    put_DisplayName(displayName) {
        displayName := displayName is String ? BSTR.Alloc(displayName).Value : displayName

        result := ComCall(10, this, BSTR, displayName, "HRESULT")
        return result
    }

    /**
     * Indicates the path to the signed executable file of a third-party firewall product registration.
     * @remarks
     * This is a read-only property, which is set after the product has been registered.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-get_pathtosignedproductexe
     */
    get_PathToSignedProductExe() {
        _path := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    Query(iid) {
        if (INetFwProduct.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RuleCategories := CallbackCreate(GetMethod(implObj, "get_RuleCategories"), flags, 2)
        this.vtbl.put_RuleCategories := CallbackCreate(GetMethod(implObj, "put_RuleCategories"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.put_DisplayName := CallbackCreate(GetMethod(implObj, "put_DisplayName"), flags, 2)
        this.vtbl.get_PathToSignedProductExe := CallbackCreate(GetMethod(implObj, "get_PathToSignedProductExe"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RuleCategories)
        CallbackFree(this.vtbl.put_RuleCategories)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.put_DisplayName)
        CallbackFree(this.vtbl.get_PathToSignedProductExe)
    }
}
