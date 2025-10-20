#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFavoritesNameSpace extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFavoritesNameSpace
     * @type {Guid}
     */
    static IID => Guid("{55136804-b2de-11d1-b9f2-00a0c98bc547}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveSelectionUp", "MoveSelectionDown", "ResetSort", "NewFolder", "Synchronize", "Import", "Export", "InvokeContextMenuCommand", "MoveSelectionTo", "get_SubscriptionsEnabled", "CreateSubscriptionForSelection", "DeleteSubscriptionForSelection", "SetRoot"]

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionUp() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionDown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetSort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NewFolder() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Synchronize() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Import() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Export() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strCommand 
     * @returns {HRESULT} 
     */
    InvokeContextMenuCommand(strCommand) {
        strCommand := strCommand is String ? BSTR.Alloc(strCommand).Value : strCommand

        result := ComCall(14, this, "ptr", strCommand, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionTo() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    get_SubscriptionsEnabled(pBool) {
        result := ComCall(16, this, "ptr", pBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    CreateSubscriptionForSelection(pBool) {
        result := ComCall(17, this, "ptr", pBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    DeleteSubscriptionForSelection(pBool) {
        result := ComCall(18, this, "ptr", pBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFullPath 
     * @returns {HRESULT} 
     */
    SetRoot(bstrFullPath) {
        bstrFullPath := bstrFullPath is String ? BSTR.Alloc(bstrFullPath).Value : bstrFullPath

        result := ComCall(19, this, "ptr", bstrFullPath, "HRESULT")
        return result
    }
}
