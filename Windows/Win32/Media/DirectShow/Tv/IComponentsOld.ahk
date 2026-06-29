#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumComponents.ahk" { IEnumComponents }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IComponents.ahk" { IComponents }
#Import "..\..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IComponent.ahk" { IComponent }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IComponentsOld extends IDispatch {
    /**
     * The interface identifier for IComponentsOld
     * @type {Guid}
     */
    static IID := Guid("{fcd01846-0e19-11d3-9d8e-00c04f72d980}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComponentsOld interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count      : IntPtr
        get__NewEnum   : IntPtr
        EnumComponents : IntPtr
        get_Item       : IntPtr
        Add            : IntPtr
        Remove         : IntPtr
        Clone          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComponentsOld.Vtbl()
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
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * 
     * @returns {IEnumComponents} 
     */
    EnumComponents() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumComponents(ppNewEnum)
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {IComponent} 
     */
    get_Item(Index) {
        result := ComCall(10, this, VARIANT, Index, "ptr*", &ppComponent := 0, "HRESULT")
        return IComponent(ppComponent)
    }

    /**
     * 
     * @param {IComponent} _Component 
     * @returns {VARIANT} 
     */
    Add(_Component) {
        NewIndex := VARIANT()
        result := ComCall(11, this, "ptr", _Component, VARIANT.Ptr, NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(12, this, VARIANT, Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IComponents} 
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &NewList := 0, "HRESULT")
        return IComponents(NewList)
    }

    Query(iid) {
        if (IComponentsOld.IID.Equals(iid)) {
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
    }
}
