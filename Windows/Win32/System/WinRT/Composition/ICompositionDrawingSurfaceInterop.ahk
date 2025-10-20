#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionDrawingSurfaceInterop extends IUnknown{
    /**
     * The interface identifier for ICompositionDrawingSurfaceInterop
     * @type {Guid}
     */
    static IID => Guid("{fd04e6e3-fe0c-4c3c-ab19-a07601a576ee}")

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
     * @param {SIZE} sizePixels 
     * @returns {HRESULT} 
     */
    Resize(sizePixels) {
        result := ComCall(5, this, "ptr", sizePixels, "int")
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
        result := ComCall(6, this, "ptr", scrollRect, "ptr", clipRect, "int", offsetX, "int", offsetY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeDraw() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspendDraw() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
