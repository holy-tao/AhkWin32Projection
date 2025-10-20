#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaControl interface provides methods for controlling the flow of data through the filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediacontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaControl extends IDispatch{
    /**
     * The interface identifier for IMediaControl
     * @type {Guid}
     */
    static IID => Guid("{56a868b1-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    Run() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @param {Pointer<Int32>} pfs 
     * @returns {HRESULT} 
     */
    GetState(msTimeout, pfs) {
        result := ComCall(10, this, "int", msTimeout, "int*", pfs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strFilename 
     * @returns {HRESULT} 
     */
    RenderFile(strFilename) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(11, this, "ptr", strFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strFilename 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    AddSourceFilter(strFilename, ppUnk) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(12, this, "ptr", strFilename, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_FilterCollection(ppUnk) {
        result := ComCall(13, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_RegFilterCollection(ppUnk) {
        result := ComCall(14, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopWhenReady() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
