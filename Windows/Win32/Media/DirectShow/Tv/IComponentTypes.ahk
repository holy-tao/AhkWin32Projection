#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IComponentType.ahk" { IComponentType }
#Import "..\..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IEnumComponentTypes.ahk" { IEnumComponentTypes }

/**
 * The IComponentTypes interface is implemented on ComponentTypes objects and contains methods that enable applications to enumerate, add, remove and retrieve individual ComponentType objects. All ComponentTypes objects also support IPersistPropertyBag.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponentTypes)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-icomponenttypes
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IComponentTypes extends IDispatch {
    /**
     * The interface identifier for IComponentTypes
     * @type {Guid}
     */
    static IID := Guid("{0dc13d4a-0313-11d3-9d8e-00c04f72d980}")

    /**
     * The class identifier for ComponentTypes
     * @type {Guid}
     */
    static CLSID := Guid("{a1a2b1c4-0e3a-11d3-9d8e-00c04f72d980}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComponentTypes interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count          : IntPtr
        get__NewEnum       : IntPtr
        EnumComponentTypes : IntPtr
        get_Item           : IntPtr
        put_Item           : IntPtr
        Add                : IntPtr
        Remove             : IntPtr
        Clone              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComponentTypes.Vtbl()
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
     * The get_Count method returns the number of component types in the collection.
     * @returns {Integer} Receives the number of items in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * The get__NewEnum enumeration method supports For...Each loops in Automation clients.
     * @remarks
     * This method is provided to enable scripting and Visual Basic applications to iterate through the collection in a <c>For...Each</c> loop. C++ applications should use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-icomponenttypes-enumcomponenttypes">IComponentTypes::EnumComponentTypes</a> method.
     * 
     * The returned <b>IEnumVARIANT</b> interface is not thread safe, because it is intended primarily for use by Automation clients. Clients should not call methods on the interface from more than one thread.
     * @returns {IEnumVARIANT} Address of an interface pointer to an <b>IEnumVARIANT</b> object that will receive the new collection.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * The EnumComponentTypes method returns an IEnumComponentTypes enumerator for all component types in the collection.
     * @returns {IEnumComponentTypes} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumcomponenttypes">IEnumComponentTypes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-enumcomponenttypes
     */
    EnumComponentTypes() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumComponentTypes(ppNewEnum)
    }

    /**
     * The get_Item method retrieves the IComponentType interface pointer at the specified index number.
     * @param {VARIANT} Index The index number of the object to retrieve.
     * @returns {IComponentType} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-get_item
     */
    get_Item(Index) {
        result := ComCall(10, this, VARIANT, Index, "ptr*", &_ComponentType := 0, "HRESULT")
        return IComponentType(_ComponentType)
    }

    /**
     * The put_Item method replaces the ComponentType object at the specified index with a new ComponentType object.
     * @param {VARIANT} Index Index number of the item to be replaced.
     * @param {IComponentType} _ComponentType Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> object that will be inserted into the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-put_item
     */
    put_Item(Index, _ComponentType) {
        result := ComCall(11, this, VARIANT, Index, "ptr", _ComponentType, "HRESULT")
        return result
    }

    /**
     * The Add method adds a new ComponentType object to the collection.
     * @param {IComponentType} _ComponentType Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> object that will be added to the collection.
     * @returns {VARIANT} The index number of the component type after it has been added to the collection.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-add
     */
    Add(_ComponentType) {
        NewIndex := VARIANT()
        result := ComCall(12, this, "ptr", _ComponentType, VARIANT.Ptr, NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * The Remove method removes the ComponentType object at the specified index number.
     * @param {VARIANT} Index Index of the item to remove.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-remove
     */
    Remove(Index) {
        result := ComCall(13, this, VARIANT, Index, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the collection.
     * @returns {IComponentTypes} Address of an <b>IComponentTypes</b> interface pointer that will be set to the new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componenttypes-object">ComponentTypes</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttypes-clone
     */
    Clone() {
        result := ComCall(14, this, "ptr*", &NewList := 0, "HRESULT")
        return IComponentTypes(NewList)
    }

    Query(iid) {
        if (IComponentTypes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.EnumComponentTypes := CallbackCreate(GetMethod(implObj, "EnumComponentTypes"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.put_Item := CallbackCreate(GetMethod(implObj, "put_Item"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.EnumComponentTypes)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.put_Item)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clone)
    }
}
