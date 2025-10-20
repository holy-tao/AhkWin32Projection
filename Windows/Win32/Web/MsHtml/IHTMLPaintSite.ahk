#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPaintSite extends IUnknown{
    /**
     * The interface identifier for IHTMLPaintSite
     * @type {Guid}
     */
    static IID => Guid("{3050f6a7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidatePainterInfo() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The InvalidateRect function adds a rectangle to the specified window's update region. The update region represents the portion of the window's client area that must be redrawn.
     * @param {Pointer<RECT>} prcInvalid 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-invalidaterect
     */
    InvalidateRect(prcInvalid) {
        result := ComCall(4, this, "ptr", prcInvalid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRGN} rgnInvalid 
     * @returns {HRESULT} 
     */
    InvalidateRegion(rgnInvalid) {
        rgnInvalid := rgnInvalid is Win32Handle ? NumGet(rgnInvalid, "ptr") : rgnInvalid

        result := ComCall(5, this, "ptr", rgnInvalid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<HTML_PAINT_DRAW_INFO>} pDrawInfo 
     * @returns {HRESULT} 
     */
    GetDrawInfo(lFlags, pDrawInfo) {
        result := ComCall(6, this, "int", lFlags, "ptr", pDrawInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} ptGlobal 
     * @param {Pointer<POINT>} pptLocal 
     * @returns {HRESULT} 
     */
    TransformGlobalToLocal(ptGlobal, pptLocal) {
        result := ComCall(7, this, "ptr", ptGlobal, "ptr", pptLocal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} ptLocal 
     * @param {Pointer<POINT>} pptGlobal 
     * @returns {HRESULT} 
     */
    TransformLocalToGlobal(ptLocal, pptGlobal) {
        result := ComCall(8, this, "ptr", ptLocal, "ptr", pptGlobal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCookie 
     * @returns {HRESULT} 
     */
    GetHitTestCookie(plCookie) {
        result := ComCall(9, this, "int*", plCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
