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
     * 
     * @param {Pointer<HRESULT>} pHrCoCreateRetVal 
     * @returns {HRESULT} 
     */
    get_EvalRatObjOK(pHrCoCreateRetVal) {
        result := ComCall(3, this, "ptr", pHrCoCreateRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pEnSystem 
     * @param {Pointer<Int32>} pEnRating 
     * @param {Pointer<Int32>} plbfEnAttr 
     * @returns {HRESULT} 
     */
    GetCurrRating(pEnSystem, pEnRating, plbfEnAttr) {
        result := ComCall(4, this, "int*", pEnSystem, "int*", pEnRating, "int*", plbfEnAttr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} protType 
     * @param {Pointer<Int32>} lpDateTime 
     * @returns {HRESULT} 
     */
    GetCurrLicenseExpDate(protType, lpDateTime) {
        result := ComCall(5, this, "int*", protType, "int*", lpDateTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetLastErrorCode() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fRecState 
     * @returns {HRESULT} 
     */
    SetRecordingOn(fRecState) {
        result := ComCall(7, this, "int", fRecState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
