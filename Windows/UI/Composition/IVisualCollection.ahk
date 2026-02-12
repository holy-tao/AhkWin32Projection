#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IVisualCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualCollection
     * @type {Guid}
     */
    static IID => Guid("{8b745505-fd3e-4a98-84a8-e949468c6bcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "InsertAbove", "InsertAtBottom", "InsertAtTop", "InsertBelow", "Remove", "RemoveAll"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Visual} newChild 
     * @param {Visual} sibling 
     * @returns {HRESULT} 
     */
    InsertAbove(newChild, sibling) {
        result := ComCall(7, this, "ptr", newChild, "ptr", sibling, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Visual} newChild 
     * @returns {HRESULT} 
     */
    InsertAtBottom(newChild) {
        result := ComCall(8, this, "ptr", newChild, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Visual} newChild 
     * @returns {HRESULT} 
     */
    InsertAtTop(newChild) {
        result := ComCall(9, this, "ptr", newChild, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Visual} newChild 
     * @param {Visual} sibling 
     * @returns {HRESULT} 
     */
    InsertBelow(newChild, sibling) {
        result := ComCall(10, this, "ptr", newChild, "ptr", sibling, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {Visual} child 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(child) {
        result := ComCall(11, this, "ptr", child, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
