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
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * 
     * @returns {IEnumComponents} 
     */
    EnumComponents() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumComponents(ppNewEnum)
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {IComponent} 
     */
    get_Item(Index) {
        result := ComCall(10, this, "ptr", Index, "ptr*", &ppComponent := 0, "HRESULT")
        return IComponent(ppComponent)
    }

    /**
     * 
     * @param {IComponent} Component 
     * @returns {VARIANT} 
     */
    Add(Component) {
        NewIndex := VARIANT()
        result := ComCall(11, this, "ptr", Component, "ptr", NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(12, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IComponents} 
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &NewList := 0, "HRESULT")
        return IComponents(NewList)
    }
}
