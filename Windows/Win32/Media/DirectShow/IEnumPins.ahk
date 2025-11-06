#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPins.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates pins on a filter.The IBaseFilter::EnumPins method returns this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ienumpins
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumPins extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPins
     * @type {Guid}
     */
    static IID => Guid("{56a86892-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cPins 
     * @param {Pointer<IPin>} ppPins 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumpins-next
     */
    Next(cPins, ppPins, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cPins, "ptr*", ppPins, pcFetchedMarshal, pcFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cPins 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumpins-skip
     */
    Skip(cPins) {
        result := ComCall(4, this, "uint", cPins, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumpins-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumPins} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumpins-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPins(ppEnum)
    }
}
