#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IWEExtendContextMenu interface to extend a Failover Cluster Administrator context menu for a cluster object.
 * @remarks
 * 
  * To add code that executes when your context menu items are selected, implement the 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iweinvokecommand">IWEInvokeCommand</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iweextendcontextmenu
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWEExtendContextMenu extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWEExtendContextMenu
     * @type {Guid}
     */
    static IID => Guid("{97dede65-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddContextMenuItems"]

    /**
     * 
     * @param {IUnknown} piData 
     * @param {IWCContextMenuCallback} piCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iweextendcontextmenu-addcontextmenuitems
     */
    AddContextMenuItems(piData, piCallback) {
        result := ComCall(3, this, "ptr", piData, "ptr", piCallback, "HRESULT")
        return result
    }
}
