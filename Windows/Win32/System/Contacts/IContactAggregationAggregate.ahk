#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContactAggregationContactCollection.ahk
#Include .\IContactAggregationGroupCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationAggregate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationAggregate
     * @type {Guid}
     */
    static IID => Guid("{7ed1c814-cd30-43c8-9b8d-2e489e53d54b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Save", "GetComponentItems", "Link", "get_Groups", "get_AntiLink", "put_AntiLink", "get_FavoriteOrder", "put_FavoriteOrder", "get_Id"]

    /**
     * @type {PWSTR} 
     */
    AntiLink {
        get => this.get_AntiLink()
        set => this.put_AntiLink(value)
    }

    /**
     * @type {Integer} 
     */
    FavoriteOrder {
        get => this.get_FavoriteOrder()
        set => this.put_FavoriteOrder(value)
    }

    /**
     * @type {PWSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * The SaveBookmark method saves the current disc position and state of the MSWebDVD object so the user can return to the same place later.
     * @remarks
     * A bookmark is a snapshot of the DVD Navigator's current state. This includes information such as where it is playing on the disc, and which audio and subpictures streams are selected. By saving a bookmark, the user can close the application, shut down the computer, and come back later to continue viewing the disc right where he or she left off, with all settings just as they were before. Only one bookmark can be saved at any given time. When you call `SaveBookmark`, the old bookmark is overwritten.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/savebookmark-method
     */
    Save() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IContactAggregationContactCollection} 
     */
    GetComponentItems() {
        result := ComCall(4, this, "ptr*", &pComponentItems := 0, "HRESULT")
        return IContactAggregationContactCollection(pComponentItems)
    }

    /**
     * Registers a window class that allows for the SysLink common control to be used in a window.
     * @remarks
     * This function does not have an associated header or library file so it must be called by ordinal value. Call [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) with the DLL name Shell32.dll to obtain a module handle. Then call [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) with that module handle and the ordinal number 258 to use this function.
     * 
     * Use [**LinkWindow\_UnregisterClass**](linkwindow-unregisterclass.md) to unregister the class after use.
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} This function has no parameters.
     * 
     * 
     * Type: **BOOL**
     * 
     * Returns **TRUE** if registration was successful; **FALSE** otherwise.
     * @see https://learn.microsoft.com/windows/win32/shell/linkwindow-registerclass
     */
    Link(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IContactAggregationGroupCollection} 
     */
    get_Groups(options) {
        result := ComCall(6, this, "int", options, "ptr*", &ppGroups := 0, "HRESULT")
        return IContactAggregationGroupCollection(ppGroups)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_AntiLink() {
        result := ComCall(7, this, "ptr*", &ppAntiLink := 0, "HRESULT")
        return ppAntiLink
    }

    /**
     * 
     * @param {PWSTR} pAntiLink 
     * @returns {HRESULT} 
     */
    put_AntiLink(pAntiLink) {
        pAntiLink := pAntiLink is String ? StrPtr(pAntiLink) : pAntiLink

        result := ComCall(8, this, "ptr", pAntiLink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FavoriteOrder() {
        result := ComCall(9, this, "uint*", &pFavoriteOrder := 0, "HRESULT")
        return pFavoriteOrder
    }

    /**
     * 
     * @param {Integer} favoriteOrder 
     * @returns {HRESULT} 
     */
    put_FavoriteOrder(favoriteOrder) {
        result := ComCall(10, this, "uint", favoriteOrder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(11, this, "ptr*", &ppItemId := 0, "HRESULT")
        return ppItemId
    }
}
