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

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TxSendMessage", "TxDraw", "TxGetHScroll", "TxGetVScroll", "OnTxSetCursor", "TxQueryHitPoint", "OnTxInPlaceActivate", "OnTxInPlaceDeactivate", "OnTxUIActivate", "OnTxUIDeactivate", "TxGetText", "TxSetText", "TxGetCurTargetX", "TxGetBaseLinePos", "TxGetNaturalSize", "TxGetDropTarget", "OnTxPropertyBitsChange", "TxGetCachedSize"]

    /**
     * 
     * @param {Integer} msg 
     * @param {WPARAM} wparam 
     * @param {LPARAM} lparam 
     * @param {Pointer<LRESULT>} plresult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txsendmessage
     */
    TxSendMessage(msg, wparam, lparam, plresult) {
        result := ComCall(3, this, "uint", msg, "ptr", wparam, "ptr", lparam, "ptr", plresult, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txdraw
     */
    TxDraw(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcBounds, lprcWBounds, lprcUpdate, pfnContinue, dwContinue, lViewId) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcBounds, "ptr", lprcWBounds, "ptr", lprcUpdate, "ptr", pfnContinue, "uint", dwContinue, "int", lViewId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMin 
     * @param {Pointer<Integer>} plMax 
     * @param {Pointer<Integer>} plPos 
     * @param {Pointer<Integer>} plPage 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txgethscroll
     */
    TxGetHScroll(plMin, plMax, plPos, plPage, pfEnabled) {
        plMinMarshal := plMin is VarRef ? "int*" : "ptr"
        plMaxMarshal := plMax is VarRef ? "int*" : "ptr"
        plPosMarshal := plPos is VarRef ? "int*" : "ptr"
        plPageMarshal := plPage is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, plMinMarshal, plMin, plMaxMarshal, plMax, plPosMarshal, plPos, plPageMarshal, plPage, "ptr", pfEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMin 
     * @param {Pointer<Integer>} plMax 
     * @param {Pointer<Integer>} plPos 
     * @param {Pointer<Integer>} plPage 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txgetvscroll
     */
    TxGetVScroll(plMin, plMax, plPos, plPage, pfEnabled) {
        plMinMarshal := plMin is VarRef ? "int*" : "ptr"
        plMaxMarshal := plMax is VarRef ? "int*" : "ptr"
        plPosMarshal := plPos is VarRef ? "int*" : "ptr"
        plPageMarshal := plPage is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, plMinMarshal, plMin, plMaxMarshal, plMax, plPosMarshal, plPos, plPageMarshal, plPage, "ptr", pfEnabled, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-ontxsetcursor
     */
    OnTxSetCursor(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcClient, "int", x, "int", y, "HRESULT")
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
     * @param {Pointer<Integer>} pHitResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txqueryhitpoint
     */
    TxQueryHitPoint(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y, pHitResult) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"
        pHitResultMarshal := pHitResult is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", lprcClient, "int", x, "int", y, pHitResultMarshal, pHitResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcClient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-ontxinplaceactivate
     */
    OnTxInPlaceActivate(prcClient) {
        result := ComCall(9, this, "ptr", prcClient, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-ontxinplacedeactivate
     */
    OnTxInPlaceDeactivate() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-ontxuiactivate
     */
    OnTxUIActivate() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-ontxuideactivate
     */
    OnTxUIDeactivate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txgettext
     */
    TxGetText(pbstrText) {
        result := ComCall(13, this, "ptr", pbstrText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txsettext
     */
    TxSetText(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(14, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txgetcurtargetx
     */
    TxGetCurTargetX(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txgetbaselinepos
     */
    TxGetBaseLinePos(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, param0Marshal, param0, "HRESULT")
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
     * @param {Pointer<Integer>} pwidth 
     * @param {Pointer<Integer>} pheight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txgetnaturalsize
     */
    TxGetNaturalSize(dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pwidthMarshal := pwidth is VarRef ? "int*" : "ptr"
        pheightMarshal := pheight is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, "uint", dwAspect, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", ptd, "uint", dwMode, "ptr", psizelExtent, pwidthMarshal, pwidth, pheightMarshal, pheight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDropTarget>} ppDropTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txgetdroptarget
     */
    TxGetDropTarget(ppDropTarget) {
        result := ComCall(18, this, "ptr*", ppDropTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @param {Integer} dwBits 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-ontxpropertybitschange
     */
    OnTxPropertyBitsChange(dwMask, dwBits) {
        result := ComCall(19, this, "uint", dwMask, "uint", dwBits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwWidth 
     * @param {Pointer<Integer>} pdwHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices-txgetcachedsize
     */
    TxGetCachedSize(pdwWidth, pdwHeight) {
        pdwWidthMarshal := pdwWidth is VarRef ? "uint*" : "ptr"
        pdwHeightMarshal := pdwHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pdwWidthMarshal, pdwWidth, pdwHeightMarshal, pdwHeight, "HRESULT")
        return result
    }
}
