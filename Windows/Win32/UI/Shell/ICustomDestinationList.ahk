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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAppID", "BeginList", "AppendCategory", "AppendKnownCategory", "AddUserTasks", "CommitList", "GetRemovedDestinations", "DeleteList", "AbortList"]

    /**
     * Specifies a unique Application User Model ID (AppUserModelID) for the application whose taskbar button will hold the custom Jump List built through the methods of this interface. This method is optional.
     * @param {PWSTR} pszAppID Type: <b>LPCWSTR</b>
     * 
     * A pointer to the AppUserModelID of the process or application whose taskbar representation receives the Jump List.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called after <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a>. The list-building process is already running with a particular AppUserModelID, either inferred by the system or set through a call to <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-setappid">SetAppID</a> before the call to <b>BeginList</b>. After a list-building operation is in progress, the AppUserModelID cannot be changed until after <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist">CommitList</a> or <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-abortlist">AbortList</a> has been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-setappid
     */
    SetAppID(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(3, this, "ptr", pszAppID, "HRESULT")
        return result
    }

    /**
     * Initiates a building session for a custom Jump List.
     * @param {Pointer<Integer>} pcMinSlots Type: <b>UINT*</b>
     * 
     * A pointer that, when this method returns, points to the current user setting for the <b>Number of recent items to display in Jump Lists</b> option in the <b>Taskbar and Start Menu Properties</b> window. The default value is 10. This is the maximum number of destinations that will be shown, and it is a total of all destinations, regardless     of category. More destinations can be added, but they will not be shown in the UI.
     * 
     * 
     * 
     * A Jump List will always show at least this many slots—destinations and, if there is room, tasks.
     * 
     * This number does not include separators and section headers as long as the total number of separators and headers does not exceed four. Separators and section headers beyond the first four might reduce the number of destinations displayed if space is constrained. This number does not affect the standard command entries for pinning or unpinning, closing the window, or launching a new instance. It also does not affect tasks or pinned items, the number of which that can be displayed is based on the space available to the Jump List.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of an interface to be retrieved in <i>ppv</i>, typically IID_IObjectArray, that will represent all items currently stored in the list of removed destinations for the application. This information is used to ensure that removed items are not part of the new Jump List.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. This is typically an <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a>, which represents a collection of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> objects that represent the removed items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist
     */
    BeginList(pcMinSlots, riid, ppv) {
        pcMinSlotsMarshal := pcMinSlots is VarRef ? "uint*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcMinSlotsMarshal, pcMinSlots, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Defines a custom category and the destinations that it contains, for inclusion in a custom Jump List.
     * @param {PWSTR} pszCategory Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that contains the display name of the custom category. This string is shown in the category's header in the Jump List. The string can directly hold the display name or it can be an indirect string representation, such as "@shell32.dll,-1324", to use a stored string. An indirect string enables the category header to be displayed in the user's selected language.
     * 
     *                     
     * 
     * <div class="alert"><b>Note</b>  Each custom category must have a unique name. Duplicate category names will cause presentation issues in the Jump List.</div>
     * <div> </div>
     * @param {IObjectArray} poa Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a> that represents one or more <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> objects that represent the destinations in the category. Some destinations in the list might also be represented by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> objects, although less often.
     * 
     *                     
     * 
     * <div class="alert"><b>Note</b>  Any <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> used here must declare an argument list through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setarguments">SetArguments</a>. Adding an <b>IShellLink</b> object with no arguments to a custom category is not supported since a user cannot pin or unpin this type of item from a Jump List, nor can they be added or removed.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     * 
     * 
     * 
     * If the call to <b>AppendCategory</b> attempts to add an item that is in the removed destinations list retrieved by the call to <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">BeginList</a> that initiated the session, the call to <b>AppendCategory</b> fails.
     * 
     * If <b>AppendCategory</b> attempts to add an <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that the application is not registered to handle, the call fails.
     * 
     * <b>AppendCategory</b> can fail if there is a privacy Group Policy or user privacy setting turned on. Custom categories contain user-specific items based on individual usage, which is not allowed under those privacy settings.
     * 
     * A privacy Group Policy or user privacy setting will not cause a failure in any other <a href="/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icustomdestinationlist">ICustomDestinationList</a> method. Tasks are not user-specific. <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendknowncategory">AppendKnownCategory</a> will not result in the display of the <b>Recent</b> or <b>Frequent</b> categories because they will have no data, but the method call will not return a failure code.
     * 
     * In the case of a failure code in <b>AppendCategory</b> caused by privacy Group Policy or user privacy setting (E_ACCESSDENIED), the application should continue to update tasks and call <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist">CommitList</a>.
     * 
     * If no file type registration was found for the associated application, <b>AppendCategory</b> returns HRESULT 0x80040F03. This can result from an application not registering the file type it is trying to add to the Jump List or from a problem in the registration, such as not providing the AppUserModelID when the application is using an explicit AppUserModelID.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendcategory
     */
    AppendCategory(pszCategory, poa) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory

        result := ComCall(5, this, "ptr", pszCategory, "ptr", poa, "HRESULT")
        return result
    }

    /**
     * Specifies that the Frequent or Recent category should be included in a custom Jump List.
     * @param {Integer} category Type: <b>KNOWNDESTCATEGORY</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. 
     *                 
     *                     
     * 
     * If there is a privacy Group Policy or user privacy setting present, it can affect the result of this method. Categories that contain user-specific items based on individual usage are not allowed under those privacy settings. Due to this, the <b>Recent</b> or <b>Frequent</b> categories added through this method will have no data, and categories with no data are not displayed. However, in that situation, this method call will not result in a failure code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendknowncategory
     */
    AppendKnownCategory(category) {
        result := ComCall(6, this, "int", category, "HRESULT")
        return result
    }

    /**
     * Specifies items to include in the Tasks category of a custom Jump List.
     * @param {IObjectArray} poa Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a> that represents one or more <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> (or, more rarely, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>) objects that represent the tasks.
     * 
     *                     
     * 
     * <div class="alert"><b>Note</b>  Any <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> used here must declare an argument list through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setarguments">SetArguments</a>. Adding an <b>IShellLink</b> object with no arguments to a custom category is not supported. A user cannot pin or unpin this type of item from a Jump List, nor can they be added or removed.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-addusertasks
     */
    AddUserTasks(poa) {
        result := ComCall(7, this, "ptr", poa, "HRESULT")
        return result
    }

    /**
     * Declares that the Jump List initiated by a call to ICustomDestinationList::BeginList is complete and ready for display.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist
     */
    CommitList() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the current list of destinations that have been removed by the user from the existing Jump List that this custom Jump List is meant to replace.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_IObjectArray.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. This is typically an <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a>, which represents a collection of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> objects that represent the items in the list of removed destinations.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-getremoveddestinations
     */
    GetRemovedDestinations(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Deletes a custom Jump List for a specified application.
     * @param {PWSTR} pszAppID Type: <b>LPCWSTR</b>
     * 
     * A pointer to the AppUserModelID of the process whose taskbar button representation displays the custom Jump List. In the beta release of Windows 7, this AppUserModelID must be explicitly provided because this method is intended to be called from an uninstaller, which runs in a separate process. Because it is in a separate process, the system cannot reliably deduce the AppUserModelID. This restriction is expected to be removed in later releases.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-deletelist
     */
    DeleteList(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(10, this, "ptr", pszAppID, "HRESULT")
        return result
    }

    /**
     * Discontinues a Jump List building session initiated by ICustomDestinationList::BeginList without committing any changes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icustomdestinationlist-abortlist
     */
    AbortList() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
