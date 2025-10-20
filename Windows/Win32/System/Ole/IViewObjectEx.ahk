#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IViewObject2.ahk

/**
 * An extension derived from IViewObject2 to provide support for Enhanced, flicker-free drawing for non-rectangular objects and transparent objects, hit testing for non-rectangular objects, and Control sizing
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iviewobjectex
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IViewObjectEx extends IViewObject2{
    /**
     * The interface identifier for IViewObjectEx
     * @type {Guid}
     */
    static IID => Guid("{3af24292-0c96-11ce-a0cf-00aa00600ab8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Pointer<RECTL>} pRect 
     * @returns {HRESULT} 
     */
    GetRect(dwAspect, pRect) {
        result := ComCall(10, this, "uint", dwAspect, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetViewStatus(pdwStatus) {
        result := ComCall(11, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Pointer<RECT>} pRectBounds 
     * @param {POINT} ptlLoc 
     * @param {Integer} lCloseHint 
     * @param {Pointer<UInt32>} pHitResult 
     * @returns {HRESULT} 
     */
    QueryHitPoint(dwAspect, pRectBounds, ptlLoc, lCloseHint, pHitResult) {
        result := ComCall(12, this, "uint", dwAspect, "ptr", pRectBounds, "ptr", ptlLoc, "int", lCloseHint, "uint*", pHitResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Pointer<RECT>} pRectBounds 
     * @param {Pointer<RECT>} pRectLoc 
     * @param {Integer} lCloseHint 
     * @param {Pointer<UInt32>} pHitResult 
     * @returns {HRESULT} 
     */
    QueryHitRect(dwAspect, pRectBounds, pRectLoc, lCloseHint, pHitResult) {
        result := ComCall(13, this, "uint", dwAspect, "ptr", pRectBounds, "ptr", pRectLoc, "int", lCloseHint, "uint*", pHitResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Integer} lindex 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {HDC} hicTargetDev 
     * @param {Pointer<DVEXTENTINFO>} pExtentInfo 
     * @param {Pointer<SIZE>} pSizel 
     * @returns {HRESULT} 
     */
    GetNaturalExtent(dwAspect, lindex, ptd, hicTargetDev, pExtentInfo, pSizel) {
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        result := ComCall(14, this, "uint", dwAspect, "int", lindex, "ptr", ptd, "ptr", hicTargetDev, "ptr", pExtentInfo, "ptr", pSizel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
