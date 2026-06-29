#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PIN_DIRECTION.ahk" { PIN_DIRECTION }
#Import ".\IBaseFilter.ahk" { IBaseFilter }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The PIN_INFO structure contains information about a pin.
 * @remarks
 * If the name of an output pin begins with a tilde (~), the filter graph manager ignores the pin when it builds a graph. During a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-connect">IGraphBuilder::Connect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-render">IGraphBuilder::Render</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-renderfile">IGraphBuilder::RenderFile</a>, if the pin appears on an intermediate filter, the filter graph manager does not render the pin. However, it renders the pin if you explicitly pass the pin to the <b>Connect</b> or <b>Render</b> method.
 * 
 * Use a tilde if the pin delivers a secondary stream that should not be rendered by default, or if the pin requires special code to render correctly. For example, DVD filters should use it for pins that deliver subpicture or closed captioning data. Video capture filters should use it for capture pins (but not preview pins).
 * 
 * The <b>pFilter</b> member has an outstanding reference count. The application must release the interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-pin_info
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PIN_INFO {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the owning filter.
     */
    pFilter : IBaseFilter

    /**
     * Direction of the pin (input or output).
     */
    dir : PIN_DIRECTION

    /**
     * Name of the pin.
     */
    achName : WCHAR[128]

}
