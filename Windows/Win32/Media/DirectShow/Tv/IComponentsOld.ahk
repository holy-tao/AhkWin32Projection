#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppNewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppNewEnum) {
        result := ComCall(8, this, "ptr*", ppNewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumComponents>} ppNewEnum 
     * @returns {HRESULT} 
     */
    EnumComponents(ppNewEnum) {
        result := ComCall(9, this, "ptr*", ppNewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<IComponent>} ppComponent 
     * @returns {HRESULT} 
     */
    get_Item(Index, ppComponent) {
        result := ComCall(10, this, "ptr", Index, "ptr*", ppComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IComponent} Component 
     * @param {Pointer<VARIANT>} NewIndex 
     * @returns {HRESULT} 
     */
    Add(Component, NewIndex) {
        result := ComCall(11, this, "ptr", Component, "ptr", NewIndex, "HRESULT")
        return result
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
     * @param {Pointer<IComponents>} NewList 
     * @returns {HRESULT} 
     */
    Clone(NewList) {
        result := ComCall(13, this, "ptr*", NewList, "HRESULT")
        return result
    }
}
