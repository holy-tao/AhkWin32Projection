#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IEncodingFilterFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEncodingFilterFactory
     * @type {Guid}
     */
    static IID => Guid("{70bdde00-c18e-11d0-a9ce-006097942311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindBestFilter", "GetDefaultFilter"]

    /**
     * 
     * @param {PWSTR} pwzCodeIn 
     * @param {PWSTR} pwzCodeOut 
     * @param {DATAINFO} info 
     * @param {Pointer<IDataFilter>} ppDF 
     * @returns {HRESULT} 
     */
    FindBestFilter(pwzCodeIn, pwzCodeOut, info, ppDF) {
        pwzCodeIn := pwzCodeIn is String ? StrPtr(pwzCodeIn) : pwzCodeIn
        pwzCodeOut := pwzCodeOut is String ? StrPtr(pwzCodeOut) : pwzCodeOut

        result := ComCall(3, this, "ptr", pwzCodeIn, "ptr", pwzCodeOut, "ptr", info, "ptr*", ppDF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzCodeIn 
     * @param {PWSTR} pwzCodeOut 
     * @param {Pointer<IDataFilter>} ppDF 
     * @returns {HRESULT} 
     */
    GetDefaultFilter(pwzCodeIn, pwzCodeOut, ppDF) {
        pwzCodeIn := pwzCodeIn is String ? StrPtr(pwzCodeIn) : pwzCodeIn
        pwzCodeOut := pwzCodeOut is String ? StrPtr(pwzCodeOut) : pwzCodeOut

        result := ComCall(4, this, "ptr", pwzCodeIn, "ptr", pwzCodeOut, "ptr*", ppDF, "HRESULT")
        return result
    }
}
