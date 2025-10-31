#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IETFilter interface is exposed by the Encrypter/Tagger filter. Most applications will not have to use this interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IETFilter)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-ietfilter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IETFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IETFilter
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4b1-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The class identifier for ETFilter
     * @type {Guid}
     */
    static CLSID => Guid("{c4c4c4f1-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EvalRatObjOK", "GetCurrRating", "GetCurrLicenseExpDate", "GetLastErrorCode", "SetRecordingOn"]

    /**
     * 
     * @param {Pointer<HRESULT>} pHrCoCreateRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-get_evalratobjok
     */
    get_EvalRatObjOK(pHrCoCreateRetVal) {
        result := ComCall(3, this, "ptr", pHrCoCreateRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pEnSystem 
     * @param {Pointer<Integer>} pEnRating 
     * @param {Pointer<Integer>} plbfEnAttr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-getcurrrating
     */
    GetCurrRating(pEnSystem, pEnRating, plbfEnAttr) {
        result := ComCall(4, this, "int*", pEnSystem, "int*", pEnRating, "int*", plbfEnAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} protType 
     * @param {Pointer<Integer>} lpDateTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-getcurrlicenseexpdate
     */
    GetCurrLicenseExpDate(protType, lpDateTime) {
        result := ComCall(5, this, "int*", protType, "int*", lpDateTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-getlasterrorcode
     */
    GetLastErrorCode() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fRecState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-setrecordingon
     */
    SetRecordingOn(fRecState) {
        result := ComCall(7, this, "int", fRecState, "HRESULT")
        return result
    }
}
