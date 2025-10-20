#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFilterGraph2.ahk

/**
 * The IFilterGraph3 interface extends the IFilterGraph2 interface, which contains methods for building filter graphs.The Filter Graph Manager implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltergraph3
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterGraph3 extends IFilterGraph2{
    /**
     * The interface identifier for IFilterGraph3
     * @type {Guid}
     */
    static IID => Guid("{aaf38154-b80b-422f-91e6-b66467509a07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * 
     * @param {Pointer<IReferenceClock>} pClockForMostOfFilterGraph 
     * @param {Pointer<IReferenceClock>} pClockForFilter 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @returns {HRESULT} 
     */
    SetSyncSourceEx(pClockForMostOfFilterGraph, pClockForFilter, pFilter) {
        result := ComCall(21, this, "ptr", pClockForMostOfFilterGraph, "ptr", pClockForFilter, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
