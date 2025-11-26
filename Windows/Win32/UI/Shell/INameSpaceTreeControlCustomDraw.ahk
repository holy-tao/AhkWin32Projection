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
     * Called before the namespace tree control is drawn.
     * @param {HDC} hdc Type: <b>HDC</b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn.
     * @returns {LRESULT} Type: <b>LRESULT*</b>
     * 
     * When this method returns, contains a pointer to an <b>LRESULT</b>, which contains one or more of the values from the <a href="https://docs.microsoft.com/windows/desktop/Controls/cdrf-constants">CDRF Constants</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-prepaint
     */
    PrePaint(hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(3, this, "ptr", hdc, "ptr", prc, "ptr*", &plres := 0, "HRESULT")
        return plres
    }

    /**
     * Called after the namespace tree control is drawn.
     * @param {HDC} hdc Type: <b>HDC</b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-postpaint
     */
    PostPaint(hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(4, this, "ptr", hdc, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * Called before an item in the namespace tree control is drawn.
     * @param {HDC} hdc Type: <b>HDC</b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn.
     * @param {Pointer<NSTCCUSTOMDRAW>} pnstccdItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-nstccustomdraw">NSTCCUSTOMDRAW</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-nstccustomdraw">NSTCCUSTOMDRAW</a> structure that determines the details of the drawing.
     * @param {Pointer<COLORREF>} pclrText Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>*</b>
     * 
     * On entry, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that declares the default color of the text. When this method returns, contains a pointer to a <b>COLORREF</b> structure that declares the color that should be used in its place, if any. This allows the client to provide their own color if they do not want to use the default.
     * @param {Pointer<COLORREF>} pclrTextBk Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>*</b>
     * 
     * On entry, a pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that declares the default color of the background. When this method returns, contains a pointer to a <b>COLORREF</b> structure that declares the color that should be used in its place, if any. This allows the client to provide their own color if they do not want to use the default.
     * @returns {LRESULT} Type: <b>LRESULT*</b>
     * 
     * When this method returns, contains a pointer to an <b>LRESULT</b>, which points to one or more of the values from the <a href="https://docs.microsoft.com/windows/desktop/Controls/cdrf-constants">CDRF Constants</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-itemprepaint
     */
    ItemPrePaint(hdc, prc, pnstccdItem, pclrText, pclrTextBk) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pclrTextMarshal := pclrText is VarRef ? "uint*" : "ptr"
        pclrTextBkMarshal := pclrTextBk is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", hdc, "ptr", prc, "ptr", pnstccdItem, pclrTextMarshal, pclrText, pclrTextBkMarshal, pclrTextBk, "ptr*", &plres := 0, "HRESULT")
        return plres
    }

    /**
     * Called after an item in the namespace tree control is drawn.
     * @param {HDC} hdc Type: <b>HDC</b>
     * 
     * A handle to the control's device context. Use this HDC to perform any GDI functions.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the bounding rectangle of the area being drawn.
     * @param {Pointer<NSTCCUSTOMDRAW>} pnstccdItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-nstccustomdraw">NSTCCUSTOMDRAW</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-nstccustomdraw">NSTCCUSTOMDRAW</a> struct that determines the details of the drawing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-inamespacetreecontrolcustomdraw-itempostpaint
     */
    ItemPostPaint(hdc, prc, pnstccdItem) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(6, this, "ptr", hdc, "ptr", prc, "ptr", pnstccdItem, "HRESULT")
        return result
    }
}
