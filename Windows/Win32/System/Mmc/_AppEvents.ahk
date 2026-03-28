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
     * @param {_Application} _Application 
     * @returns {HRESULT} 
     */
    OnQuit(_Application) {
        result := ComCall(7, this, "ptr", _Application, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} _Document 
     * @param {BOOL} New 
     * @returns {HRESULT} 
     */
    OnDocumentOpen(_Document, New) {
        result := ComCall(8, this, "ptr", _Document, "int", New, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} _Document 
     * @returns {HRESULT} 
     */
    OnDocumentClose(_Document) {
        result := ComCall(9, this, "ptr", _Document, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} _Document 
     * @param {SnapIn} _SnapIn 
     * @returns {HRESULT} 
     */
    OnSnapInAdded(_Document, _SnapIn) {
        result := ComCall(10, this, "ptr", _Document, "ptr", _SnapIn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Document} _Document 
     * @param {SnapIn} _SnapIn 
     * @returns {HRESULT} 
     */
    OnSnapInRemoved(_Document, _SnapIn) {
        result := ComCall(11, this, "ptr", _Document, "ptr", _SnapIn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @returns {HRESULT} 
     */
    OnNewView(_View) {
        result := ComCall(12, this, "ptr", _View, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @returns {HRESULT} 
     */
    OnViewClose(_View) {
        result := ComCall(13, this, "ptr", _View, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @param {Node} NewOwnerNode 
     * @returns {HRESULT} 
     */
    OnViewChange(_View, NewOwnerNode) {
        result := ComCall(14, this, "ptr", _View, "ptr", NewOwnerNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {View} _View 
     * @param {Nodes} NewNodes 
     * @returns {HRESULT} 
     */
    OnSelectionChange(_View, NewNodes) {
        result := ComCall(15, this, "ptr", _View, "ptr", NewNodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MenuItem} _MenuItem 
     * @returns {HRESULT} 
     */
    OnContextMenuExecuted(_MenuItem) {
        result := ComCall(16, this, "ptr", _MenuItem, "HRESULT")
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
     * @param {View} _View 
     * @returns {HRESULT} 
     */
    OnListUpdated(_View) {
        result := ComCall(18, this, "ptr", _View, "HRESULT")
        return result
    }
}
