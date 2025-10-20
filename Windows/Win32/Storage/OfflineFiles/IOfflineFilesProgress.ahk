#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to report progress back to callers of lengthy Offline Files operations.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesprogress
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesProgress extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesProgress
     * @type {Guid}
     */
    static IID => Guid("{fad63237-c55b-4911-9850-bcf96d4c979e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pbAbort 
     * @returns {HRESULT} 
     */
    Begin(pbAbort) {
        result := ComCall(3, this, "ptr", pbAbort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbAbort 
     * @returns {HRESULT} 
     */
    QueryAbort(pbAbort) {
        result := ComCall(4, this, "ptr", pbAbort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    End(hrResult) {
        result := ComCall(5, this, "int", hrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
