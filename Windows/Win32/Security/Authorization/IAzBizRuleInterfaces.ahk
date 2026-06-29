#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides methods and properties used to manage a list of IDispatch interfaces that can be called by business rule (BizRule) scripts.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazbizruleinterfaces
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzBizRuleInterfaces extends IDispatch {
    /**
     * The interface identifier for IAzBizRuleInterfaces
     * @type {Guid}
     */
    static IID := Guid("{e94128c7-e9da-44cc-b0bd-53036f3aab3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzBizRuleInterfaces interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        AddInterface      : IntPtr
        AddInterfaces     : IntPtr
        GetInterfaceValue : IntPtr
        Remove            : IntPtr
        RemoveAll         : IntPtr
        get_Count         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzBizRuleInterfaces.Vtbl()
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
     * Adds the specified interface to the list of IDispatch interfaces that can be called by business rule (BizRule) scripts.
     * @param {BSTR} bstrInterfaceName A string that contains the name used by scripts to call the interface specified by the <i>varInterface</i> parameter.
     * @param {Integer} lInterfaceFlag Flags sent to the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript-addnameditem">AddNamedItem</a> method of the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript">IActiveScript</a> interface. The <b>AddNamedItem</b> always behaves as if the <b>SCRIPTITEM_ISVISIBLE</b> flag is set, and the <b>SCRIPTITEM_ISPERSISTENT</b> flag is not set.
     * @param {VARIANT} varInterface The ID of the interface to be added.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-addinterface
     */
    AddInterface(bstrInterfaceName, lInterfaceFlag, varInterface) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(7, this, BSTR, bstrInterfaceName, "int", lInterfaceFlag, VARIANT, varInterface, "HRESULT")
        return result
    }

    /**
     * Adds the specified interfaces to the list of IDispatch interfaces that can be called by business rule (BizRule) scripts.
     * @remarks
     * The names of the interfaces specified by the <i>varInterfaceNames</i> array are in the same order as the corresponding interface IDs specified by the <i>varInterfaces</i> array.
     * @param {VARIANT} varInterfaceNames A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that specifies the names that scripts use to call the interfaces specified by the <i>varInterfaces</i> array.
     * @param {VARIANT} varInterfaceFlags A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that specifies flags sent to the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript-addnameditem">AddNamedItem</a> method of the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript">IActiveScript</a> interface. The <b>AddNamedItem</b> always behaves as if the <b>SCRIPTITEM_ISVISIBLE</b> flag is set, and the <b>SCRIPTITEM_ISPERSISTENT</b> flag is not set.
     * @param {VARIANT} varInterfaces A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that specifies the IDs of the interfaces to be added.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-addinterfaces
     */
    AddInterfaces(varInterfaceNames, varInterfaceFlags, varInterfaces) {
        result := ComCall(8, this, VARIANT, varInterfaceNames, VARIANT, varInterfaceFlags, VARIANT, varInterfaces, "HRESULT")
        return result
    }

    /**
     * Gets the ID and flags of the interface that corresponds to the specified interface name.
     * @param {BSTR} bstrInterfaceName A string that contains the interface name.
     * @param {Pointer<Integer>} lInterfaceFlag A pointer to the flags associated with the interface name.
     * @param {Pointer<VARIANT>} varInterface A pointer to the ID associated with the interface name.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-getinterfacevalue
     */
    GetInterfaceValue(bstrInterfaceName, lInterfaceFlag, varInterface) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        lInterfaceFlagMarshal := lInterfaceFlag is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, BSTR, bstrInterfaceName, lInterfaceFlagMarshal, lInterfaceFlag, VARIANT.Ptr, varInterface, "HRESULT")
        return result
    }

    /**
     * Removes the specified interface from the list of interfaces The number of interfaces in the list of interfaces that can be called by BizRule scripts.
     * @param {BSTR} bstrInterfaceName The name of the interface to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-remove
     */
    Remove(bstrInterfaceName) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(10, this, BSTR, bstrInterfaceName, "HRESULT")
        return result
    }

    /**
     * Removes all interfaces from the list of interfaces that can be called by business rule (BizRule) scripts.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-removeall
     */
    RemoveAll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Specifies the number of interfaces that can be called by business rule (BizRule) scripts.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-get_count
     */
    get_Count() {
        result := ComCall(12, this, "uint*", &plCount := 0, "HRESULT")
        return plCount
    }

    Query(iid) {
        if (IAzBizRuleInterfaces.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddInterface := CallbackCreate(GetMethod(implObj, "AddInterface"), flags, 4)
        this.vtbl.AddInterfaces := CallbackCreate(GetMethod(implObj, "AddInterfaces"), flags, 4)
        this.vtbl.GetInterfaceValue := CallbackCreate(GetMethod(implObj, "GetInterfaceValue"), flags, 4)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.RemoveAll := CallbackCreate(GetMethod(implObj, "RemoveAll"), flags, 1)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddInterface)
        CallbackFree(this.vtbl.AddInterfaces)
        CallbackFree(this.vtbl.GetInterfaceValue)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.RemoveAll)
        CallbackFree(this.vtbl.get_Count)
    }
}
