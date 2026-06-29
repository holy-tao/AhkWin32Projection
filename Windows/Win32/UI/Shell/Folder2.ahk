#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FolderItem.ahk" { FolderItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\Folder.ahk" { Folder }

/**
 * Extends the Folder object to support offline folders.
 * @see https://learn.microsoft.com/windows/win32/shell/folder2-object
 * @namespace Windows.Win32.UI.Shell
 */
export default struct Folder2 extends Folder {
    /**
     * The interface identifier for Folder2
     * @type {Guid}
     */
    static IID := Guid("{f0d2d8ef-3890-11d2-bf8b-00c04fb93661}")

    /**
     * The class identifier for Folder2
     * @type {Guid}
     */
    static CLSID := Guid("{f0d2d8ef-3890-11d2-bf8b-00c04fb93661}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Folder2 interfaces
    */
    struct Vtbl extends Folder.Vtbl {
        get_Self                       : IntPtr
        get_OfflineStatus              : IntPtr
        Synchronize                    : IntPtr
        get_HaveToShowWebViewBarricade : IntPtr
        DismissedWebViewBarricade      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Folder2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FolderItem} 
     */
    Self {
        get => this.get_Self()
    }

    /**
     * @type {Integer} 
     */
    OfflineStatus {
        get => this.get_OfflineStatus()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    HaveToShowWebViewBarricade {
        get => this.get_HaveToShowWebViewBarricade()
    }

    /**
     * 
     * @returns {FolderItem} 
     */
    get_Self() {
        result := ComCall(17, this, "ptr*", &ppfi := 0, "HRESULT")
        return FolderItem(ppfi)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OfflineStatus() {
        result := ComCall(18, this, "int*", &pul := 0, "HRESULT")
        return pul
    }

    /**
     * Synchronizes all offline files in the folder.
     * @remarks
     * This method has no parameters.
     * 
     * 
     * To use this method, the Offline Files feature must be enabled.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder2-synchronize
     */
    Synchronize() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_HaveToShowWebViewBarricade() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &pbHaveToShowWebViewBarricade := 0, "HRESULT")
        return pbHaveToShowWebViewBarricade
    }

    /**
     * Called in response to the web view barricade being dismissed by the user.
     * @remarks
     * An application calls this method after the user dismisses the web view barricade.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/shell/folder2-dismissedwebviewbarricade
     */
    DismissedWebViewBarricade() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (Folder2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Self := CallbackCreate(GetMethod(implObj, "get_Self"), flags, 2)
        this.vtbl.get_OfflineStatus := CallbackCreate(GetMethod(implObj, "get_OfflineStatus"), flags, 2)
        this.vtbl.Synchronize := CallbackCreate(GetMethod(implObj, "Synchronize"), flags, 1)
        this.vtbl.get_HaveToShowWebViewBarricade := CallbackCreate(GetMethod(implObj, "get_HaveToShowWebViewBarricade"), flags, 2)
        this.vtbl.DismissedWebViewBarricade := CallbackCreate(GetMethod(implObj, "DismissedWebViewBarricade"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Self)
        CallbackFree(this.vtbl.get_OfflineStatus)
        CallbackFree(this.vtbl.Synchronize)
        CallbackFree(this.vtbl.get_HaveToShowWebViewBarricade)
        CallbackFree(this.vtbl.DismissedWebViewBarricade)
    }
}
