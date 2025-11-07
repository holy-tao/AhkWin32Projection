#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\IViewObject2.ahk

/**
 * An extension derived from IViewObject2 to provide support for Enhanced, flicker-free drawing for non-rectangular objects and transparent objects, hit testing for non-rectangular objects, and Control sizing
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iviewobjectex
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IViewObjectEx extends IViewObject2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRect", "GetViewStatus", "QueryHitPoint", "QueryHitRect", "GetNaturalExtent"]

    /**
     * 
     * @param {Integer} dwAspect 
     * @returns {RECTL} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-getrect
     */
    GetRect(dwAspect) {
        pRect := RECTL()
        result := ComCall(10, this, "uint", dwAspect, "ptr", pRect, "HRESULT")
        return pRect
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-getviewstatus
     */
    GetViewStatus() {
        result := ComCall(11, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Pointer<RECT>} pRectBounds 
     * @param {POINT} ptlLoc 
     * @param {Integer} lCloseHint 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-queryhitpoint
     */
    QueryHitPoint(dwAspect, pRectBounds, ptlLoc, lCloseHint) {
        result := ComCall(12, this, "uint", dwAspect, "ptr", pRectBounds, "ptr", ptlLoc, "int", lCloseHint, "uint*", &pHitResult := 0, "HRESULT")
        return pHitResult
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Pointer<RECT>} pRectBounds 
     * @param {Pointer<RECT>} pRectLoc 
     * @param {Integer} lCloseHint 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-queryhitrect
     */
    QueryHitRect(dwAspect, pRectBounds, pRectLoc, lCloseHint) {
        result := ComCall(13, this, "uint", dwAspect, "ptr", pRectBounds, "ptr", pRectLoc, "int", lCloseHint, "uint*", &pHitResult := 0, "HRESULT")
        return pHitResult
    }

    /**
     * 
     * @param {Integer} dwAspect 
     * @param {Integer} lindex 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {HDC} hicTargetDev 
     * @param {Pointer<DVEXTENTINFO>} pExtentInfo 
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iviewobjectex-getnaturalextent
     */
    GetNaturalExtent(dwAspect, lindex, ptd, hicTargetDev, pExtentInfo) {
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pSizel := SIZE()
        result := ComCall(14, this, "uint", dwAspect, "int", lindex, "ptr", ptd, "ptr", hicTargetDev, "ptr", pExtentInfo, "ptr", pSizel, "HRESULT")
        return pSizel
    }
}
