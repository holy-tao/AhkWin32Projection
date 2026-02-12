#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IMoniker.ahk
#Include .\IOleContainer.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the primary means by which an embedded object obtains information about the location and extent of its display site, its moniker, its user interface, and other resources provided by its container.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-ioleclientsite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleClientSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleClientSite
     * @type {Guid}
     */
    static IID => Guid("{00000118-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveObject", "GetMoniker", "GetContainer", "ShowObject", "OnShowWindow", "RequestNewObjectLayout"]

    /**
     * Saves the embedded object associated with the client site. This function is synchronous; by the time it returns, the save will be completed.
     * @remarks
     * An embedded object calls <b>SaveObject</b> to ask its container to save it to persistent storage when an end user chooses the File Update or Exit commands. The call is synchronous, meaning that by the time it returns, the save operation will be completed.
     * 
     * Calls to <b>SaveObject</b> occur in most implementations of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a>. Normally, when a container tells an object to close, the container passes a flag specifying whether the object should save itself before closing, prompt the user for instructions, or close without saving itself. If an object is instructed to save itself, either by its container or an end user, it calls <b>SaveObject</b> to ask the container application to save the object's contents before the object closes itself. If a container instructs an object not to save itself, the object should not call <b>SaveObject</b>.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation has failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleclientsite-saveobject
     */
    SaveObject() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a moniker for the object's client site. An object can force the assignment of its own or its container's moniker by specifying a value for dwAssign.
     * @remarks
     * Containers implement <b>GetMoniker</b> as a way of passing out monikers for their embedded objects to clients that need to link to those objects.
     * 
     * When a link is made to an embedded object or to a pseudo-object within it (a range of cells in a spreadsheet, for example), the object needs a moniker to construct the composite moniker indicating the source of the link. If the embedded object does not already have a moniker, it can call <b>GetMoniker</b> to request one.
     * 
     * Every container that expects to contain links to embeddings should support <b>GetMoniker</b> to give out OLEWHICHMK_CONTAINER, thus enabling link tracking when the link client and link source files move, but maintain the same relative position.
     * 
     * An object must not persistently store its full moniker or its container's moniker, because these can change while the object is not loaded. For example, either the container or the object could be renamed, in which event, storing the container's moniker or the object's full moniker would make it impossible for a client to track a link to the object.
     * 
     * In some very specialized cases, an object may no longer need a moniker previously assigned to it and may wish to have it removed as an optimization. In such cases, the object can call <b>GetMoniker</b> with OLEGETMONIKER_UNASSIGN to have the moniker removed.
     * @param {Integer} dwAssign Specifies whether to get a moniker only if one already exists, force assignment of a moniker, create a temporary moniker, or remove a moniker that has been assigned. In practice, you will usually request that the container force assignment of the moniker. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olegetmoniker">OLEGETMONIKER</a> enumeration.
     * @param {Integer} dwWhichMoniker Specifies whether to return the container's moniker, the object's moniker relative to the container, or the object's full moniker. In practice, you will usually request the object's full moniker. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olewhichmk">OLEWHICHMK</a> enumeration.
     * @returns {IMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the moniker for the object's client site. If an error occurs, the implementation must set <i>ppmk</i> to <b>NULL</b>. Each time a container receives a call to <b>IOleClientSite::GetMoniker</b>, it must increase the reference count on the <i>ppmk</i> pointer it returns. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when it is finished with the pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleclientsite-getmoniker
     */
    GetMoniker(dwAssign, dwWhichMoniker) {
        result := ComCall(4, this, "uint", dwAssign, "uint", dwWhichMoniker, "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Retrieves a pointer to the object's container.
     * @remarks
     * If a container supports links to its embedded objects, implementing <b>GetContainer</b> enables link clients to enumerate the container's objects and recursively traverse a containment hierarchy. This method is optional but recommended for all containers that expect to support links to their embedded objects.
     * 
     * Link clients can traverse a hierarchy of compound-document objects by recursively calling <b>GetContainer</b> to get a pointer to the link source's container; followed by <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get a pointer to the container's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface and, finally, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getclientsite">IOleObject::GetClientSite</a> to get the container's client site in its container.
     * 
     * Simple containers that do not support links to their embedded objects probably do not need to implement this method. Instead, they can return E_NOINTERFACE and set <i>ppContainer</i> to <b>NULL</b>.
     * @returns {IOleContainer} Address of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecontainer">IOleContainer</a> pointer variable that receives the interface pointer to the container object. If an error occurs, the implementation must set <i>ppContainer</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleclientsite-getcontainer
     */
    GetContainer() {
        result := ComCall(5, this, "ptr*", &ppContainer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOleContainer(ppContainer)
    }

    /**
     * Asks a container to display its object to the user. This method ensures that the container itself is visible and not minimized.
     * @remarks
     * After a link client binds to a link source, it commonly calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-doverb">IOleObject::DoVerb</a> on the link source, usually requesting the source to perform some action requiring that it display itself to the user. As part of its implementation of <b>IOleObject::DoVerb</b>, the link source can call <b>ShowObject</b>, which forces the client to show the link source as best it can. If the link source's container is itself an embedded object, it will recursively invoke <b>ShowObject</b> on its own container.
     * 
     * Having called the <b>ShowObject</b> method, a link source has no guarantee of being appropriately displayed because its container may not be able to do so at the time of the call. The <b>ShowObject</b> method does not guarantee visibility, only that the container will do the best it can.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client site is in an OLE 1 container.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleclientsite-showobject
     */
    ShowObject() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies a container when an embedded object's window is about to become visible or invisible. This method does not apply to an object that is activated in place and therefore has no window separate from that of its container.
     * @remarks
     * An embedded object calls <b>OnShowWindow</b> to keep its container informed when the object is open in a window. This window may or may not be currently visible to the end user. The container uses this information to shade the object's client site when the object is displayed in a window, and to remove the shading when the object is not. A shaded object, having received this notification, knows that it already has an open window and therefore can respond to being double-clicked by bringing this window quickly to the top, instead of launching its application in order to obtain a new one.
     * @param {BOOL} fShow Indicates whether an object's window is open (TRUE) or closed (FALSE).
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleclientsite-onshowwindow
     */
    OnShowWindow(fShow) {
        result := ComCall(7, this, "int", fShow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Asks a container to resize the display site for embedded objects.
     * @remarks
     * This method can either increase or decrease the space. Currently, there is no standard mechanism by which a container can negotiate how much room an object would like. When such a negotiation is defined, responding to this method will be optional for containers.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Client site does not support requests for new layout.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleclientsite-requestnewobjectlayout
     */
    RequestNewObjectLayout() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
