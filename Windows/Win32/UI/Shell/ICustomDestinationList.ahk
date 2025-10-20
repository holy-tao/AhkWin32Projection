#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow an application to provide a custom Jump List, including destinations and tasks, for display in the taskbar.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided in Windows as CLSID_DestinationList. This interface is not implemented by third parties.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Jump Lists contain both destination and task lists.
  *             
  *                 
  * 
  * <ul>
  * <li><i>Destinations</i> are items that appear in the <b>Recent</b>, <b>Frequent</b>, or custom categories, based on an individual's usage. Destinations can be files, folders, websites, or other content-based items, but are not necessarily file-backed. Destinations can be thought of as things or nouns. Destinations can be pinned or removed from the Jump List by the user. They are generally represented by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> objects but they can also be <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> objects.</li>
  * <li><i>Tasks</i> are common actions performed in an application that apply to all users of that application regardless of an individual's usage patterns. Tasks can be thought of as actions or verbs. Tasks cannot be pinned or removed. They are represented by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> objects.</li>
  * </ul>
  * 
  * 
  * The taskbar provides each taskbar button with a Jump List. By default, a Jump List contains a <b>Recent</b> category, which is populated automatically for file-based applications through <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shaddtorecentdocs">SHAddToRecentDocs</a> or the common file dialog. To replace the <b>Recent</b> category with the <b>Frequent</b> category or define, add, and populate its own custom categories, an application must call the methods of this interface. The application can also supply its own tasks based on the application's architecture and intended use.
  * 
  * <div class="alert"><b>Note</b>  An application must be a registered handler for a file type for an item of that type to appear in its Jump List. It does not, however, need to be the default handler for that file type.</div>
  * <div> </div>
  * A custom Jump List is intended to present content that the application has deemed significant based on either previous usage of the application or through an action that has indicated that an item is of importance to the user, such as the user adding an item to a Favorites list.
  * 
  * The application must call this object to provide a custom Jump List to the taskbar UI. The system never queries the application for the information.
  * 
  * When an application provides a custom Jump List, it takes on certain responsibilities around that list. Custom categories must be populated in a manner consistent with the intended use of a Jump List. Items in the list must be checked for validity or fail gracefully if they have been deleted. If the user removes an item from the list, that removal must be honored.
  * 
  * A custom Jump List is never truly updated in the sense of changing elements in an existing list. Rather, the old list is replaced with a new list.
  * 
  * The basic sequence of <b>ICustomDestinationList</b> method calls to build and display a custom Jump List is as follows:
  * 
  *                 
  * 
  * <ol>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-setappid">SetAppID</a> (required only if an application provides its own AppUserModelID)</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">BeginList</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendcategory">AppendCategory</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendknowncategory">AppendKnownCategory</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-addusertasks">AddUserTasks</a>, or any combination of those three methods.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist">CommitList</a>
  * </li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icustomdestinationlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICustomDestinationList extends IUnknown{
    /**
     * The interface identifier for ICustomDestinationList
     * @type {Guid}
     */
    static IID => Guid("{6332debf-87b5-4670-90c0-5e57b408a49e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszAppID 
     * @returns {HRESULT} 
     */
    SetAppID(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(3, this, "ptr", pszAppID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcMinSlots 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    BeginList(pcMinSlots, riid, ppv) {
        result := ComCall(4, this, "uint*", pcMinSlots, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszCategory 
     * @param {Pointer<IObjectArray>} poa 
     * @returns {HRESULT} 
     */
    AppendCategory(pszCategory, poa) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory

        result := ComCall(5, this, "ptr", pszCategory, "ptr", poa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @returns {HRESULT} 
     */
    AppendKnownCategory(category) {
        result := ComCall(6, this, "int", category, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectArray>} poa 
     * @returns {HRESULT} 
     */
    AddUserTasks(poa) {
        result := ComCall(7, this, "ptr", poa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CommitList() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetRemovedDestinations(riid, ppv) {
        result := ComCall(9, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAppID 
     * @returns {HRESULT} 
     */
    DeleteList(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(10, this, "ptr", pszAppID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbortList() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
