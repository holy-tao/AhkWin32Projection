#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IEnumComponentTypes.ahk
#Include .\IComponentType.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IComponentTypes.ahk
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
     * The get_Count method returns the number of component types in the collection.
     * @returns {Integer} Receives the number of items in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttypes-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * The get__NewEnum enumeration method supports For...Each loops in Automation clients.
     * @returns {IEnumVARIANT} Address of an interface pointer to an <b>IEnumVARIANT</b> object that will receive the new collection.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttypes-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * The EnumComponentTypes method returns an IEnumComponentTypes enumerator for all component types in the collection.
     * @returns {IEnumComponentTypes} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumcomponenttypes">IEnumComponentTypes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttypes-enumcomponenttypes
     */
    EnumComponentTypes() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumComponentTypes(ppNewEnum)
    }

    /**
     * The get_Item method retrieves the IComponentType interface pointer at the specified index number.
     * @param {VARIANT} Index The index number of the object to retrieve.
     * @returns {IComponentType} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttypes-get_item
     */
    get_Item(Index) {
        result := ComCall(10, this, "ptr", Index, "ptr*", &ComponentType := 0, "HRESULT")
        return IComponentType(ComponentType)
    }

    /**
     * The put_Item method replaces the ComponentType object at the specified index with a new ComponentType object.
     * @param {VARIANT} Index Index number of the item to be replaced.
     * @param {IComponentType} ComponentType Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> object that will be inserted into the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttypes-put_item
     */
    put_Item(Index, ComponentType) {
        result := ComCall(11, this, "ptr", Index, "ptr", ComponentType, "HRESULT")
        return result
    }

    /**
     * The Add method adds a new ComponentType object to the collection.
     * @param {IComponentType} ComponentType Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> object that will be added to the collection.
     * @returns {VARIANT} The index number of the component type after it has been added to the collection.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttypes-add
     */
    Add(ComponentType) {
        NewIndex := VARIANT()
        result := ComCall(12, this, "ptr", ComponentType, "ptr", NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * The Remove method removes the ComponentType object at the specified index number.
     * @param {VARIANT} Index Index of the item to remove.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttypes-remove
     */
    Remove(Index) {
        result := ComCall(13, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the collection.
     * @returns {IComponentTypes} Address of an <b>IComponentTypes</b> interface pointer that will be set to the new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componenttypes-object">ComponentTypes</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttypes-clone
     */
    Clone() {
        result := ComCall(14, this, "ptr*", &NewList := 0, "HRESULT")
        return IComponentTypes(NewList)
    }
}
