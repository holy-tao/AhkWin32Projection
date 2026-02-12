#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGraphBuilder.ahk
#Include .\AM_DVD_RENDERSTATUS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdGraphBuilder interface builds a filter graph for DVD-Video playback.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-idvdgraphbuilder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdGraphBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdGraphBuilder
     * @type {Guid}
     */
    static IID => Guid("{fcc152b6-f372-11d0-8e00-00c04fd7c08b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFiltergraph", "GetDvdInterface", "RenderDvdVideoVolume"]

    /**
     * The GetFiltergraph method retrieves the IGraphBuilder interface for the filter graph used by the DVD-Video graph builder object.
     * @remarks
     * The returned <b>IGraphBuilder</b> interface pointer has an outstanding reference count. The caller must release the interface.
     * @returns {IGraphBuilder} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface that the DVD-Video graph builder object is using.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdgraphbuilder-getfiltergraph
     */
    GetFiltergraph() {
        result := ComCall(3, this, "ptr*", &ppGB := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGraphBuilder(ppGB)
    }

    /**
     * The GetDvdInterface method retrieves interfaces from the DVD-Video playback graph to make DVD-Video playback development easier.
     * @remarks
     * You can use this method to select and configure a video renderer filter before you build the filter graph for DVD playback. The following interfaces are available:
     * 
     * <ul>
     * <li><b>Overlay Mixer Filter</b>: <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iddrawexclmodevideo">IDDrawExclModeVideo</a>.</li>
     * <li><b>Video Mixing Renderer 7 (VMR-7)</b>: <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrfilterconfig">IVMRFilterConfig</a>, <a href="https://docs.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrmixerbitmap">IVMRMixerBitmap</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrwindowlesscontrol">IVMRWindowlessControl</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrmonitorconfig">IVMRMonitorConfig</a>.</li>
     * <li><b>Video Mixing Renderer 9 (VMR-9)</b>: <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrfilterconfig9">IVMRFilterConfig9</a>, <a href="https://docs.microsoft.com/previous-versions/ms787059(v=vs.85)">IVMRMixerBitmap9</a>, <a href="https://docs.microsoft.com/previous-versions/ms787155(v=vs.85)">IVMRWindowlessControl9</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrmonitorconfig9">IVMRMonitorConfig9</a>.</li>
     * <li><b>Enhanced Video Renderer (EVR)</b>: <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-ievrfilterconfig">IEVRFilterConfig</a> and <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideorenderer">IMFVideoRenderer</a>.<b>Windows Server 2003, Windows XP and Windows 2000:  </b>This interface is not supported.
     * 
     * </li>
     * </ul>
     * If you call <b>GetDvdInterface</b> to get any of these interfaces before you build the filter graph, the DVD Graph Builder creates the appropriate video renderer. It will use this renderer later when you build the graph. After the video renderer has been selected, you can no longer retrieve the interfaces for the other video renderers. (The <b>GetDvdInterface</b> method will return E_NOINTERFACE.)
     * 
     * Before the DVD playback graph is built, if you request any interfaces that are not on the previous list, the method returns VFW_E_DVD_GRAPHNOTREADY. To build the DVD graph, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdgraphbuilder-renderdvdvideovolume">IDvdGraphBuilder::RenderDvdVideoVolume</a>. After you build the graph, you can use <b>GetDvdInterface</b> to retrieve some additional interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcontrol">IDvdControl</a> (deprecated), <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcontrol2">IDvdControl2</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdinfo">IDvdInfo</a> (deprecated), and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdinfo2">IDvdInfo2</a> to control DVD playback.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-ivideowindow">IVideoWindow</a>, <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-ibasicvideo">IBasicVideo</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-ibasicvideo2">IBasicVideo2</a> to control the video settings, in windowed mode only.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-ibasicaudio">IBasicAudio</a> to control the audio settings.</li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/il21dec/nn-il21dec-iamline21decoder">IAMLine21Decoder</a> to control closed caption display.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mpconfig/nn-mpconfig-imixerpinconfig">IMixerPinConfig</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mpconfig/nn-mpconfig-imixerpinconfig2">IMixerPinConfig2</a> to configure the Overlay Mixer filter's first input pin, which delivers the primary video stream. (To get this interface for the other pins on the Overlay Mixer, enumerate the filter's pins and query them directly.) New applications should avoid using the Overlay Mixer filter.</li>
     * </ul>
     * To get other interfaces, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdgraphbuilder-getfiltergraph">IDvdGraphBuilder::GetFiltergraph</a>. Query the returned <b>IGraphBuilder</b> interface or use <b>EnumFilters</b> to enumerate the filters.
     * @param {Pointer<Guid>} riid IID of the requested interface.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The application must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdgraphbuilder-getdvdinterface
     */
    GetDvdInterface(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppvIF := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvIF
    }

    /**
     * The RenderDvdVideoVolume method completes building a filter graph according to user specifications for playing a DVD-Video volume.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_dvd_renderstatus">AM_DVD_RENDERSTATUS</a> structure reflects failure codes for this method. Reasons for this method returning S_FALSE include the following:
     * 
     * <ul>
     * <li>The graph has been completely built, but one of the following is true.<ul>
     * <li>Overlay mixing doesn't work—the application did not set the AM_DVD_NOVPE flag and the video stream could not be put through the Overlay Mixer. In this case, if the video is decoded in software the application will have enough information to inform the user that the video won't be visible. Hardware-decoded video will be visible only on a TV connected to the NTSC out port of the hardware video decoder.</li>
     * <li>The video decoder does not produce line 21 data. The application can display a warning or informative message that closed captioning is not available because of the decoder.</li>
     * <li>No volume path is specified and the DVD Navigator did not locate any DVD-Video volume to be played. The application can ask the user to insert a DVD-Video disc if none is available in the drive when playback starts.</li>
     * </ul>
     * </li>
     * <li>Some streams did not render. The application can indicate to the user that some streams can't be played.</li>
     * </ul>
     * This method builds the graph without any knowledge of the DVD-Video file or volume to play. The DVD-Video graph builder builds the graph even if <i>lpcwszPathName</i> is <b>NULL</b> or if the DVD Navigator filter does not find a default DVD-Video volume to play.
     * @param {PWSTR} lpcwszPathName Pointer to the path for the DVD-Video volume to play. Can be <b>NULL</b>.
     * @param {Integer} dwFlags Bitwise OR of flags from <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-am_dvd_graph_flags">AM_DVD_GRAPH_FLAGS</a> enumeration, specifying how to build the DVD playback graph.
     * @returns {AM_DVD_RENDERSTATUS} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_dvd_renderstatus">AM_DVD_RENDERSTATUS</a> structure. When the method returns, the structure indicates any rendering failures.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdgraphbuilder-renderdvdvideovolume
     */
    RenderDvdVideoVolume(lpcwszPathName, dwFlags) {
        lpcwszPathName := lpcwszPathName is String ? StrPtr(lpcwszPathName) : lpcwszPathName

        pStatus := AM_DVD_RENDERSTATUS()
        result := ComCall(5, this, "ptr", lpcwszPathName, "uint", dwFlags, "ptr", pStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pStatus
    }
}
