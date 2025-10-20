#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivityCategory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenServiceActivityCategory
     * @type {Guid}
     */
    static IID => Guid("{850af9d6-7309-40b5-bdb8-786c106b2153}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasDefaultActivity", "GetDefaultActivity", "SetDefaultActivity", "GetName", "GetActivityEnumerator"]

    /**
     * 
     * @param {Pointer<BOOL>} pfHasDefaultActivity 
     * @returns {HRESULT} 
     */
    HasDefaultActivity(pfHasDefaultActivity) {
        result := ComCall(3, this, "ptr", pfHasDefaultActivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpenServiceActivity>} ppDefaultActivity 
     * @returns {HRESULT} 
     */
    GetDefaultActivity(ppDefaultActivity) {
        result := ComCall(4, this, "ptr*", ppDefaultActivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpenServiceActivity} pActivity 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetDefaultActivity(pActivity, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", pActivity, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetName(pbstrName) {
        result := ComCall(6, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @param {Pointer<IEnumOpenServiceActivity>} ppEnumActivity 
     * @returns {HRESULT} 
     */
    GetActivityEnumerator(pInput, pOutput, ppEnumActivity) {
        result := ComCall(7, this, "ptr", pInput, "ptr", pOutput, "ptr*", ppEnumActivity, "HRESULT")
        return result
    }
}
