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
     * The AddSourceFilterForMoniker method creates a source filter from an IMoniker pointer and adds the filter to the graph.
     * @param {IMoniker} pMoniker Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface.
     * @param {IBindCtx} pCtx Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> bind context interface.
     * @param {PWSTR} lpcwstrFilterName Name for the filter.
     * @returns {IBaseFilter} Receives a pointer to the source filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph2-addsourcefilterformoniker
     */
    AddSourceFilterForMoniker(pMoniker, pCtx, lpcwstrFilterName) {
        lpcwstrFilterName := lpcwstrFilterName is String ? StrPtr(lpcwstrFilterName) : lpcwstrFilterName

        result := ComCall(18, this, "ptr", pMoniker, "ptr", pCtx, "ptr", lpcwstrFilterName, "ptr*", &ppFilter := 0, "HRESULT")
        return IBaseFilter(ppFilter)
    }

    /**
     * The ReconnectEx method breaks the existing pin connection and reconnects it to the same pin, using a specified media type.
     * @param {IPin} ppin Pointer to the pin to disconnect and reconnect.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to the media type to reconnect with. Specify <b>NULL</b> to use the existing media type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin was not connected. No error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter is not stopped, but it does not support reconnection while in a running state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph2-reconnectex
     */
    ReconnectEx(ppin, pmt) {
        result := ComCall(19, this, "ptr", ppin, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The RenderEx method renders an output pin, with an option to use existing renderers only.
     * @param {IPin} pPinOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the output pin.
     * @param {Integer} dwFlags Flag that specifies how to render the pin. If the value is AM_RENDEREX_RENDERTOEXISTINGRENDERERS, the method attempts to use renderers already in the filter graph. It will not add new renderers to the graph. (It will add intermediate transform filters, if needed.) For the method to succeed, the graph must contain the appropriate renderers, and they must have unconnected input pins. If the value is zero, the method behaves identically to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-render">IGraphBuilder::Render</a> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ifiltergraph2-renderex
     */
    RenderEx(pPinOut, dwFlags) {
        static pvContext := 0 ;Reserved parameters must always be NULL

        result := ComCall(20, this, "ptr", pPinOut, "uint", dwFlags, "uint*", pvContext, "HRESULT")
        return result
    }
}
