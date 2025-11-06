#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable the user to draw a custom namespace tree control and its items.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-inamespacetreecontrolcustomdraw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeControlCustomDraw extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INameSpaceTreeControlCustomDraw
     * @type {Guid}
     */
    static IID => Guid("{2d3ba758-33ee-42d5-bb7b-5f3431d86c78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrePaint", "PostPaint", "ItemPrePaint", "ItemPostPaint"]

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prc 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-prepaint
     */
    PrePaint(hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(3, this, "ptr", hdc, "ptr", prc, "ptr*", &plres := 0, "HRESULT")
        return plres
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-postpaint
     */
    PostPaint(hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(4, this, "ptr", hdc, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<NSTCCUSTOMDRAW>} pnstccdItem 
     * @param {Pointer<COLORREF>} pclrText 
     * @param {Pointer<COLORREF>} pclrTextBk 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-itemprepaint
     */
    ItemPrePaint(hdc, prc, pnstccdItem, pclrText, pclrTextBk) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pclrTextMarshal := pclrText is VarRef ? "uint*" : "ptr"
        pclrTextBkMarshal := pclrTextBk is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", hdc, "ptr", prc, "ptr", pnstccdItem, pclrTextMarshal, pclrText, pclrTextBkMarshal, pclrTextBk, "ptr*", &plres := 0, "HRESULT")
        return plres
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<NSTCCUSTOMDRAW>} pnstccdItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-itempostpaint
     */
    ItemPostPaint(hdc, prc, pnstccdItem) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(6, this, "ptr", hdc, "ptr", prc, "ptr", pnstccdItem, "HRESULT")
        return result
    }
}
