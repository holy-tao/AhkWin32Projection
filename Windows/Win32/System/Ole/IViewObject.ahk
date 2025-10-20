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
     */
    Draw(dwDrawAspect, lindex, pvAspect, ptd, hdcTargetDev, hdcDraw, lprcBounds, lprcWBounds, pfnContinue, dwContinue) {
        hdcTargetDev := hdcTargetDev is Win32Handle ? NumGet(hdcTargetDev, "ptr") : hdcTargetDev
        hdcDraw := hdcDraw is Win32Handle ? NumGet(hdcDraw, "ptr") : hdcDraw

        result := ComCall(3, this, "uint", dwDrawAspect, "int", lindex, "ptr", pvAspect, "ptr", ptd, "ptr", hdcTargetDev, "ptr", hdcDraw, "ptr", lprcBounds, "ptr", lprcWBounds, "ptr", pfnContinue, "ptr", dwContinue, "int")
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
     * @param {HDC} hicTargetDev 
     * @param {Pointer<LOGPALETTE>} ppColorSet 
     * @returns {HRESULT} 
     */
    GetColorSet(dwDrawAspect, lindex, pvAspect, ptd, hicTargetDev, ppColorSet) {
        hicTargetDev := hicTargetDev is Win32Handle ? NumGet(hicTargetDev, "ptr") : hicTargetDev

        result := ComCall(4, this, "uint", dwDrawAspect, "int", lindex, "ptr", pvAspect, "ptr", ptd, "ptr", hicTargetDev, "ptr", ppColorSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDrawAspect 
     * @param {Integer} lindex 
     * @param {Pointer<Void>} pvAspect 
     * @param {Pointer<UInt32>} pdwFreeze 
     * @returns {HRESULT} 
     */
    Freeze(dwDrawAspect, lindex, pvAspect, pdwFreeze) {
        result := ComCall(5, this, "uint", dwDrawAspect, "int", lindex, "ptr", pvAspect, "uint*", pdwFreeze, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFreeze 
     * @returns {HRESULT} 
     */
    Unfreeze(dwFreeze) {
        result := ComCall(6, this, "uint", dwFreeze, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} aspects 
     * @param {Integer} advf 
     * @param {Pointer<IAdviseSink>} pAdvSink 
     * @returns {HRESULT} 
     */
    SetAdvise(aspects, advf, pAdvSink) {
        result := ComCall(7, this, "uint", aspects, "uint", advf, "ptr", pAdvSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pAspects 
     * @param {Pointer<UInt32>} pAdvf 
     * @param {Pointer<IAdviseSink>} ppAdvSink 
     * @returns {HRESULT} 
     */
    GetAdvise(pAspects, pAdvf, ppAdvSink) {
        result := ComCall(8, this, "uint*", pAspects, "uint*", pAdvf, "ptr", ppAdvSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
