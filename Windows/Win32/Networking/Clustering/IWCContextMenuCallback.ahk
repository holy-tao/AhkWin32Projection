#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWCContextMenuCallback interface is called by a Failover Cluster Administrator extension to add items to a Failover Cluster Administrator context menu.
 * @remarks
 * 
 * Use the <i>piCallback</i> pointer that you receive when Failover Cluster Administrator calls 
 *      your 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendcontextmenu-addcontextmenuitems">IWEExtendContextMenu::AddContextMenuItems</a> 
 *      method to call the <b>IWCContextMenuCallback</b> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iwccontextmenucallback
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWCContextMenuCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWCContextMenuCallback
     * @type {Guid}
     */
    static IID => Guid("{97dede64-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddExtensionMenuItem"]

    /**
     * Adds a menu item to a Failover Cluster Administrator context menu.
     * @param {BSTR} lpszName Pointer to a null-terminated Unicode string containing the name of the item to be added to the menu. Although 
     *        declared as a <b>BSTR</b>, this parameter is implemented as an 
     *        <b>LPWSTR</b>.
     * @param {BSTR} lpszStatusBarText Pointer to text to display on the status bar when the new item is selected. Although declared as a 
     *        <b>BSTR</b>, this parameter is implemented as an 
     *        <b>LPWSTR</b>.
     * @param {Integer} nCommandID Identifier for the command to be invoked when the menu item is selected. The 
     *        <i>nCommandID</i> parameter must not be set to –1.
     * @param {Integer} nSubmenuCommandID Identifier for a submenu. Submenus are not supported, and the <i>nSubmenuCommandID</i> 
     *        parameter must be zero.
     * @param {Integer} uFlags 
     * @returns {HRESULT} If <b>AddExtensionMenuItem</b> 
     *        is not successful, it can return other <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NOERROR</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>uFlags</i> parameter was set to either <b>MF_OWNERDRAW</b> 
     *          or <b>MF_POPUP</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * <dt>0x8007000e</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating the menu item.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-iwccontextmenucallback-addextensionmenuitem
     */
    AddExtensionMenuItem(lpszName, lpszStatusBarText, nCommandID, nSubmenuCommandID, uFlags) {
        lpszName := lpszName is String ? BSTR.Alloc(lpszName).Value : lpszName
        lpszStatusBarText := lpszStatusBarText is String ? BSTR.Alloc(lpszStatusBarText).Value : lpszStatusBarText

        result := ComCall(3, this, "ptr", lpszName, "ptr", lpszStatusBarText, "uint", nCommandID, "uint", nSubmenuCommandID, "uint", uFlags, "HRESULT")
        return result
    }
}
