#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBuilder interface enables an output pin to notify the filter graph manager that the pin itself will build the downstream section of the filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-istreambuilder
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
     * @remarks
     * The following code illustrates how to implement this method on an output pin. This example assumes that the filter requires a custom renderer downstream from it.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * 
     * ```
     * STDMETHODIMP CMyOutputPin::Render(IPin *pPin, IGraphBuilder *pGraph)
     * {
     *     CheckPointer(pPin, E_POINTER);
     *     CheckPointer(pGraph, E_POINTER);
     * 
     *     // This filter needs a special renderer connected to it.
     *     IBaseFilter *pMyRenderer = NULL;
     * 
     *     // Create the renderer.
     *     HRESULT hr = CoCreateInstance(CLSID_MyRenderer, NULL, CLSCTX_INPROC,
     *         IID_IBaseFilter, (void **)&amp;pMyRenderer);
     *     if (FAILED(hr))
     *     {
     *         return hr;
     *     }
     *     
     *     // Add my renderer to the filter graph.
     *     hr = pGraph-&gt;AddFilter(pMyRenderer, L"My Renderer");
     *     if (FAILED(hr))
     *     {
     *         pMyRenderer-&gt;Release();
     *         return hr;
     *     }
     * 
     *     IEnumPins *pEnumPins;
     *     IPin *pMyRendererInputPin = NULL;
     *     hr = pMyRenderer-&gt;EnumPins(&amp;pEnumPins);
     *     if (SUCCEEDED(hr)) 
     *     {
     *         if (S_OK != pEnumPins-&gt;Next(1, &amp;pMyRendererInputPin, 0))
     *         {
     *             hr = E_UNEXPECTED;
     *          }
     *     }
     *     if (SUCCEEDED(hr)) 
     *     {
     *         // Connect my renderer to my output pin.
     *         hr = pGraph-&gt;ConnectDirect(pPin, pMyRendererInputPin);
     *         pMyRendererInputPin-&gt;Release();
     *     }
     *     if (FAILED(hr)) 
     *     {
     *         // Could not connect to my renderer. Remove it from the graph.
     *         pGraph-&gt;RemoveFilter(pMyRenderer);
     *     }
     *     pMyRenderer-&gt;Release();
     *     return hr;
     * }
     * ```
     * </td>
     * </tr>
     * </table></span></div>
     * @param {IPin} ppinOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of this pin.
     * @param {IGraphBuilder} pGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface of the Filter Graph Manager.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. A return code of S_OK indicates that the stream was successfully rendered.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-istreambuilder-render
     */
    Render(ppinOut, pGraph) {
        result := ComCall(3, this, "ptr", ppinOut, "ptr", pGraph, "HRESULT")
        return result
    }

    /**
     * The Backout method undoes steps taken in the IStreamBuilder::Render method. This includes disconnecting and removing any filters that were added inside Render.
     * @remarks
     * The following example shows how a filter would reverse the steps that are shown in the code example for the <b>IStreamBuilder::Render</b> method:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * 
     * ```
     * STDMETHODIMP CMyOutputPin::BackOut(IPin *pPin, IGraphBuilder *pGraph)
     * {
     *     CheckPointer(pPin, E_POINTER);
     *     CheckPointer(pGraph, E_POINTER);
     * 
     *     HRESULT hr = S_OK;
     *     if (m_Connected != NULL) // Pointer to the pin we're connected to.
     *     {
     *         // Find the filter that owns the pin connected to us.
     *         FILTER_INFO fi;
     *         hr = m_Connected-&gt;QueryFilterInfo(&amp;fi);
     *         if (SUCCEEDED(hr)) 
     *         {
     *             if (fi.pFilter != NULL) 
     *             {
     *                 //  Disconnect the pins.
     *                 pGraph-&gt;Disconnect(m_Connected);
     *                 pGraph-&gt;Disconnect(pPin);
     *                 // Remove the filter from the graph.
     *                 pGraph-&gt;RemoveFilter(fi.pFilter);
     *                 fi.pFilter-&gt;Release();
     *             } 
     *             else 
     *             {
     *                 hr = E_UNEXPECTED;
     *             }
     *         }
     *     }
     *     return hr;
     * }
     * ```
     * </td>
     * </tr>
     * </table></span></div>
     * @param {IPin} ppinOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of this pin.
     * @param {IGraphBuilder} pGraph Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface of the Filter Graph Manager.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. A return code of S_OK indicates to the graph builder that the disconnect was successful.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-istreambuilder-backout
     */
    Backout(ppinOut, pGraph) {
        result := ComCall(4, this, "ptr", ppinOut, "ptr", pGraph, "HRESULT")
        return result
    }
}
