#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfUIElement.ahk

/**
 * The ITfToolTipUIElement interface is implemented by a text service that wants to show a tooltip on its UI.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftooltipuielement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfToolTipUIElement extends ITfUIElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfToolTipUIElement
     * @type {Guid}
     */
    static IID => Guid("{52b18b5c-555d-46b2-b00a-fa680144fbdb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetString"]

    /**
     * Returns the string of the tooltip.
     * @returns {BSTR} [out] A pointer to receive BSTR. This is the string for the tooltip.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itftooltipuielement-getstring
     */
    GetString() {
        pstr := BSTR()
        result := ComCall(7, this, "ptr", pstr, "HRESULT")
        return pstr
    }
}
