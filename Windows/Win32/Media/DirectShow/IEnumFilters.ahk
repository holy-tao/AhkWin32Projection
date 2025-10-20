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
     * 
     * @param {Integer} cFilters 
     * @param {Pointer<IBaseFilter>} ppFilter 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cFilters, ppFilter, pcFetched) {
        result := ComCall(3, this, "uint", cFilters, "ptr", ppFilter, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cFilters 
     * @returns {HRESULT} 
     */
    Skip(cFilters) {
        result := ComCall(4, this, "uint", cFilters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFilters>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
