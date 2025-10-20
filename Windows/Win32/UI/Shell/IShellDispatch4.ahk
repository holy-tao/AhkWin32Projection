#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellDispatch3.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch4 extends IShellDispatch3{
    /**
     * The interface identifier for IShellDispatch4
     * @type {Guid}
     */
    static IID => Guid("{efd84b2d-4bcf-4298-be25-eb542a59fbda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * 
     * @returns {HRESULT} 
     */
    WindowsSecurity() {
        result := ComCall(40, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ToggleDesktop() {
        result := ComCall(41, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPolicyName 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     */
    ExplorerPolicy(bstrPolicyName, pValue) {
        bstrPolicyName := bstrPolicyName is String ? BSTR.Alloc(bstrPolicyName).Value : bstrPolicyName

        result := ComCall(42, this, "ptr", bstrPolicyName, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSetting 
     * @param {Pointer<VARIANT_BOOL>} pResult 
     * @returns {HRESULT} 
     */
    GetSetting(lSetting, pResult) {
        result := ComCall(43, this, "int", lSetting, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
