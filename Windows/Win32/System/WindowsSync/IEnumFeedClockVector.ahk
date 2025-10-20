#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates the clock vector elements that are stored in a clock vector that contains FeedSync information.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumfeedclockvector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumFeedClockVector extends IUnknown{
    /**
     * The interface identifier for IEnumFeedClockVector
     * @type {Guid}
     */
    static IID => Guid("{550f763d-146a-48f6-abeb-6c88c7f70514}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cClockVectorElements 
     * @param {Pointer<IFeedClockVectorElement>} ppiClockVectorElements 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cClockVectorElements, ppiClockVectorElements, pcFetched) {
        result := ComCall(3, this, "uint", cClockVectorElements, "ptr", ppiClockVectorElements, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cSyncVersions 
     * @returns {HRESULT} 
     */
    Skip(cSyncVersions) {
        result := ComCall(4, this, "uint", cSyncVersions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFeedClockVector>} ppiEnum 
     * @returns {HRESULT} 
     */
    Clone(ppiEnum) {
        result := ComCall(6, this, "ptr", ppiEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
