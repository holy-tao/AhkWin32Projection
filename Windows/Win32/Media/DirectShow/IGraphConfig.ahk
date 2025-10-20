#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The Filter Graph Manager exposes IGraphConfig to support dynamic graph building.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-igraphconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IGraphConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphConfig
     * @type {Guid}
     */
    static IID => Guid("{03a1eb8e-32bf-4245-8502-114d08a9cb88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reconnect", "Reconfigure", "AddFilterToCache", "EnumCacheFilter", "RemoveFilterFromCache", "GetStartTime", "PushThroughData", "SetFilterFlags", "GetFilterFlags", "RemoveFilterEx"]

    /**
     * 
     * @param {IPin} pOutputPin 
     * @param {IPin} pInputPin 
     * @param {Pointer<AM_MEDIA_TYPE>} pmtFirstConnection 
     * @param {IBaseFilter} pUsingFilter 
     * @param {HANDLE} hAbortEvent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-reconnect
     */
    Reconnect(pOutputPin, pInputPin, pmtFirstConnection, pUsingFilter, hAbortEvent, dwFlags) {
        hAbortEvent := hAbortEvent is Win32Handle ? NumGet(hAbortEvent, "ptr") : hAbortEvent

        result := ComCall(3, this, "ptr", pOutputPin, "ptr", pInputPin, "ptr", pmtFirstConnection, "ptr", pUsingFilter, "ptr", hAbortEvent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGraphConfigCallback} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @param {Integer} dwFlags 
     * @param {HANDLE} hAbortEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-reconfigure
     */
    Reconfigure(pCallback, pvContext, dwFlags, hAbortEvent) {
        hAbortEvent := hAbortEvent is Win32Handle ? NumGet(hAbortEvent, "ptr") : hAbortEvent

        result := ComCall(4, this, "ptr", pCallback, "ptr", pvContext, "uint", dwFlags, "ptr", hAbortEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBaseFilter} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-addfiltertocache
     */
    AddFilterToCache(pFilter) {
        result := ComCall(5, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFilters>} pEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-enumcachefilter
     */
    EnumCacheFilter(pEnum) {
        result := ComCall(6, this, "ptr*", pEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBaseFilter} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-removefilterfromcache
     */
    RemoveFilterFromCache(pFilter) {
        result := ComCall(7, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prtStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-getstarttime
     */
    GetStartTime(prtStart) {
        result := ComCall(8, this, "int64*", prtStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPin} pOutputPin 
     * @param {IPinConnection} pConnection 
     * @param {HANDLE} hEventAbort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-pushthroughdata
     */
    PushThroughData(pOutputPin, pConnection, hEventAbort) {
        hEventAbort := hEventAbort is Win32Handle ? NumGet(hEventAbort, "ptr") : hEventAbort

        result := ComCall(9, this, "ptr", pOutputPin, "ptr", pConnection, "ptr", hEventAbort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBaseFilter} pFilter 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-setfilterflags
     */
    SetFilterFlags(pFilter, dwFlags) {
        result := ComCall(10, this, "ptr", pFilter, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBaseFilter} pFilter 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-getfilterflags
     */
    GetFilterFlags(pFilter, pdwFlags) {
        result := ComCall(11, this, "ptr", pFilter, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBaseFilter} pFilter 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphconfig-removefilterex
     */
    RemoveFilterEx(pFilter, Flags) {
        result := ComCall(12, this, "ptr", pFilter, "uint", Flags, "HRESULT")
        return result
    }
}
