#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IADsExtension interface forms the basis of the ADSI application extension model.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsextension
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsExtension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsExtension
     * @type {Guid}
     */
    static IID => Guid("{3d35553c-d2b0-11d1-b17b-0000f87593a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Operate", "PrivateGetIDsOfNames", "PrivateInvoke"]

    /**
     * 
     * @param {Integer} dwCode 
     * @param {VARIANT} varData1 
     * @param {VARIANT} varData2 
     * @param {VARIANT} varData3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsextension-operate
     */
    Operate(dwCode, varData1, varData2, varData3) {
        result := ComCall(3, this, "uint", dwCode, "ptr", varData1, "ptr", varData2, "ptr", varData3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Integer>>} rgszNames 
     * @param {Integer} cNames 
     * @param {Integer} lcid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsextension-privategetidsofnames
     */
    PrivateGetIDsOfNames(riid, rgszNames, cNames, lcid) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", riid, rgszNamesMarshal, rgszNames, "uint", cNames, "uint", lcid, "int*", &rgDispid := 0, "HRESULT")
        return rgDispid
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
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsextension-privateinvoke
     */
    PrivateInvoke(dispidMember, riid, lcid, wFlags, pdispparams, pvarResult, pexcepinfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", dispidMember, "ptr", riid, "uint", lcid, "ushort", wFlags, "ptr", pdispparams, "ptr", pvarResult, "ptr", pexcepinfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }
}
