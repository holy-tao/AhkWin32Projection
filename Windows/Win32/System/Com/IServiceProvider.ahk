#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The IServiceProvider interface provides a generic access mechanism to locate a GUID-identified service.
 * @remarks
 * The **IServiceProvider** interface is a generic access mechanism to locate a GUID-identified service that is provided through a control or any other object that the service can communicate with. For example, an embedded object (such as an OLE control) typically communicates only with its associated client site object in the container through the [IOleClientSite](../oleidl/nn-oleidl-ioleclientsite.md) interface that is supplied by using [IOleObject::SetClientSite](../oleidl/nf-oleidl-ioleobject-setclientsite.md). The embedded object must ask the client site for some other service that the container supports when that service might not be implemented in the client site.
 * 
 * The client site must provide a means by which the control that is managed by the site can access the service when necessary. For example, the [IOleInPlaceSite::GetWindowContext](/windows/win32/api/oleidl/nf-oleidl-ioleinplacesite-getwindowcontext)) function can be used by an in-place object or control to access interface pointers for the document object that contains the site and the frame object that contains the document. Because these interface pointers exist on separate objects, the control cannot call the site's [QueryInterface](../unknwn/nf-unknwn-iunknown-queryinterface(q).md) to obtain those pointers. Instead, use the IServiceProvider interface.
 * 
 * The **IServiceProvider** interface has to overloads of a single method, [QueryService](nf-servprov-iserviceprovider-queryservice(refguid_refiid_void).md), through which a caller specifies the service ID (SID, a GUID), the IID of the interface to return, and the address of the caller's interface pointer variable. The second overload infers the IID from the output pointer passed into the method.
 * 
 * The IID for this interface is IID_IServiceProvider.
 * @see https://learn.microsoft.com/windows/win32/api//content/servprov/nn-servprov-iserviceprovider
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IServiceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{6d5140c1-7436-11ce-8034-00aa006009fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryService"]

    /**
     * Acts as the factory method for any services exposed through an implementation of IServiceProvider. Accepts a CLSID parameter.
     * @remarks
     * **QueryService** creates or accesses the implementation of the service identified with guidService. In ppv, it returns the address of the interface that is specified by riid.
     * @param {Pointer<Guid>} guidService Acts as the factory method for any services exposed through an implementation of [IServiceProvider](nn-servprov-iserviceprovider.md). Accepts a CLSID parameter.
     * 
     * 
     * The unique identifier of the service (an SID).
     * @param {Pointer<Guid>} riid The unique identifier of the interface that the caller wants to receive for the service.
     * @returns {Pointer<Pointer<Void>>} The address of the caller-allocated variable to receive the interface pointer of the service on successful return from this function. The caller becomes responsible for calling [Release](../unknwn/nf-unknwn-iunknown-release.md) through this interface pointer when the service is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api//content/servprov/nf-servprov-iserviceprovider-queryservice(refguid_refiid_void)
     */
    QueryService(guidService, riid) {
        result := ComCall(3, this, "ptr", guidService, "ptr", riid, "ptr*", &ppvObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvObject
    }
}
