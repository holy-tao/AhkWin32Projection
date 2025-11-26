#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBuilder interface enables an output pin to notify the filter graph manager that the pin itself will build the downstream section of the filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-istreambuilder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IStreamBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBuilder
     * @type {Guid}
     */
    static IID => Guid("{56a868bf-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Render", "Backout"]

    /**
     * The Render method completes rendering of the stream originating with this pin. This can involve adding filters to the filter graph and connecting them.
     * @param {IPin} ppinOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of this pin.
     * @param {IGraphBuilder} pGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface of the Filter Graph Manager.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. A return code of S_OK indicates that the stream was successfully rendered.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-istreambuilder-render
     */
    Render(ppinOut, pGraph) {
        result := ComCall(3, this, "ptr", ppinOut, "ptr", pGraph, "HRESULT")
        return result
    }

    /**
     * The Backout method undoes steps taken in the IStreamBuilder::Render method. This includes disconnecting and removing any filters that were added inside Render.
     * @param {IPin} ppinOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of this pin.
     * @param {IGraphBuilder} pGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface of the Filter Graph Manager.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. A return code of S_OK indicates to the graph builder that the disconnect was successful.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-istreambuilder-backout
     */
    Backout(ppinOut, pGraph) {
        result := ComCall(4, this, "ptr", ppinOut, "ptr", pGraph, "HRESULT")
        return result
    }
}
