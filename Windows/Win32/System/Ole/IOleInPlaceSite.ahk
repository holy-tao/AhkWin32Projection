#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleWindow.ahk

/**
 * Manages the interaction between the container and the object's in-place client site. Recall that the client site is the display site for embedded objects, and provides position and conceptual information about the object.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplacesite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceSite extends IOleWindow{
    /**
     * The interface identifier for IOleInPlaceSite
     * @type {Guid}
     */
    static IID => Guid("{00000119-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @returns {HRESULT} 
     */
    CanInPlaceActivate() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnInPlaceActivate() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnUIActivate() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleInPlaceFrame>} ppFrame 
     * @param {Pointer<IOleInPlaceUIWindow>} ppDoc 
     * @param {Pointer<RECT>} lprcPosRect 
     * @param {Pointer<RECT>} lprcClipRect 
     * @param {Pointer<OLEINPLACEFRAMEINFO>} lpFrameInfo 
     * @returns {HRESULT} 
     */
    GetWindowContext(ppFrame, ppDoc, lprcPosRect, lprcClipRect, lpFrameInfo) {
        result := ComCall(8, this, "ptr", ppFrame, "ptr", ppDoc, "ptr", lprcPosRect, "ptr", lprcClipRect, "ptr", lpFrameInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {SIZE} scrollExtant 
     * @returns {HRESULT} 
     */
    Scroll(scrollExtant) {
        result := ComCall(9, this, "ptr", scrollExtant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fUndoable 
     * @returns {HRESULT} 
     */
    OnUIDeactivate(fUndoable) {
        result := ComCall(10, this, "int", fUndoable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnInPlaceDeactivate() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DiscardUndoState() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeactivateAndUndo() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lprcPosRect 
     * @returns {HRESULT} 
     */
    OnPosRectChange(lprcPosRect) {
        result := ComCall(14, this, "ptr", lprcPosRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
