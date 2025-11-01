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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanInPlaceActivate", "OnInPlaceActivate", "OnUIActivate", "GetWindowContext", "Scroll", "OnUIDeactivate", "OnInPlaceDeactivate", "DiscardUndoState", "DeactivateAndUndo", "OnPosRectChange"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-caninplaceactivate
     */
    CanInPlaceActivate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-oninplaceactivate
     */
    OnInPlaceActivate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-onuiactivate
     */
    OnUIActivate() {
        result := ComCall(7, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-getwindowcontext
     */
    GetWindowContext(ppFrame, ppDoc, lprcPosRect, lprcClipRect, lpFrameInfo) {
        result := ComCall(8, this, "ptr*", ppFrame, "ptr*", ppDoc, "ptr", lprcPosRect, "ptr", lprcClipRect, "ptr", lpFrameInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SIZE} scrollExtant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-scroll
     */
    Scroll(scrollExtant) {
        result := ComCall(9, this, "ptr", scrollExtant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fUndoable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-onuideactivate
     */
    OnUIDeactivate(fUndoable) {
        result := ComCall(10, this, "int", fUndoable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-oninplacedeactivate
     */
    OnInPlaceDeactivate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-discardundostate
     */
    DiscardUndoState() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-deactivateandundo
     */
    DeactivateAndUndo() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lprcPosRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-onposrectchange
     */
    OnPosRectChange(lprcPosRect) {
        result := ComCall(14, this, "ptr", lprcPosRect, "HRESULT")
        return result
    }
}
