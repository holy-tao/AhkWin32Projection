#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdateServiceManager2.ahk
#Include .\IUpdateHistoryEntryCollection.ahk
#Include .\IUpdateSession2.ahk

/**
 * Represents a session in which the caller can perform operations that involve updates. For example, this interface represents sessions in which the caller performs a search, download, installation, or uninstallation operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatesession3
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateSession3 extends IUpdateSession2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateSession3
     * @type {Guid}
     */
    static IID => Guid("{918efd1e-b5d8-4c90-8540-aeb9bdc56f9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUpdateServiceManager", "QueryHistory"]

    /**
     * 
     * @returns {IUpdateServiceManager2} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession3-createupdateservicemanager
     */
    CreateUpdateServiceManager() {
        result := ComCall(17, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateServiceManager2(retval)
    }

    /**
     * 
     * @param {BSTR} criteria 
     * @param {Integer} startIndex 
     * @param {Integer} count 
     * @returns {IUpdateHistoryEntryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession3-queryhistory
     */
    QueryHistory(criteria, startIndex, count) {
        criteria := criteria is String ? BSTR.Alloc(criteria).Value : criteria

        result := ComCall(18, this, "ptr", criteria, "int", startIndex, "int", count, "ptr*", &retval := 0, "HRESULT")
        return IUpdateHistoryEntryCollection(retval)
    }
}
