#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ISharedPropertyGroup.ahk" { ISharedPropertyGroup }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to create shared property groups and to obtain access to existing shared property groups.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isharedpropertygroupmanager
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ISharedPropertyGroupManager extends IDispatch {
    /**
     * The interface identifier for ISharedPropertyGroupManager
     * @type {Guid}
     */
    static IID := Guid("{2a005c0d-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The class identifier for SharedPropertyGroupManager
     * @type {Guid}
     */
    static CLSID := Guid("{2a005c11-a5de-11cf-9e66-00aa00a3f464}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISharedPropertyGroupManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreatePropertyGroup : IntPtr
        get_Group           : IntPtr
        get__NewEnum        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISharedPropertyGroupManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Creates a new shared property group.
     * @remarks
     * The following constants are used to specify the effective isolation mode for a shared property group.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>LockSetGet
     * </td>
     * <td>0</td>
     * <td>The default value. It assures that every get or set operation on a shared property is atomic by locking the property during the call. This ensures that two clients cannot read or write to the same property at the same time, but it does not prevent other clients from concurrently accessing other properties in the same group.
     * </td>
     * </tr>
     * <tr>
     * <td>LockMethod
     * </td>
     * <td>1</td>
     * <td>This value locks all the properties in the shared property group for exclusive use by the caller as long as the caller's current method is executing. This is the appropriate mode to use when there are interdependencies among properties, or in cases where a client may have to update a property immediately after reading it before it can be accessed again.
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  When you set the isolation mode to LockMethod, the Shared Property Manager requires access to the calling object's object context. You cannot use this isolation mode to create a shared property group from within an object's constructor or from a non-COM+ object because the object context is not available during object construction and a base client does not have an object context.</div>
     * <div> </div>
     * The following constants are used to specify the effective release mode for a shared property group.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>Standard
     * </td>
     * <td>0</td>
     * <td>The default value. When all clients have released their references on the property group, the property group is automatically destroyed.
     * </td>
     * </tr>
     * <tr>
     * <td>Process
     * </td>
     * <td>1</td>
     * <td>The property group is not destroyed until the process in which it was created has terminated. Objects that hold references on a property group must still call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on their references.
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  An object should never attempt to pass a shared property group reference to another object. If the reference is passed outside of the object that acquired it, it is no longer a valid reference.</div>
     * <div> </div>
     * @param {BSTR} Name The name of the shared property group to be created.
     * @param {Pointer<Integer>} dwIsoMode The isolation mode for the properties in the new shared property group. See the table of constants in Remarks below. If the value of the <i>fExists</i> parameter is set to VARIANT_TRUE on return from this method, the input value is ignored and the value returned in this parameter is the isolation mode that was assigned when the property group was created.
     * @param {Pointer<Integer>} dwRelMode The release mode for the properties in the new shared property group. See the table of constants in Remarks below. If the value of the <i>fExists</i> parameter is set to VARIANT_TRUE on return from this method, the input value is ignored and the value returned in this parameter is the release mode that was assigned when the property group was created.
     * @param {Pointer<VARIANT_BOOL>} fExists VARIANT_TRUE on return from this method if the shared property group specified in the name parameter existed prior to this call, and VARIANT_FALSE if the property group was created by this call.
     * @param {Pointer<ISharedPropertyGroup>} ppGroup A reference to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-isharedpropertygroup">ISharedPropertyGroup</a>, which is a shared property group identified by the <i>Name</i> parameter, or <b>NULL</b> if an error is encountered.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A reference to the shared property group specified in the <i>Name</i> parameter is returned in the <i>ppGroup</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOCONTEXT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not executing under COM+. A caller must be executing under COM+ to use the Shared Property Manager.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the parameters is not valid, or the same object is attempting to create the same property group more than once.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroupmanager-createpropertygroup
     */
    CreatePropertyGroup(Name, dwIsoMode, dwRelMode, fExists, ppGroup) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        dwIsoModeMarshal := dwIsoMode is VarRef ? "int*" : "ptr"
        dwRelModeMarshal := dwRelMode is VarRef ? "int*" : "ptr"
        fExistsMarshal := fExists is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, BSTR, Name, dwIsoModeMarshal, dwIsoMode, dwRelModeMarshal, dwRelMode, fExistsMarshal, fExists, ISharedPropertyGroup.Ptr, ppGroup, "HRESULT")
        return result
    }

    /**
     * Retrieves a reference to an existing shared property group.
     * @param {BSTR} Name The name of the shared property group to be retrieved.
     * @returns {ISharedPropertyGroup} A reference to the shared property group specified in the <i>Name</i> parameter, or <b>NULL</b> if the property group does not exist.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroupmanager-get_group
     */
    get_Group(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, BSTR, Name, "ptr*", &ppGroup := 0, "HRESULT")
        return ISharedPropertyGroup(ppGroup)
    }

    /**
     * Retrieves an enumerator for the named security call context properties.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroupmanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    Query(iid) {
        if (ISharedPropertyGroupManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePropertyGroup := CallbackCreate(GetMethod(implObj, "CreatePropertyGroup"), flags, 6)
        this.vtbl.get_Group := CallbackCreate(GetMethod(implObj, "get_Group"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePropertyGroup)
        CallbackFree(this.vtbl.get_Group)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
