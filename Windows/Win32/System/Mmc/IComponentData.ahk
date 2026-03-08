#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IComponent.ahk
#Include ..\Com\IDataObject.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IComponentData interface enables MMC to communicate with snap-ins. Similar to the IComponent interface, IComponentData is typically implemented at the document level and is closely associated with items (folders) being displayed in the scope pane.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-icomponentdata
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IComponentData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentData
     * @type {Guid}
     */
    static IID => Guid("{955ab28a-5218-11d0-a985-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "CreateComponent", "Notify", "Destroy", "QueryDataObject", "GetDisplayInfo", "CompareObjects"]

    /**
     * The IComponentData::Initialize method provides an entry point to the console.
     * @remarks
     * <b>IComponentData::Initialize</b> is called when a snap-in is created and has items to enumerate in the scope pane. The pointer to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> that is passed in is used to make <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> calls to the console for interfaces such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole2">IConsole2</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsolenamespace2">IConsoleNamespace2</a>. The snap-in should also call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814791(v=vs.85)">IConsole2::QueryScopeImageList</a> to get the image list for the scope pane and add images to be displayed on the scope pane side.
     * @param {IUnknown} pUnknown A pointer to the console IUnknown interface. This interface pointer can be used to call QueryInterface for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsole2">IConsole2</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iconsolenamespace2">IConsoleNameSpace2</a>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponentdata-initialize
     */
    Initialize(pUnknown) {
        result := ComCall(3, this, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * The IComponentData::CreateComponent method creates an instance of the IComponent that will be associated with this IComponentData interface.
     * @returns {IComponent} A pointer to the location that stores the newly created pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponentdata-createcomponent
     */
    CreateComponent() {
        result := ComCall(4, this, "ptr*", &ppComponent := 0, "HRESULT")
        return IComponent(ppComponent)
    }

    /**
     * The IComponentData::Notify method notifies the snap-in of actions performed by the user.
     * @remarks
     * For more information, see the individual notifications. The snap-in should return <b>S_FALSE</b> for any notification it does not handle.
     * @param {IDataObject} lpDataObject A pointer to the data object of the currently selected item.
     * @param {Integer} event Identifies an action taken by a user. <b>IComponentData::Notify</b> can receive the following notifications:
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-btn-click">MMCN_BTN_CLICK</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-delete">MMCN_DELETE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expandsync">MMCN_EXPANDSYNC</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-preload">MMCN_PRELOAD</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-property-change">MMCN_PROPERTY_CHANGE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-remove-children">MMCN_REMOVE_CHILDREN</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-rename">MMCN_RENAME</a>
     * @param {LPARAM} arg Depends on the notification type.
     * @param {LPARAM} param3 
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponentdata-notify
     */
    Notify(lpDataObject, event, arg, param3) {
        result := ComCall(5, this, "ptr", lpDataObject, "int", event, "ptr", arg, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * The IComponentData::Destroy method releases all references to the console.
     * @remarks
     * The snap-in is in the process of being unloaded. Release all references to the console.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Only the console calls this method.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponentdata-destroy
     */
    Destroy() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The IComponentData::QueryDataObject method returns a data object that can be used to retrieve the context information for the specified cookie.
     * @remarks
     * You can pass these data objects to the same snap-in or to extension snap-ins that require them. Some of the MMC interfaces that can use this data object are 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icontextmenuprovider">IContextMenuProvider</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iextendcontextmenu">IExtendContextMenu</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iextendpropertysheet2">IExtendPropertySheet2</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-ipropertysheetprovider">IPropertySheetProvider</a>.
     * @param {Pointer} cookie A value that specifies the unique identifier for which the data object is required.
     * @param {Integer} type A value that specifies the data object as one of the following:
     * @returns {IDataObject} A pointer to the address of the returned data object.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponentdata-querydataobject
     */
    QueryDataObject(cookie, type) {
        result := ComCall(7, this, "ptr", cookie, "int", type, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * The IComponentData::GetDisplayInfo method retrieves display information for a scope item.
     * @remarks
     * It is safe to reallocate the memory allocated for members of the pScopeDataItem parameter only:
     * 
     * <ul>
     * <li>When the scope item is deleted.</li>
     * <li>When 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponentdata-destroy">IComponentData::Destroy</a> is called.</li>
     * <li>When 
     * GetDisplayInfo is called again for that scope item.</li>
     * </ul>
     * @param {Pointer<SCOPEDATAITEM>} pScopeDataItem A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scopedataitem">SCOPEDATAITEM</a> structure. On input, the structure mask member specifies the type of information required and the lParam member identifies the item of interest.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponentdata-getdisplayinfo
     */
    GetDisplayInfo(pScopeDataItem) {
        result := ComCall(8, this, "ptr", pScopeDataItem, "HRESULT")
        return result
    }

    /**
     * The IComponentData::CompareObjects method enables a snap-in to compare two data objects acquired through QueryDataObject. Be aware that the data objects can be acquired from two different instances of IComponentData.
     * @param {IDataObject} lpDataObjectA A pointer to the first data object exposing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface that is to be compared.
     * @param {IDataObject} lpDataObjectB A pointer to the second data object exposing an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface that is to be compared.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponentdata-compareobjects
     */
    CompareObjects(lpDataObjectA, lpDataObjectB) {
        result := ComCall(9, this, "ptr", lpDataObjectA, "ptr", lpDataObjectB, "HRESULT")
        return result
    }
}
