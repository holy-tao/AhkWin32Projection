#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IComponents interface represents a collection of components.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponents)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-icomponents
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IComponents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponents
     * @type {Guid}
     */
    static IID => Guid("{39a48091-fffe-4182-a161-3ff802640e26}")

    /**
     * The class identifier for Components
     * @type {Guid}
     */
    static CLSID => Guid("{809b6661-94c4-49e6-b6ec-3f0f862215aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "EnumComponents", "get_Item", "Add", "Remove", "Clone", "put_Item"]

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get_count
     */
    get_Count(Count) {
        CountMarshal := Count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, CountMarshal, Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppNewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get__newenum
     */
    get__NewEnum(ppNewEnum) {
        result := ComCall(8, this, "ptr*", ppNewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumComponents>} ppNewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-enumcomponents
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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get_item
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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-add
     */
    Add(Component, NewIndex) {
        result := ComCall(11, this, "ptr", Component, "ptr", NewIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-remove
     */
    Remove(Index) {
        result := ComCall(12, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IComponents>} NewList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-clone
     */
    Clone(NewList) {
        result := ComCall(13, this, "ptr*", NewList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {IComponent} ppComponent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-put_item
     */
    put_Item(Index, ppComponent) {
        result := ComCall(14, this, "ptr", Index, "ptr", ppComponent, "HRESULT")
        return result
    }
}
