#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConsoleNameSpace.ahk

/**
 * The IConsoleNameSpace2 interface is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iconsolenamespace2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsoleNameSpace2 extends IConsoleNameSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsoleNameSpace2
     * @type {Guid}
     */
    static IID => Guid("{255f18cc-65db-11d1-a7dc-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Expand", "AddExtension"]

    /**
     * The IConsoleNameSpace2::Expand method enables the snap-in to expand an item in the namespace without visibly expanding the item in the scope pane.
     * @remarks
     * <b>IConsoleNameSpace2::Expand</b> should be used to expand a specified item for the purpose of enumerating the child items of that item. Be aware that you must call <b>IConsoleNameSpace2::Expand</b> before inserting an item as a child item in the scope pane.
     * 
     * For example, if a snap-in must place a child item beneath a parent item at a specific position (such as the top of a child item list), the snap-in should use this method to expand the item to find the exact position in which to place a child item. The snap-in could also use this method to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-getchilditem">IConsoleNameSpace2::GetChildItem</a> on a child item of an item that has not been expanded (either by a previous call to <b>IConsoleNameSpace2::Expand</b> or by the user clicking the plus sign in the scope pane) to expand that item for the purpose of enumerating its children.
     * 
     * <b>IConsoleNameSpace2::Expand</b> does not visibly expand the item in the tree displayed in the scope pane in the console. A snap-in uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsole2-expand">IConsole2::Expand</a> to visibly expand or collapse an item in the scope pane. This method sends an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a> notification to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a> if and only if the item has not been previously expanded.
     * @param {Pointer} hItem A handle to the item to expand.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace2-expand
     */
    Expand(hItem) {
        result := ComCall(10, this, "ptr", hItem, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::AddExtension method enables the snap-in to add an extension snap-in that dynamically extends the namespace of a selected item.
     * @remarks
     * When a snap-in calls the 
     * AddExtension method, the namespace extension specified by lpClsid extends only the specific instance of the item specified by hItem. Other items of that type are not affected: Calling 
     * AddExtension is not the same as using the snap-in manager to add an extension to a snap-in. By using the snap-in manager to add an extension to a snap-in, the extension is added to all instances of snap-ins of that type.
     * 
     * In addition, the 
     * AddExtension method only works for items that are directly owned by the snap-in making the 
     * AddExtension call. For example, if a snap-in has a namespace extension that adds an item to its namespace, the snap-in cannot call 
     * AddExtension for the item provided by the namespace extension because the snap-in does not own that item.
     * 
     * A common place to add dynamic namespace extensions is in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-expand">MMCN_EXPAND</a> notification handler of the snap-in's 
     * IComponentData object.
     * 
     * <div class="alert"><b>Note</b>  The extension snap-in must be a namespace extension. In addition, the MMC registry entries for the snap-in to be extended, as well as the extension snap-in, must be set correctly.</div>
     * <div> </div>
     * To dynamically add other types of extensions (such as context menus, toolbars, property sheets, or taskpads), the snap-in must add the new clipboard format CCF_MMC_DYNAMIC_EXTENSIONS to the data object for the items you want to extend. The 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-mmc-dynamic-extensions">CCF_MMC_DYNAMIC_EXTENSIONS</a> format uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-smmcobjecttypes">SMMCDynamicExtensions</a> structure. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/dynamic-non-namespace-extensions">Dynamic Non-Namespace Extensions</a>.
     * 
     * If an extension snap-in is intended to be used as a dynamic extension only, that extension snap-in should not be listed in the Available Extensions list box when the primary snap-in is selected in the Snap-in that can be extended box on the snap-in manager's extensions page. To hide an extension in the snap-in manager, add the key "Dynamic Extensions" to the key that represents the node type of the item you want to extend. Then put the CLSIDs of the snap-ins that should only dynamically extend the node type as values under the new key.
     * @param {Pointer} hItem A handle to the item to extend with the snap-in specified by <i>lpClsid</i>.
     * @param {Pointer<Guid>} lpClsid A pointer to the <b>CLSID</b> of the snap-in that will extend the namespace of the item specified by <i>hItem</i>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace2-addextension
     */
    AddExtension(hItem, lpClsid) {
        result := ComCall(11, this, "ptr", hItem, "ptr", lpClsid, "HRESULT")
        return result
    }
}
