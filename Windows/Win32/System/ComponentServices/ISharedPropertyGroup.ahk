#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISharedProperty.ahk" { ISharedProperty }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Used to create and access the shared properties in a shared property group.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isharedpropertygroup
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ISharedPropertyGroup extends IDispatch {
    /**
     * The interface identifier for ISharedPropertyGroup
     * @type {Guid}
     */
    static IID := Guid("{2a005c07-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The class identifier for SharedPropertyGroup
     * @type {Guid}
     */
    static CLSID := Guid("{2a005c0b-a5de-11cf-9e66-00aa00a3f464}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISharedPropertyGroup interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreatePropertyByPosition : IntPtr
        get_PropertyByPosition   : IntPtr
        CreateProperty           : IntPtr
        get_Property             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISharedPropertyGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new shared property with the specified index.
     * @remarks
     * When you create a shared property, its value is set to the default, which is a VT_I4 VARIANT with a value of 0.
     * 
     * 
     * 
     * If you create a <a href="https://docs.microsoft.com/windows/desktop/cossdk/sharedproperty">SharedProperty</a> object with the <b>CreatePropertyByPosition</b> method, you can access that property only by using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_propertybyposition">get_PropertyByPosition</a> method. You cannot assign a string name to the same property and then access it by using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_property">get_Property</a> method. Accessing a property by position is faster than accessing a property by using a string name because it requires less overhead.
     * 
     * The same shared property group can contain some <a href="https://docs.microsoft.com/windows/desktop/cossdk/sharedproperty">SharedProperty</a> objects that are identified by position and others that are identified by name.
     * @param {Integer} Index The numeric index within the <a href="https://docs.microsoft.com/windows/desktop/cossdk/sharedpropertygroup">SharedPropertyGroup</a> object by which the new property is referenced. You can use this index later to retrieve the shared property with the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_propertybyposition">get_PropertyByPosition</a> method.
     * @param {Pointer<VARIANT_BOOL>} fExists A reference to a Boolean value. If <i>fExists</i> is set to VARIANT_TRUE on return from this method, the shared property specified by <i>Index</i> existed prior to this call. If it is set to VARIANT_FALSE, the property was created by this call.
     * @param {Pointer<ISharedProperty>} ppProp A reference to a shared property object identified by the numeric index passed in the <i>Index</i> parameter, or <b>NULL</b> if an error is encountered.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroup-createpropertybyposition
     */
    CreatePropertyByPosition(Index, fExists, ppProp) {
        fExistsMarshal := fExists is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "int", Index, fExistsMarshal, fExists, ISharedProperty.Ptr, ppProp, "HRESULT")
        return result
    }

    /**
     * Retrieves a reference to an existing shared property with the specified index.
     * @param {Integer} Index The numeric index that was used to create the shared property that is retrieved.
     * @returns {ISharedProperty} A reference to the shared property specified in the <i>Index</i> parameter, or <b>NULL</b> if the property does not exist.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_propertybyposition
     */
    get_PropertyByPosition(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &ppProperty := 0, "HRESULT")
        return ISharedProperty(ppProperty)
    }

    /**
     * Creates a new shared property with the specified name.
     * @remarks
     * When you create a shared property, its value is set to the default, which is a VT_I4 VARIANT with a value of 0.
     * 
     * 
     * 
     * If you create a shared property with the <b>CreateProperty</b> method, you can access that property only by using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_property">get_Property</a> method. You cannot assign a numeric index to the same property and then access it by using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_propertybyposition">get_PropertyByPosition</a> method.
     * 
     * 
     * 
     * The same shared property group can contain some <a href="https://docs.microsoft.com/windows/desktop/cossdk/sharedproperty">SharedProperty</a> objects that are identified by name and others that are identified by position.
     * @param {BSTR} Name The name of the property to create. You can use this name later to obtain a reference to this property by using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_property">get_Property</a> method.
     * @param {Pointer<VARIANT_BOOL>} fExists A reference to a Boolean value that is set to VARIANT_TRUE on return from this method if the shared property specified in the <i>Name</i> parameter existed prior to this call, and VARIANT_FALSE if the property was created by this call.
     * @param {Pointer<ISharedProperty>} ppProp A reference to a <a href="https://docs.microsoft.com/windows/desktop/cossdk/sharedproperty">SharedProperty</a> object with the name specified in the <i>Name</i> parameter, or <b>NULL</b> if an error is encountered.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroup-createproperty
     */
    CreateProperty(Name, fExists, ppProp) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        fExistsMarshal := fExists is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, BSTR, Name, fExistsMarshal, fExists, ISharedProperty.Ptr, ppProp, "HRESULT")
        return result
    }

    /**
     * Retrieves a reference to an existing shared property with the specified name.
     * @param {BSTR} Name The name that was used to create the shared property that is retrieved.
     * @returns {ISharedProperty} A reference to the shared property specified in the <i>Name</i> parameter, or <b>NULL</b> if the property does not exist.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_property
     */
    get_Property(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, BSTR, Name, "ptr*", &ppProperty := 0, "HRESULT")
        return ISharedProperty(ppProperty)
    }

    Query(iid) {
        if (ISharedPropertyGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePropertyByPosition := CallbackCreate(GetMethod(implObj, "CreatePropertyByPosition"), flags, 4)
        this.vtbl.get_PropertyByPosition := CallbackCreate(GetMethod(implObj, "get_PropertyByPosition"), flags, 3)
        this.vtbl.CreateProperty := CallbackCreate(GetMethod(implObj, "CreateProperty"), flags, 4)
        this.vtbl.get_Property := CallbackCreate(GetMethod(implObj, "get_Property"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePropertyByPosition)
        CallbackFree(this.vtbl.get_PropertyByPosition)
        CallbackFree(this.vtbl.CreateProperty)
        CallbackFree(this.vtbl.get_Property)
    }
}
