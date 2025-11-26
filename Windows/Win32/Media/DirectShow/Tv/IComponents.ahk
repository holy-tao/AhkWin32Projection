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
     * The get_Count method gets the number of Component objects in the collection.
     * @returns {Integer} Pointer to a variable of type <b>long</b> that receives the number of components.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponents-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * The get__NewEnum enumeration method supports For...Each loops in Automation clients.
     * @returns {IEnumVARIANT} Address of an <b>IEnumVARIANT</b> interface pointer that will receive the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponents-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * The EnumComponents method returns an enumerator for the components in the collection.
     * @returns {IEnumComponents} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumcomponents">IEnumComponents</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponents-enumcomponents
     */
    EnumComponents() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumComponents(ppNewEnum)
    }

    /**
     * The get_Item method enables the caller to access a component by index.
     * @param {VARIANT} Index Variable of type <b>VARIANT</b> specifying the zero-based index in the collection.
     * @returns {IComponent} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponent">IComponent</a> interface pointer that will receive the <b>Component</b> object at the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponents-get_item
     */
    get_Item(Index) {
        result := ComCall(10, this, "ptr", Index, "ptr*", &ppComponent := 0, "HRESULT")
        return IComponent(ppComponent)
    }

    /**
     * The Add method adds a Component object to the collection.
     * @param {IComponent} Component Pointer to the <b>Component</b> object to be added.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that will receive the index of the <b>Component</b> object after it has been added.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponents-add
     */
    Add(Component) {
        NewIndex := VARIANT()
        result := ComCall(11, this, "ptr", Component, "ptr", NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * The Remove method removes a Component object from the collection.
     * @param {VARIANT} Index Variable of type <b>VARIANT</b> that specifies the index number of the <b>Component</b> object to be removed.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponents-remove
     */
    Remove(Index) {
        result := ComCall(12, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the collection.
     * @returns {IComponents} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponents">IComponents</a> interface pointer that will be set to the new <b>Components</b> object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponents-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &NewList := 0, "HRESULT")
        return IComponents(NewList)
    }

    /**
     * The put_Item method inserts a component into the collection, replacing the item that is identified by the specified index.
     * @param {VARIANT} Index Specifies the index to assign to the component. This parameter is a value of type <b>VARIANT</b>.
     * @param {IComponent} ppComponent Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponent">IComponent</a> interface of the component object. The method creates a clone of the component and inserts the clone into the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponents-put_item
     */
    put_Item(Index, ppComponent) {
        result := ComCall(14, this, "ptr", Index, "ptr", ppComponent, "HRESULT")
        return result
    }
}
