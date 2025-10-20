#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * To access the properties of a third-party firewall registration.
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwproduct
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwProduct extends IDispatch{
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
     * 
     * @param {Pointer<VARIANT>} ruleCategories 
     * @returns {HRESULT} 
     */
    get_RuleCategories(ruleCategories) {
        result := ComCall(7, this, "ptr", ruleCategories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} ruleCategories 
     * @returns {HRESULT} 
     */
    put_RuleCategories(ruleCategories) {
        result := ComCall(8, this, "ptr", ruleCategories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} displayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(displayName) {
        result := ComCall(9, this, "ptr", displayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} displayName 
     * @returns {HRESULT} 
     */
    put_DisplayName(displayName) {
        displayName := displayName is String ? BSTR.Alloc(displayName).Value : displayName

        result := ComCall(10, this, "ptr", displayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_PathToSignedProductExe(path) {
        result := ComCall(11, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
