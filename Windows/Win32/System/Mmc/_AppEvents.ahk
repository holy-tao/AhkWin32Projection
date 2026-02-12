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
     * @param {_Application} Application_ 
     * @returns {HRESULT} 
     */
    OnQuit(Application_) {
        result := ComCall(7, this, "ptr", Application_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Document} Document_ 
     * @param {BOOL} New 
     * @returns {HRESULT} 
     */
    OnDocumentOpen(Document_, New) {
        result := ComCall(8, this, "ptr", Document_, "int", New, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Document} Document_ 
     * @returns {HRESULT} 
     */
    OnDocumentClose(Document_) {
        result := ComCall(9, this, "ptr", Document_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Document} Document_ 
     * @param {SnapIn} SnapIn_ 
     * @returns {HRESULT} 
     */
    OnSnapInAdded(Document_, SnapIn_) {
        result := ComCall(10, this, "ptr", Document_, "ptr", SnapIn_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Document} Document_ 
     * @param {SnapIn} SnapIn_ 
     * @returns {HRESULT} 
     */
    OnSnapInRemoved(Document_, SnapIn_) {
        result := ComCall(11, this, "ptr", Document_, "ptr", SnapIn_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {View} View_ 
     * @returns {HRESULT} 
     */
    OnNewView(View_) {
        result := ComCall(12, this, "ptr", View_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {View} View_ 
     * @returns {HRESULT} 
     */
    OnViewClose(View_) {
        result := ComCall(13, this, "ptr", View_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {View} View_ 
     * @param {Node} NewOwnerNode 
     * @returns {HRESULT} 
     */
    OnViewChange(View_, NewOwnerNode) {
        result := ComCall(14, this, "ptr", View_, "ptr", NewOwnerNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {View} View_ 
     * @param {Nodes} NewNodes 
     * @returns {HRESULT} 
     */
    OnSelectionChange(View_, NewNodes) {
        result := ComCall(15, this, "ptr", View_, "ptr", NewNodes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {MenuItem} MenuItem_ 
     * @returns {HRESULT} 
     */
    OnContextMenuExecuted(MenuItem_) {
        result := ComCall(16, this, "ptr", MenuItem_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnToolbarButtonClicked() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {View} View_ 
     * @returns {HRESULT} 
     */
    OnListUpdated(View_) {
        result := ComCall(18, this, "ptr", View_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
