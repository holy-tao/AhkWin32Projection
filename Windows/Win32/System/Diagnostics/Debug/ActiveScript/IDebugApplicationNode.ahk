#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IEnumDebugApplicationNodes.ahk
#Include .\IDebugApplicationNode.ahk
#Include .\IDebugDocumentProvider.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationNode extends IDebugDocumentProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationNode
     * @type {Guid}
     */
    static IID => Guid("{51973c34-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumChildren", "GetParent", "SetDocumentProvider", "Close", "Attach", "Detach"]

    /**
     * 
     * @returns {IEnumDebugApplicationNodes} 
     */
    EnumChildren() {
        result := ComCall(6, this, "ptr*", &pperddp := 0, "HRESULT")
        return IEnumDebugApplicationNodes(pperddp)
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @returns {IDebugApplicationNode} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(7, this, "ptr*", &pprddp := 0, "HRESULT")
        return IDebugApplicationNode(pprddp)
    }

    /**
     * 
     * @param {IDebugDocumentProvider} pddp 
     * @returns {HRESULT} 
     */
    SetDocumentProvider(pddp) {
        result := ComCall(8, this, "ptr", pddp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugApplicationNode} pdanParent 
     * @returns {HRESULT} 
     */
    Attach(pdanParent) {
        result := ComCall(10, this, "ptr", pdanParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
