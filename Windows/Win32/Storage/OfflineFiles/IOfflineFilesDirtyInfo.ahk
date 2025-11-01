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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LocalDirtyByteCount", "RemoteDirtyByteCount"]

    /**
     * 
     * @param {Pointer<Integer>} pDirtyByteCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesdirtyinfo-localdirtybytecount
     */
    LocalDirtyByteCount(pDirtyByteCount) {
        result := ComCall(3, this, "int64*", pDirtyByteCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDirtyByteCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesdirtyinfo-remotedirtybytecount
     */
    RemoteDirtyByteCount(pDirtyByteCount) {
        result := ComCall(4, this, "int64*", pDirtyByteCount, "HRESULT")
        return result
    }
}
