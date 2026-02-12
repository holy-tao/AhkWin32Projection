#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetFwRule.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Collection of firewall rules.
 * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nn-netfw-inetfwrules
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwRules extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwRules
     * @type {Guid}
     */
    static IID => Guid("{9c4c6277-5027-441e-afae-ca1f542da009}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Add", "Remove", "Item", "get__NewEnum"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwrules-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwrules-add
     */
    Add(rule) {
        result := ComCall(8, this, "ptr", rule, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwrules-remove
     */
    Remove(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(9, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Item method returns the specified rule if it is in the collection.
     * @param {BSTR} name Name of the rule to retrieve.
     * @returns {INetFwRule} Reference to the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwrules-item
     */
    Item(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(10, this, "ptr", name, "ptr*", &rule := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INetFwRule(rule)
    }

    /**
     * Returns an object supporting IEnumVARIANT that can be used to iterate through all the rules in the collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nf-netfw-inetfwrules-get__newenum
     */
    get__NewEnum() {
        result := ComCall(11, this, "ptr*", &newEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(newEnum)
    }
}
