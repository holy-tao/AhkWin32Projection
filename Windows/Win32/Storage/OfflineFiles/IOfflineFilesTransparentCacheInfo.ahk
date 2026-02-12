#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents information associated with transparently cached items.
 * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nn-cscobj-iofflinefilestransparentcacheinfo
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
     * Determines whether the item is transparently cached.
     * @remarks
     * A transparently cached item is cached locally. However, it can be accessed only when the server is available and the user is online with respect to that server. If the cached version of the file matches the correct version of the file on the server, requests to read data will be satisfied from the cache rather than requesting the data from the server.
     * @returns {BOOL} A pointer to a variable that receives <b>TRUE</b> if the item is transparently cached, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilestransparentcacheinfo-istransparentlycached
     */
    IsTransparentlyCached() {
        result := ComCall(3, this, "int*", &pbTransparentlyCached := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbTransparentlyCached
    }
}
