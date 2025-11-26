#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfSystemLangBarItemText interface is implemented by a system language bar and is used by a system language bar extension to modify the description displayed for the menu.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itfsystemlangbaritemtext
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfSystemLangBarItemText extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfSystemLangBarItemText
     * @type {Guid}
     */
    static IID => Guid("{5c4ce0e5-ba49-4b52-ac6b-3b397b4f701f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetItemText", "GetItemText"]

    /**
     * The ITfSystemLangBarItemText::SetItemText method modifies the text displayed for the system language bar menu.
     * @param {PWSTR} pch [in] A string that appears as a description.
     * @param {Integer} cch [in] Size, in characters, of the string.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itfsystemlangbaritemtext-setitemtext
     */
    SetItemText(pch, cch) {
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(3, this, "ptr", pch, "uint", cch, "HRESULT")
        return result
    }

    /**
     * The ITfSystemLangBarItemText::GetItemText method obtains the text displayed for the system language bar menu.
     * @returns {BSTR} [out] A pointer to BSTR that contains the current description.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itfsystemlangbaritemtext-getitemtext
     */
    GetItemText() {
        pbstrText := BSTR()
        result := ComCall(4, this, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
