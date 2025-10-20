#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents information about an unsynchronized (&quot;dirty&quot;) file in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesdirtyinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesDirtyInfo extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesDirtyInfo
     * @type {Guid}
     */
    static IID => Guid("{0f50ce33-bac9-4eaa-a11d-da0e527d047d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int64>} pDirtyByteCount 
     * @returns {HRESULT} 
     */
    LocalDirtyByteCount(pDirtyByteCount) {
        result := ComCall(3, this, "int64*", pDirtyByteCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pDirtyByteCount 
     * @returns {HRESULT} 
     */
    RemoteDirtyByteCount(pDirtyByteCount) {
        result := ComCall(4, this, "int64*", pDirtyByteCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
