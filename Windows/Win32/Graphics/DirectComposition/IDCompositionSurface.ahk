#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a physical bitmap that can be associated with a visual for composition in a visual tree. This interface can also be used to update the bitmap contents.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionsurface
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionSurface extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionSurface
     * @type {Guid}
     */
    static IID => Guid("{bb8a4953-2c99-4f5a-96f5-4819027fa3ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginDraw", "EndDraw", "SuspendDraw", "ResumeDraw", "Scroll"]

    /**
     * Initiates drawing on this Microsoft DirectComposition surface object.
     * @param {Pointer<RECT>} updateRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The rectangle to be updated. If this parameter is NULL, the entire bitmap is updated.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to retrieve.
     * @param {Pointer<Pointer<Void>>} updateObject Type: <b>void**</b>
     * 
     * Receives an interface pointer of the type specified in the <i>iid</i> parameter.   This parameter must not be NULL.
     * 
     * <div class="alert"><b>Note</b>  In Windows 8, this parameter was <i>surface</i>.</div>
     * <div> </div>
     * @param {Pointer<POINT>} updateOffset Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * The offset into the surface where the application should draw updated content. This offset will reference the upper left corner of the update rectangle.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionsurface-begindraw
     */
    BeginDraw(updateRect, iid, updateObject, updateOffset) {
        updateObjectMarshal := updateObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", updateRect, "ptr", iid, updateObjectMarshal, updateObject, "ptr", updateOffset, "HRESULT")
        return result
    }

    /**
     * Marks the end of drawing on this Microsoft DirectComposition surface object.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code, which can include <a href="/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_NOT_BEING_RENDERED</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionsurface-enddraw
     */
    EndDraw() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Suspends the drawing on this Microsoft DirectComposition surface object.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code, which can include <a href="/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_BEING_RENDERED</a> and <a href="/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_NOT_BEING_RENDERED</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionsurface-suspenddraw
     */
    SuspendDraw() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Resumes drawing on this Microsoft DirectComposition surface object.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code, which can include <a href="/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_BEING_RENDERED</a> and <a href="/windows/desktop/directcomp/directcomposition-error-codes">DCOMPOSITION_ERROR_SURFACE_NOT_BEING_RENDERED</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionsurface-resumedraw
     */
    ResumeDraw() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Scrolls a rectangular area of a Microsoft DirectComposition logical surface.
     * @param {Pointer<RECT>} scrollRect The rectangular area of the surface to be scrolled, relative to the upper-left corner of the surface. If this parameter is NULL, the entire surface is scrolled.
     * @param {Pointer<RECT>} clipRect The <i>clipRect</i> clips the destination (<i>scrollRect</i> after offset) of the scroll.
     * The only bitmap content that will be scrolled are those that remain inside the clip rectangle after the scroll is completed.
     * @param {Integer} offsetX The amount of horizontal scrolling, in pixels. Use positive values to scroll right, and negative values to scroll left.
     * @param {Integer} offsetY The amount of vertical scrolling, in pixels. Use positive values to scroll down, and negative values to scroll up.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionsurface-scroll
     */
    Scroll(scrollRect, clipRect, offsetX, offsetY) {
        result := ComCall(7, this, "ptr", scrollRect, "ptr", clipRect, "int", offsetX, "int", offsetY, "HRESULT")
        return result
    }
}
