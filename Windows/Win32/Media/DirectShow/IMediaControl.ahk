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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Run", "Pause", "Stop", "GetState", "RenderFile", "AddSourceFilter", "get_FilterCollection", "get_RegFilterCollection", "StopWhenReady"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-run
     */
    Run() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-pause
     */
    Pause() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-stop
     */
    Stop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @param {Pointer<Integer>} pfs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-getstate
     */
    GetState(msTimeout, pfs) {
        pfsMarshal := pfs is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", msTimeout, pfsMarshal, pfs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-renderfile
     */
    RenderFile(strFilename) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(11, this, "ptr", strFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strFilename 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-addsourcefilter
     */
    AddSourceFilter(strFilename, ppUnk) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(12, this, "ptr", strFilename, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-get_filtercollection
     */
    get_FilterCollection(ppUnk) {
        result := ComCall(13, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-get_regfiltercollection
     */
    get_RegFilterCollection(ppUnk) {
        result := ComCall(14, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediacontrol-stopwhenready
     */
    StopWhenReady() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
