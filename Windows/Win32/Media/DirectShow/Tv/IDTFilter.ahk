#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDTFilter interface is exposed by the Decrypter/Detagger filter. Applications can use this interface to set the ratings permissions.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilter)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-idtfilter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDTFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDTFilter
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4b2-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The class identifier for DTFilter
     * @type {Guid}
     */
    static CLSID => Guid("{c4c4c4f2-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EvalRatObjOK", "GetCurrRating", "get_BlockedRatingAttributes", "put_BlockedRatingAttributes", "get_BlockUnRated", "put_BlockUnRated", "get_BlockUnRatedDelay", "put_BlockUnRatedDelay"]

    /**
     * 
     * @param {Pointer<HRESULT>} pHrCoCreateRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-get_evalratobjok
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
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-getcurrrating
     */
    GetCurrRating(pEnSystem, pEnRating, plbfEnAttr) {
        result := ComCall(4, this, "int*", pEnSystem, "int*", pEnRating, "int*", plbfEnAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSystem 
     * @param {Integer} enLevel 
     * @param {Pointer<Integer>} plbfEnAttr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-get_blockedratingattributes
     */
    get_BlockedRatingAttributes(enSystem, enLevel, plbfEnAttr) {
        result := ComCall(5, this, "int", enSystem, "int", enLevel, "int*", plbfEnAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSystem 
     * @param {Integer} enLevel 
     * @param {Integer} lbfAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-put_blockedratingattributes
     */
    put_BlockedRatingAttributes(enSystem, enLevel, lbfAttrs) {
        result := ComCall(6, this, "int", enSystem, "int", enLevel, "int", lbfAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfBlockUnRatedShows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-get_blockunrated
     */
    get_BlockUnRated(pfBlockUnRatedShows) {
        result := ComCall(7, this, "ptr", pfBlockUnRatedShows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fBlockUnRatedShows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-put_blockunrated
     */
    put_BlockUnRated(fBlockUnRatedShows) {
        result := ComCall(8, this, "int", fBlockUnRatedShows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmsecsDelayBeforeBlock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-get_blockunrateddelay
     */
    get_BlockUnRatedDelay(pmsecsDelayBeforeBlock) {
        result := ComCall(9, this, "int*", pmsecsDelayBeforeBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msecsDelayBeforeBlock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-put_blockunrateddelay
     */
    put_BlockUnRatedDelay(msecsDelayBeforeBlock) {
        result := ComCall(10, this, "int", msecsDelayBeforeBlock, "HRESULT")
        return result
    }
}
