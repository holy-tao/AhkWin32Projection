#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Extends the Text Object Model (TOM) to provide extra functionality for windowless operation.
 * @remarks
 * 
  * In conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nl-textserv-itexthost">ITextHost</a> interface, <b>ITextServices</b> provides the means by which a rich edit control can be used <i>without</i> creating a window.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Applications do not implement the <b>ITextServices</b> interface.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Applications can call the <a href="https://docs.microsoft.com/windows/desktop/api/textserv/nf-textserv-createtextservices">CreateTextServices</a> function to create a text services object. To retrieve an <b>ITextServices</b> pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the private <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer returned by <b>CreateTextServices</b>. You can then call the <b>ITextServices</b> methods to send messages to the text services object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nl-textserv-itextservices
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextServices extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} msg 
     * @param {WPARAM} wparam 
     * @param {LPARAM} lparam 
     * @param {Pointer<LRESULT>} plresult 
     * @returns {HRESULT} 
     */
    TxSendMessage(msg, wparam, lparam, plresult) {
        result := ComCall(3, this, "uint", msg, "ptr", wparam, "ptr", lparam, "ptr", plresult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Integer} lindex 
     * @param {Pointer<Void>} pvAspect 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {HDC} hdcDraw 
     * @param {HDC} hicTargetDev 
     * @param {Pointer<RECTL>} lprcBounds 
     * @param {Pointer<RECTL>} lprcWBounds 
     * @param {Pointer<RECT>} lprcUpdate 
     * @param {Pointer} pfnContinue 
     * @param {Integer} dwContinue 
     * @param {Integer} lViewId 
     * @returns {HRESULT} 
     */
    TxDraw(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcBounds, lprcWBounds, lprcUpdate, pfnContinue, dwContinue, lViewId) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        result := ComCall(4, this, "uint", dwDrawAspect, "int", lindex, "ptr", pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcBounds, "ptr", lprcWBounds, "ptr", lprcUpdate, "ptr", pfnContinue, "uint", dwContinue, "int", lViewId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMin 
     * @param {Pointer<Int32>} plMax 
     * @param {Pointer<Int32>} plPos 
     * @param {Pointer<Int32>} plPage 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    TxGetHScroll(plMin, plMax, plPos, plPage, pfEnabled) {
        result := ComCall(5, this, "int*", plMin, "int*", plMax, "int*", plPos, "int*", plPage, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMin 
     * @param {Pointer<Int32>} plMax 
     * @param {Pointer<Int32>} plPos 
     * @param {Pointer<Int32>} plPage 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    TxGetVScroll(plMin, plMax, plPos, plPage, pfEnabled) {
        result := ComCall(6, this, "int*", plMin, "int*", plMax, "int*", plPos, "int*", plPage, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Integer} lindex 
     * @param {Pointer<Void>} pvAspect 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {HDC} hdcDraw 
     * @param {HDC} hicTargetDev 
     * @param {Pointer<RECT>} lprcClient 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    OnTxSetCursor(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        result := ComCall(7, this, "uint", dwDrawAspect, "int", lindex, "ptr", pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcClient, "int", x, "int", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Integer} lindex 
     * @param {Pointer<Void>} pvAspect 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {HDC} hdcDraw 
     * @param {HDC} hicTargetDev 
     * @param {Pointer<RECT>} lprcClient 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<UInt32>} pHitResult 
     * @returns {HRESULT} 
     */
    TxQueryHitPoint(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y, pHitResult) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        result := ComCall(8, this, "uint", dwDrawAspect, "int", lindex, "ptr", pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcClient, "int", x, "int", y, "uint*", pHitResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcClient 
     * @returns {HRESULT} 
     */
    OnTxInPlaceActivate(prcClient) {
        result := ComCall(9, this, "ptr", prcClient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnTxInPlaceDeactivate() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnTxUIActivate() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnTxUIDeactivate() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     */
    TxGetText(pbstrText) {
        result := ComCall(13, this, "ptr", pbstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    TxSetText(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(14, this, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} param0 
     * @returns {HRESULT} 
     */
    TxGetCurTargetX(param0) {
        result := ComCall(15, this, "int*", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} param0 
     * @returns {HRESULT} 
     */
    TxGetBaseLinePos(param0) {
        result := ComCall(16, this, "int*", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {HDC} hdcDraw 
     * @param {HDC} hicTargetDev 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {Integer} dwMode 
     * @param {Pointer<SIZE>} psizelExtent 
     * @param {Pointer<Int32>} pwidth 
     * @param {Pointer<Int32>} pheight 
     * @returns {HRESULT} 
     */
    TxGetNaturalSize(dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        result := ComCall(17, this, "uint", dwAspect, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", ptd, "uint", dwMode, "ptr", psizelExtent, "int*", pwidth, "int*", pheight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDropTarget>} ppDropTarget 
     * @returns {HRESULT} 
     */
    TxGetDropTarget(ppDropTarget) {
        result := ComCall(18, this, "ptr", ppDropTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @param {Integer} dwBits 
     * @returns {HRESULT} 
     */
    OnTxPropertyBitsChange(dwMask, dwBits) {
        result := ComCall(19, this, "uint", dwMask, "uint", dwBits, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwWidth 
     * @param {Pointer<UInt32>} pdwHeight 
     * @returns {HRESULT} 
     */
    TxGetCachedSize(pdwWidth, pdwHeight) {
        result := ComCall(20, this, "uint*", pdwWidth, "uint*", pdwHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
