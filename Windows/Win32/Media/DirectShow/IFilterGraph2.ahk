#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBaseFilter.ahk
#Include .\IGraphBuilder.ahk

/**
 * The IFilterGraph2 interface extends the IFilterGraph and IGraphBuilder interfaces, which contain methods for building filter graphs.The Filter Graph Manager implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltergraph2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterGraph2 extends IGraphBuilder{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterGraph2
     * @type {Guid}
     */
    static IID => Guid("{36b73882-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddSourceFilterForMoniker", "ReconnectEx", "RenderEx"]

    /**
     * 
     * @param {IMoniker} pMoniker 
     * @param {IBindCtx} pCtx 
     * @param {PWSTR} lpcwstrFilterName 
     * @returns {IBaseFilter} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph2-addsourcefilterformoniker
     */
    AddSourceFilterForMoniker(pMoniker, pCtx, lpcwstrFilterName) {
        lpcwstrFilterName := lpcwstrFilterName is String ? StrPtr(lpcwstrFilterName) : lpcwstrFilterName

        result := ComCall(18, this, "ptr", pMoniker, "ptr", pCtx, "ptr", lpcwstrFilterName, "ptr*", &ppFilter := 0, "HRESULT")
        return IBaseFilter(ppFilter)
    }

    /**
     * 
     * @param {IPin} ppin 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph2-reconnectex
     */
    ReconnectEx(ppin, pmt) {
        result := ComCall(19, this, "ptr", ppin, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPin} pPinOut 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltergraph2-renderex
     */
    RenderEx(pPinOut, dwFlags) {
        static pvContext := 0 ;Reserved parameters must always be NULL

        result := ComCall(20, this, "ptr", pPinOut, "uint", dwFlags, "uint*", pvContext, "HRESULT")
        return result
    }
}
