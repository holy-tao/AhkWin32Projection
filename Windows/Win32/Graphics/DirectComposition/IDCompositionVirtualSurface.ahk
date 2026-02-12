#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionSurface.ahk

/**
 * Represents a sparsely allocated bitmap that can be associated with a visual for composition in a visual tree.
 * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nn-dcomp-idcompositionvirtualsurface
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionVirtualSurface extends IDCompositionSurface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionVirtualSurface
     * @type {Guid}
     */
    static IID => Guid("{ae471c51-5f53-4a24-8d3e-d0c39c30b3f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Resize", "Trim"]

    /**
     * Changes the logical size of this virtual surface object.
     * @remarks
     * When a virtual surface is resized, its contents are preserved up to the new boundaries of the surface. If the surface is made smaller, any previously allocated pixels that fall outside of the new width or height are discarded.
     * 
     * This method fails if <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> was called for this bitmap without a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-enddraw">IDCompositionSurface::EndDraw</a>.
     * 
     * This method fails if <i>width</i> or <i>height</i> exceeds 16,777,216 pixels.
     * @param {Integer} width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The new width of the virtual surface, in pixels. The maximum width is 16,777,216 pixels.
     * @param {Integer} height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The new height of the virtual surface, in pixels. The maximum height is 16,777,216 pixels.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvirtualsurface-resize
     */
    Resize(width, height) {
        result := ComCall(8, this, "uint", width, "uint", height, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Discards pixels that fall outside of the specified trim rectangles.
     * @remarks
     * A virtual surface might not  have enough storage for every pixel in the surface. An application instructs the composition engine to allocate memory for the surface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> method, and to release memory for the surface by calling the <b>IDCompositionVirtualSurface::Trim</b> method. The array of rectangles represents the regions of the virtual surface that should remain allocated after this method returns. Any pixels that are outside the specified set of rectangles are no longer used for texturing, and their memory may be reclaimed.
     * 
     * 
     * 
     * If the <i>count</i> parameter is zero, no pixels are kept, and all of the memory allocated for the virtual surface may be reclaimed. The <i>rectangles</i> parameter can be NULL only if the <i>count</i> parameter is zero.
     * 
     * This method fails if <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> was called for this bitmap without a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-enddraw">IDCompositionSurface::EndDraw</a>.
     * @param {Pointer<RECT>} rectangles Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * An array of rectangles to keep.
     * @param {Integer} count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of rectangles in the <i>rectangles</i> array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcomp/nf-dcomp-idcompositionvirtualsurface-trim
     */
    Trim(rectangles, count) {
        result := ComCall(9, this, "ptr", rectangles, "uint", count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
