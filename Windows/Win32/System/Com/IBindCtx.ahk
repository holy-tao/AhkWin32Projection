#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRunningObjectTable.ahk
#Include .\IUnknown.ahk
#Include .\IEnumString.ahk

/**
 * Provides access to a bind context, which is an object that stores information about a particular moniker binding operation.
 * @remarks
 * 
 * A bind context includes the following information:
 * 
 * <ul>
 * <li>A <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure containing a set of parameters that do not change during the binding operation. When a composite moniker is bound, each component uses the same bind context, so it acts as a mechanism for passing the same parameters to each component of a composite moniker. 
 * </li>
 * <li>A set of pointers to objects that the binding operation has activated. The bind context holds pointers to these bound objects, keeping them loaded and thus eliminating redundant activations if the objects are needed again during subsequent binding operations.</li>
 * <li>A pointer to the running object table (ROT) on the same computer as the process that started the bind operation. Moniker implementations that need to access the ROT should use the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getrunningobjecttable">IBindCtx::GetRunningObjectTable</a> method rather than using the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-getrunningobjecttable">GetRunningObjectTable</a> function. This allows future enhancements to the system's <b>IBindCtx</b> implementation to modify binding behavior.
 * </li>
 * <li>A table of interface pointers, each associated with a string key. This capability enables moniker implementations to store interface pointers under a well-known string so that they can later be retrieved from the bind context. For example, OLE defines several string keys ("ExceededDeadline", "ConnectManually", and so on) that can be used to store a pointer to the object that caused an error during a binding operation.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ibindctx
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindCtx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindCtx
     * @type {Guid}
     */
    static IID => Guid("{0000000e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterObjectBound", "RevokeObjectBound", "ReleaseBoundObjects", "SetBindOptions", "GetBindOptions", "GetRunningObjectTable", "RegisterObjectParam", "GetObjectParam", "EnumObjectParam", "RevokeObjectParam"]

    /**
     * Registers an object with the bind context to ensure that the object remains active until the bind context is released.
     * @param {IUnknown} punk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object that is being registered as bound.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-registerobjectbound
     */
    RegisterObjectBound(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Removes the object from the bind context, undoing a previous call to RegisterObjectBound.
     * @param {IUnknown} punk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/com/iunknown-and-interface-inheritance">IUnknown</a> interface on the object to be removed.
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
     * The object was released successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOTBOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object was not previously registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-revokeobjectbound
     */
    RevokeObjectBound(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Releases all pointers to all objects that were previously registered by calls to RegisterObjectBound.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-releaseboundobjects
     */
    ReleaseBoundObjects() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Sets new values for the binding parameters stored in the bind context.
     * @param {Pointer<BIND_OPTS>} pbindopts A pointer to a [BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1) structure containing the binding parameters.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-setbindoptions
     */
    SetBindOptions(pbindopts) {
        result := ComCall(6, this, "ptr", pbindopts, "HRESULT")
        return result
    }

    /**
     * Retrieves the binding options stored in this bind context.
     * @param {Pointer<BIND_OPTS>} pbindopts A pointer to an initialized structure that receives the current binding parameters on return. See [BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1).
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-getbindoptions
     */
    GetBindOptions(pbindopts) {
        result := ComCall(7, this, "ptr", pbindopts, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface pointer to the running object table (ROT) for the computer on which this bind context is running.
     * @returns {IRunningObjectTable} The address of a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunningobjecttable">IRunningObjectTable</a>* pointer variable that receives the interface pointer to the running object table. If an error occurs, *<i>pprot</i> is set to <b>NULL</b>. If *<i>pprot</i> is non-<b>NULL</b>, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the running table object; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-getrunningobjecttable
     */
    GetRunningObjectTable() {
        result := ComCall(8, this, "ptr*", &pprot := 0, "HRESULT")
        return IRunningObjectTable(pprot)
    }

    /**
     * Associates an object with a string key in the bind context's string-keyed table of pointers.
     * @param {PWSTR} pszKey The <a href="https://docs.microsoft.com/windows/desktop/shell/str-constants">bind context string key</a> under which the object is being registered. Key string comparison is case-sensitive.
     * @param {IUnknown} punk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object that is to be registered.
     * 
     * The method calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the pointer.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-registerobjectparam
     */
    RegisterObjectParam(pszKey, punk) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(9, this, "ptr", pszKey, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface pointer to the object associated with the specified key in the bind context's string-keyed table of pointers.
     * @param {PWSTR} pszKey The <a href="https://docs.microsoft.com/windows/desktop/shell/str-constants">bind context string key</a> to be searched for. Key string comparison is case-sensitive.
     * @returns {IUnknown} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>* pointer variable that receives the interface pointer to the object associated with <i>pszKey</i>. When successful, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on *<i>ppunk</i>. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation sets *<i>ppunk</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-getobjectparam
     */
    GetObjectParam(pszKey) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(10, this, "ptr", pszKey, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Retrieves a pointer to an interface that can be used to enumerate the keys of the bind context's string-keyed table of pointers.
     * @returns {IEnumString} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a>* pointer variable that receives the interface pointer to the enumerator. If an error occurs, *<i>ppenum</i> is set to <b>NULL</b>. If *<i>ppenum</i> is non-<b>NULL</b>, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on *<i>ppenum</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-enumobjectparam
     */
    EnumObjectParam() {
        result := ComCall(11, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumString(ppenum)
    }

    /**
     * Removes the specified key and its associated pointer from the bind context's string-keyed table of objects. The key must have previously been inserted into the table with a call to RegisterObjectParam.
     * @param {PWSTR} pszKey The <a href="https://docs.microsoft.com/windows/desktop/shell/str-constants">bind context string key</a> to be removed. Key string comparison is case-sensitive.
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
     * The specified key was removed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object was not previously registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ibindctx-revokeobjectparam
     */
    RevokeObjectParam(pszKey) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(12, this, "ptr", pszKey, "HRESULT")
        return result
    }
}
