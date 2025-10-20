#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaFilter.ahk

/**
 * The IBaseFilter interface is the primary interface for DirectShow filters.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ibasefilter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBaseFilter extends IMediaFilter{
    /**
     * The interface identifier for IBaseFilter
     * @type {Guid}
     */
    static IID => Guid("{56a86895-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<IEnumPins>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumPins(ppEnum) {
        result := ComCall(10, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Id 
     * @param {Pointer<IPin>} ppPin 
     * @returns {HRESULT} 
     */
    FindPin(Id, ppPin) {
        Id := Id is String ? StrPtr(Id) : Id

        result := ComCall(11, this, "ptr", Id, "ptr", ppPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILTER_INFO>} pInfo 
     * @returns {HRESULT} 
     */
    QueryFilterInfo(pInfo) {
        result := ComCall(12, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFilterGraph>} pGraph 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    JoinFilterGraph(pGraph, pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(13, this, "ptr", pGraph, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVendorInfo 
     * @returns {HRESULT} 
     */
    QueryVendorInfo(pVendorInfo) {
        result := ComCall(14, this, "ptr", pVendorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
