#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IEvalRat interface is used to evaluate content ratings carried by a broadcast stream.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEvalRat)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tvratings/nn-tvratings-ievalrat
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEvalRat extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEvalRat
     * @type {Guid}
     */
    static IID => Guid("{c5c5c5b1-3abc-11d6-b25b-00c04fa0c026}")

    /**
     * The class identifier for EvalRat
     * @type {Guid}
     */
    static CLSID => Guid("{c5c5c5f1-3abc-11d6-b25b-00c04fa0c026}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BlockedRatingAttributes", "put_BlockedRatingAttributes", "get_BlockUnRated", "put_BlockUnRated", "MostRestrictiveRating", "TestRating"]

    /**
     * 
     * @param {Integer} enSystem 
     * @param {Integer} enLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-get_blockedratingattributes
     */
    get_BlockedRatingAttributes(enSystem, enLevel) {
        result := ComCall(7, this, "int", enSystem, "int", enLevel, "int*", &plbfAttrs := 0, "HRESULT")
        return plbfAttrs
    }

    /**
     * 
     * @param {Integer} enSystem 
     * @param {Integer} enLevel 
     * @param {Integer} lbfAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-put_blockedratingattributes
     */
    put_BlockedRatingAttributes(enSystem, enLevel, lbfAttrs) {
        result := ComCall(8, this, "int", enSystem, "int", enLevel, "int", lbfAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-get_blockunrated
     */
    get_BlockUnRated() {
        result := ComCall(9, this, "int*", &pfBlockUnRatedShows := 0, "HRESULT")
        return pfBlockUnRatedShows
    }

    /**
     * 
     * @param {BOOL} fBlockUnRatedShows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-put_blockunrated
     */
    put_BlockUnRated(fBlockUnRatedShows) {
        result := ComCall(10, this, "int", fBlockUnRatedShows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSystem1 
     * @param {Integer} enEnLevel1 
     * @param {Integer} lbfEnAttr1 
     * @param {Integer} enSystem2 
     * @param {Integer} enEnLevel2 
     * @param {Integer} lbfEnAttr2 
     * @param {Pointer<Integer>} penSystem 
     * @param {Pointer<Integer>} penEnLevel 
     * @param {Pointer<Integer>} plbfEnAttr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-mostrestrictiverating
     */
    MostRestrictiveRating(enSystem1, enEnLevel1, lbfEnAttr1, enSystem2, enEnLevel2, lbfEnAttr2, penSystem, penEnLevel, plbfEnAttr) {
        penSystemMarshal := penSystem is VarRef ? "int*" : "ptr"
        penEnLevelMarshal := penEnLevel is VarRef ? "int*" : "ptr"
        plbfEnAttrMarshal := plbfEnAttr is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", enSystem1, "int", enEnLevel1, "int", lbfEnAttr1, "int", enSystem2, "int", enEnLevel2, "int", lbfEnAttr2, penSystemMarshal, penSystem, penEnLevelMarshal, penEnLevel, plbfEnAttrMarshal, plbfEnAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enShowSystem 
     * @param {Integer} enShowLevel 
     * @param {Integer} lbfEnShowAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-testrating
     */
    TestRating(enShowSystem, enShowLevel, lbfEnShowAttributes) {
        result := ComCall(12, this, "int", enShowSystem, "int", enShowLevel, "int", lbfEnShowAttributes, "HRESULT")
        return result
    }
}
