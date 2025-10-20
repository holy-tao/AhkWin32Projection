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
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppNewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppNewEnum) {
        result := ComCall(8, this, "ptr", ppNewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumComponentTypes>} ppNewEnum 
     * @returns {HRESULT} 
     */
    EnumComponentTypes(ppNewEnum) {
        result := ComCall(9, this, "ptr", ppNewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<IComponentType>} ComponentType 
     * @returns {HRESULT} 
     */
    get_Item(Index, ComponentType) {
        result := ComCall(10, this, "ptr", Index, "ptr", ComponentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<IComponentType>} ComponentType 
     * @returns {HRESULT} 
     */
    put_Item(Index, ComponentType) {
        result := ComCall(11, this, "ptr", Index, "ptr", ComponentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponentType>} ComponentType 
     * @param {Pointer<VARIANT>} NewIndex 
     * @returns {HRESULT} 
     */
    Add(ComponentType, NewIndex) {
        result := ComCall(12, this, "ptr", ComponentType, "ptr", NewIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(13, this, "ptr", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponentTypes>} NewList 
     * @returns {HRESULT} 
     */
    Clone(NewList) {
        result := ComCall(14, this, "ptr", NewList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
