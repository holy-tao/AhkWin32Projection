#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ienumregfilters
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumRegFilters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumRegFilters
     * @type {Guid}
     */
    static IID => Guid("{56a868a4-0ad4-11ce-b03a-0020af0ba770}")

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
     * @param {Integer} cFilters 
     * @param {Pointer<Pointer<REGFILTER>>} apRegFilter 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumregfilters-next
     */
    Next(cFilters, apRegFilter, pcFetched) {
        apRegFilterMarshal := apRegFilter is VarRef ? "ptr*" : "ptr"
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFilters, apRegFilterMarshal, apRegFilter, pcFetchedMarshal, pcFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cFilters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumregfilters-skip
     */
    Skip(cFilters) {
        result := ComCall(4, this, "uint", cFilters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumregfilters-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumRegFilters>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumregfilters-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
