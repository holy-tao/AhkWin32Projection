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
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} 
     */
    Resize(width, height) {
        result := ComCall(8, this, "uint", width, "uint", height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} rectangles 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    Trim(rectangles, count) {
        result := ComCall(9, this, "ptr", rectangles, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
