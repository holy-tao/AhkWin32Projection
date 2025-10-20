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
     * 
     * @param {Pointer<RECT>} updateRect 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} updateObject 
     * @param {Pointer<POINT>} updateOffset 
     * @returns {HRESULT} 
     */
    BeginDraw(updateRect, iid, updateObject, updateOffset) {
        result := ComCall(3, this, "ptr", updateRect, "ptr", iid, "ptr", updateObject, "ptr", updateOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDraw() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspendDraw() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeDraw() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} scrollRect 
     * @param {Pointer<RECT>} clipRect 
     * @param {Integer} offsetX 
     * @param {Integer} offsetY 
     * @returns {HRESULT} 
     */
    Scroll(scrollRect, clipRect, offsetX, offsetY) {
        result := ComCall(7, this, "ptr", scrollRect, "ptr", clipRect, "int", offsetX, "int", offsetY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
