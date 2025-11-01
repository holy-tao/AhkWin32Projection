#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-icapturegraphbuilder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ICaptureGraphBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICaptureGraphBuilder
     * @type {Guid}
     */
    static IID => Guid("{bf87b6e0-8c27-11d0-b3f0-00aa003761c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFiltergraph", "GetFiltergraph", "SetOutputFileName", "FindInterface", "RenderStream", "ControlStream", "AllocCapFile", "CopyCaptureFile"]

    /**
     * 
     * @param {IGraphBuilder} pfg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-setfiltergraph
     */
    SetFiltergraph(pfg) {
        result := ComCall(3, this, "ptr", pfg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGraphBuilder>} ppfg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-getfiltergraph
     */
    GetFiltergraph(ppfg) {
        result := ComCall(4, this, "ptr*", ppfg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pType 
     * @param {PWSTR} lpstrFile 
     * @param {Pointer<IBaseFilter>} ppf 
     * @param {Pointer<IFileSinkFilter>} ppSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-setoutputfilename
     */
    SetOutputFileName(pType, lpstrFile, ppf, ppSink) {
        lpstrFile := lpstrFile is String ? StrPtr(lpstrFile) : lpstrFile

        result := ComCall(5, this, "ptr", pType, "ptr", lpstrFile, "ptr*", ppf, "ptr*", ppSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {IBaseFilter} pf 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-findinterface
     */
    FindInterface(pCategory, pf, riid, ppint) {
        result := ComCall(6, this, "ptr", pCategory, "ptr", pf, "ptr", riid, "ptr*", ppint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {IUnknown} pSource 
     * @param {IBaseFilter} pfCompressor 
     * @param {IBaseFilter} pfRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-renderstream
     */
    RenderStream(pCategory, pSource, pfCompressor, pfRenderer) {
        result := ComCall(7, this, "ptr", pCategory, "ptr", pSource, "ptr", pfCompressor, "ptr", pfRenderer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {IBaseFilter} pFilter 
     * @param {Pointer<Integer>} pstart 
     * @param {Pointer<Integer>} pstop 
     * @param {Integer} wStartCookie 
     * @param {Integer} wStopCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-controlstream
     */
    ControlStream(pCategory, pFilter, pstart, pstop, wStartCookie, wStopCookie) {
        pstartMarshal := pstart is VarRef ? "int64*" : "ptr"
        pstopMarshal := pstop is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "ptr", pCategory, "ptr", pFilter, pstartMarshal, pstart, pstopMarshal, pstop, "ushort", wStartCookie, "ushort", wStopCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpstr 
     * @param {Integer} dwlSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-alloccapfile
     */
    AllocCapFile(lpstr, dwlSize) {
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        result := ComCall(9, this, "ptr", lpstr, "uint", dwlSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpwstrOld 
     * @param {PWSTR} lpwstrNew 
     * @param {Integer} fAllowEscAbort 
     * @param {IAMCopyCaptureFileProgress} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-copycapturefile
     */
    CopyCaptureFile(lpwstrOld, lpwstrNew, fAllowEscAbort, pCallback) {
        lpwstrOld := lpwstrOld is String ? StrPtr(lpwstrOld) : lpwstrOld
        lpwstrNew := lpwstrNew is String ? StrPtr(lpwstrNew) : lpwstrNew

        result := ComCall(10, this, "ptr", lpwstrOld, "ptr", lpwstrNew, "int", fAllowEscAbort, "ptr", pCallback, "HRESULT")
        return result
    }
}
