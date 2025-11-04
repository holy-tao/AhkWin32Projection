#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IPrivateDispatch extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrivateDispatch
     * @type {Guid}
     */
    static IID => Guid("{86ab4bbe-65f6-11d1-8c13-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ADSIInitializeDispatchManager", "ADSIGetTypeInfoCount", "ADSIGetTypeInfo", "ADSIGetIDsOfNames", "ADSIInvoke"]

    /**
     * 
     * @param {Integer} dwExtensionId 
     * @returns {HRESULT} 
     */
    ADSIInitializeDispatchManager(dwExtensionId) {
        result := ComCall(3, this, "int", dwExtensionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pctinfo 
     * @returns {HRESULT} 
     */
    ADSIGetTypeInfoCount(pctinfo) {
        pctinfoMarshal := pctinfo is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pctinfoMarshal, pctinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} itinfo 
     * @param {Integer} lcid 
     * @param {Pointer<ITypeInfo>} pptinfo 
     * @returns {HRESULT} 
     */
    ADSIGetTypeInfo(itinfo, lcid, pptinfo) {
        result := ComCall(5, this, "uint", itinfo, "uint", lcid, "ptr*", pptinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Integer>>} rgszNames 
     * @param {Integer} cNames 
     * @param {Integer} lcid 
     * @param {Pointer<Integer>} rgdispid 
     * @returns {HRESULT} 
     */
    ADSIGetIDsOfNames(riid, rgszNames, cNames, lcid, rgdispid) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"
        rgdispidMarshal := rgdispid is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", riid, rgszNamesMarshal, rgszNames, "uint", cNames, "uint", lcid, rgdispidMarshal, rgdispid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispidMember 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} lcid 
     * @param {Integer} wFlags 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @param {Pointer<Integer>} puArgErr 
     * @returns {HRESULT} 
     */
    ADSIInvoke(dispidMember, riid, lcid, wFlags, pdispparams, pvarResult, pexcepinfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "int", dispidMember, "ptr", riid, "uint", lcid, "ushort", wFlags, "ptr", pdispparams, "ptr", pvarResult, "ptr", pexcepinfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }
}
