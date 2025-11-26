#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that unpins an application shortcut from the Start menu or the taskbar.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-istartmenupinnedlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStartMenuPinnedList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStartMenuPinnedList
     * @type {Guid}
     */
    static IID => Guid("{4cd19ada-25a5-4a32-b3b7-347bee5be36b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemoveFromList"]

    /**
     * Windows Vista:\_Removes an item from the Start menu pinned list, which is the list in the upper left position of the Start menu.
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-istartmenupinnedlist-removefromlist
     */
    RemoveFromList(pitem) {
        result := ComCall(3, this, "ptr", pitem, "HRESULT")
        return result
    }
}
