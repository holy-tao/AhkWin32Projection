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
     * 
     * @param {Integer} enSystem 
     * @param {Integer} enLevel 
     * @param {Pointer<Int32>} plbfAttrs 
     * @returns {HRESULT} 
     */
    get_BlockedRatingAttributes(enSystem, enLevel, plbfAttrs) {
        result := ComCall(7, this, "int", enSystem, "int", enLevel, "int*", plbfAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enSystem 
     * @param {Integer} enLevel 
     * @param {Integer} lbfAttrs 
     * @returns {HRESULT} 
     */
    put_BlockedRatingAttributes(enSystem, enLevel, lbfAttrs) {
        result := ComCall(8, this, "int", enSystem, "int", enLevel, "int", lbfAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfBlockUnRatedShows 
     * @returns {HRESULT} 
     */
    get_BlockUnRated(pfBlockUnRatedShows) {
        result := ComCall(9, this, "ptr", pfBlockUnRatedShows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fBlockUnRatedShows 
     * @returns {HRESULT} 
     */
    put_BlockUnRated(fBlockUnRatedShows) {
        result := ComCall(10, this, "int", fBlockUnRatedShows, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<Int32>} penSystem 
     * @param {Pointer<Int32>} penEnLevel 
     * @param {Pointer<Int32>} plbfEnAttr 
     * @returns {HRESULT} 
     */
    MostRestrictiveRating(enSystem1, enEnLevel1, lbfEnAttr1, enSystem2, enEnLevel2, lbfEnAttr2, penSystem, penEnLevel, plbfEnAttr) {
        result := ComCall(11, this, "int", enSystem1, "int", enEnLevel1, "int", lbfEnAttr1, "int", enSystem2, "int", enEnLevel2, "int", lbfEnAttr2, "int*", penSystem, "int*", penEnLevel, "int*", plbfEnAttr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enShowSystem 
     * @param {Integer} enShowLevel 
     * @param {Integer} lbfEnShowAttributes 
     * @returns {HRESULT} 
     */
    TestRating(enShowSystem, enShowLevel, lbfEnShowAttributes) {
        result := ComCall(12, this, "int", enShowSystem, "int", enShowLevel, "int", lbfEnShowAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
