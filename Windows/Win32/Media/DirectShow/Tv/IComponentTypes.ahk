#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IComponentTypes interface is implemented on ComponentTypes objects and contains methods that enable applications to enumerate, add, remove and retrieve individual ComponentType objects. All ComponentTypes objects also support IPersistPropertyBag.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponentTypes)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-icomponenttypes
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IComponentTypes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentTypes
     * @type {Guid}
     */
    static IID => Guid("{0dc13d4a-0313-11d3-9d8e-00c04f72d980}")

    /**
     * The class identifier for ComponentTypes
     * @type {Guid}
     */
    static CLSID => Guid("{a1a2b1c4-0e3a-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "EnumComponentTypes", "get_Item", "put_Item", "Add", "Remove", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-get_count
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppNewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-get__newenum
     */
    get__NewEnum(ppNewEnum) {
        result := ComCall(8, this, "ptr*", ppNewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumComponentTypes>} ppNewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-enumcomponenttypes
     */
    EnumComponentTypes(ppNewEnum) {
        result := ComCall(9, this, "ptr*", ppNewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<IComponentType>} ComponentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-get_item
     */
    get_Item(Index, ComponentType) {
        result := ComCall(10, this, "ptr", Index, "ptr*", ComponentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {IComponentType} ComponentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-put_item
     */
    put_Item(Index, ComponentType) {
        result := ComCall(11, this, "ptr", Index, "ptr", ComponentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IComponentType} ComponentType 
     * @param {Pointer<VARIANT>} NewIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-add
     */
    Add(ComponentType, NewIndex) {
        result := ComCall(12, this, "ptr", ComponentType, "ptr", NewIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-remove
     */
    Remove(Index) {
        result := ComCall(13, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IComponentTypes>} NewList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-clone
     */
    Clone(NewList) {
        result := ComCall(14, this, "ptr*", NewList, "HRESULT")
        return result
    }
}
