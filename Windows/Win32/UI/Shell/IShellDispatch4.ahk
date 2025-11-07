#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IShellDispatch3.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch4 extends IShellDispatch3{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WindowsSecurity", "ToggleDesktop", "ExplorerPolicy", "GetSetting"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4-windowssecurity
     */
    WindowsSecurity() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4-toggledesktop
     */
    ToggleDesktop() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPolicyName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4-explorerpolicy
     */
    ExplorerPolicy(bstrPolicyName) {
        bstrPolicyName := bstrPolicyName is String ? BSTR.Alloc(bstrPolicyName).Value : bstrPolicyName

        pValue := VARIANT()
        result := ComCall(42, this, "ptr", bstrPolicyName, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} lSetting 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4-getsetting
     */
    GetSetting(lSetting) {
        result := ComCall(43, this, "int", lSetting, "short*", &pResult := 0, "HRESULT")
        return pResult
    }
}
