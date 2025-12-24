#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionSurface.ahk

/**
 * Represents a sparsely allocated bitmap that can be associated with a visual for composition in a visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionvirtualsurface
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
     * @param {Integer} width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The new width of the virtual surface, in pixels. The maximum width is 16,777,216 pixels.
     * @param {Integer} height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The new height of the virtual surface, in pixels. The maximum height is 16,777,216 pixels.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvirtualsurface-resize
     */
    Resize(width, height) {
        result := ComCall(8, this, "uint", width, "uint", height, "HRESULT")
        return result
    }

    /**
     * Discards pixels that fall outside of the specified trim rectangles.
     * @param {Pointer<RECT>} rectangles Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * An array of rectangles to keep.
     * @param {Integer} count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of rectangles in the <i>rectangles</i> array.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvirtualsurface-trim
     */
    Trim(rectangles, count) {
        result := ComCall(9, this, "ptr", rectangles, "uint", count, "HRESULT")
        return result
    }
}
