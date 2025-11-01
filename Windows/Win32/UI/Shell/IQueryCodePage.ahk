#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets and sets the numeric value (Code Page identifier) of the ANSI code page.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iquerycodepage
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IQueryCodePage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryCodePage
     * @type {Guid}
     */
    static IID => Guid("{c7b236ce-ee80-11d0-985f-006008059382}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodePage", "SetCodePage"]

    /**
     * 
     * @param {Pointer<Integer>} puiCodePage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iquerycodepage-getcodepage
     */
    GetCodePage(puiCodePage) {
        puiCodePageMarshal := puiCodePage is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, puiCodePageMarshal, puiCodePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iquerycodepage-setcodepage
     */
    SetCodePage(uiCodePage) {
        result := ComCall(4, this, "uint", uiCodePage, "HRESULT")
        return result
    }
}
