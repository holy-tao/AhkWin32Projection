#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesCache.ahk

/**
 * Implements the RenameItemEx method.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilescache2
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesCache2 extends IOfflineFilesCache{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesCache2
     * @type {Guid}
     */
    static IID => Guid("{8c075039-1551-4ed9-8781-56705c04d3c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenameItemEx"]

    /**
     * 
     * @param {PWSTR} pszPathOriginal 
     * @param {PWSTR} pszPathNew 
     * @param {BOOL} bReplaceIfExists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilescache2-renameitemex
     */
    RenameItemEx(pszPathOriginal, pszPathNew, bReplaceIfExists) {
        pszPathOriginal := pszPathOriginal is String ? StrPtr(pszPathOriginal) : pszPathOriginal
        pszPathNew := pszPathNew is String ? StrPtr(pszPathNew) : pszPathNew

        result := ComCall(20, this, "ptr", pszPathOriginal, "ptr", pszPathNew, "int", bReplaceIfExists, "HRESULT")
        return result
    }
}
