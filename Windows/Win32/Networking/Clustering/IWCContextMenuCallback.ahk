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
     * 
     * @param {BSTR} lpszName 
     * @param {BSTR} lpszStatusBarText 
     * @param {Integer} nCommandID 
     * @param {Integer} nSubmenuCommandID 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwccontextmenucallback-addextensionmenuitem
     */
    AddExtensionMenuItem(lpszName, lpszStatusBarText, nCommandID, nSubmenuCommandID, uFlags) {
        lpszName := lpszName is String ? BSTR.Alloc(lpszName).Value : lpszName
        lpszStatusBarText := lpszStatusBarText is String ? BSTR.Alloc(lpszStatusBarText).Value : lpszStatusBarText

        result := ComCall(3, this, "ptr", lpszName, "ptr", lpszStatusBarText, "uint", nCommandID, "uint", nSubmenuCommandID, "uint", uFlags, "HRESULT")
        return result
    }
}
