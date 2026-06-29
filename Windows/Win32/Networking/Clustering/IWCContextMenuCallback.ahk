#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWCContextMenuCallback interface is called by a Failover Cluster Administrator extension to add items to a Failover Cluster Administrator context menu.
 * @remarks
 * Use the <i>piCallback</i> pointer that you receive when Failover Cluster Administrator calls 
 *      your 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendcontextmenu-addcontextmenuitems">IWEExtendContextMenu::AddContextMenuItems</a> 
 *      method to call the <b>IWCContextMenuCallback</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nn-cluadmex-iwccontextmenucallback
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct IWCContextMenuCallback extends IUnknown {
    /**
     * The interface identifier for IWCContextMenuCallback
     * @type {Guid}
     */
    static IID := Guid("{97dede64-fc6b-11cf-b5f5-00a0c90ab505}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWCContextMenuCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddExtensionMenuItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWCContextMenuCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a menu item to a Failover Cluster Administrator context menu.
     * @remarks
     * The <b>AddExtensionMenuItem</b> 
     *      method adds items at the top of the context menu and follows them by a separator. The command identified by 
     *      <i>nCommandID</i> is passed in the <i>nCommandID</i> parameter to the 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweinvokecommand-invokecommand">IWEInvokeCommand::InvokeCommand</a> method 
     *      when the user selects this menu item.
     * 
     * Note that the <b>MF_OWNERDRAW</b> and <b>MF_POPUP</b> flags are not 
     *      supported specifically for the <i>uFlags</i> parameter.
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-administrator">Failover Cluster Administrator</a> extensions call 
     *      <b>AddExtensionMenuItem</b> from 
     *      their 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendcontextmenu-addcontextmenuitems">IWEExtendContextMenu::AddContextMenuItems</a> 
     *      method.
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
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwccontextmenucallback-addextensionmenuitem
     */
    AddExtensionMenuItem(lpszName, lpszStatusBarText, nCommandID, nSubmenuCommandID, uFlags) {
        lpszName := lpszName is String ? BSTR.Alloc(lpszName).Value : lpszName
        lpszStatusBarText := lpszStatusBarText is String ? BSTR.Alloc(lpszStatusBarText).Value : lpszStatusBarText

        result := ComCall(3, this, BSTR, lpszName, BSTR, lpszStatusBarText, "uint", nCommandID, "uint", nSubmenuCommandID, "uint", uFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWCContextMenuCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddExtensionMenuItem := CallbackCreate(GetMethod(implObj, "AddExtensionMenuItem"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddExtensionMenuItem)
    }
}
