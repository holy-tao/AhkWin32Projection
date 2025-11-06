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
     * 
     * @returns {IGraphBuilder} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdgraphbuilder-getfiltergraph
     */
    GetFiltergraph() {
        result := ComCall(3, this, "ptr*", &ppGB := 0, "HRESULT")
        return IGraphBuilder(ppGB)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdgraphbuilder-getdvdinterface
     */
    GetDvdInterface(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppvIF := 0, "HRESULT")
        return ppvIF
    }

    /**
     * 
     * @param {PWSTR} lpcwszPathName 
     * @param {Integer} dwFlags 
     * @returns {AM_DVD_RENDERSTATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdgraphbuilder-renderdvdvideovolume
     */
    RenderDvdVideoVolume(lpcwszPathName, dwFlags) {
        lpcwszPathName := lpcwszPathName is String ? StrPtr(lpcwszPathName) : lpcwszPathName

        pStatus := AM_DVD_RENDERSTATUS()
        result := ComCall(5, this, "ptr", lpcwszPathName, "uint", dwFlags, "ptr", pStatus, "HRESULT")
        return pStatus
    }
}
