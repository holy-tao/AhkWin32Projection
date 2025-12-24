#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGraphBuilder.ahk
#Include .\AM_DVD_RENDERSTATUS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdGraphBuilder interface builds a filter graph for DVD-Video playback.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdgraphbuilder
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
     * @returns {IGraphBuilder} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface that the DVD-Video graph builder object is using.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdgraphbuilder-getfiltergraph
     */
    GetFiltergraph() {
        result := ComCall(3, this, "ptr*", &ppGB := 0, "HRESULT")
        return IGraphBuilder(ppGB)
    }

    /**
     * The GetDvdInterface method retrieves interfaces from the DVD-Video playback graph to make DVD-Video playback development easier.
     * @param {Pointer<Guid>} riid IID of the requested interface.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The application must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdgraphbuilder-getdvdinterface
     */
    GetDvdInterface(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppvIF := 0, "HRESULT")
        return ppvIF
    }

    /**
     * The RenderDvdVideoVolume method completes building a filter graph according to user specifications for playing a DVD-Video volume.
     * @param {PWSTR} lpcwszPathName Pointer to the path for the DVD-Video volume to play. Can be <b>NULL</b>.
     * @param {Integer} dwFlags Bitwise OR of flags from <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-am_dvd_graph_flags">AM_DVD_GRAPH_FLAGS</a> enumeration, specifying how to build the DVD playback graph.
     * @returns {AM_DVD_RENDERSTATUS} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_dvd_renderstatus">AM_DVD_RENDERSTATUS</a> structure. When the method returns, the structure indicates any rendering failures.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdgraphbuilder-renderdvdvideovolume
     */
    RenderDvdVideoVolume(lpcwszPathName, dwFlags) {
        lpcwszPathName := lpcwszPathName is String ? StrPtr(lpcwszPathName) : lpcwszPathName

        pStatus := AM_DVD_RENDERSTATUS()
        result := ComCall(5, this, "ptr", lpcwszPathName, "uint", dwFlags, "ptr", pStatus, "HRESULT")
        return pStatus
    }
}
