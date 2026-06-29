#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumComponents.ahk" { IEnumComponents }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IComponent.ahk" { IComponent }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IComponents interface represents a collection of components.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponents)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-icomponents
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IComponents extends IDispatch {
    /**
     * The interface identifier for IComponents
     * @type {Guid}
     */
    static IID := Guid("{39a48091-fffe-4182-a161-3ff802640e26}")

    /**
     * The class identifier for Components
     * @type {Guid}
     */
    static CLSID := Guid("{809b6661-94c4-49e6-b6ec-3f0f862215aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComponents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count      : IntPtr
        get__NewEnum   : IntPtr
        EnumComponents : IntPtr
        get_Item       : IntPtr
        Add            : IntPtr
        Remove         : IntPtr
        Clone          : IntPtr
        put_Item       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComponents.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * The get__NewEnum enumeration method supports For...Each loops in Automation clients.
     * @remarks
     * This method is provided so that scripting and Visual Basic applications can iterate through the collection in a <c>For...Each</c> loop. C++ applications should use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-icomponents-enumcomponents">IComponents::EnumComponents</a> method.
     * 
     * The returned <b>IEnumVARIANT</b> interface is not thread safe, because it is intended primarily for use by Automation clients. Clients should not call methods on the interface from more than one thread.
     * @returns {IEnumVARIANT} Address of an <b>IEnumVARIANT</b> interface pointer that will receive the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * The EnumComponents method returns an enumerator for the components in the collection.
     * @remarks
     * If the method succeeds, the <b>IEnumComponents</b> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IEnumComponents} Address of a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumcomponents">IEnumComponents</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-enumcomponents
     */
    EnumComponents() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumComponents(ppNewEnum)
    }

    /**
     * The get_Item method enables the caller to access a component by index.
     * @param {VARIANT} Index Variable of type <b>VARIANT</b> specifying the zero-based index in the collection.
     * @returns {IComponent} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponent">IComponent</a> interface pointer that will receive the <b>Component</b> object at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-get_item
     */
    get_Item(Index) {
        result := ComCall(10, this, VARIANT, Index, "ptr*", &ppComponent := 0, "HRESULT")
        return IComponent(ppComponent)
    }

    /**
     * The Add method adds a Component object to the collection.
     * @param {IComponent} _Component Pointer to the <b>Component</b> object to be added.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that will receive the index of the <b>Component</b> object after it has been added.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-add
     */
    Add(_Component) {
        NewIndex := VARIANT()
        result := ComCall(11, this, "ptr", _Component, VARIANT.Ptr, NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * The Remove method removes a Component object from the collection.
     * @param {VARIANT} Index Variable of type <b>VARIANT</b> that specifies the index number of the <b>Component</b> object to be removed.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-remove
     */
    Remove(Index) {
        result := ComCall(12, this, VARIANT, Index, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the collection.
     * @returns {IComponents} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponents">IComponents</a> interface pointer that will be set to the new <b>Components</b> object.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &NewList := 0, "HRESULT")
        return IComponents(NewList)
    }

    /**
     * The put_Item method inserts a component into the collection, replacing the item that is identified by the specified index.
     * @remarks
     * This method allows the client to replace an existing item in the collection.
     * 
     * If the collection contains <i>n</i> items, valid indexes are in the range 0 to <i>n</i>-1. To determine the number of items in the collection, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-icomponents-get_count">get_Count</a>.
     * @param {VARIANT} Index Specifies the index to assign to the component. This parameter is a value of type <b>VARIANT</b>.
     * @param {IComponent} ppComponent Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponent">IComponent</a> interface of the component object. The method creates a clone of the component and inserts the clone into the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponents-put_item
     */
    put_Item(Index, ppComponent) {
        result := ComCall(14, this, VARIANT, Index, "ptr", ppComponent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComponents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.EnumComponents := CallbackCreate(GetMethod(implObj, "EnumComponents"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.put_Item := CallbackCreate(GetMethod(implObj, "put_Item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.EnumComponents)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.put_Item)
    }
}
