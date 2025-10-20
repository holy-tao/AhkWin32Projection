#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IClockVector.ahk

/**
 * Represents a clock vector that contains FeedSync information.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ifeedclockvector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFeedClockVector extends IClockVector{
    /**
     * The interface identifier for IFeedClockVector
     * @type {Guid}
     */
    static IID => Guid("{8d1d98d1-9fb8-4ec9-a553-54dd924e0f67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<UInt32>} pdwUpdateCount 
     * @returns {HRESULT} 
     */
    GetUpdateCount(pdwUpdateCount) {
        result := ComCall(5, this, "uint*", pdwUpdateCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsNoConflictsSpecified 
     * @returns {HRESULT} 
     */
    IsNoConflictsSpecified(pfIsNoConflictsSpecified) {
        result := ComCall(6, this, "ptr", pfIsNoConflictsSpecified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
