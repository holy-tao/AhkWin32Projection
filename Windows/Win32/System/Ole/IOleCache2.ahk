#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleCache.ahk

/**
 * Enables object clients to selectively update each cache that was created with IOleCache::Cache.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolecache2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleCache2 extends IOleCache{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleCache2
     * @type {Guid}
     */
    static IID => Guid("{00000128-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateCache", "DiscardCache"]

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @param {Integer} grfUpdf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecache2-updatecache
     */
    UpdateCache(pDataObject, grfUpdf) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(8, this, "ptr", pDataObject, "uint", grfUpdf, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDiscardOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolecache2-discardcache
     */
    DiscardCache(dwDiscardOptions) {
        result := ComCall(9, this, "uint", dwDiscardOptions, "HRESULT")
        return result
    }
}
