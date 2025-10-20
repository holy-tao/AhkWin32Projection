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
     * 
     * @param {Pointer<IPin>} ppinOut 
     * @param {Pointer<IPin>} ppinIn 
     * @returns {HRESULT} 
     */
    Connect(ppinOut, ppinIn) {
        result := ComCall(11, this, "ptr", ppinOut, "ptr", ppinIn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} ppinOut 
     * @returns {HRESULT} 
     */
    Render(ppinOut) {
        result := ComCall(12, this, "ptr", ppinOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpcwstrFile 
     * @param {PWSTR} lpcwstrPlayList 
     * @returns {HRESULT} 
     */
    RenderFile(lpcwstrFile, lpcwstrPlayList) {
        lpcwstrFile := lpcwstrFile is String ? StrPtr(lpcwstrFile) : lpcwstrFile
        lpcwstrPlayList := lpcwstrPlayList is String ? StrPtr(lpcwstrPlayList) : lpcwstrPlayList

        result := ComCall(13, this, "ptr", lpcwstrFile, "ptr", lpcwstrPlayList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpcwstrFileName 
     * @param {PWSTR} lpcwstrFilterName 
     * @param {Pointer<IBaseFilter>} ppFilter 
     * @returns {HRESULT} 
     */
    AddSourceFilter(lpcwstrFileName, lpcwstrFilterName, ppFilter) {
        lpcwstrFileName := lpcwstrFileName is String ? StrPtr(lpcwstrFileName) : lpcwstrFileName
        lpcwstrFilterName := lpcwstrFilterName is String ? StrPtr(lpcwstrFilterName) : lpcwstrFilterName

        result := ComCall(14, this, "ptr", lpcwstrFileName, "ptr", lpcwstrFilterName, "ptr", ppFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hFile 
     * @returns {HRESULT} 
     */
    SetLogFile(hFile) {
        result := ComCall(15, this, "ptr", hFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShouldOperationContinue() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
