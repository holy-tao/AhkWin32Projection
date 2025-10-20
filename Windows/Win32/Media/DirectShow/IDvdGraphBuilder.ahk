#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdGraphBuilder interface builds a filter graph for DVD-Video playback.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdgraphbuilder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdGraphBuilder extends IUnknown{
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
     * 
     * @param {Pointer<IGraphBuilder>} ppGB 
     * @returns {HRESULT} 
     */
    GetFiltergraph(ppGB) {
        result := ComCall(3, this, "ptr", ppGB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvIF 
     * @returns {HRESULT} 
     */
    GetDvdInterface(riid, ppvIF) {
        result := ComCall(4, this, "ptr", riid, "ptr", ppvIF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpcwszPathName 
     * @param {Integer} dwFlags 
     * @param {Pointer<AM_DVD_RENDERSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    RenderDvdVideoVolume(lpcwszPathName, dwFlags, pStatus) {
        lpcwszPathName := lpcwszPathName is String ? StrPtr(lpcwszPathName) : lpcwszPathName

        result := ComCall(5, this, "ptr", lpcwszPathName, "uint", dwFlags, "ptr", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
