#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISharedPropertyGroup.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Used to create shared property groups and to obtain access to existing shared property groups.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isharedpropertygroupmanager
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISharedPropertyGroupManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISharedPropertyGroupManager
     * @type {Guid}
     */
    static IID => Guid("{2a005c0d-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The class identifier for SharedPropertyGroupManager
     * @type {Guid}
     */
    static CLSID => Guid("{2a005c11-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePropertyGroup", "get_Group", "get__NewEnum"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Creates a new shared property group.
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedpropertygroupmanager-createpropertygroup
     */
    CreatePropertyGroup(Name, dwIsoMode, dwRelMode, fExists, ppGroup) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        dwIsoModeMarshal := dwIsoMode is VarRef ? "int*" : "ptr"
        dwRelModeMarshal := dwRelMode is VarRef ? "int*" : "ptr"
        fExistsMarshal := fExists is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", Name, dwIsoModeMarshal, dwIsoMode, dwRelModeMarshal, dwRelMode, fExistsMarshal, fExists, "ptr*", ppGroup, "HRESULT")
        return result
    }

    /**
     * Retrieves a reference to an existing shared property group.
     * @param {BSTR} Name The name of the shared property group to be retrieved.
     * @returns {ISharedPropertyGroup} A reference to the shared property group specified in the <i>Name</i> parameter, or <b>NULL</b> if the property group does not exist.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedpropertygroupmanager-get_group
     */
    get_Group(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "ptr*", &ppGroup := 0, "HRESULT")
        return ISharedPropertyGroup(ppGroup)
    }

    /**
     * Retrieves an enumerator for the named security call context properties.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedpropertygroupmanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }
}
