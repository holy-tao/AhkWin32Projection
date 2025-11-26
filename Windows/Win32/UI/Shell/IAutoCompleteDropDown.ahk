#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow clients to reset or query the display state of the autocomplete drop-down list, which contains possible completions to a string entered by the user in an edit control.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iautocompletedropdown
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAutoCompleteDropDown extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutoCompleteDropDown
     * @type {Guid}
     */
    static IID => Guid("{3cd141f4-3c6a-11d2-bcaa-00c04fd929db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDropDownStatus", "ResetEnumerator"]

    /**
     * Gets the current display status of the autocomplete drop-down list.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * 
     * A pointer to a value indicating whether the autocomplete drop-down list is currently displayed. This parameter can be <b>NULL</b> on entry if this information is not needed. The following values are recognized as the target of this pointer.
     * @param {Pointer<PWSTR>} ppwszString Type: <b>LPWSTR*</b>
     * 
     * A pointer to a buffer containing the first select item in the drop-down list, if the value pointed to by <i>pdwFlags</i> is <b>ACDD_VISIBLE</b>. This value can be <b>NULL</b> on entry if this information is not needed.
     *             
     *                     
     * 
     * If <i>pdwFlags</i> is zero on exit, then this value will be <b>NULL</b>.
     * 
     * If this value is not <b>NULL</b> on exit, the buffer it points to must be freed using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when it is no longer needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iautocompletedropdown-getdropdownstatus
     */
    GetDropDownStatus(pdwFlags, ppwszString) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        ppwszStringMarshal := ppwszString is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, ppwszStringMarshal, ppwszString, "HRESULT")
        return result
    }

    /**
     * Forces the autocomplete object to refresh its list of suggestions when the list is visible.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iautocompletedropdown-resetenumerator
     */
    ResetEnumerator() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
