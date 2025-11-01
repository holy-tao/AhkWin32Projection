#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentPropertyUi extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentPropertyUi
     * @type {Guid}
     */
    static IID => Guid("{932238e0-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryPropertyUi", "SetContext", "MergePropPages", "ValidateProperties", "ApplyProperties", "CancelProperties"]

    /**
     * 
     * @param {IUnknown} pUnkReserved 
     * @returns {HRESULT} 
     */
    QueryPropertyUi(pUnkReserved) {
        result := ComCall(3, this, "ptr", pUnkReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkReserved 
     * @returns {HRESULT} 
     */
    SetContext(pUnkReserved) {
        result := ComCall(4, this, "ptr", pUnkReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwDefPages 
     * @param {Pointer<Pointer<Integer>>} pahpspPrivate 
     * @param {Pointer<Integer>} pcPages 
     * @param {HWND} hwndParent 
     * @param {Pointer<PWSTR>} pszStartPage 
     * @returns {HRESULT} 
     */
    MergePropPages(pdwDefPages, pahpspPrivate, pcPages, hwndParent, pszStartPage) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "uint*", pdwDefPages, "ptr*", pahpspPrivate, "uint*", pcPages, "ptr", hwndParent, "ptr", pszStartPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndSheet 
     * @returns {HRESULT} 
     */
    ValidateProperties(hwndSheet) {
        hwndSheet := hwndSheet is Win32Handle ? NumGet(hwndSheet, "ptr") : hwndSheet

        result := ComCall(6, this, "ptr", hwndSheet, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ApplyProperties() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelProperties() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
