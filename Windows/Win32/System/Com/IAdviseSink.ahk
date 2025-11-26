#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables containers and other objects to receive notifications of data changes, view changes, and compound-document changes occurring in objects of interest.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iadvisesink
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAdviseSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdviseSink
     * @type {Guid}
     */
    static IID => Guid("{0000010f-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDataChange", "OnViewChange", "OnRename", "OnSave", "OnClose"]

    /**
     * Called by the server to notify a data object's currently registered advise sinks that data in the object has changed.
     * @remarks
     * 
     * Object handlers and containers of link objects implement <b>IAdviseSink::OnDataChange</b> to take appropriate steps when notified that data in the object has changed. They also must call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a> to set up advisory connections with the objects in whose data they are interested.
     * 
     * Containers that take advantage of OLE's caching support do not need to register for data-change notifications, because the information necessary to update the container's presentation of the object, including any changes in its data, are maintained in the object's cache.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If you implement <b>IAdviseSink::OnDataChange</b> for a container, remember that this method is asynchronous and that making synchronous calls within asynchronous methods is not valid. Therefore, you cannot call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> to obtain the data you need to update your object. Instead, you either post an internal message, or invalidate the rectangle for the changed data by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-invalidaterect">InvalidateRect</a> and waiting for a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message, at which point you are free to get the data and update the object.
     * 
     * The data itself, which is valid only for the duration of the call, is passed using the storage medium pointed to by <i>pStgmed</i>. Since the caller owns the medium, the advise sink should not free it. Also, if <i>pStgmed</i> points to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface, the sink must not increment the reference count.
     * 
     * 
     * @param {Pointer<FORMATETC>} pFormatetc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure, which describes the format, target device, rendering, and storage information of the calling data object.
     * @param {Pointer<STGMEDIUM>} pStgmed A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure, which defines the storage medium (global memory, disk file, storage object, stream object, GDI object, or undefined) and ownership of that medium for the calling data object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iadvisesink-ondatachange
     */
    OnDataChange(pFormatetc, pStgmed) {
        ComCall(3, this, "ptr", pFormatetc, "ptr", pStgmed)
    }

    /**
     * Notifies an object's registered advise sinks that its view has changed.
     * @remarks
     * 
     * Containers register to be notified when an object's view changes by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-setadvise">IViewObject::SetAdvise</a>. After it is registered, the object will call the sink's <b>IAdviseSink::OnViewChange</b> method when appropriate. <b>OnViewChange</b> can be called when the object is in either the loaded or running state.
     * 
     * Even though <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> values are individual flag bits, <i>dwAspect</i> may represent only one value. That is, <i>dwAspect</i> cannot contain the result of an OR operation combining two or more <b>DVASPECT</b> values.
     * 
     * The <i>lindex</i> parameter represents the part of the aspect that is of interest. The value of <i>lindex</i> depends on the value of <i>dwAspect</i>. If <i>dwAspect</i> is either DVASPECT_THUMBNAIL or DVASPECT_ICON, <i>lindex</i> is ignored. If <i>dwAspect</i> is DVASPECT_CONTENT, <i>lindex</i> must be -1, which indicates that the entire view is of interest and is the only value that is currently valid.
     * 
     * 
     * @param {Integer} dwAspect The aspect, or view, of the object. Contains a value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> enumeration.
     * @param {Integer} lindex The portion of the view that has changed. Currently only -1 is valid.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iadvisesink-onviewchange
     */
    OnViewChange(dwAspect, lindex) {
        ComCall(4, this, "uint", dwAspect, "int", lindex)
    }

    /**
     * Called by the server to notify all registered advisory sinks that the object has been renamed.
     * @remarks
     * 
     * OLE link objects normally implement <b>IAdviseSink::OnRename</b> to receive notification of a change in the name of a link source or its container. The object serving as the link source calls <b>OnRename</b> and passes its new full moniker to the object handler, which forwards the notification to the link object. In response, the link object must update its moniker. The link object, in turn, forwards the notification to its own container.
     * 
     * 
     * @param {IMoniker} pmk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the new full moniker of the object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iadvisesink-onrename
     */
    OnRename(pmk) {
        ComCall(5, this, "ptr", pmk)
    }

    /**
     * Called by the server to notify all registered advisory sinks that the object has been saved.
     * @remarks
     * 
     * Object handlers and link objects normally implement <b>IAdviseSink::OnSave</b> to receive notifications of when an object is saved to disk, either to its original storage (through a <b>Save</b> operation) or to new storage (through a <b>Save As</b> operation). Object Handlers and link objects register to be notified when an object is saved for the purpose of updating their caches, but then only if the advise flag passed during registration specifies ADVFCACHE_ONSAVE. Object handlers and link objects forward these notifications to their containers.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iadvisesink-onsave
     */
    OnSave() {
        ComCall(6, this)
    }

    /**
     * Called by the server to notify all registered advisory sinks that the object has changed from the running to the loaded state.
     * @remarks
     * 
     * The <b>OnClose</b> notification indicates that an object is making the transition from the running to the loaded state, so its container can take appropriate measures to ensure an orderly shutdown. For example, an object handler must release its pointer to the object.
     * 
     * If the object that is closing is the last open object supported by its OLE server application, the application can also shut down.
     * 
     * In the case of a link object, the notification that the object is closing should always be interpreted to mean that the connection to the link source has broken.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iadvisesink-onclose
     */
    OnClose() {
        ComCall(7, this)
    }
}
