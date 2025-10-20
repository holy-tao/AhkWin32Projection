#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IPrivateDispatch extends IUnknown{
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
     * 
     * @param {Integer} dwExtensionId 
     * @returns {HRESULT} 
     */
    ADSIInitializeDispatchManager(dwExtensionId) {
        result := ComCall(3, this, "int", dwExtensionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pctinfo 
     * @returns {HRESULT} 
     */
    ADSIGetTypeInfoCount(pctinfo) {
        result := ComCall(4, this, "uint*", pctinfo, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(5, this, "uint", itinfo, "uint", lcid, "ptr", pptinfo, "int")
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
     * @param {Pointer<Int32>} rgdispid 
     * @returns {HRESULT} 
     */
    ADSIGetIDsOfNames(riid, rgszNames, cNames, lcid, rgdispid) {
        result := ComCall(6, this, "ptr", riid, "ushort*", rgszNames, "uint", cNames, "uint", lcid, "int*", rgdispid, "int")
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
    ADSIInvoke(dispidMember, riid, lcid, wFlags, pdispparams, pvarResult, pexcepinfo, puArgErr) {
        result := ComCall(7, this, "int", dispidMember, "ptr", riid, "uint", lcid, "ushort", wFlags, "ptr", pdispparams, "ptr", pvarResult, "ptr", pexcepinfo, "uint*", puArgErr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
