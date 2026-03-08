#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRunningObjectTable.ahk
#Include .\IUnknown.ahk
#Include .\IEnumString.ahk

/**
 * Provides access to a bind context, which is an object that stores information about a particular moniker binding operation.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ibindctx
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
     * @remarks
     * Those writing a new moniker class (through an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface) should call this method whenever the implementation activates an object. This happens most often in the course of binding a moniker, but it can also happen while retrieving a moniker's display name, parsing a display name into a moniker, or retrieving the time that an object was last modified.
     * 
     * <b>RegisterObjectBound</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> to create an additional reference to the object. You must, however, still release your own copy of the pointer. Calling this method twice for the same object creates two references to that object. You can release a reference obtained through a call to this method by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-revokeobjectbound">IBindCtx::RevokeObjectBound</a>. All references held by the bind context are released when the bind context itself is released.
     * 
     * Calling <b>RegisterObjectBound</b> to register an object with a bind context keeps the object active until the bind context is released. Reusing a bind context in a subsequent binding operation (either for another piece of the same composite moniker or for a different moniker) can make the subsequent binding operation more efficient because it doesn't have to reload that object. This, however, improves performance only if the subsequent binding operation requires some of the same objects as the original one, so you need to balance the possible performance improvement of reusing a bind context against the costs of keeping objects activated unnecessarily.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> does not provide a method to retrieve a pointer to an object registered using <b>RegisterObjectBound</b>. Assuming the object has registered itself with the running object table, moniker implementations can call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-getobject">IRunningObjectTable::GetObject</a> to retrieve a pointer to the object.
     * @param {IUnknown} punk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object that is being registered as bound.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-registerobjectbound
     */
    RegisterObjectBound(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Removes the object from the bind context, undoing a previous call to RegisterObjectBound.
     * @remarks
     * You would rarely call this method. It is documented primarily for completeness.
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
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-revokeobjectbound
     */
    RevokeObjectBound(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Releases all pointers to all objects that were previously registered by calls to RegisterObjectBound.
     * @remarks
     * You rarely call this method directly. The system's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> implementation calls this method when the pointer to the <b>IBindCtx</b> interface on the bind context is released (the bind context is released). If a bind context is not released, all of the registered objects remain active.
     * 
     * If the same object has been registered more than once, this method calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method on the object the number of times it was registered.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-releaseboundobjects
     */
    ReleaseBoundObjects() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Sets new values for the binding parameters stored in the bind context.
     * @remarks
     * A bind context contains a block of parameters that are common to most <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> operations. These parameters do not change as the operation moves from piece to piece of a composite moniker.
     * 
     * Subsequent binding operations can call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getbindoptions">IBindCtx::GetBindOptions</a> to retrieve these parameters.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * This method can be called by moniker clients (those who use monikers to acquire interface pointers to objects).
     * 
     * When you first create a bind context by using the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> function, the fields of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure are initialized to the following values:
     * 
     * 
     * ``` syntax
     *     cbStruct = sizeof(BIND_OPTS); 
     *     grfFlags = 0; 
     *     grfMode = STGM_READWRITE; 
     *     dwTickCountDeadline = 0; 
     * 
     * ```
     * 
     * You can use the <b>IBindCtx::SetBindOptions</b> method to modify these values before using the bind context, if you want values other than the defaults.
     * 
     * <b>SetBindOptions</b> copies the members of the specified structure, but not the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure and the pointers it contains. Callers may not free these pointers until the bind context is released.
     * @param {Pointer<BIND_OPTS>} pbindopts A pointer to a [BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1) structure containing the binding parameters.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-setbindoptions
     */
    SetBindOptions(pbindopts) {
        result := ComCall(6, this, "ptr", pbindopts, "HRESULT")
        return result
    }

    /**
     * Retrieves the binding options stored in this bind context.
     * @remarks
     * A bind context contains a block of parameters that are common to most <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> operations and that do not change as the operation moves from piece to piece of a composite moniker.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * You typically call this method if you are writing your own moniker class. (This requires that you implement the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface.) You call this method to retrieve the parameters specified by the moniker client.
     * 
     * You must initialize the structure that is filled in by this method. Before calling this method, you must initialize the <b>cbStruct</b> member to the size of the structure.
     * @param {Pointer<BIND_OPTS>} pbindopts A pointer to an initialized structure that receives the current binding parameters on return. See [BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1).
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-getbindoptions
     */
    GetBindOptions(pbindopts) {
        result := ComCall(7, this, "ptr", pbindopts, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface pointer to the running object table (ROT) for the computer on which this bind context is running.
     * @remarks
     * The running object table is a globally accessible table on each computer. It keeps track of all the objects that are currently running on the computer.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Typically, those implementing a new moniker class (through an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface) call <b>GetRunningObjectTable</b>. It is useful to call this method in an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isrunning">IMoniker::IsRunning</a> to check whether an object is currently running. You can also call this method in the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-gettimeoflastchange">IMoniker::GetTimeOfLastChange</a> to learn when a running object was last modified.
     * 
     * Moniker implementations should call this method instead of using the <b>GetRunningObjectTable</b> function. This makes it possible for future implementations of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> to modify binding behavior.
     * @returns {IRunningObjectTable} The address of a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunningobjecttable">IRunningObjectTable</a>* pointer variable that receives the interface pointer to the running object table. If an error occurs, *<i>pprot</i> is set to <b>NULL</b>. If *<i>pprot</i> is non-<b>NULL</b>, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the running table object; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-getrunningobjecttable
     */
    GetRunningObjectTable() {
        result := ComCall(8, this, "ptr*", &pprot := 0, "HRESULT")
        return IRunningObjectTable(pprot)
    }

    /**
     * Associates an object with a string key in the bind context's string-keyed table of pointers.
     * @remarks
     * A bind context maintains a table of interface pointers, each associated with a string key. This enables communication between a moniker implementation and the caller that initiated the binding operation. One party can store an interface pointer under a string known to both parties so that the other party can later retrieve it from the bind context.
     * 
     * Binding operations subsequent to the use of this method can use <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getobjectparam">IBindCtx::GetObjectParam</a> to retrieve the stored pointer.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * <b>RegisterObjectParam</b> is useful to those implementing a new moniker class (through an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>) and to moniker clients (those who use monikers to bind to objects).
     * 
     * In implementing a new moniker class, you call this method when an error occurs during moniker binding to inform the caller of the cause of the error. The key that you would obtain with a call to this method would depend on the error condition. Following is a list of common moniker binding errors, describing for each the keys that would be appropriate:
     * 
     * <ul>
     * <li>MK_E_EXCEEDEDDEADLINE: If a binding operation exceeds its deadline because a given object is not running, you should register the object's moniker using the first unused key from the list: "ExceededDeadline", "ExceededDeadline1", "ExceededDeadline2", and so on. If the caller later finds the moniker in the running object table, the caller can retry the binding operation.</li>
     * <li>MK_E_CONNECTMANUALLY: The "ConnectManually" key indicates a moniker whose binding requires assistance from the end user. To request that the end user manually connect to the object, the caller can retry the binding operation after showing the moniker's display name. Common reasons for this error are that a password is needed or that a floppy needs to be mounted.</li>
     * <li>E_CLASSNOTFOUND: The "ClassNotFound" key indicates a moniker whose class could not be found. (The server for the object identified by this moniker could not be located.) If this key is used for an OLE compound-document object, the caller can use <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtostorage">IMoniker::BindToStorage</a> to bind to the object and then try to carry out a <b>Treat As...</b> or <b>Convert To...</b> operation to associate the object with a different server. If this is successful, the caller can retry the binding operation.</li>
     * </ul>
     * A moniker client with detailed knowledge of the implementation of the moniker can also call this method to pass private information to that implementation.
     * 
     * You can define new strings as keys for storing pointers. By convention, you should use key names that begin with the string form of the CLSID of the moniker class. (See the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-stringfromclsid">StringFromCLSID</a> function.)
     * 
     * If the <i>pszKey</i> parameter matches the name of an existing key in the bind context's table, the new object replaces the existing object in the table.
     * 
     * When you register an object using this method, the object is not released until one of the following occurs:
     * 
     * <ul>
     * <li>It is replaced in the table by another object with the same key.</li>
     * <li>It is removed from the table by a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-revokeobjectparam">IBindCtx::RevokeObjectParam</a>.</li>
     * <li>The bind context is released. All registered objects are released when the bind context is released.</li>
     * </ul>
     * @param {PWSTR} pszKey The <a href="https://docs.microsoft.com/windows/desktop/shell/str-constants">bind context string key</a> under which the object is being registered. Key string comparison is case-sensitive.
     * @param {IUnknown} punk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object that is to be registered.
     * 
     * The method calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the pointer.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-registerobjectparam
     */
    RegisterObjectParam(pszKey, punk) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(9, this, "ptr", pszKey, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface pointer to the object associated with the specified key in the bind context's string-keyed table of pointers.
     * @remarks
     * A bind context maintains a table of interface pointers, each associated with a string key. This enables communication between a moniker implementation and the caller that initiated the binding operation. One party can store an interface pointer under a string known to both parties so that the other party can later retrieve it from the bind context.
     * 
     * The pointer this method retrieves must have previously been inserted into the table using the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectparam">IBindCtx::RegisterObjectParam</a> method.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Objects using monikers to locate other objects can call this method when a binding operation fails to get specific information about the error that occurred. Depending on the error, it may be possible to correct the situation and retry the binding operation. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectparam">IBindCtx::RegisterObjectParam</a> for more information.
     * 
     * Moniker implementations can call this method to handle situations where a caller initiates a binding operation and requests specific information. By convention, the implementer should use key names that begin with the string form of the CLSID of a moniker class. (See the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-stringfromclsid">StringFromCLSID</a> function.)
     * @param {PWSTR} pszKey The <a href="https://docs.microsoft.com/windows/desktop/shell/str-constants">bind context string key</a> to be searched for. Key string comparison is case-sensitive.
     * @returns {IUnknown} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>* pointer variable that receives the interface pointer to the object associated with <i>pszKey</i>. When successful, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on *<i>ppunk</i>. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation sets *<i>ppunk</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-getobjectparam
     */
    GetObjectParam(pszKey) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(10, this, "ptr", pszKey, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Retrieves a pointer to an interface that can be used to enumerate the keys of the bind context's string-keyed table of pointers.
     * @remarks
     * The keys returned by the enumerator are the ones previously specified in calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectparam">IBindCtx::RegisterObjectParam</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A bind context maintains a table of interface pointers, each associated with a string key. This enables communication between a moniker implementation and the caller that initiated the binding operation. One party can store an interface pointer under a string known to both parties so that the other party can later retrieve it from the bind context.
     * 
     * In the system implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface, this method is not implemented. Therefore, calling this method results in a return value of E_NOTIMPL.
     * @returns {IEnumString} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a>* pointer variable that receives the interface pointer to the enumerator. If an error occurs, *<i>ppenum</i> is set to <b>NULL</b>. If *<i>ppenum</i> is non-<b>NULL</b>, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on *<i>ppenum</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-enumobjectparam
     */
    EnumObjectParam() {
        result := ComCall(11, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumString(ppenum)
    }

    /**
     * Removes the specified key and its associated pointer from the bind context's string-keyed table of objects. The key must have previously been inserted into the table with a call to RegisterObjectParam.
     * @remarks
     * A bind context maintains a table of interface pointers, each associated with a string key. This enables communication between a moniker implementation and the caller that initiated the binding operation. One party can store an interface pointer under a string known to both parties so that the other party can later retrieve it from the bind context.
     * 
     * This method is used to remove an entry from the table. If the specified key is found, the bind context also releases its reference to the object.
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
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ibindctx-revokeobjectparam
     */
    RevokeObjectParam(pszKey) {
        pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

        result := ComCall(12, this, "ptr", pszKey, "HRESULT")
        return result
    }
}
