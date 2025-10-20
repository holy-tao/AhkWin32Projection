#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IClockVectorElement.ahk

/**
 * Represents a clock vector element that contains FeedSync information.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ifeedclockvectorelement
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFeedClockVectorElement extends IClockVectorElement{
    /**
     * The interface identifier for IFeedClockVectorElement
     * @type {Guid}
     */
    static IID => Guid("{a40b46d2-e97b-4156-b6da-991f501b0f05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<SYNC_TIME>} pSyncTime 
     * @returns {HRESULT} 
     */
    GetSyncTime(pSyncTime) {
        result := ComCall(5, this, "ptr", pSyncTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pbFlags) {
        result := ComCall(6, this, "char*", pbFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
