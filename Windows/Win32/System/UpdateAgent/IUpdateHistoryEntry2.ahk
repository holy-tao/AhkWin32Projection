#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICategoryCollection.ahk
#Include .\IUpdateHistoryEntry.ahk

/**
 * Represents the recorded history of an update.
 * @remarks
 * 
 * The <b>IUpdateHistoryEntry2</b> interface  may require you to update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatehistoryentry2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateHistoryEntry2 extends IUpdateHistoryEntry{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateHistoryEntry2
     * @type {Guid}
     */
    static IID => Guid("{c2bfb780-4539-4132-ab8c-0a8772013ab6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Categories"]

    /**
     * @type {ICategoryCollection} 
     */
    Categories {
        get => this.get_Categories()
    }

    /**
     * 
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories
     */
    get_Categories() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }
}
