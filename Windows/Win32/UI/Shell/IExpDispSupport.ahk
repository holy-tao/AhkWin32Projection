#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deprecated. Exposes methods that allow the retrieval of properties, translation of keyboard accelerators, and determination of a connection point for certain events.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  <b>IExpDispSupport</b> might not be supported in versions of Windows later than Windows XP.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-iexpdispsupport
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExpDispSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExpDispSupport
     * @type {Guid}
     */
    static IID => Guid("{0d7d1d00-6fc0-11d0-a974-00c04fd705a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindConnectionPoint", "OnTranslateAccelerator", "OnInvoke"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IConnectionPoint>} ppccp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-iexpdispsupport-findconnectionpoint
     */
    FindConnectionPoint(riid, ppccp) {
        result := ComCall(3, this, "ptr", riid, "ptr*", ppccp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @param {Integer} grfModifiers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-iexpdispsupport-ontranslateaccelerator
     */
    OnTranslateAccelerator(pMsg, grfModifiers) {
        result := ComCall(4, this, "ptr", pMsg, "uint", grfModifiers, "HRESULT")
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
     * @param {Pointer<Integer>} puArgErr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-iexpdispsupport-oninvoke
     */
    OnInvoke(dispidMember, iid, lcid, wFlags, pdispparams, pVarResult, pexcepinfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", dispidMember, "ptr", iid, "uint", lcid, "ushort", wFlags, "ptr", pdispparams, "ptr", pVarResult, "ptr", pexcepinfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }
}
