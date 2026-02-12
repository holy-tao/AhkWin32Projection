#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides access to the current object's context. An object's context is primarily used when working with transactions or dealing with the security of an object. (IObjectContext)
 * @remarks
 * As with any COM object, you must release an <b>IObjectContext</b> object when you are finished using it, unless it is a local variable.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-iobjectcontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectContext
     * @type {Guid}
     */
    static IID => Guid("{51372ae0-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The class identifier for ObjectContext
     * @type {Guid}
     */
    static CLSID => Guid("{74c08646-cedb-11cf-8b49-00aa00b8a790}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "SetComplete", "SetAbort", "EnableCommit", "DisableCommit", "IsInTransaction", "IsSecurityEnabled", "IsCallerInRole"]

    /**
     * Creates an object using current object's context. (IObjectContext.CreateInstance)
     * @remarks
     * <b>CreateInstance</b> creates a COM object. However, the object will have context only if its component is registered with COM+.
     * 
     * When you create an object by using <b>CreateInstance</b>, the new object's context is derived from the current object's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontext">IObjectContext</a> and the declarative properties of the new object's component. The new object always executes within the same activity as the object that created it. If the current object has a transaction, the transaction attribute of the new object's component determines whether the new object executes within the scope of that transaction.
     * 
     * If the component's transaction attribute setting either requires a transaction or supports transactions, the new object inherits its creator's transaction. If the component's transaction attribute requires a new transaction, COM+ initiates a new transaction for the new object. If the component's transaction attribute does not support transactions, the new object doesn't execute under any transaction.
     * 
     * <b>CreateInstance</b> always returns the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the newly instantiated object. You should immediately cast the returned value to the interface through which you want to communicate with the new object. The interface ID you pass in the <i>riid</i> parameter does not need to be the same interface as the one to which you cast the returned value, but it must be an interface that is implemented by the object you are instantiating.
     * @param {Pointer<Guid>} rclsid The CLSID of the type of object to instantiate.
     * @param {Pointer<Guid>} riid Any interface that's implemented by the object you want to instantiate.
     * @param {Pointer<Pointer<Void>>} ppv A reference to the requested interface on the new object. If instantiation fails, this parameter is set to <b>NULL</b>.
     * @returns {HRESULT} This method can return the following values.
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
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component specified by clsid is not registered as a COM component.
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
     * There's not enough memory available to instantiate the object.
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
     * The argument passed in the <i>ppvObj</i> parameter is invalid.
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
     * An unexpected error occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontext">IObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-createinstance">CreateInstance</a> using this pointer. An <b>IObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iobjectcontext-createinstance
     */
    CreateInstance(rclsid, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", rclsid, "ptr", riid, ppvMarshal, ppv, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Declares that the transaction in which the object is executing can be committed and that the object should be deactivated when it returns from the currently executing method call.
     * @remarks
     * The object is deactivated automatically on return from the method in which it called <b>SetComplete</b>. If the object is the root of an automatic transaction, COM+ attempts to commit the transaction. However, if any object that was participating in the transaction has called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setabort">SetAbort</a>, or has called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-disablecommit">DisableCommit</a> and has not subsequently called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-enablecommit">EnableCommit</a> or <b>SetComplete</b>, the transaction is aborted.
     * 
     * If an object does not need to maintain its state after it returns from a method call, it should call <b>SetComplete</b> so that it can be automatically deactivated as soon as it returns and its resources can be reclaimed.
     * @returns {HRESULT} This method can return the following values.
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
     * An unexpected error occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontext">IObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a> using this pointer. An <b>IObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iobjectcontext-setcomplete
     */
    SetComplete() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Declares that the transaction in which the object is executing must be aborted and that the object should be deactivated when it returns from the currently executing method call.
     * @remarks
     * The object is deactivated automatically on return from the method in which it called <b>SetAbort</b>. If the object is the root of an automatic transaction, COM+ aborts the transaction. If the object is transactional but not the root of an automatic transaction, the transaction in which it's participating is doomed to abort.
     * 
     * You can call <b>SetAbort</b> in error handlers to ensure that a transaction aborts when an error occurs. You can also call <b>SetAbort</b> at the beginning of a method to prevent your object from committing prematurely in the event of an unexpected return and then, if all goes well, call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a> just before the method returns.
     * @returns {HRESULT} This method can return the following values.
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
     * An unexpected error occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontext">IObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setabort">SetAbort</a> using this pointer. An <b>IObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iobjectcontext-setabort
     */
    SetAbort() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Declares that the object's work is not necessarily finished but that its transactional updates are in a consistent state and could be committed in their present form.
     * @remarks
     * When an object calls <b>EnableCommit</b>, it allows the transaction in which it's participating to be committed but it maintains its internal state across calls from its clients until it calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setabort">SetAbort</a> or until the transaction completes.
     * 
     * <b>EnableCommit</b> is the default state when an object is activated. Therefore, an object should always call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setabort">SetAbort</a> before returning from a method, unless you want the object to maintain its internal state for the next call from a client.
     * @returns {HRESULT} This method can return the following values.
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
     * An unexpected error occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontext">IObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-enablecommit">EnableCommit</a> using this pointer. An <b>IObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iobjectcontext-enablecommit
     */
    EnableCommit() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Declares that the object's transactional updates are in an inconsistent state and cannot be committed in their present state.
     * @remarks
     * You can use the <b>DisableCommit</b> method to prevent a transaction from committing prematurely between method calls in a stateful object. When an object invokes <b>DisableCommit</b>, it indicates that its work is inconsistent and that it cannot complete its work until it receives further method invocations from the client. It also indicates that it needs to maintain its state to perform that work. This prevents COM+ from deactivating the object and reclaiming its resources on return from a method call. When an object has called <b>DisableCommit</b>, if a client attempts to commit the transaction before the object has called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-enablecommit">EnableCommit</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a>, the transaction aborts.
     * 
     * For example, suppose you have a GeneralLedger component that updates a database. A client makes multiple calls to a GeneralLedger object to post entries to various accounts. There's an integrity constraint that says the debits must equal the credits when the final method invocation returns, or the transaction must abort. The GeneralLedger object has an initialization method in which the client informs it of the sequence of calls the client is going to make, and the GeneralLedger object calls <b>DisableCommit</b>. The object maintains its state between calls so that, after the final call in the sequence is made, the object can make sure the integrity constraint is satisfied before allowing its work to be committed.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully. The object's transactional updates cannot be committed until the object calls either <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-enablecommit">EnableCommit</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a>.
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
     * An unexpected error occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontext">IObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-disablecommit">DisableCommit</a> using this pointer. An <b>IObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
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
     * The current object does not have a context associated with it. This is probably because it was not created with one of the COM+ CreateInstance methods.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iobjectcontext-disablecommit
     */
    DisableCommit() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether the object is executing within a transaction.
     * @remarks
     * You can use this method to ensure that an object that requires a transaction never runs without one. For example, if a component that requires a transaction is improperly configured in the Component Services administration tool, you can use this method to determine that the object does not have a transaction. Then you can return an error to alert the user to the problem, or take whatever action is appropriate.
     * @returns {BOOL} If the current object is executing within a transaction, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iobjectcontext-isintransaction
     */
    IsInTransaction() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * Indicates whether security is enabled for the current object. COM+ security is enabled unless the object is running in the client's process.
     * @remarks
     * In the COM+ environment, server and library applications can use role-based security. <b>IsSecurityEnabled</b> returns <b>TRUE</b> when an application uses role-based security, and role-based security is enabled both for the application and the specific component that called the method. 
     * 
     * <b>MTS 2.0:  </b>In MTS 2.0, this method always returns <b>FALSE</b> when the current object is running in a library application, because MTS library applications cannot use role-based security. However, in the COM+ environment, library applications optionally can use role-based security.
     * @returns {BOOL} If security is enabled for this object, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iobjectcontext-issecurityenabled
     */
    IsSecurityEnabled() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * Indicates whether the object's direct caller is in a specified role (either directly or as part of a group). (IObjectContext.IsCallerInRole)
     * @remarks
     * You use this method to determine whether the direct caller of the currently executing method is associated with a specific role. A role is a symbolic name that represents a user or group of users who have specific access permissions to all components in a given COM+ application. Developers define roles when they create a component, and roles are mapped to individual users or groups at deployment time.
     * 
     * <b>IsCallerInRole</b> applies only to the direct caller of the currently executing method. (The direct caller is the process calling into the current server process. It can be either a base client process or a server process.) <b>IsCallerInRole</b> does not apply to the process that initiated the call sequence from which the current method was called or to any other callers in that sequence.
     * 
     * Because <b>IsCallerInRole</b> returns <b>TRUE</b> when the object that invokes it is executing in a client's process, it's a good idea to call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-issecurityenabled">IsSecurityEnabled</a> before calling <b>IsCallerInRole</b>. If security isn't enabled, <b>IsCallerInRole</b> will not return an accurate result.
     * @param {BSTR} bstrRole The name of the role.
     * @param {Pointer<BOOL>} pfIsInRole <b>TRUE</b> if the caller is in the specified role; <b>FALSE</b> if not. This parameter is also set to <b>TRUE</b> if security is not enabled.
     * @returns {HRESULT} This method can return the following values.
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
     * The role specified in the <i>bstrRole</i> parameter is a recognized role, and the Boolean result returned in the <i>pbIsInRole</i> parameter indicates whether the caller is in that role.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_ROLENOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The role specified in the <i>bstrRole</i> parameter does not exist.
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
     * One or more of the arguments passed in is not valid.
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
     * An unexpected error occurred. This can happen if one object passes its <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontext">IObjectContext</a> pointer to another object and the other object calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-iscallerinrole">IsCallerInRole</a> using this pointer. An <b>IObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-iobjectcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole, pfIsInRole) {
        if(bstrRole is String) {
            pin := BSTR.Alloc(bstrRole)
            bstrRole := pin.Value
        }

        pfIsInRoleMarshal := pfIsInRole is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "ptr", bstrRole, pfIsInRoleMarshal, pfIsInRole, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
