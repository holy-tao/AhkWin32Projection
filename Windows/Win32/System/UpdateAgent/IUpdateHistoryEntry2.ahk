#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateHistoryEntry.ahk" { IUpdateHistoryEntry }
#Import ".\ICategoryCollection.ahk" { ICategoryCollection }

/**
 * Represents the recorded history of an update. (IUpdateHistoryEntry2)
 * @remarks
 * The <b>IUpdateHistoryEntry2</b> interface  may require you to update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatehistoryentry2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateHistoryEntry2 extends IUpdateHistoryEntry {
    /**
     * The interface identifier for IUpdateHistoryEntry2
     * @type {Guid}
     */
    static IID := Guid("{c2bfb780-4539-4132-ab8c-0a8772013ab6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateHistoryEntry2 interfaces
    */
    struct Vtbl extends IUpdateHistoryEntry.Vtbl {
        get_Categories : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateHistoryEntry2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ICategoryCollection} 
     */
    Categories {
        get => this.get_Categories()
    }

    /**
     * Gets a collection of the update categories to which an update belongs.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface  may require you to update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
     * 
     * The information that this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, WUA uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language that  the provider of the  update recommends.
     * 
     * Because there is a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_categories">Categories</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface and a <b>Categories</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a> interface, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depends on the WUA object that owns the <b>ICategory</b> interface. If the <b>ICategory</b> interface is returned from the <b>Categories</b> property of <b>IUpdate</b>, it follows the localization rules of <b>IUpdate</b>. If the <b>ICategory</b> interface is returned from the <b>Categories</b> property of <b>IUpdateHistoryEntry2</b>, it follows the localization rules of <b>IUpdateHistoryEntry2</b>.
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories
     */
    get_Categories() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    Query(iid) {
        if (IUpdateHistoryEntry2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Categories := CallbackCreate(GetMethod(implObj, "get_Categories"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Categories)
    }
}
