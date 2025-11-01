#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextServices.ahk

/**
 * The ITextServices2 interface extends the ITextServices interface.
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nl-textserv-itextservices2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextServices2 extends ITextServices{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TxGetNaturalSize2", "TxDrawD2D"]

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
     * @param {Pointer<Integer>} pascent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices2-txgetnaturalsize2
     */
    TxGetNaturalSize2(dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight, pascent) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pwidthMarshal := pwidth is VarRef ? "int*" : "ptr"
        pheightMarshal := pheight is VarRef ? "int*" : "ptr"
        pascentMarshal := pascent is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, "uint", dwAspect, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", ptd, "uint", dwMode, "ptr", psizelExtent, pwidthMarshal, pwidth, pheightMarshal, pheight, pascentMarshal, pascent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1RenderTarget} pRenderTarget 
     * @param {Pointer<RECTL>} lprcBounds 
     * @param {Pointer<RECT>} lprcUpdate 
     * @param {Integer} lViewId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-itextservices2-txdrawd2d
     */
    TxDrawD2D(pRenderTarget, lprcBounds, lprcUpdate, lViewId) {
        result := ComCall(22, this, "ptr", pRenderTarget, "ptr", lprcBounds, "ptr", lprcUpdate, "int", lViewId, "HRESULT")
        return result
    }
}
