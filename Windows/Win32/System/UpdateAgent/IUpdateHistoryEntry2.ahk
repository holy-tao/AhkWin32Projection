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
     * Gets a collection of the update categories to which an update belongs.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface  may require you to update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
     * 
     * The information that this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language that  the provider of the  update recommends.
     * 
     * Because there is a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface and a <b>Categories</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depends on the WUA object that owns the <b>ICategory</b> interface. If the <b>ICategory</b> interface is returned from the <b>Categories</b> property of <b>IUpdate</b>, it follows the localization rules of <b>IUpdate</b>. If the <b>ICategory</b> interface is returned from the <b>Categories</b> property of <b>IUpdateHistoryEntry2</b>, it follows the localization rules of <b>IUpdateHistoryEntry2</b>.
     * 
     * 
     * @returns {ICategoryCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatehistoryentry2-get_categories
     */
    get_Categories() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }
}
