#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IEnumComponents.ahk
#Include .\IComponent.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IComponents.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IComponentsOld extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentsOld
     * @type {Guid}
     */
    static IID => Guid("{fcd01846-0e19-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "EnumComponents", "get_Item", "Add", "Remove", "Clone"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * 
     * @returns {IEnumComponents} 
     */
    EnumComponents() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumComponents(ppNewEnum)
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {IComponent} 
     */
    get_Item(Index) {
        result := ComCall(10, this, "ptr", Index, "ptr*", &ppComponent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IComponent(ppComponent)
    }

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {IComponent} Component_ 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(Component_) {
        NewIndex := VARIANT()
        result := ComCall(11, this, "ptr", Component_, "ptr", NewIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NewIndex
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(Index) {
        result := ComCall(12, this, "ptr", Index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clone Method Example (VC++)
     * @returns {IComponents} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &NewList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IComponents(NewList)
    }
}
