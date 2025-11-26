#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Displays a dialog box that allows users to select one or more principals from a list.
 * @remarks
 * 
 * Implement this interface when you need a custom dialog box that allows users to choose principals.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazobjectpicker
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzObjectPicker extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzObjectPicker
     * @type {Guid}
     */
    static IID => Guid("{63130a48-699a-42d8-bf01-c62ac3fb79f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrincipals", "get_Name"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @param {HWND} hParentWnd 
     * @param {BSTR} bstrTitle 
     * @param {Pointer<VARIANT>} pvSidTypes 
     * @param {Pointer<VARIANT>} pvNames 
     * @param {Pointer<VARIANT>} pvSids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazobjectpicker-getprincipals
     */
    GetPrincipals(hParentWnd, bstrTitle, pvSidTypes, pvNames, pvSids) {
        hParentWnd := hParentWnd is Win32Handle ? NumGet(hParentWnd, "ptr") : hParentWnd
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(7, this, "ptr", hParentWnd, "ptr", bstrTitle, "ptr", pvSidTypes, "ptr", pvNames, "ptr", pvSids, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazobjectpicker-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(8, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
