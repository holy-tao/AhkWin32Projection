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
     * 
     * @param {Pointer<RECT>} updateRect 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} updateObject 
     * @param {Pointer<POINT>} updateOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-begindraw
     */
    BeginDraw(updateRect, iid, updateObject, updateOffset) {
        result := ComCall(3, this, "ptr", updateRect, "ptr", iid, "ptr*", updateObject, "ptr", updateOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-enddraw
     */
    EndDraw() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-suspenddraw
     */
    SuspendDraw() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-resumedraw
     */
    ResumeDraw() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} scrollRect 
     * @param {Pointer<RECT>} clipRect 
     * @param {Integer} offsetX 
     * @param {Integer} offsetY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionsurface-scroll
     */
    Scroll(scrollRect, clipRect, offsetX, offsetY) {
        result := ComCall(7, this, "ptr", scrollRect, "ptr", clipRect, "int", offsetX, "int", offsetY, "HRESULT")
        return result
    }
}
