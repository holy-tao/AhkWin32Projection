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
     * 
     * @param {Pointer<IPin>} pOutputPin 
     * @param {Pointer<IPin>} pInputPin 
     * @param {Pointer<AM_MEDIA_TYPE>} pmtFirstConnection 
     * @param {Pointer<IBaseFilter>} pUsingFilter 
     * @param {HANDLE} hAbortEvent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Reconnect(pOutputPin, pInputPin, pmtFirstConnection, pUsingFilter, hAbortEvent, dwFlags) {
        hAbortEvent := hAbortEvent is Win32Handle ? NumGet(hAbortEvent, "ptr") : hAbortEvent

        result := ComCall(3, this, "ptr", pOutputPin, "ptr", pInputPin, "ptr", pmtFirstConnection, "ptr", pUsingFilter, "ptr", hAbortEvent, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGraphConfigCallback>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @param {Integer} dwFlags 
     * @param {HANDLE} hAbortEvent 
     * @returns {HRESULT} 
     */
    Reconfigure(pCallback, pvContext, dwFlags, hAbortEvent) {
        hAbortEvent := hAbortEvent is Win32Handle ? NumGet(hAbortEvent, "ptr") : hAbortEvent

        result := ComCall(4, this, "ptr", pCallback, "ptr", pvContext, "uint", dwFlags, "ptr", hAbortEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @returns {HRESULT} 
     */
    AddFilterToCache(pFilter) {
        result := ComCall(5, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFilters>} pEnum 
     * @returns {HRESULT} 
     */
    EnumCacheFilter(pEnum) {
        result := ComCall(6, this, "ptr", pEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @returns {HRESULT} 
     */
    RemoveFilterFromCache(pFilter) {
        result := ComCall(7, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} prtStart 
     * @returns {HRESULT} 
     */
    GetStartTime(prtStart) {
        result := ComCall(8, this, "int64*", prtStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} pOutputPin 
     * @param {Pointer<IPinConnection>} pConnection 
     * @param {HANDLE} hEventAbort 
     * @returns {HRESULT} 
     */
    PushThroughData(pOutputPin, pConnection, hEventAbort) {
        hEventAbort := hEventAbort is Win32Handle ? NumGet(hEventAbort, "ptr") : hEventAbort

        result := ComCall(9, this, "ptr", pOutputPin, "ptr", pConnection, "ptr", hEventAbort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetFilterFlags(pFilter, dwFlags) {
        result := ComCall(10, this, "ptr", pFilter, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFilterFlags(pFilter, pdwFlags) {
        result := ComCall(11, this, "ptr", pFilter, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    RemoveFilterEx(pFilter, Flags) {
        result := ComCall(12, this, "ptr", pFilter, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
