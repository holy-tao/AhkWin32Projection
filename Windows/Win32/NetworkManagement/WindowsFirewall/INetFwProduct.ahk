#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * To access the properties of a third-party firewall registration.
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwproduct
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwProduct extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwProduct
     * @type {Guid}
     */
    static IID => Guid("{71881699-18f4-458b-b892-3ffce5e07f75}")

    /**
     * The class identifier for NetFwProduct
     * @type {Guid}
     */
    static CLSID => Guid("{9d745ed8-c514-4d1d-bf42-751fed2d5ac7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RuleCategories", "put_RuleCategories", "get_DisplayName", "put_DisplayName", "get_PathToSignedProductExe"]

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
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-get_rulecategories
     */
    get_RuleCategories() {
        ruleCategories := VARIANT()
        result := ComCall(7, this, "ptr", ruleCategories, "HRESULT")
        return ruleCategories
    }

    /**
     * 
     * @param {VARIANT} ruleCategories 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-put_rulecategories
     */
    put_RuleCategories(ruleCategories) {
        result := ComCall(8, this, "ptr", ruleCategories, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-get_displayname
     */
    get_DisplayName() {
        displayName := BSTR()
        result := ComCall(9, this, "ptr", displayName, "HRESULT")
        return displayName
    }

    /**
     * 
     * @param {BSTR} displayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-put_displayname
     */
    put_DisplayName(displayName) {
        displayName := displayName is String ? BSTR.Alloc(displayName).Value : displayName

        result := ComCall(10, this, "ptr", displayName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproduct-get_pathtosignedproductexe
     */
    get_PathToSignedProductExe() {
        path := BSTR()
        result := ComCall(11, this, "ptr", path, "HRESULT")
        return path
    }
}
