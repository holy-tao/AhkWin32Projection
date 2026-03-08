#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The IExternalConnection (objidlbase.h) interface manages a server object's count of marshaled, or external, connections.
 * @remarks
 * <b>IExternalConnection</b> is most commonly implemented on server objects, to enable the orderly shutdown of a link to an embedded object following a silent update. Objects that do not implement <b>IExternalConnection</b> risk losing data in such a situation: When the final link client releases the embedded (server) object, the last external connection on the object's stub manager is released, causing the stub manager to release its pointers to interfaces on the embedded object and initiate shutdown of the object. At this point, the server object calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-saveobject">IOleClientSite::SaveObject</a> on the link container, and the link container's return call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> fails because the stub manager no longer has a pointer to the embedded object. Any unsaved changes to the server object's data would then be lost. 
 * 
 * 
 * 
 * If the server object implements <b>IExternalConnection</b>, however, its stub manager will not release its connection to the object when the last external connection is released. Instead, it will stay connected until the object is ready to destroy itself. 
 * 
 * In standard marshaling, to increment the object's count of external connections, COM calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iexternalconnection-addconnection">IExternalConnection::AddConnection</a> on the object when the object is first marshaled. The stub manager calls the methods of <b>IExternalConnection</b> on the object as subsequent external connections are obtained and released. When the object's count of external connections goes to zero, the object can save its data and then revoke itself from the running object table and do whatever else is necessary to reduce its object reference count to zero.
 * 
 * An object that implements <b>IExternalConnection</b> should explicitly call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codisconnectobject">CoDisconnectObject</a> on itself when its external reference count drops to 0. This call will cause the stub manager to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the object so that the object can destroy itself.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-iexternalconnection
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
     * The IExternalConnection::AddConnection (objidlbase.h) method increments the count of an object's strong external connections.
     * @remarks
     * An object created by a EXE object server relies on its stub manager to call <b>AddConnection</b> whenever a link client activates and therefore creates an external lock on the object. When the link client breaks the connection, the stub manager calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iexternalconnection-releaseconnection">IExternalConnection::ReleaseConnection</a> to release the lock.
     * 
     * DLL object applications exist in the same process space as their objects, so they do not use RPC (remote procedure calls) and do not have stub managers to keep track of external connections. Therefore, DLL servers that support external links to their objects must implement <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iexternalconnection">IExternalConnection</a> so that link clients can directly call the interface to inform them when connections are added or released.
     * 
     * The following is a typical implementation for the <b>AddConnection</b> method.
     * 
     * 
     * ``` syntax
     * DWORD MyInterface::AddConnection(DWORD extconn, DWORD dwReserved)
     * {
     *     return extconn &amp; EXTCONN_STRONG ? ++m_cStrong : 0;
     * }
     * 
     * ```
     * @param {Integer} extconn The type of external connection to the object. The only type of external connection currently supported by this interface is strong, which means that the object must remain alive as long as this external connection exists. Strong external connections are represented by the value EXTCONN_STRONG, which is defined in the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-extconn">EXTCONN</a>.
     * @param {Integer} reserved Information about the connection. This parameter is reserved for use by OLE. Its value can be zero, but not necessarily. Therefore, implementations of <b>AddConnection</b> should not contain blocks of code whose execution depends on whether a zero value is returned.
     * @returns {Integer} The method returns the count of connections. This value is intended to be used only for debugging purposes.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iexternalconnection-addconnection
     */
    AddConnection(extconn, reserved) {
        result := ComCall(3, this, "uint", extconn, "uint", reserved, "uint")
        return result
    }

    /**
     * The IExternalConnection::ReleaseConnection (objidlbase.h) method decrements the count of an object's strong external connections.
     * @remarks
     * If <i>fLastReleaseCloses</i> equals <b>TRUE</b>, calling <b>ReleaseConnection</b> causes the object to shut itself down. Calling this method is the only way in which a DLL object, running in the same process space as the container application, will know when to close following a silent update.
     * @param {Integer} extconn The type of external connection to the object. The only type of external connection currently supported by this interface is strong, which means that the object must remain alive as long as this external connection exists. Strong external connections are represented by the value EXTCONN_STRONG, which is defined in the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-extconn">EXTCONN</a>.
     * @param {Integer} reserved Information about the connection. This parameter is reserved for use by OLE. Its value can be zero, but not necessarily. Therefore, implementations of <b>ReleaseConnection</b> should not contain blocks of code whose execution depends on whether a zero value is returned.
     * @param {BOOL} fLastReleaseCloses This parameter is <b>TRUE</b> if the connection being released is the last external lock on the object, and therefore the object should close. Otherwise, the object should remain open until closed by the user or another process.
     * @returns {Integer} The method returns the count of connections. This value is intended to be used only for debugging purposes.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iexternalconnection-releaseconnection
     */
    ReleaseConnection(extconn, reserved, fLastReleaseCloses) {
        result := ComCall(4, this, "uint", extconn, "uint", reserved, "int", fLastReleaseCloses, "uint")
        return result
    }
}
