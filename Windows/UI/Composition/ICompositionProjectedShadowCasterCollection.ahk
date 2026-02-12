#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionProjectedShadowCasterCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionProjectedShadowCasterCollection
     * @type {Guid}
     */
    static IID => Guid("{d2525c0c-e07f-58a3-ac91-37f73ee91740}")

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
     * @param {CompositionProjectedShadowCaster} newCaster 
     * @param {CompositionProjectedShadowCaster} reference_ 
     * @returns {HRESULT} 
     */
    InsertAbove(newCaster, reference_) {
        result := ComCall(7, this, "ptr", newCaster, "ptr", reference_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CompositionProjectedShadowCaster} newCaster 
     * @returns {HRESULT} 
     */
    InsertAtBottom(newCaster) {
        result := ComCall(8, this, "ptr", newCaster, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CompositionProjectedShadowCaster} newCaster 
     * @returns {HRESULT} 
     */
    InsertAtTop(newCaster) {
        result := ComCall(9, this, "ptr", newCaster, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CompositionProjectedShadowCaster} newCaster 
     * @param {CompositionProjectedShadowCaster} reference_ 
     * @returns {HRESULT} 
     */
    InsertBelow(newCaster, reference_) {
        result := ComCall(10, this, "ptr", newCaster, "ptr", reference_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {CompositionProjectedShadowCaster} caster 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(caster) {
        result := ComCall(11, this, "ptr", caster, "int")
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
