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
     * 
     * @param {Pointer<IGraphBuilder>} pfg 
     * @returns {HRESULT} 
     */
    SetFiltergraph(pfg) {
        result := ComCall(3, this, "ptr", pfg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGraphBuilder>} ppfg 
     * @returns {HRESULT} 
     */
    GetFiltergraph(ppfg) {
        result := ComCall(4, this, "ptr", ppfg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pType 
     * @param {PWSTR} lpstrFile 
     * @param {Pointer<IBaseFilter>} ppf 
     * @param {Pointer<IFileSinkFilter>} ppSink 
     * @returns {HRESULT} 
     */
    SetOutputFileName(pType, lpstrFile, ppf, ppSink) {
        lpstrFile := lpstrFile is String ? StrPtr(lpstrFile) : lpstrFile

        result := ComCall(5, this, "ptr", pType, "ptr", lpstrFile, "ptr", ppf, "ptr", ppSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {Pointer<IBaseFilter>} pf 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppint 
     * @returns {HRESULT} 
     */
    FindInterface(pCategory, pf, riid, ppint) {
        result := ComCall(6, this, "ptr", pCategory, "ptr", pf, "ptr", riid, "ptr", ppint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {Pointer<IUnknown>} pSource 
     * @param {Pointer<IBaseFilter>} pfCompressor 
     * @param {Pointer<IBaseFilter>} pfRenderer 
     * @returns {HRESULT} 
     */
    RenderStream(pCategory, pSource, pfCompressor, pfRenderer) {
        result := ComCall(7, this, "ptr", pCategory, "ptr", pSource, "ptr", pfCompressor, "ptr", pfRenderer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCategory 
     * @param {Pointer<IBaseFilter>} pFilter 
     * @param {Pointer<Int64>} pstart 
     * @param {Pointer<Int64>} pstop 
     * @param {Integer} wStartCookie 
     * @param {Integer} wStopCookie 
     * @returns {HRESULT} 
     */
    ControlStream(pCategory, pFilter, pstart, pstop, wStartCookie, wStopCookie) {
        result := ComCall(8, this, "ptr", pCategory, "ptr", pFilter, "int64*", pstart, "int64*", pstop, "ushort", wStartCookie, "ushort", wStopCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpstr 
     * @param {Integer} dwlSize 
     * @returns {HRESULT} 
     */
    AllocCapFile(lpstr, dwlSize) {
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        result := ComCall(9, this, "ptr", lpstr, "uint", dwlSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpwstrOld 
     * @param {PWSTR} lpwstrNew 
     * @param {Integer} fAllowEscAbort 
     * @param {Pointer<IAMCopyCaptureFileProgress>} pCallback 
     * @returns {HRESULT} 
     */
    CopyCaptureFile(lpwstrOld, lpwstrNew, fAllowEscAbort, pCallback) {
        lpwstrOld := lpwstrOld is String ? StrPtr(lpwstrOld) : lpwstrOld
        lpwstrNew := lpwstrNew is String ? StrPtr(lpwstrNew) : lpwstrNew

        result := ComCall(10, this, "ptr", lpwstrOld, "ptr", lpwstrNew, "int", fAllowEscAbort, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
