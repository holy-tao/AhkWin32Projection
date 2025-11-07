#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGraphBuilder.ahk
#Include .\IPin.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICaptureGraphBuilder2 interface builds capture graphs and other custom filter graphs.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-icapturegraphbuilder2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ICaptureGraphBuilder2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICaptureGraphBuilder2
     * @type {Guid}
     */
    static IID => Guid("{93e5a4e0-2d50-11d2-abfa-00a0c9c6e38d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFiltergraph", "GetFiltergraph", "SetOutputFileName", "FindInterface", "RenderStream", "ControlStream", "AllocCapFile", "CopyCaptureFile", "FindPin"]

    /**
     * 
     * @param {IGraphBuilder} pfg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-setfiltergraph
     */
    SetFiltergraph(pfg) {
        result := ComCall(3, this, "ptr", pfg, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IGraphBuilder} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-getfiltergraph
     */
    GetFiltergraph() {
        result := ComCall(4, this, "ptr*", &ppfg := 0, "HRESULT")
        return IGraphBuilder(ppfg)
    }

    /**
     * 
     * @param {Pointer<Guid>} pType 
     * @param {PWSTR} lpstrFile 
     * @param {Pointer<IBaseFilter>} ppf 
     * @param {Pointer<IFileSinkFilter>} ppSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-setoutputfilename
     */
    SetOutputFileName(pType, lpstrFile, ppf, ppSink) {
        lpstrFile := lpstrFile is String ? StrPtr(lpstrFile) : lpstrFile

        result := ComCall(5, this, "ptr", pType, "ptr", lpstrFile, "ptr*", ppf, "ptr*", ppSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {Pointer<Guid>} pType 
     * @param {IBaseFilter} pf 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-findinterface
     */
    FindInterface(pCategory, pType, pf, riid) {
        result := ComCall(6, this, "ptr", pCategory, "ptr", pType, "ptr", pf, "ptr", riid, "ptr*", &ppint := 0, "HRESULT")
        return ppint
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {Pointer<Guid>} pType 
     * @param {IUnknown} pSource 
     * @param {IBaseFilter} pfCompressor 
     * @param {IBaseFilter} pfRenderer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-renderstream
     */
    RenderStream(pCategory, pType, pSource, pfCompressor, pfRenderer) {
        result := ComCall(7, this, "ptr", pCategory, "ptr", pType, "ptr", pSource, "ptr", pfCompressor, "ptr", pfRenderer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {Pointer<Guid>} pType 
     * @param {IBaseFilter} pFilter 
     * @param {Pointer<Integer>} pstart 
     * @param {Pointer<Integer>} pstop 
     * @param {Integer} wStartCookie 
     * @param {Integer} wStopCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-controlstream
     */
    ControlStream(pCategory, pType, pFilter, pstart, pstop, wStartCookie, wStopCookie) {
        pstartMarshal := pstart is VarRef ? "int64*" : "ptr"
        pstopMarshal := pstop is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "ptr", pCategory, "ptr", pType, "ptr", pFilter, pstartMarshal, pstart, pstopMarshal, pstop, "ushort", wStartCookie, "ushort", wStopCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpstr 
     * @param {Integer} dwlSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-alloccapfile
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-copycapturefile
     */
    CopyCaptureFile(lpwstrOld, lpwstrNew, fAllowEscAbort, pCallback) {
        lpwstrOld := lpwstrOld is String ? StrPtr(lpwstrOld) : lpwstrOld
        lpwstrNew := lpwstrNew is String ? StrPtr(lpwstrNew) : lpwstrNew

        result := ComCall(10, this, "ptr", lpwstrOld, "ptr", lpwstrNew, "int", fAllowEscAbort, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pSource 
     * @param {Integer} pindir 
     * @param {Pointer<Guid>} pCategory 
     * @param {Pointer<Guid>} pType 
     * @param {BOOL} fUnconnected 
     * @param {Integer} num 
     * @returns {IPin} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-findpin
     */
    FindPin(pSource, pindir, pCategory, pType, fUnconnected, num) {
        result := ComCall(11, this, "ptr", pSource, "int", pindir, "ptr", pCategory, "ptr", pType, "int", fUnconnected, "int", num, "ptr*", &ppPin := 0, "HRESULT")
        return IPin(ppPin)
    }
}
