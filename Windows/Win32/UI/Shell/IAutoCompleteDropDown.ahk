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
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<PWSTR>} ppwszString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iautocompletedropdown-getdropdownstatus
     */
    GetDropDownStatus(pdwFlags, ppwszString) {
        result := ComCall(3, this, "uint*", pdwFlags, "ptr", ppwszString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iautocompletedropdown-resetenumerator
     */
    ResetEnumerator() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
