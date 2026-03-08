#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow an application to provide a custom Jump List, including destinations and tasks, for display in the taskbar.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icustomdestinationlist
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
     * @remarks
     * If an application has an explicit AppUserModelID, you must call <b>SetAppID</b> before you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-getremoveddestinations">ICustomDestinationList::GetRemovedDestinations</a>.
     * 
     * After an AppUserModelID is specified through an object's <b>SetAppID</b> method, the AppUserModelID is saved in the object for that object's lifetime, providing that it is not overwritten by another call to <b>SetAppID</b>.
     * 
     * Some applications will not declare an explicit AppUserModelID and should not call this method. In that case, the application's identity is deduced when <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-getremoveddestinations">ICustomDestinationList::GetRemovedDestinations</a> are called. However, there is a performance benefit in avoiding those calculations, so applications that provide custom Jump Lists are encouraged to use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-setcurrentprocessexplicitappusermodelid">explicit AppUserModelIDs</a>.
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
     * This method was called after <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a>. The list-building process is already running with a particular AppUserModelID, either inferred by the system or set through a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-setappid">SetAppID</a> before the call to <b>BeginList</b>. After a list-building operation is in progress, the AppUserModelID cannot be changed until after <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist">CommitList</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-abortlist">AbortList</a> has been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-setappid
     */
    SetAppID(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(3, this, "ptr", pszAppID, "HRESULT")
        return result
    }

    /**
     * Initiates a building session for a custom Jump List.
     * @remarks
     * If an application has an explicit Application User Model ID (AppUserModelID), you must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-setappid">ICustomDestinationList::SetAppID</a> before you call this method.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a> interface retrieved in the <i>ppv</i> parameter represents the same list of removed destinations that is retrieved through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-getremoveddestinations">GetRemovedDestinations</a>. When a new Jump List is being generated, applications must first process any removed destinations. Tracking data for any item in the removed list must be cleared. If an application attempts to include an item through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendcategory">AppendCategory</a> that is present in this removed destinations list, the <b>AppendCategory</b> call fails. This ensures that applications respect the user's choice of removed items. After a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist">CommitList</a> is made with no failed call to <b>AppendCategory</b> due to an attempt to re-add a removed item having been made since <b>BeginList</b>, the removed destinations list is cleared. After that time, a previously removed item can return to the destinations list if the user continues to use the item.
     * 
     * <b>BeginList</b> must be called to initiate the list before any calls are made to populate it through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendcategory">AppendCategory</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendknowncategory">AppendKnownCategory</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-addusertasks">AddUserTasks</a>.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist
     */
    BeginList(pcMinSlots, riid, ppv) {
        pcMinSlotsMarshal := pcMinSlots is VarRef ? "uint*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcMinSlotsMarshal, pcMinSlots, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Defines a custom category and the destinations that it contains, for inclusion in a custom Jump List.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">BeginList</a> before you call this method.
     * 
     * If an application provides a custom category, that application assumes responsibility for populating it. The category contents should still be user-specific and based on the user's history and actions, but by using a custom category an application can determine what it wants to track and what it wants to ignore. For instance, different scenarios could be involved when different application options are chosen. For example, an audio program might elect to include only recently played albums and ignore recently played individual tracks. An application might also simply have a usage-tracking algorithm tailored to its specific use that gives better results than the system's default algorithms.
     * 
     * An application can call <b>AppendCategory</b> more than once in a list-building session to add multiple custom categories. In this case, the categories should be designed so that their contents are mutually exclusive. Each custom category should be built around a specific scenario so that items are not duplicated between them.
     * 
     * Categories in a custom Jump List, including the known <b>Recent</b> or <b>Frequent</b> categories, are shown in the order that they are added, with the most recent items added to the end of the list. If there is insufficient space to show all entries, the last entries in the list disappear off the screen first. Therefore, the most important categories should be added first to ensure their best chance of being always shown. Destinations within the category are shown in the order that they are stored in the <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a> object pointed to by <i>poa</i>.
     * 
     * The user might decide to pin one or more of the destinations provided in the custom category to the Jump List. The list of pinned destinations is not available to the application, but duplication is prevented by the UI so no extra action is required of the application. Visually, a pinned item moves to the <b>Pinned</b> section of the Jump List and disappears from its original location.
     * 
     * A successful call to <b>AppendCategory</b> does not guarantee that those items will be displayed. Any number of destinations added over the value pointed to by the <i>pcMinItems</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a> are not shown. The <b>Pinned</b> category takes priority over all other destination lists. The <b>Pinned</b> list is displayed, then the remaining space is allocated to the other destination lists. It is possible for a user to pin enough destinations to the Jump List to keep any other destinations from displaying. Other factors, such as a reduced screen resolution or an increased font size, can also cause application-provided destinations to be truncated from the list. The application has no way of predicting these situations and is not notified when they occur. The application must just be aware that the possibility exists. Because truncation of the destination list or lists occurs from the bottom up, the application should put its most important categories and destinations at the top of the list so that they have the best chance of being shown.
     * 
     * During a session started with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">BeginList</a> and ending with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist">CommitList</a>, you might call <b>AppendCategory</b> more than once. If any one of those calls fails because of an attempt to add a category that contains an item in the removed items list, the call to <b>CommitList</b> does not clear the removed items list. For the removed items list to be cleared, all calls to <b>AppendCategory</b> in a session must return successfully.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> instances provided through the <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a> pointed to by <i>poa</i> must provide the following:
     * 
     *                 
     * 
     * <ul>
     * <li>Either a pointer to an item identifier list (PIDL) (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setidlist">SetIDList</a>) or the target path (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setpath">SetPath</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setrelativepath">SetRelativePath</a>)</li>
     * <li>Command-line arguments (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setarguments">SetArguments</a>)</li>
     * <li>Icon location  (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-seticonlocation">SetIconLocation</a>)</li>
     * </ul>
     * The display name must be set through the item's <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-title">System.Title (PKEY_Title)</a> property. The property can directly hold the display name or it can be an indirect string representation, such as "@shell32.dll,-1324", to use a stored string. An indirect string enables the item name to be displayed in the user's selected language.
     * 
     * Optionally, the description field (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setdescription">SetDescription</a>) can be set to provide a custom tooltip for the item in the Jump List.
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
     * If the call to <b>AppendCategory</b> attempts to add an item that is in the removed destinations list retrieved by the call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">BeginList</a> that initiated the session, the call to <b>AppendCategory</b> fails.
     * 
     * If <b>AppendCategory</b> attempts to add an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that the application is not registered to handle, the call fails.
     * 
     * <b>AppendCategory</b> can fail if there is a privacy Group Policy or user privacy setting turned on. Custom categories contain user-specific items based on individual usage, which is not allowed under those privacy settings.
     * 
     * A privacy Group Policy or user privacy setting will not cause a failure in any other <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icustomdestinationlist">ICustomDestinationList</a> method. Tasks are not user-specific. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendknowncategory">AppendKnownCategory</a> will not result in the display of the <b>Recent</b> or <b>Frequent</b> categories because they will have no data, but the method call will not return a failure code.
     * 
     * In the case of a failure code in <b>AppendCategory</b> caused by privacy Group Policy or user privacy setting (E_ACCESSDENIED), the application should continue to update tasks and call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist">CommitList</a>.
     * 
     * If no file type registration was found for the associated application, <b>AppendCategory</b> returns HRESULT 0x80040F03. This can result from an application not registering the file type it is trying to add to the Jump List or from a problem in the registration, such as not providing the AppUserModelID when the application is using an explicit AppUserModelID.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendcategory
     */
    AppendCategory(pszCategory, poa) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory

        result := ComCall(5, this, "ptr", pszCategory, "ptr", poa, "HRESULT")
        return result
    }

    /**
     * Specifies that the Frequent or Recent category should be included in a custom Jump List.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a> before you call this method.
     * 
     * The <b>Recent</b> category is shown in a default Jump List, but to show it in a custom Jump List together with custom categories you must explicitly request it through this method.
     * 
     * With both <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendcategory">AppendCategory</a> and <b>AppendKnownCategory</b>, a custom Jump List should be designed to avoid any item appearing in more than one category. If two categories are simply different views on the same data, one of those categories should be removed since it is using Jump List space without contributing to the user's convenience. Duplicates are not hidden by the system except in the case of a pinned destination, in which case that destination is shown in the Pinned category and hidden in all others.
     * 
     * 
     * 
     * The <b>Frequent</b> and <b>Recent</b> categories are likely to contain a degree of overlap and therefore you should not add both categories to a single Jump List. Which of the two is best for your application depends on its nature. An application that generates files, such as Microsoft Word or Microsoft Paint, should use the <b>Recent</b> category as users are most likely to want to return to files that they have recently worked on. An application that is used more for browsing or playback of data created elsewhere should use the <b>Frequent</b> category because the user is more likely to access a greater number of items, many of them only once. In other words, if your application is most likely to access a large number of items only a few times each, which contributes noise to the smaller set of items users want to access many times, then <b>Frequent</b> is the best choice. If your application is more likely to access a smaller number of newer items most of the time, then you should choose <b>Recent</b>.
     * 
     * Categories in a custom Jump List, including the known <b>Recent</b> or <b>Frequent</b> category, are shown in the order that they are added, with the most recently added categories at the bottom of the list.
     * 
     * Any number of destinations added over the value pointed to by the <i>pcMinItems</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a> are not shown.
     * 
     * Empty categories are not shown.
     * 
     * The contents of the <b>Frequent</b> and <b>Recent</b> categories are calculated for each application that uses <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shaddtorecentdocs">SHAddToRecentDocs</a> directly. In some cases of user action, such as opening a file through Windows Explorer or using the common file dialog box to open, save, or create a file, the Shell calls <b>SHAddToRecentDocs</b> on behalf of an application and those calls are also taken into account in the usage statistics. The Shell also calls <b>SHAddToRecentDocs</b> on behalf of the application when a destination is launched from its Jump List. However, it is good practice for the application to explicitly call <b>SHAddToRecentDocs</b> itself even if it is expected that the Shell will make the call. This guarantees that the usage is recorded, and the algorithms for tracking recent or frequent usage will correct for any duplicate calls.
     * @param {Integer} category Type: <b>KNOWNDESTCATEGORY</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. 
     *                 
     *                     
     * 
     * If there is a privacy Group Policy or user privacy setting present, it can affect the result of this method. Categories that contain user-specific items based on individual usage are not allowed under those privacy settings. Due to this, the <b>Recent</b> or <b>Frequent</b> categories added through this method will have no data, and categories with no data are not displayed. However, in that situation, this method call will not result in a failure code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendknowncategory
     */
    AppendKnownCategory(category) {
        result := ComCall(6, this, "int", category, "HRESULT")
        return result
    }

    /**
     * Specifies items to include in the Tasks category of a custom Jump List.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a> before you call this method.
     * 
     * The <b>Tasks</b> category header is always shown in the list by default, unless the category is empty. This header text cannot be changed. It is displayed in the user's selected language.
     * 
     * The <b>Tasks</b> category, even though it always appears as the last category in a Jump List, takes priority over all other categories in the list. This list is filled, and then the remaining space is allocated to the other categories. Unlike other categories, items in the <b>Tasks</b> category cannot be removed or pinned by the user. Applications must balance the value to the user of the tasks in this category against the space needed for other categories.
     * 
     * Tasks should apply to the application as a whole; they are not meant to be specific to an individual window or document. For those more granular contextual tasks, an application can supply them through a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist3-thumbbaraddbuttons">thumbnail toolbar</a>.
     * 
     * <div class="alert"><b>Note</b>  It is strongly recommended that the task list be static. The task list should remain the same regardless of the state or status of the application—these tasks are available even when the application is not running. There is no programmatic prohibition against using <b>AddUserTasks</b> to vary the task list when it is updated, but you should consider that this could confuse the user who does not expect that portion of the Jump List to change. However, if an application does opt to change the state of a task, such as "Sign In" to "Sign Out", it is the responsibility of that application to ensure that the task list is correct and up to date. Also, if the application unexpectedly shuts down, the taskbar will use its last known good version of the task list without calling into the application to request one, leading to the possibility of out of date items.</div>
     * <div> </div>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> instances provided through the <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a> pointed to by <i>poa</i> must provide the following:
     * 
     *                 
     * 
     * <ul>
     * <li>Either a pointer to an item identifier list (PIDL) (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setidlist">SetIDList</a>) or the target path (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setpath">SetPath</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setrelativepath">SetRelativePath</a>)</li>
     * <li>Command-line arguments (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setarguments">SetArguments</a>)</li>
     * <li>Icon location  (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-seticonlocation">SetIconLocation</a>)</li>
     * </ul>
     * The display name must be set through the item's <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-title">System.Title (PKEY_Title)</a> property. The property can directly hold the display name or it can be an indirect string representation, such as "@shell32.dll,-1324", to use a stored string. An indirect string enables the item name to be displayed in the user's selected language.
     * 
     * Optionally, the description field (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-setdescription">SetDescription</a>) can be set to provide a custom tooltip for the item in the Jump List.
     * 
     * A task list can also include separators. These are created by including a blank <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> (this is the single exception to the argument list requirement), and setting its <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-appusermodel-isdestlistseparator">System.AppUserModel.IsDestListSeparator</a> property to <b>TRUE</b> through the <b>IShellLink</b> object's <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface. Any other values in the <b>IShellLink</b> will be ignored. Separators do not take up a full space in the list and are not counted in the number of items in the list. If two separators are provided with no items between them, one of the separators will not be shown. Separators at the beginning or end of the list are also ignored.
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-addusertasks
     */
    AddUserTasks(poa) {
        result := ComCall(7, this, "ptr", poa, "HRESULT")
        return result
    }

    /**
     * Declares that the Jump List initiated by a call to ICustomDestinationList::BeginList is complete and ready for display.
     * @remarks
     * As long as no call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendcategory">AppendCategory</a> in this session failed for attempting to include a removed item, calling <b>CommitList</b> causes the stored list of removed items to be cleared and a new list of removed items to begin.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist
     */
    CommitList() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the current list of destinations that have been removed by the user from the existing Jump List that this custom Jump List is meant to replace.
     * @remarks
     * Items can be removed from the Jump List UI through user action. The item is then marked as removed and is no longer displayed. An application can use this method to tell which items the user has removed so that it knows not to show them in its custom list. For instance, this method should be called when an application is launched, if that application is not going to generate a new list through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a>.
     * 
     * It is strongly recommended that an application clear any destination tracking data when the user elects to remove that destination. If the user accesses that destination again in the future, it may be re-added to the Jump List and can again accumulate data. The same removed destinations list retrieved by this method is retrieved when <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">ICustomDestinationList::BeginList</a> is called. In that case, the application must not immediately attempt to reinsert any removed item or that call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendcategory">AppendCategory</a> will fail. This ensures that the application respects the user's intent to remove the item.
     * 
     * If the application has an explicit Application User Model ID (AppUserModelID), you must call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-setappid">SetAppID</a> before calling this method.
     * 
     * Even if an application calls <b>GetRemovedDestinations</b> and finds an item on the list that has a high probability to be restored to the Jump List sooner than a new custom Jump List is expected to be created, the application should write the Jump List without that item and re-add it to the list only after the user has again accessed it.
     * 
     * An application can add a <b>Recent</b> or <b>Frequent</b> <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-appendknowncategory">known category</a> to its custom Jump List. Items in that category might be in the removed items list even though they were not shown in any custom category. In that case, the application should still clear any usage data for that item if any had been stored.
     * 
     * A call to <b>GetRemovedDestinations</b> does not clear the removed destinations data. This data is needed by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-beginlist">BeginList</a> for its next list generation. The removed destinations data is no longer needed and is cleared after a list generation session is begun by <b>BeginList</b>, continued with no failed calls to <b>AppendCategory</b>, and completed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-commitlist">CommitList</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_IObjectArray.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. This is typically an <a href="https://docs.microsoft.com/windows/desktop/api/objectarray/nn-objectarray-iobjectarray">IObjectArray</a>, which represents a collection of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishelllinka">IShellLink</a> objects that represent the items in the list of removed destinations.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-getremoveddestinations
     */
    GetRemovedDestinations(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Deletes a custom Jump List for a specified application.
     * @remarks
     * There are several instances where this method should be called, including:
     *             
     *                 
     * 
     * <ul>
     * <li>When the application is uninstalled.</li>
     * <li>When the user clears history from within the application.</li>
     * <li>When the user disables destination tracking in the application's Settings or Options pages.</li>
     * </ul>
     * This method should not be called when an application is updating a custom destination list. It is used only to completely clear the list during an uninstall operation, or if the application provides an option for the user to turn off the list.
     * 
     * After the custom Jump List has been removed, a standard Jump List generated from system-generated data for recently used items is shown. If no such data has been collected or if the information has been cleared through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iapplicationdestinations-removealldestinations">RemoveAllDestinations</a>, the Jump List might contain only its minimum, always present content: standard tasks to pin or unpin, launch a new instance of the application, or close windows.
     * @param {PWSTR} pszAppID Type: <b>LPCWSTR</b>
     * 
     * A pointer to the AppUserModelID of the process whose taskbar button representation displays the custom Jump List. In the beta release of Windows 7, this AppUserModelID must be explicitly provided because this method is intended to be called from an uninstaller, which runs in a separate process. Because it is in a separate process, the system cannot reliably deduce the AppUserModelID. This restriction is expected to be removed in later releases.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-deletelist
     */
    DeleteList(pszAppID) {
        pszAppID := pszAppID is String ? StrPtr(pszAppID) : pszAppID

        result := ComCall(10, this, "ptr", pszAppID, "HRESULT")
        return result
    }

    /**
     * Discontinues a Jump List building session initiated by ICustomDestinationList::BeginList without committing any changes.
     * @remarks
     * This method allows an application to use a single <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icustomdestinationlist">ICustomDestinationList</a> object for many transactions, because a session can be terminated without committing any new data or destroying the previously stored list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icustomdestinationlist-abortlist
     */
    AbortList() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
