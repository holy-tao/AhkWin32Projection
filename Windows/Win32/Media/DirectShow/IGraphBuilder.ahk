#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFilterGraph.ahk

/**
 * This interface provides methods that enable an application to build a filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-igraphbuilder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IGraphBuilder extends IFilterGraph{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphBuilder
     * @type {Guid}
     */
    static IID => Guid("{56a868a9-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Render", "RenderFile", "AddSourceFilter", "SetLogFile", "Abort", "ShouldOperationContinue"]

    /**
     * 
     * @param {IPin} ppinOut 
     * @param {IPin} ppinIn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-connect
     */
    Connect(ppinOut, ppinIn) {
        result := ComCall(11, this, "ptr", ppinOut, "ptr", ppinIn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPin} ppinOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-render
     */
    Render(ppinOut) {
        result := ComCall(12, this, "ptr", ppinOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpcwstrFile 
     * @param {PWSTR} lpcwstrPlayList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-renderfile
     */
    RenderFile(lpcwstrFile, lpcwstrPlayList) {
        lpcwstrFile := lpcwstrFile is String ? StrPtr(lpcwstrFile) : lpcwstrFile
        lpcwstrPlayList := lpcwstrPlayList is String ? StrPtr(lpcwstrPlayList) : lpcwstrPlayList

        result := ComCall(13, this, "ptr", lpcwstrFile, "ptr", lpcwstrPlayList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpcwstrFileName 
     * @param {PWSTR} lpcwstrFilterName 
     * @param {Pointer<IBaseFilter>} ppFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-addsourcefilter
     */
    AddSourceFilter(lpcwstrFileName, lpcwstrFilterName, ppFilter) {
        lpcwstrFileName := lpcwstrFileName is String ? StrPtr(lpcwstrFileName) : lpcwstrFileName
        lpcwstrFilterName := lpcwstrFilterName is String ? StrPtr(lpcwstrFilterName) : lpcwstrFilterName

        result := ComCall(14, this, "ptr", lpcwstrFileName, "ptr", lpcwstrFilterName, "ptr*", ppFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-setlogfile
     */
    SetLogFile(hFile) {
        result := ComCall(15, this, "ptr", hFile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-abort
     */
    Abort() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-shouldoperationcontinue
     */
    ShouldOperationContinue() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
