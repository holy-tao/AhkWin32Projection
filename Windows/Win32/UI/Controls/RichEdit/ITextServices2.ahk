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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

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
     * @param {Pointer<Int32>} pascent 
     * @returns {HRESULT} 
     */
    TxGetNaturalSize2(dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight, pascent) {
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        result := ComCall(21, this, "uint", dwAspect, "ptr", hdcDraw, "ptr", hicTargetDev, "ptr", ptd, "uint", dwMode, "ptr", psizelExtent, "int*", pwidth, "int*", pheight, "int*", pascent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1RenderTarget>} pRenderTarget 
     * @param {Pointer<RECTL>} lprcBounds 
     * @param {Pointer<RECT>} lprcUpdate 
     * @param {Integer} lViewId 
     * @returns {HRESULT} 
     */
    TxDrawD2D(pRenderTarget, lprcBounds, lprcUpdate, lViewId) {
        result := ComCall(22, this, "ptr", pRenderTarget, "ptr", lprcBounds, "ptr", lprcUpdate, "int", lViewId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
