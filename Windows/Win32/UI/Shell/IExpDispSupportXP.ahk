#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deprecated. Exposes methods that allow the retrieval of properties, translation of keyboard accelerators, and determination of a connection point for certain events.
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-iexpdispsupportxp
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExpDispSupportXP extends IUnknown{
    /**
     * The interface identifier for IExpDispSupportXP
     * @type {Guid}
     */
    static IID => Guid("{2f0dd58c-f789-4f14-99fb-9293b3c9c212}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<CIE4ConnectionPoint>} ppccp 
     * @returns {HRESULT} 
     */
    FindCIE4ConnectionPoint(riid, ppccp) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppccp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @param {Integer} grfModifiers 
     * @returns {HRESULT} 
     */
    OnTranslateAccelerator(pMsg, grfModifiers) {
        result := ComCall(4, this, "ptr", pMsg, "uint", grfModifiers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dispidMember 
     * @param {Pointer<Guid>} iid 
     * @param {Integer} lcid 
     * @param {Integer} wFlags 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @param {Pointer<VARIANT>} pVarResult 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @param {Pointer<UInt32>} puArgErr 
     * @returns {HRESULT} 
     */
    OnInvoke(dispidMember, iid, lcid, wFlags, pdispparams, pVarResult, pexcepinfo, puArgErr) {
        result := ComCall(5, this, "int", dispidMember, "ptr", iid, "uint", lcid, "ushort", wFlags, "ptr", pdispparams, "ptr", pVarResult, "ptr", pexcepinfo, "uint*", puArgErr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
