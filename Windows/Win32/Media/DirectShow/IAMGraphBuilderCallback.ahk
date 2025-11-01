#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMGraphBuilderCallback interface provides a callback mechanism during graph building.To use this interface, implement the interface in your application or client object.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamgraphbuildercallback
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMGraphBuilderCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMGraphBuilderCallback
     * @type {Guid}
     */
    static IID => Guid("{4995f511-9ddb-4f12-bd3b-f04611807b79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectedFilter", "CreatedFilter"]

    /**
     * 
     * @param {IMoniker} pMon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphbuildercallback-selectedfilter
     */
    SelectedFilter(pMon) {
        result := ComCall(3, this, "ptr", pMon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBaseFilter} pFil 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphbuildercallback-createdfilter
     */
    CreatedFilter(pFil) {
        result := ComCall(4, this, "ptr", pFil, "HRESULT")
        return result
    }
}
