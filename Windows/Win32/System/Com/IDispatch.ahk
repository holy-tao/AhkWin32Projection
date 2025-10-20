#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Exposes objects, methods and properties to programming tools and other applications that support Automation.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-idispatch
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IDispatch extends IUnknown{
    /**
     * The interface identifier for IDispatch
     * @type {Guid}
     */
    static IID => Guid("{00020400-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pctinfo 
     * @returns {HRESULT} 
     */
    GetTypeInfoCount(pctinfo) {
        result := ComCall(3, this, "uint*", pctinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iTInfo 
     * @param {Integer} lcid 
     * @param {Pointer<ITypeInfo>} ppTInfo 
     * @returns {HRESULT} 
     */
    GetTypeInfo(iTInfo, lcid, ppTInfo) {
        result := ComCall(4, this, "uint", iTInfo, "uint", lcid, "ptr", ppTInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<PWSTR>} rgszNames 
     * @param {Integer} cNames 
     * @param {Integer} lcid 
     * @param {Pointer<Int32>} rgDispId 
     * @returns {HRESULT} 
     */
    GetIDsOfNames(riid, rgszNames, cNames, lcid, rgDispId) {
        result := ComCall(5, this, "ptr", riid, "ptr", rgszNames, "uint", cNames, "uint", lcid, "int*", rgDispId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dispIdMember 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} lcid 
     * @param {Integer} wFlags 
     * @param {Pointer<DISPPARAMS>} pDispParams 
     * @param {Pointer<VARIANT>} pVarResult 
     * @param {Pointer<EXCEPINFO>} pExcepInfo 
     * @param {Pointer<UInt32>} puArgErr 
     * @returns {HRESULT} 
     */
    Invoke(dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr) {
        result := ComCall(6, this, "int", dispIdMember, "ptr", riid, "uint", lcid, "ushort", wFlags, "ptr", pDispParams, "ptr", pVarResult, "ptr", pExcepInfo, "uint*", puArgErr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
