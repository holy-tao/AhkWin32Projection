#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ICreatePropBagOnRegKey interface creates a property bag that can store information in the system registry.Use this interface to store the default tune request in the registry.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ICreatePropBagOnRegKey)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/regbag/nn-regbag-icreatepropbagonregkey
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ICreatePropBagOnRegKey extends IUnknown {
    /**
     * The interface identifier for ICreatePropBagOnRegKey
     * @type {Guid}
     */
    static IID := Guid("{8a674b48-1f63-11d3-b64c-00c04f79498e}")

    /**
     * The class identifier for CreatePropBagOnRegKey
     * @type {Guid}
     */
    static CLSID := Guid("{8a674b49-1f63-11d3-b64c-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreatePropBagOnRegKey interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreatePropBagOnRegKey.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Create method creates a property bag that can store information in the system registry.
     * @remarks
     * This method creates a property bag and returns a pointer to the <b>IPropertyBag</b> or <b>IPropertyBag2</b> interface, depending on the value of the <i>iid</i> parameter. The returned property bag can access the specified registry key, using the access rights given in the <i>samDesired</i> parameter. The various property bag methods require different access rights, as follows:
     * 
     * <table>
     * <tr>
     * <th>Method
     *             </th>
     * <th>Required Access Rights
     *             </th>
     * </tr>
     * <tr>
     * <td><b>IPropertyBag::Read
     *             </b></td>
     * <td>KEY_READ</td>
     * </tr>
     * <tr>
     * <td><b>IPropertyBag::Write
     *             </b></td>
     * <td>KEY_WRITE</td>
     * </tr>
     * <tr>
     * <td><b>IPropertyBag2::CountProperties
     *             </b></td>
     * <td>KEY_QUERY_VALUE | KEY_ENUMERATE_SUB_KEYS</td>
     * </tr>
     * <tr>
     * <td><b>IPropertyBag2::GetPropertyInfo
     *             </b></td>
     * <td>KEY_QUERY_VALUE | KEY_ENUMERATE_SUB_KEYS</td>
     * </tr>
     * </table>
     *  
     * 
     * If you write a value of VT_EMPTY or VT_NULL the property is removed from the bag and the corresponding registry values are deleted.
     * @param {HKEY} _hkey Specifies a handle to the registry key.
     * @param {PWSTR} subkey Specifies the subkey.
     * @param {Integer} ulOptions Reserved; must be zero.
     * @param {Integer} samDesired Specifies the desired access rights to the key. The value can be any combination of flags from the <i>samDesired</i> parameter in the Win32 <b>RegOpenKeyEx</b> function.
     * @param {Pointer<Guid>} iid Specifies the interface identifier (IID) of a property bag interface. Use the value IID_IPropertyBag or IID_IPropertyBag2.
     * @returns {Pointer<Void>} Address of a variable that receives the interface specified by the <i>iid</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/regbag/nf-regbag-icreatepropbagonregkey-create
     */
    Create(_hkey, subkey, ulOptions, samDesired, iid) {
        subkey := subkey is String ? StrPtr(subkey) : subkey

        result := ComCall(3, this, HKEY, _hkey, "ptr", subkey, "uint", ulOptions, "uint", samDesired, Guid.Ptr, iid, "ptr*", &ppBag := 0, "HRESULT")
        return ppBag
    }

    Query(iid) {
        if (ICreatePropBagOnRegKey.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}
