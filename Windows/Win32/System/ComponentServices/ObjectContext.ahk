#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
#Include .\SecurityProperty.ahk
#Include .\ContextInfo.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to the current object's context. An object's context is primarily used when working with transactions or dealing with the security of an object. (ObjectContext)
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-objectcontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ObjectContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ObjectContext
     * @type {Guid}
     */
    static IID => Guid("{74c08646-cedb-11cf-8b49-00aa00b8a790}")

    /**
     * The class identifier for ObjectContext
     * @type {Guid}
     */
    static CLSID => Guid("{74c08646-cedb-11cf-8b49-00aa00b8a790}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "SetComplete", "SetAbort", "EnableCommit", "DisableCommit", "IsInTransaction", "IsSecurityEnabled", "IsCallerInRole", "get_Count", "get_Item", "get__NewEnum", "get_Security", "get_ContextInfo"]

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
     * @type {SecurityProperty} 
     */
    Security {
        get => this.get_Security()
    }

    /**
     * @type {ContextInfo} 
     */
    ContextInfo {
        get => this.get_ContextInfo()
    }

    /**
     * Creates an object using current object's context. (ObjectContext.CreateInstance)
     * @remarks
     * When you create an object by using <b>CreateInstance</b>, the new object's context is derived from the current object's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> and the declarative properties of the new object's component. The new object always executes within the same activity as the object that created it. If the current object has a transaction, the transaction attribute of the new object's component determines whether the new object executes within the scope of that transaction.
     * 
     * If the component's transaction attribute setting either requires a transaction or supports transactions, the new object inherits its creator's transaction. If the component's transaction attribute requires a new transaction, COM+ initiates a new transaction for the new object. If the component's transaction attribute does not support transactions, the new object does not execute under any transaction.
     * @param {BSTR} bstrProgID The ProgID of the type of object to be instantiated.
     * @returns {VARIANT} A reference to the new object.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-createinstance
     */
    CreateInstance(bstrProgID) {
        if(bstrProgID is String) {
            pin := BSTR.Alloc(bstrProgID)
            bstrProgID := pin.Value
        }

        pObject := VARIANT()
        result := ComCall(7, this, "ptr", bstrProgID, "ptr", pObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pObject
    }

    /**
     * Declares that the transaction in which the object is executing can be committed and that the object should be deactivated on return.
     * @remarks
     * The object is deactivated automatically on return from the method in which it called <b>SetComplete</b>. If the object is the root of an automatic transaction, COM+ attempts to commit the transaction. However, if any object that was participating in the transaction has called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setabort">SetAbort</a>, or has called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-disablecommit">DisableCommit</a> and has not subsequently called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-enablecommit">EnableCommit</a> or <b>SetComplete</b>, the transaction is aborted.
     * 
     * If an object does not need to maintain its state after it returns from a method call, it should call <b>SetComplete</b> so that it can be automatically deactivated as soon as it returns and its resources can be reclaimed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
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
     * The method completed successfully.
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
     * An unexpected error has occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setcomplete">SetComplete</a> using this pointer. An <b>ObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-setcomplete
     */
    SetComplete() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Declares that the transaction in which the object is executing must be aborted and that the object should be deactivated on return.
     * @remarks
     * The object is deactivated automatically on return from the method in which it called <b>SetAbort</b>. If the object is the root of an automatic transaction, COM+ aborts the transaction. If the object is transactional but not the root of an automatic transaction, the transaction in which it is participating is doomed to abort.
     * 
     * You can call <b>SetAbort</b> in error handlers to ensure that a transaction aborts when an error occurs. You can also call <b>SetAbort</b> at the beginning of a method to prevent your object from committing prematurely in the event of an unexpected return and then, if all goes well, call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setcomplete">SetComplete</a> just before the method returns.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
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
     * The method completed successfully.
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
     * An unexpected error has occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setabort">SetAbort</a> using this pointer. An <b>ObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-setabort
     */
    SetAbort() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Declares that the current object's work is not necessarily finished but that its transactional updates are consistent and could be committed in their present form.
     * @remarks
     * When an object calls <b>EnableCommit</b>, it allows the transaction in which it's participating to be committed but it maintains its internal state across calls from its clients until it calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setcomplete">SetComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setabort">SetAbort</a> or until the transaction completes.
     * 
     * <b>EnableCommit</b> is the default state when an object is activated. Therefore, an object should always call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setcomplete">SetComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setabort">SetAbort</a> before returning from a method, unless you want the object to maintain its internal state for the next call from a client.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
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
     * The method completed successfully and the object's transactional updates can now be committed.
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
     * An unexpected error has occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-enablecommit">EnableCommit</a> using this pointer. An <b>ObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-enablecommit
     */
    EnableCommit() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Declares that the object's transactional updates are inconsistent and cannot be committed in their present state.
     * @remarks
     * You can use the <b>DisableCommit</b> method to prevent a transaction from committing prematurely between method calls in a stateful object. When an object invokes <b>DisableCommit</b>, it indicates that its work is inconsistent and that it cannot complete its work until it receives further method invocations from the client. It also indicates that it needs to maintain its state to perform that work. This prevents COM+ from deactivating the object and reclaiming its resources on return from a method call. When an object has called <b>DisableCommit</b>, if a client attempts to commit the transaction before the object has called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-enablecommit">EnableCommit</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setcomplete">SetComplete</a>, the transaction aborts.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
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
     * The method completed successfully. The object's transactional updates cannot be committed until the object calls either <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-enablecommit">EnableCommit</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setcomplete">SetComplete</a>.
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
     * An unexpected error has occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-disablecommit">DisableCommit</a> using this pointer. An <b>ObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_NOCONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current object doesn't have a context associated with it. This is probably because it was not created with one of the COM+ <b>CreateInstance</b> methods.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-disablecommit
     */
    DisableCommit() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether the current object is executing in a transaction. (ObjectContext.IsInTransaction)
     * @remarks
     * You can use this method to ensure that an object that requires a transaction never runs without one. For example, if a component that requires a transaction is improperly configured in the Component Services administration tool, you can use this method to determine that the object does not have a transaction. Then you can return an error to alert the user to the problem, or take whatever action is appropriate.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the current object is executing within a transaction; <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-isintransaction
     */
    IsInTransaction() {
        result := ComCall(12, this, "short*", &pbIsInTx := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsInTx
    }

    /**
     * Indicates whether security is enabled for the current object.
     * @remarks
     * In the COM+ environment, server and library applications can use role-based security. <b>IsSecurityEnabled</b> returns <b>TRUE</b> when an application uses role-based security, and role-based security is enabled both for the application and the specific component that called the method.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if security is enabled for this object; <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-issecurityenabled
     */
    IsSecurityEnabled() {
        result := ComCall(13, this, "short*", &pbIsEnabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsEnabled
    }

    /**
     * Indicates whether the object's direct caller is in a specified role (either directly or as part of a group). (ObjectContext.IsCallerInRole)
     * @remarks
     * Use this method to determine whether the direct caller of the currently executing method is associated with a specific role. A role is a symbolic name that represents a user or group of users who have specific access permissions to all components in a given COM+ application. Developers define roles when they create a component, and roles are mapped to individual users or groups at deployment time.
     * 
     * <b>IsCallerInRole</b> applies only to the direct caller of the currently executing method. (The direct caller is the process calling into the current server process. It can be either a base client process or a server process.) <b>IsCallerInRole</b> does not apply to the process that initiated the call sequence from which the current method was called or to any other callers in that sequence.
     * 
     * Because <b>IsCallerInRole</b> returns <b>TRUE</b> when the object that invokes it is executing in a client's process, it is a good idea to call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-issecurityenabled">IsSecurityEnabled</a> before calling <b>IsCallerInRole</b>. If security isn't enabled, <b>IsCallerInRole</b> will not return an accurate result.
     * @param {BSTR} bstrRole The name of the role.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the caller is in the specified role; <b>FALSE</b> otherwise. This parameter is also set to <b>TRUE</b> if security is not enabled.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole) {
        if(bstrRole is String) {
            pin := BSTR.Alloc(bstrRole)
            bstrRole := pin.Value
        }

        result := ComCall(14, this, "ptr", bstrRole, "short*", &pbInRole := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbInRole
    }

    /**
     * Retrieves the number of named context object properties.
     * @returns {Integer} The number of named context object properties.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-get_count
     */
    get_Count() {
        result := ComCall(15, this, "int*", &plCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCount
    }

    /**
     * Retrieves a named property.
     * @param {BSTR} name The name of the property to be retrieved.
     * @returns {VARIANT} A reference to the retrieved property.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-get_item
     */
    get_Item(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        pItem := VARIANT()
        result := ComCall(16, this, "ptr", name, "ptr", pItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pItem
    }

    /**
     * Retrieves an enumerator for the named context object properties.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-get__newenum
     */
    get__NewEnum() {
        result := ComCall(17, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppEnum)
    }

    /**
     * Retrieves the security object of the current object's context.
     * @returns {SecurityProperty} A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-securityproperty">SecurityProperty</a> interface that contains the security property of the current object's context.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-get_security
     */
    get_Security() {
        result := ComCall(18, this, "ptr*", &ppSecurityProperty := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SecurityProperty(ppSecurityProperty)
    }

    /**
     * Retrieves the context information object of the current object's context.
     * @returns {ContextInfo} A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-contextinfo">ContextInfo</a> interface that contains the context information.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-objectcontext-get_contextinfo
     */
    get_ContextInfo() {
        result := ComCall(19, this, "ptr*", &ppContextInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContextInfo(ppContextInfo)
    }
}
