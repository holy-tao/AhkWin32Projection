#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBuilder interface enables an output pin to notify the filter graph manager that the pin itself will build the downstream section of the filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-istreambuilder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IStreamBuilder extends IUnknown{
    /**
     * The interface identifier for IStreamBuilder
     * @type {Guid}
     */
    static IID => Guid("{56a868bf-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPin>} ppinOut 
     * @param {Pointer<IGraphBuilder>} pGraph 
     * @returns {HRESULT} 
     */
    Render(ppinOut, pGraph) {
        result := ComCall(3, this, "ptr", ppinOut, "ptr", pGraph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} ppinOut 
     * @param {Pointer<IGraphBuilder>} pGraph 
     * @returns {HRESULT} 
     */
    Backout(ppinOut, pGraph) {
        result := ComCall(4, this, "ptr", ppinOut, "ptr", pGraph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
