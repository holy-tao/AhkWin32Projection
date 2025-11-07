#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables an object to display itself directly without passing a data object to the caller. In addition, this interface can create and manage a connection with an advise sink so the caller can be notified of changes in the view object.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iviewobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IViewObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObject
     * @type {Guid}
     */
    static IID => Guid("{0000010d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Draw", "GetColorSet", "Freeze", "Unfreeze", "SetAdvise", "GetAdvise"]

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Integer} lindex 
     * @param {Pointer<Void>} pvAspect 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {HDC} hdcTargetDev 
     * @param {HDC} hdcDraw 
     * @param {Pointer<RECTL>} lprcBounds 
     * @param {Pointer<RECTL>} lprcWBounds 
     * @param {Pointer} pfnContinue 
     * @param {Pointer} dwContinue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-draw
     */
    Draw(dwDrawAspect, lindex, pvAspect, ptd, hdcTargetDev, hdcDraw, lprcBounds, lprcWBounds, pfnContinue, dwContinue) {
        hdcTargetDev := hdcTargetDev is Win32Handle ? NumGet(hdcTargetDev, "ptr") : hdcTargetDev
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hdcTargetDev, "ptr", hdcDraw, "ptr", lprcBounds, "ptr", lprcWBounds, "ptr", pfnContinue, "ptr", dwContinue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Integer} lindex 
     * @param {Pointer<Void>} pvAspect 
     * @param {Pointer<DVTARGETDEVICE>} ptd 
     * @param {HDC} hicTargetDev 
     * @returns {Pointer<LOGPALETTE>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-getcolorset
     */
    GetColorSet(dwDrawAspect, lindex, pvAspect, ptd, hicTargetDev) {
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "ptr", ptd, "ptr", hicTargetDev, "ptr*", &ppColorSet := 0, "HRESULT")
        return ppColorSet
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Integer} lindex 
     * @param {Pointer<Void>} pvAspect 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-freeze
     */
    Freeze(dwDrawAspect, lindex, pvAspect) {
        pvAspectMarshal := pvAspect is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "uint", dwDrawAspect, "int", lindex, pvAspectMarshal, pvAspect, "uint*", &pdwFreeze := 0, "HRESULT")
        return pdwFreeze
    }

    /**
     * 
     * @param {Integer} dwFreeze 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-unfreeze
     */
    Unfreeze(dwFreeze) {
        result := ComCall(6, this, "uint", dwFreeze, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} aspects 
     * @param {Integer} advf 
     * @param {IAdviseSink} pAdvSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-setadvise
     */
    SetAdvise(aspects, advf, pAdvSink) {
        result := ComCall(7, this, "uint", aspects, "uint", advf, "ptr", pAdvSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAspects 
     * @param {Pointer<Integer>} pAdvf 
     * @param {Pointer<IAdviseSink>} ppAdvSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iviewobject-getadvise
     */
    GetAdvise(pAspects, pAdvf, ppAdvSink) {
        pAspectsMarshal := pAspects is VarRef ? "uint*" : "ptr"
        pAdvfMarshal := pAdvf is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pAspectsMarshal, pAspects, pAdvfMarshal, pAdvf, "ptr*", ppAdvSink, "HRESULT")
        return result
    }
}
