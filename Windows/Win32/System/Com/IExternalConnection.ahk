#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Manages a server object's count of marshaled, or external, connections. A server that maintains such a count can detect when it has no external connections and shut itself down in an orderly fashion.
 * @remarks
 * 
  * <b>IExternalConnection</b> is most commonly implemented on server objects, to enable the orderly shutdown of a link to an embedded object following a silent update. Objects that do not implement <b>IExternalConnection</b> risk losing data in such a situation: When the final link client releases the embedded (server) object, the last external connection on the object's stub manager is released, causing the stub manager to release its pointers to interfaces on the embedded object and initiate shutdown of the object. At this point, the server object calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-saveobject">IOleClientSite::SaveObject</a> on the link container, and the link container's return call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> fails because the stub manager no longer has a pointer to the embedded object. Any unsaved changes to the server object's data would then be lost. 
  * 
  * 
  * 
  * If the server object implements <b>IExternalConnection</b>, however, its stub manager will not release its connection to the object when the last external connection is released. Instead, it will stay connected until the object is ready to destroy itself. 
  * 
  * In standard marshaling, to increment the object's count of external connections, COM calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iexternalconnection-addconnection">IExternalConnection::AddConnection</a> on the object when the object is first marshaled. The stub manager calls the methods of <b>IExternalConnection</b> on the object as subsequent external connections are obtained and released. When the object's count of external connections goes to zero, the object can save its data and then revoke itself from the running object table and do whatever else is necessary to reduce its object reference count to zero.
  * 
  * An object that implements <b>IExternalConnection</b> should explicitly call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codisconnectobject">CoDisconnectObject</a> on itself when its external reference count drops to 0. This call will cause the stub manager to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the object so that the object can destroy itself.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iexternalconnection
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IExternalConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExternalConnection
     * @type {Guid}
     */
    static IID => Guid("{00000019-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddConnection", "ReleaseConnection"]

    /**
     * 
     * @param {Integer} extconn 
     * @param {Integer} reserved 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iexternalconnection-addconnection
     */
    AddConnection(extconn, reserved) {
        result := ComCall(3, this, "uint", extconn, "uint", reserved, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} extconn 
     * @param {Integer} reserved 
     * @param {BOOL} fLastReleaseCloses 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iexternalconnection-releaseconnection
     */
    ReleaseConnection(extconn, reserved, fLastReleaseCloses) {
        result := ComCall(4, this, "uint", extconn, "uint", reserved, "int", fLastReleaseCloses, "uint")
        return result
    }
}
