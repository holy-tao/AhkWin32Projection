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
     * 
     * @param {Pointer<IMoniker>} pMon 
     * @returns {HRESULT} 
     */
    SelectedFilter(pMon) {
        result := ComCall(3, this, "ptr", pMon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBaseFilter>} pFil 
     * @returns {HRESULT} 
     */
    CreatedFilter(pFil) {
        result := ComCall(4, this, "ptr", pFil, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
