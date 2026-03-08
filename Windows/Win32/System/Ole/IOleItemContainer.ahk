#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleContainer.ahk

/**
 * Used by item monikers when they are bound to the objects they identify.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleitemcontainer
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
     * @remarks
     * The item moniker implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> calls this method, passing the name stored within the item moniker as the <i>pszItem</i> parameter.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation of <b>IOleItemContainer::GetObject</b> should first determine whether <i>pszItem</i> is a valid name for one of the container's objects. If not, you should return MK_E_NOOBJECT.
     * 
     * If <i>pszItem</i> names an embedded or linked object, your implementation must check the value of the <i>dwSpeedNeeded</i> parameter. If the value is BINDSPEED_IMMEDIATE and the object is not yet loaded, you should return MK_E_EXCEEDEDDEADLINE. If the object is loaded, your implementation should determine whether the object is running (for example, by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleisrunning">OleIsRunning</a> function). If it is not running and the <i>dwSpeedNeeded</i> value is BINDSPEED_MODERATE, your implementation should return MK_E_EXCEEDEDDEADLINE. If the object is not running and <i>dwSpeedNeeded</i> is BINDSPEED_INDEFINITE, your implementation should call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olerun">OleRun</a> function to put the object in the running state. Then it can query the object for the requested interface. Note that it is important the object be running before you query for the interface.
     * 
     * If <i>pszItem</i> names a pseudo-object, your implementation can ignore the <i>dwSpeedNeeded</i> parameter because a pseudo-object is running whenever its container is running. In this case, your implementation can simply query for the requested interface.
     * 
     * If you need more specific information about the time limit than is given by <i>dwSpeedNeeded</i>, you can call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getbindoptions">IBindCtx::GetBindOptions</a> on the <i>pbc</i> parameter to get the actual deadline parameter.
     * @param {PWSTR} pszItem The container's name for the requested object.
     * @param {Integer} dwSpeedNeeded Indicates approximately how long the caller will wait to get the object. Possible values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-bindspeed">BINDSPEED</a>.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context object to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the binding implementation should retrieve information about its environment.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface pointer requested.
     * @returns {Pointer<Void>} Address of the pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObject</i> contains the requested interface pointer to the object named by <i>pszItem</i>. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the *<i>ppvObject</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation sets *<i>ppvObject</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleitemcontainer-getobject
     */
    GetObject(pszItem, dwSpeedNeeded, pbc, riid) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(6, this, "ptr", pszItem, "uint", dwSpeedNeeded, "ptr", pbc, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Retrieves a pointer to the storage for the specified object.
     * @remarks
     * The item moniker implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtostorage">IMoniker::BindToStorage</a> calls this method.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If <i>pszItem</i> designates a pseudo-object, your implementation of <b>IOleItemContainer::GetObjectStorage</b> should return MK_E_NOSTORAGE, because pseudo-objects do not have their own independent storage. If <i>pszItem</i> designates an embedded object, or a portion of the document that has its own storage, your implementation should return the specified interface pointer on the appropriate storage object.
     * @param {PWSTR} pszItem The compound document's name for the object whose storage is requested.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the binding implementation should retrieve information about its environment.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the object, usually <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>.
     * @returns {Pointer<Void>} Address of a pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvStorage</i> contains the requested interface pointer to the storage for the object named by <i>pszItem</i>. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on *<i>ppvStorage</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, *<i>ppvStorage</i> is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleitemcontainer-getobjectstorage
     */
    GetObjectStorage(pszItem, pbc, riid) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(7, this, "ptr", pszItem, "ptr", pbc, "ptr", riid, "ptr*", &ppvStorage := 0, "HRESULT")
        return ppvStorage
    }

    /**
     * Determines whether the specified object is running.
     * @remarks
     * The item moniker implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isrunning">IMoniker::IsRunning</a> calls this method.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation of <b>IOleItemContainer::IsRunning</b> should first determine whether <i>pszItem</i> identifies one of the container's objects. If it does not, your implementation should return MK_E_NOOBJECT. If the object is not loaded, your implementation should return S_FALSE. If it is loaded, your implementation can call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleisrunning">OleIsRunning</a> function to determine whether it is running.
     * 
     * If <i>pszItem</i> names a pseudo-object, your implementation can simply return S_OK because a pseudo-object is running whenever its container is running.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleitemcontainer-isrunning
     */
    IsRunning(pszItem) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(8, this, "ptr", pszItem, "HRESULT")
        return result
    }
}
