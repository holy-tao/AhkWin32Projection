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
     * 
     * @param {PWSTR} pszPathOriginal 
     * @param {PWSTR} pszPathNew 
     * @param {BOOL} bReplaceIfExists 
     * @returns {HRESULT} 
     */
    RenameItemEx(pszPathOriginal, pszPathNew, bReplaceIfExists) {
        pszPathOriginal := pszPathOriginal is String ? StrPtr(pszPathOriginal) : pszPathOriginal
        pszPathNew := pszPathNew is String ? StrPtr(pszPathNew) : pszPathNew

        result := ComCall(20, this, "ptr", pszPathOriginal, "ptr", pszPathNew, "int", bReplaceIfExists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
