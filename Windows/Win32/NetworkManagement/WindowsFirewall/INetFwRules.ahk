#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\INetFwRule.ahk" { INetFwRule }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Collection of firewall rules.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwrules
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwRules extends IDispatch {
    /**
     * The interface identifier for INetFwRules
     * @type {Guid}
     */
    static IID := Guid("{9c4c6277-5027-441e-afae-ca1f542da009}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwRules interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
        Item         : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwRules.Vtbl()
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
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Returns the number of rules in a collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * The Add method adds a new rule to the collection.
     * @remarks
     * If a rule with the same rule identifier as the one being submitted already exists, the existing rule is overwritten.
     * 
     * Adding a firewall rule with a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule3-get_localapppackageid">LocalAppPackageId</a> specified can lead to unexpected behavior and is not supported.
     * @param {INetFwRule} rule Rule to be added to the collection via an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> object.
     * @returns {HRESULT} <h3>C++</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because a parameter was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  method failed because the  object is already in the collection.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because a parameter was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  method failed because the  object is already in the collection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-add
     */
    Add(rule) {
        result := ComCall(8, this, "ptr", rule, "HRESULT")
        return result
    }

    /**
     * The Remove method removes a rule from the collection.
     * @remarks
     * If a rule specified by the <i>name</i> parameter does not exist in the collection, the <b>Remove</b> method has no effect.
     * @param {BSTR} name Name of the rule  to remove from the collection.
     * @returns {HRESULT} <h3>C++</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-remove
     */
    Remove(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * The Item method returns the specified rule if it is in the collection.
     * @param {BSTR} name Name of the rule to retrieve.
     * @returns {INetFwRule} Reference to the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-item
     */
    Item(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, BSTR, name, "ptr*", &rule := 0, "HRESULT")
        return INetFwRule(rule)
    }

    /**
     * Returns an object supporting IEnumVARIANT that can be used to iterate through all the rules in the collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-get__newenum
     */
    get__NewEnum() {
        result := ComCall(11, this, "ptr*", &newEnum := 0, "HRESULT")
        return IUnknown(newEnum)
    }

    Query(iid) {
        if (INetFwRules.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
