#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DTT_CALLBACK_PROC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HDC} hdc_ 
     * @param {PWSTR} pszText 
     * @param {Integer} cchText 
     * @param {Pointer<RECT>} prc 
     * @param {Integer} dwFlags 
     * @param {LPARAM} lParam_ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hdc_, pszText, cchText, prc, dwFlags, lParam_) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_
        pszText := pszText is String ? StrPtr(pszText) : pszText
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(3, this, "ptr", hdc_, "ptr", pszText, "int", cchText, "ptr", prc, "uint", dwFlags, "ptr", lParam_, "int")
        return result
    }
}
