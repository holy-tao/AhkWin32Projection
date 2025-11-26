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
 * Provides access to the current object's context. An object's context is primarily used when working with transactions or dealing with the security of an object.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-objectcontext
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
     * Creates an object using current object's context.
     * @param {BSTR} bstrProgID The ProgID of the type of object to be instantiated.
     * @returns {VARIANT} A reference to the new object.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-createinstance
     */
    CreateInstance(bstrProgID) {
        bstrProgID := bstrProgID is String ? BSTR.Alloc(bstrProgID).Value : bstrProgID

        pObject := VARIANT()
        result := ComCall(7, this, "ptr", bstrProgID, "ptr", pObject, "HRESULT")
        return pObject
    }

    /**
     * Declares that the transaction in which the object is executing can be committed and that the object should be deactivated on return.
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
     * An unexpected error has occurred. This can happen if one object passes its <a href="/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> pointer to another object and the other object calls <a href="/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setcomplete">SetComplete</a> using this pointer. An <b>ObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-setcomplete
     */
    SetComplete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Declares that the transaction in which the object is executing must be aborted and that the object should be deactivated on return.
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
     * An unexpected error has occurred. This can happen if one object passes its <a href="/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> pointer to another object and the other object calls <a href="/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setabort">SetAbort</a> using this pointer. An <b>ObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-setabort
     */
    SetAbort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Declares that the current object's work is not necessarily finished but that its transactional updates are consistent and could be committed in their present form.
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
     * The method completed succesfully and the object's transactional updates can now be committed.
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
     * An unexpected error has occurred. This can happen if one object passes its <a href="/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> pointer to another object and the other object calls <a href="/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-enablecommit">EnableCommit</a> using this pointer. An <b>ObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-enablecommit
     */
    EnableCommit() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Declares that the object's transactional updates are inconsistent and cannot be committed in their present state.
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
     * The method completed succesfully. The object's transactional updates cannot be committed until the object calls either <a href="/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-enablecommit">EnableCommit</a> or <a href="/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-setcomplete">SetComplete</a>.
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
     * An unexpected error has occurred. This can happen if one object passes its <a href="/windows/desktop/api/comsvcs/nn-comsvcs-objectcontext">ObjectContext</a> pointer to another object and the other object calls <a href="/windows/desktop/api/comsvcs/nf-comsvcs-objectcontext-disablecommit">DisableCommit</a> using this pointer. An <b>ObjectContext</b> pointer is not valid outside the context of the object that originally obtained it.
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
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-disablecommit
     */
    DisableCommit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Indicates whether the current object is executing in a transaction.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the current object is executing within a transaction; <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-isintransaction
     */
    IsInTransaction() {
        result := ComCall(12, this, "short*", &pbIsInTx := 0, "HRESULT")
        return pbIsInTx
    }

    /**
     * Indicates whether security is enabled for the current object.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if security is enabled for this object; <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-issecurityenabled
     */
    IsSecurityEnabled() {
        result := ComCall(13, this, "short*", &pbIsEnabled := 0, "HRESULT")
        return pbIsEnabled
    }

    /**
     * Indicates whether the object's direct caller is in a specified role (either directly or as part of a group).
     * @param {BSTR} bstrRole The name of the role.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the caller is in the specified role; <b>FALSE</b> otherwise. This parameter is also set to <b>TRUE</b> if security is not enabled.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(14, this, "ptr", bstrRole, "short*", &pbInRole := 0, "HRESULT")
        return pbInRole
    }

    /**
     * Retrieves the number of named context object properties.
     * @returns {Integer} The number of named context object properties.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-get_count
     */
    get_Count() {
        result := ComCall(15, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Retrieves a named property.
     * @param {BSTR} name The name of the property to be retrieved.
     * @returns {VARIANT} A reference to the retrieved property.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-get_item
     */
    get_Item(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        pItem := VARIANT()
        result := ComCall(16, this, "ptr", name, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * Retrieves an enumerator for the named context object properties.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-get__newenum
     */
    get__NewEnum() {
        result := ComCall(17, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    /**
     * Retrieves the security object of the current object's context.
     * @returns {SecurityProperty} A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-securityproperty">SecurityProperty</a> interface that contains the security property of the current object's context.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-get_security
     */
    get_Security() {
        result := ComCall(18, this, "ptr*", &ppSecurityProperty := 0, "HRESULT")
        return SecurityProperty(ppSecurityProperty)
    }

    /**
     * Retrieves the context information object of the current object's context.
     * @returns {ContextInfo} A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-contextinfo">ContextInfo</a> interface that contains the context information.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-objectcontext-get_contextinfo
     */
    get_ContextInfo() {
        result := ComCall(19, this, "ptr*", &ppContextInfo := 0, "HRESULT")
        return ContextInfo(ppContextInfo)
    }
}
