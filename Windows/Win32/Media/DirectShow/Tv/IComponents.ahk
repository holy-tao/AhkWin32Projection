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
     * @param {Pointer<IEnumComponents>} ppNewEnum 
     * @returns {HRESULT} 
     */
    EnumComponents(ppNewEnum) {
        result := ComCall(9, this, "ptr", ppNewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<IComponent>} ppComponent 
     * @returns {HRESULT} 
     */
    get_Item(Index, ppComponent) {
        result := ComCall(10, this, "ptr", Index, "ptr", ppComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponent>} Component 
     * @param {Pointer<VARIANT>} NewIndex 
     * @returns {HRESULT} 
     */
    Add(Component, NewIndex) {
        result := ComCall(11, this, "ptr", Component, "ptr", NewIndex, "int")
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
        result := ComCall(12, this, "ptr", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponents>} NewList 
     * @returns {HRESULT} 
     */
    Clone(NewList) {
        result := ComCall(13, this, "ptr", NewList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<IComponent>} ppComponent 
     * @returns {HRESULT} 
     */
    put_Item(Index, ppComponent) {
        result := ComCall(14, this, "ptr", Index, "ptr", ppComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
