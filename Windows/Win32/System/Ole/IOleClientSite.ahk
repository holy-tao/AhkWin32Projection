#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IMoniker.ahk
#Include .\IOleContainer.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the primary means by which an embedded object obtains information about the location and extent of its display site, its moniker, its user interface, and other resources provided by its container.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleclientsite
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleclientsite-saveobject
     */
    SaveObject() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a moniker for the object's client site. An object can force the assignment of its own or its container's moniker by specifying a value for dwAssign.
     * @param {Integer} dwAssign Specifies whether to get a moniker only if one already exists, force assignment of a moniker, create a temporary moniker, or remove a moniker that has been assigned. In practice, you will usually request that the container force assignment of the moniker. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olegetmoniker">OLEGETMONIKER</a> enumeration.
     * @param {Integer} dwWhichMoniker Specifies whether to return the container's moniker, the object's moniker relative to the container, or the object's full moniker. In practice, you will usually request the object's full moniker. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olewhichmk">OLEWHICHMK</a> enumeration.
     * @returns {IMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the moniker for the object's client site. If an error occurs, the implementation must set <i>ppmk</i> to <b>NULL</b>. Each time a container receives a call to <b>IOleClientSite::GetMoniker</b>, it must increase the reference count on the <i>ppmk</i> pointer it returns. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when it is finished with the pointer.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleclientsite-getmoniker
     */
    GetMoniker(dwAssign, dwWhichMoniker) {
        result := ComCall(4, this, "uint", dwAssign, "uint", dwWhichMoniker, "ptr*", &ppmk := 0, "HRESULT")
        return IMoniker(ppmk)
    }

    /**
     * Retrieves a pointer to the object's container.
     * @returns {IOleContainer} Address of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecontainer">IOleContainer</a> pointer variable that receives the interface pointer to the container object. If an error occurs, the implementation must set <i>ppContainer</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleclientsite-getcontainer
     */
    GetContainer() {
        result := ComCall(5, this, "ptr*", &ppContainer := 0, "HRESULT")
        return IOleContainer(ppContainer)
    }

    /**
     * Asks a container to display its object to the user. This method ensures that the container itself is visible and not minimized.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleclientsite-showobject
     */
    ShowObject() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Notifies a container when an embedded object's window is about to become visible or invisible. This method does not apply to an object that is activated in place and therefore has no window separate from that of its container.
     * @param {BOOL} fShow Indicates whether an object's window is open (TRUE) or closed (FALSE).
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleclientsite-onshowwindow
     */
    OnShowWindow(fShow) {
        result := ComCall(7, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * Asks a container to resize the display site for embedded objects.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleclientsite-requestnewobjectlayout
     */
    RequestNewObjectLayout() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
