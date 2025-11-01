#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _AppEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _AppEvents
     * @type {Guid}
     */
    static IID => Guid("{de46cbdd-53f5-4635-af54-4fe71e923d3f}")

    /**
     * The class identifier for _AppEvents
     * @type {Guid}
     */
    static CLSID => Guid("{de46cbdd-53f5-4635-af54-4fe71e923d3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnQuit", "OnDocumentOpen", "OnDocumentClose", "OnSnapInAdded", "OnSnapInRemoved", "OnNewView", "OnViewClose", "OnViewChange", "OnSelectionChange", "OnContextMenuExecuted", "OnToolbarButtonClicked", "OnListUpdated"]

    /**
     * 
     * @param {_Application} Application 
     * @returns {HRESULT} 
     */
    OnQuit(Application) {
        result := ComCall(7, this, "ptr", Application, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} Document 
     * @param {BOOL} New 
     * @returns {HRESULT} 
     */
    OnDocumentOpen(Document, New) {
        result := ComCall(8, this, "ptr", Document, "int", New, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} Document 
     * @returns {HRESULT} 
     */
    OnDocumentClose(Document) {
        result := ComCall(9, this, "ptr", Document, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} Document 
     * @param {SnapIn} SnapIn 
     * @returns {HRESULT} 
     */
    OnSnapInAdded(Document, SnapIn) {
        result := ComCall(10, this, "ptr", Document, "ptr", SnapIn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} Document 
     * @param {SnapIn} SnapIn 
     * @returns {HRESULT} 
     */
    OnSnapInRemoved(Document, SnapIn) {
        result := ComCall(11, this, "ptr", Document, "ptr", SnapIn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} View 
     * @returns {HRESULT} 
     */
    OnNewView(View) {
        result := ComCall(12, this, "ptr", View, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} View 
     * @returns {HRESULT} 
     */
    OnViewClose(View) {
        result := ComCall(13, this, "ptr", View, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} View 
     * @param {Node} NewOwnerNode 
     * @returns {HRESULT} 
     */
    OnViewChange(View, NewOwnerNode) {
        result := ComCall(14, this, "ptr", View, "ptr", NewOwnerNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} View 
     * @param {Nodes} NewNodes 
     * @returns {HRESULT} 
     */
    OnSelectionChange(View, NewNodes) {
        result := ComCall(15, this, "ptr", View, "ptr", NewNodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MenuItem} MenuItem 
     * @returns {HRESULT} 
     */
    OnContextMenuExecuted(MenuItem) {
        result := ComCall(16, this, "ptr", MenuItem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnToolbarButtonClicked() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} View 
     * @returns {HRESULT} 
     */
    OnListUpdated(View) {
        result := ComCall(18, this, "ptr", View, "HRESULT")
        return result
    }
}
