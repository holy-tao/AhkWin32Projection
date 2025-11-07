#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for applying color and font information to preview handlers.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this interface to be called. The preview handlers must be able to make their own decisions.</div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipreviewhandlervisuals
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPreviewHandlerVisuals extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPreviewHandlerVisuals
     * @type {Guid}
     */
    static IID => Guid("{196bf9a5-b346-4ef0-aa1e-5dcdb76768b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBackgroundColor", "SetFont", "SetTextColor"]

    /**
     * 
     * @param {COLORREF} color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlervisuals-setbackgroundcolor
     */
    SetBackgroundColor(color) {
        result := ComCall(3, this, "uint", color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LOGFONTW>} plf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipreviewhandlervisuals-setfont
     */
    SetFont(plf) {
        result := ComCall(4, this, "ptr", plf, "HRESULT")
        return result
    }

    /**
     * The SetTextColor function sets the text color for the specified device context to the specified color.
     * @param {COLORREF} color The color of the text.
     * @returns {HRESULT} If the function succeeds, the return value is a color reference for the previous text color as a <a href="/windows/desktop/gdi/colorref">COLORREF</a> value.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-settextcolor
     */
    SetTextColor(color) {
        result := ComCall(5, this, "uint", color, "HRESULT")
        return result
    }
}
