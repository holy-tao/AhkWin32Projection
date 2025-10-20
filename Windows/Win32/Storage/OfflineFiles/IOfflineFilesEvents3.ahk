#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesEvents2.ahk

/**
 * Used to report events associated with transparently cached items.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesevents3
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesEvents3 extends IOfflineFilesEvents2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesEvents3
     * @type {Guid}
     */
    static IID => Guid("{9ba04a45-ee69-42f0-9ab1-7db5c8805808}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 37

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransparentCacheItemNotify", "PrefetchFileBegin", "PrefetchFileEnd"]

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} EventType 
     * @param {Integer} ItemType 
     * @param {BOOL} bModifiedData 
     * @param {BOOL} bModifiedAttributes 
     * @param {PWSTR} pzsOldPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents3-transparentcacheitemnotify
     */
    TransparentCacheItemNotify(pszPath, EventType, ItemType, bModifiedData, bModifiedAttributes, pzsOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pzsOldPath := pzsOldPath is String ? StrPtr(pzsOldPath) : pzsOldPath

        result := ComCall(37, this, "ptr", pszPath, "int", EventType, "int", ItemType, "int", bModifiedData, "int", bModifiedAttributes, "ptr", pzsOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents3-prefetchfilebegin
     */
    PrefetchFileBegin(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(38, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesevents3-prefetchfileend
     */
    PrefetchFileEnd(pszPath, hrResult) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(39, this, "ptr", pszPath, "int", hrResult, "HRESULT")
        return result
    }
}
