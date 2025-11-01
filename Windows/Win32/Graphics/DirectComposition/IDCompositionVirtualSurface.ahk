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
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvirtualsurface-resize
     */
    Resize(width, height) {
        result := ComCall(8, this, "uint", width, "uint", height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} rectangles 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvirtualsurface-trim
     */
    Trim(rectangles, count) {
        result := ComCall(9, this, "ptr", rectangles, "uint", count, "HRESULT")
        return result
    }
}
