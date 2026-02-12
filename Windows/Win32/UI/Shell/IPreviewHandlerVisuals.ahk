#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for applying color and font information to preview handlers.
 * @remarks
 * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this interface to be called. The preview handlers must be able to make their own decisions.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ipreviewhandlervisuals
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
     * Sets the background color of the preview handler.
     * @remarks
     * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this method to be called. The preview handlers must be able to make their own decisions.</div>
     * <div> </div>
     * @param {COLORREF} color_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A value of type <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> to use for the preview handler background.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ipreviewhandlervisuals-setbackgroundcolor
     */
    SetBackgroundColor(color_) {
        result := ComCall(3, this, "uint", color_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the font attributes to be used for text within the preview handler.
     * @remarks
     * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this method to be called. The preview handlers must be able to make their own decisions.</div>
     * <div> </div>
     * @param {Pointer<LOGFONTW>} plf Type: <b>const LOGFONTW*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741231(v=vs.85)">LOGFONTW Structure</a> containing the necessary attributes for the font to use.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ipreviewhandlervisuals-setfont
     */
    SetFont(plf) {
        result := ComCall(4, this, "ptr", plf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the color of the text within the preview handler.
     * @remarks
     * <div class="alert"><b>Note</b>  These are suggestions. It is not compulsory for this method to be called; the preview handlers must be able to make their own decisions.</div>
     * <div> </div>
     * @param {COLORREF} color_ Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A value of type <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> to use for the preview handler text color.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ipreviewhandlervisuals-settextcolor
     */
    SetTextColor(color_) {
        result := ComCall(5, this, "uint", color_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
