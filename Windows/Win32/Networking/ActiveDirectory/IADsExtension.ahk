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
     * 
     * @param {Integer} dwCode 
     * @param {VARIANT} varData1 
     * @param {VARIANT} varData2 
     * @param {VARIANT} varData3 
     * @returns {HRESULT} 
     */
    Operate(dwCode, varData1, varData2, varData3) {
        result := ComCall(3, this, "uint", dwCode, "ptr", varData1, "ptr", varData2, "ptr", varData3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<UInt16>} rgszNames 
     * @param {Integer} cNames 
     * @param {Integer} lcid 
     * @param {Pointer<Int32>} rgDispid 
     * @returns {HRESULT} 
     */
    PrivateGetIDsOfNames(riid, rgszNames, cNames, lcid, rgDispid) {
        result := ComCall(4, this, "ptr", riid, "ushort*", rgszNames, "uint", cNames, "uint", lcid, "int*", rgDispid, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<UInt32>} puArgErr 
     * @returns {HRESULT} 
     */
    PrivateInvoke(dispidMember, riid, lcid, wFlags, pdispparams, pvarResult, pexcepinfo, puArgErr) {
        result := ComCall(5, this, "int", dispidMember, "ptr", riid, "uint", lcid, "ushort", wFlags, "ptr", pdispparams, "ptr", pvarResult, "ptr", pexcepinfo, "uint*", puArgErr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
