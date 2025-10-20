#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssAsync interface is returned to calling applications by methods that initiate asynchronous operations, which run in the background and typically require a long time to complete.
 * @see https://docs.microsoft.com/windows/win32/api//vss/nn-vss-ivssasync
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssAsync extends IUnknown{
    /**
     * The interface identifier for IVssAsync
     * @type {Guid}
     */
    static IID => Guid("{507c37b4-cf5b-4e95-b0af-14eb9767467e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    Wait(dwMilliseconds) {
        result := ComCall(4, this, "uint", dwMilliseconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} pHrResult 
     * @param {Pointer<Int32>} pReserved 
     * @returns {HRESULT} 
     */
    QueryStatus(pHrResult, pReserved) {
        result := ComCall(5, this, "ptr", pHrResult, "int*", pReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
