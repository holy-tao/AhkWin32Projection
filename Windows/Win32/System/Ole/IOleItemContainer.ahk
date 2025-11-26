#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleContainer.ahk

/**
 * Used by item monikers when they are bound to the objects they identify.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleitemcontainer
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleItemContainer extends IOleContainer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleItemContainer
     * @type {Guid}
     */
    static IID => Guid("{0000011c-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObject", "GetObjectStorage", "IsRunning"]

    /**
     * Retrieves a pointer to the specified object.
     * @param {PWSTR} pszItem The container's name for the requested object.
     * @param {Integer} dwSpeedNeeded Indicates approximately how long the caller will wait to get the object. Possible values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-bindspeed">BINDSPEED</a>.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context object to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the binding implementation should retrieve information about its environment.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface pointer requested.
     * @returns {Pointer<Void>} Address of the pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObject</i> contains the requested interface pointer to the object named by <i>pszItem</i>. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the *<i>ppvObject</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation sets *<i>ppvObject</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleitemcontainer-getobject
     */
    GetObject(pszItem, dwSpeedNeeded, pbc, riid) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(6, this, "ptr", pszItem, "uint", dwSpeedNeeded, "ptr", pbc, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Retrieves a pointer to the storage for the specified object.
     * @param {PWSTR} pszItem The compound document's name for the object whose storage is requested.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the binding implementation should retrieve information about its environment.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the object, usually <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>.
     * @returns {Pointer<Void>} Address of a pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvStorage</i> contains the requested interface pointer to the storage for the object named by <i>pszItem</i>. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on *<i>ppvStorage</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, *<i>ppvStorage</i> is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleitemcontainer-getobjectstorage
     */
    GetObjectStorage(pszItem, pbc, riid) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(7, this, "ptr", pszItem, "ptr", pbc, "ptr", riid, "ptr*", &ppvStorage := 0, "HRESULT")
        return ppvStorage
    }

    /**
     * Determines whether the specified object is running.
     * @param {PWSTR} pszItem The container's name for the object.
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
     * The object is running.
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
     * The object is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter does not identify an object in this container.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleitemcontainer-isrunning
     */
    IsRunning(pszItem) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(8, this, "ptr", pszItem, "HRESULT")
        return result
    }
}
