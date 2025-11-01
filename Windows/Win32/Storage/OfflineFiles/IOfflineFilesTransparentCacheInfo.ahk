#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents information associated with transparently cached items.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilestransparentcacheinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesTransparentCacheInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesTransparentCacheInfo
     * @type {Guid}
     */
    static IID => Guid("{bcaf4a01-5b68-4b56-a6a1-8d2786ede8e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsTransparentlyCached"]

    /**
     * 
     * @param {Pointer<BOOL>} pbTransparentlyCached 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilestransparentcacheinfo-istransparentlycached
     */
    IsTransparentlyCached(pbTransparentlyCached) {
        result := ComCall(3, this, "ptr", pbTransparentlyCached, "HRESULT")
        return result
    }
}
