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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * 
     * @returns {IEnumComponents} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-enumcomponents
     */
    EnumComponents() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumComponents(ppNewEnum)
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {IComponent} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get_item
     */
    get_Item(Index) {
        result := ComCall(10, this, "ptr", Index, "ptr*", &ppComponent := 0, "HRESULT")
        return IComponent(ppComponent)
    }

    /**
     * 
     * @param {IComponent} Component 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-add
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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-remove
     */
    Remove(Index) {
        result := ComCall(12, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IComponents} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &NewList := 0, "HRESULT")
        return IComponents(NewList)
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
