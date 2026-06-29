#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that unpins an application shortcut from the Start menu or the taskbar.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Windows provides an implementation of this interface as CLSID_StartMenuPin. Third parties do not provide their own implementation.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Any shortcut installed by an application might have been subsequently pinned by the user, and there is no way for an application to know this. Therefore, we recommend that, during uninstallation, all applications call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-istartmenupinnedlist-removefromlist">IStartMenuPinnedList::RemoveFromList</a> on each shortcut they installed.
 * 
 * 
 * 
 * Note that <b>IStartMenuPinnedList</b> does not remove the shortcuts themselves, it only unpins them. Applications first call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-istartmenupinnedlist-removefromlist">IStartMenuPinnedList::RemoveFromList</a> on a shortcut, then delete that shortcut.
 * 
 * <h3><a id="Compatibility"></a><a id="compatibility"></a><a id="COMPATIBILITY"></a>Compatibility</h3>
 * In Windows 8, the Start screen replaces the legacy Start menu. CLSID_StartMenuPin and <b>IStartMenuPinnedList</b> are present in Windows 8 to provide backward compatibility with existing applications, but they do not affect <a href="https://docs.microsoft.com/previous-versions/windows/apps/hh761490(v=win.10)">tiles</a> pinned to the Windows 8 Start screen. CLSID_StartMenuPin and <b>IStartMenuPinnedList</b> do continue to impact items pinned to the Windows 8 desktop taskbar.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-istartmenupinnedlist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IStartMenuPinnedList extends IUnknown {
    /**
     * The interface identifier for IStartMenuPinnedList
     * @type {Guid}
     */
    static IID := Guid("{4cd19ada-25a5-4a32-b3b7-347bee5be36b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStartMenuPinnedList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RemoveFromList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStartMenuPinnedList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Windows Vista:\_Removes an item from the Start menu pinned list, which is the list in the upper left position of the Start menu.
     * @remarks
     * Because an application cannot know if any of its installed shortcuts have been pinned, this method should be called on any application shortcut being removed from the system. This includes shortcuts placed on the desktop during installation and those added to the <b>Start</b> menu's <b>All Programs</b> list.
     * 
     * It is recommended that all applications use this method to clean up their pinned items during their uninstallation process. Unpinning the application shortcut is not required, but it is strongly recommended for reliability.
     * 
     * This method does not remove the original shortcut represented by <i>pitem</i>. It removes its pinned representation from the <b>Start</b> menu and/or taskbar. Once an item has been removed (unpinned) through this method, then the application can delete the original shortcut.
     * 
     * If an item is pinned to both the <b>Start</b> menu and the taskbar, one call to this method removes it from both locations.
     * 
     * <div class="alert"><b>Note</b>  If your application is using the Windows Installer (MSI) framework to perform the uninstallation, you do not need to call this method explicitly; MSI will make the call to unpin the shortcuts for you.</div>
     * <div> </div>
     * @param {IShellItem} pitem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object that represents the item to unpin.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * <ul>
     * <li>Returns S_OK if the item was successfully removed from the list of pinned items and/or the taskbar.</li>
     * <li>Returns S_OK if the item was not pinned at all.</li>
     * <li>Returns a standard error code otherwise.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istartmenupinnedlist-removefromlist
     */
    RemoveFromList(pitem) {
        result := ComCall(3, this, "ptr", pitem, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStartMenuPinnedList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RemoveFromList := CallbackCreate(GetMethod(implObj, "RemoveFromList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RemoveFromList)
    }
}
