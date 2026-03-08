#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDataObject.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IComponent interface a base class for all derived interfaces such as IMPEG2Component and it describes the general characteristics of a component, which is an elementary stream within the program stream.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-icomponent
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IComponent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponent
     * @type {Guid}
     */
    static IID => Guid("{43136eb2-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Notify", "Destroy", "QueryDataObject", "GetResultViewType", "GetDisplayInfo", "CompareObjects"]

    /**
     * The IComponent::Initialize method provides an entry point to the console.
     * @remarks
     * <b>IComponent::Initialize</b> is called when a snap-in is being created. The pointer to IConsole that is passed in is used to make QueryInterface calls to the console for interfaces such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultdata">IResultData</a>. You can also call QueryInterface on the IConsole pointer to get an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole2">IConsole2</a> interface pointer.
     * @param {IConsole} lpConsole A pointer to the console 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole2">IConsole</a> interface.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-initialize
     */
    Initialize(lpConsole) {
        result := ComCall(3, this, "ptr", lpConsole, "HRESULT")
        return result
    }

    /**
     * The IComponent::Notify method notifies the snap-in of actions taken by the user.
     * @remarks
     * For more information, see the individual notifications. The snap-in should return <b>S_FALSE</b> for any notification it does not handle.
     * @param {IDataObject} lpDataObject A pointer to the data object of the currently selected item.
     * @param {Integer} event Identifies an action taken by a user. <b>IComponent::Notify</b> can receive the following notifications:
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-activate">MMCN_ACTIVATE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-add-images">MMCN_ADD_IMAGES</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-btn-click">MMCN_BTN_CLICK</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-column-click">MMCN_COLUMN_CLICK</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-columns-changed">MMCN_COLUMNS_CHANGED</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-contexthelp">MMCN_CONTEXTHELP</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-dblclick">MMCN_DBLCLICK</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-delete">MMCN_DELETE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-deselect-all">MMCN_DESELECT_ALL</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-filterbtn-click">MMCN_FILTERBTN_CLICK</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-filter-change">MMCN_FILTER_CHANGE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-initocx">MMCN_INITOCX</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-listpad">MMCN_LISTPAD</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-minimized">MMCN_MINIMIZED</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-paste">MMCN_PASTE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-print">MMCN_PRINT</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-property-change">MMCN_PROPERTY_CHANGE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-query-paste">MMCN_QUERY_PASTE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-refresh">MMCN_REFRESH</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-rename">MMCN_RENAME</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-restore-view">MMCN_RESTORE_VIEW</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-select">MMCN_SELECT</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-show">MMCN_SHOW</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-snapinhelp">MMCN_SNAPINHELP</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-view-change">MMCN_VIEW_CHANGE</a>
     * @param {LPARAM} arg Depends on the notification type.
     * @param {LPARAM} param3 
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-notify
     */
    Notify(lpDataObject, event, arg, param3) {
        result := ComCall(4, this, "ptr", lpDataObject, "int", event, "ptr", arg, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * The IComponent::Destroy method releases all references to the console that are held by this component.
     * @remarks
     * The snap-in is in the process of being unloaded. It should release all references to the console contained by the component.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Only the console calls this method.
     * @param {Pointer} cookie Reserved for future use.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-destroy
     */
    Destroy(cookie) {
        result := ComCall(5, this, "ptr", cookie, "HRESULT")
        return result
    }

    /**
     * The IComponent::QueryDataObject method returns a data object that can be used to retrieve context information for the specified cookie.
     * @remarks
     * These data objects can be passed to the same snap-in or to extension snap-ins that require them. Some of the MMC interfaces that can use this data object are 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icontextmenuprovider">IContextMenuProvider</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iextendcontextmenu">IExtendContextMenu</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iextendpropertysheet2">IExtendPropertySheet2</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-ipropertysheetprovider">IPropertySheetProvider</a>.
     * @param {Pointer} cookie A value that specifies the unique identifier for which the data object is required. When called for virtual list items, which do not have cookies, this parameter is set to the item list index.
     * @param {Integer} type A value that specifies the data object as one of the following.
     * @returns {IDataObject} A pointer to the address of the returned data object.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-querydataobject
     */
    QueryDataObject(cookie, type) {
        result := ComCall(6, this, "ptr", cookie, "int", type, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * The IComponent::GetResultViewType method determines what the result pane view should be.
     * @remarks
     * The callee (snap-in) allocates the view type string using COM API function 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and the caller (MMC) frees it using 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * 
     * MMC calls <b>GetResultViewType</b> when a 
     *     snap-in scope item is selected. When switching from a standard list view to a custom view, the snap-in must call 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814792(v=vs.85)">IConsole2::SelectScopeItem</a> to reselect the item 
     *     and force MMC to call <b>GetResultViewType</b> 
     *     again. This enables the snap-in to specify the appropriate custom OCX or webpage so that MMC can load 
     *     it. When switching from a custom view to a standard list view, MMC automatically calls 
     *     <b>GetResultViewType</b> and sets the appropriate 
     *     list view type.
     * 
     * Given a Unicode string, the font linking feature determines the best font for that displays that string. For 
     *     example, if you were populating a list view with server names and knew that half would be in Japanese and half in 
     *     Russian, then you would set the font linking view options and MMC would determine an appropriate font. The default 
     *     is not to use font linking, because there is a small performance hit when MMC searches for the appropriate 
     *     font.
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cookies">cookie</a> is a pointer to a structure that contains information 
     *     unique to a specific item. It is passed in through the <b>lParam</b> member of a 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scopedataitem">SCOPEDATAITEM</a> structure.
     * @param {Pointer} cookie A value that specifies the snapin-provided unique identifier for the scope item. For more details about 
     *       cookies in MMC, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cookies">Cookies</a>.
     * @param {Pointer<PWSTR>} ppViewType A pointer to the address of a string that specifies the view to display for the specified 
     *       <i>cookie</i>. The callee (snap-in) allocates the view type string using the COM API function 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and the caller (MMC) frees it using 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * 
     * The string that is returned depends on the view type:
     * @param {Pointer<Integer>} pViewOptions A pointer to the value that provides the console with options specified by the owning snap-in. This value 
     *       can be a combination of the following:
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-getresultviewtype
     */
    GetResultViewType(cookie, ppViewType, pViewOptions) {
        ppViewTypeMarshal := ppViewType is VarRef ? "ptr*" : "ptr"
        pViewOptionsMarshal := pViewOptions is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", cookie, ppViewTypeMarshal, ppViewType, pViewOptionsMarshal, pViewOptions, "HRESULT")
        return result
    }

    /**
     * The IComponent::GetDisplayInfo method retrieves display information for an item in the result pane.
     * @remarks
     * For virtual lists, MMC calls the 
     * GetDisplayInfo method only for items that are currently visible in the result pane. This means that 
     * GetDisplayInfo does not get called for an item until it appears in the result pane.
     * 
     * It is safe to reallocate the memory allocated for members of pResultDataItem only in the following situations:
     * 
     * <ul>
     * <li>The item is deleted.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-destroy">IComponent::Destroy</a> is called.</li>
     * <li>GetDisplayInfo is called again for that item.</li>
     * </ul>
     * @param {Pointer<RESULTDATAITEM>} pResultDataItem A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-resultdataitem">RESULTDATAITEM</a> structure. On input, the mask member specifies the type of data required and the lParam member identifies the item of interest. When called for a virtual list, the nIndex member identifies the desired virtual item and the lParam member is zero.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-getdisplayinfo
     */
    GetDisplayInfo(pResultDataItem) {
        result := ComCall(8, this, "ptr", pResultDataItem, "HRESULT")
        return result
    }

    /**
     * The IComponent::CompareObjects method enables a snap-in to compare two data objects acquired through IComponent::QueryDataObject. Be aware that data objects can be acquired from two different instances of IComponent.
     * @remarks
     * The 
     * IDataObject interface is documented in the Platform Software Development Kit (SDK).
     * @param {IDataObject} lpDataObjectA A pointer to the first object exposing an IDataObject interface that is to be compared.
     * @param {IDataObject} lpDataObjectB A pointer to the second object exposing an IDataObject interface that is to be compared.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent-compareobjects
     */
    CompareObjects(lpDataObjectA, lpDataObjectB) {
        result := ComCall(9, this, "ptr", lpDataObjectA, "ptr", lpDataObjectB, "HRESULT")
        return result
    }
}
