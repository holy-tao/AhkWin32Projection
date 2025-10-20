#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumFilters interface enumerates the filters in a filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ienumfilters
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IEnumFilters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumFilters
     * @type {Guid}
     */
    static IID => Guid("{56a86893-0ad4-11ce-b03a-0020af0ba770}")

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
     * @param {Pointer<IBaseFilter>} ppFilter 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumfilters-next
     */
    Next(cFilters, ppFilter, pcFetched) {
        result := ComCall(3, this, "uint", cFilters, "ptr*", ppFilter, "uint*", pcFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cFilters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumfilters-skip
     */
    Skip(cFilters) {
        result := ComCall(4, this, "uint", cFilters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumfilters-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFilters>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ienumfilters-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
