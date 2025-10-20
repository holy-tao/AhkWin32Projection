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
     * 
     * @param {Pointer<UInt32>} puiCodePage 
     * @returns {HRESULT} 
     */
    GetCodePage(puiCodePage) {
        result := ComCall(3, this, "uint*", puiCodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {HRESULT} 
     */
    SetCodePage(uiCodePage) {
        result := ComCall(4, this, "uint", uiCodePage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
