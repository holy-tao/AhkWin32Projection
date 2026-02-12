#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IUPnPDevices.ahk
#Include .\IUPnPDevice.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IUPnPDeviceFinder interface enables an application to find a device.
 * @see https://learn.microsoft.com/windows/win32/api//content/upnp/nn-upnp-iupnpdevicefinder
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceFinder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceFinder
     * @type {Guid}
     */
    static IID => Guid("{adda3d55-6f72-4319-bff9-18600a539b10}")

    /**
     * The class identifier for UPnPDeviceFinder
     * @type {Guid}
     */
    static CLSID => Guid("{e2085f28-feb7-404a-b8e7-e659bdeaaa02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindByType", "CreateAsyncFind", "StartAsyncFind", "CancelAsyncFind", "FindByUDN"]

    /**
     * The FindByType method searches synchronously for devices by device type or service type.
     * @remarks
     * This method does not return until the search is complete. The search can take at least nine seconds, and possibly more. This method must not be called from a thread that processes user interface messages.
     * @param {BSTR} bstrTypeURI Specifies the type URI for the device or service type for which to search.
     * @param {Integer} dwFlags Must be zero. This parameter is reserved for future use.
     * @returns {IUPnPDevices} Receives a reference to a collection of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevices">IUPnPDevices</a> devices that were found.
     * @see https://learn.microsoft.com/windows/win32/api//content/upnp/nf-upnp-iupnpdevicefinder-findbytype
     */
    FindByType(bstrTypeURI, dwFlags) {
        if(bstrTypeURI is String) {
            pin := BSTR.Alloc(bstrTypeURI)
            bstrTypeURI := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrTypeURI, "uint", dwFlags, "ptr*", &pDevices := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUPnPDevices(pDevices)
    }

    /**
     * The CreateAsyncFind method creates an asynchronous search operation.
     * @remarks
     * This method returns immediately; the UPnP framework notifies the caller of any search results using the callback specified by <i>pUnkCallback</i>. This method returns a search identifier; the caller must use the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-startasyncfind">IUPnPDeviceFinder::StartAsyncFind</a> to actually begin the search.
     * 
     * In C++, the object referred to by <i>pUnkCallback</i> must support either the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefindercallback">IUPnPDeviceFinderCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface. Optionally, the object referred to by <i>pUnkCallback</i>  might support the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefinderaddcallbackwithinterface">IUPnPDeviceFinderAddCallbackWithInterface</a> interface, in addition to the <b>IUPnPDeviceFinderCallback</b> interface. The UPnP framework first queries <i>pUnkCallback</i> for the <b>IUPnPDeviceFinderAddCallbackWithInterface</b> interface. If the interface is not supported, the UPnP framework next queries <i>pUnkCallback</i> for the <b>IUPnPDeviceFinderCallback</b> interface.  If it is not supported, the UPnP framework then queries <i>pUnkCallback</i> for the <b>IDispatch</b> interface. If the <b>IDispatch</b> interface is not supported, the UPnP framework returns E_FAIL.
     * 
     * In VBScript, the second argument must be <b>GetRef</b>(<i>funcname</i>), where <i>funcname</i> is the name of the callback subroutine.
     * 
     * In Visual Basic, the callback function must be declared with three parameters. The callback function uses the values specified for each parameter: <ul>
     * <li><i>param1</i> is the Device object of the new device; it is only valid when <i>param3</i> is zero. </li>
     * <li><i>param2</i> is the UDN of the found or removed device; it is only valid when <i>param3</i> is zero or one. 
     * </li>
     * <li><i>param3</i> is the type of callback. Valid values are: <dl>
     * <dd>0—indicates a new device. 
     * 
     * </dd>
     * <dd>1—indicates a device has been removed. 
     * 
     * </dd>
     * <dd>2—indicates the search is complete. 
     * </dd>
     * </dl>
     * </li>
     * </ul>
     * @param {BSTR} bstrTypeURI Specifies the uniform resource identifier (URI) for which to search.
     * @param {Integer} dwFlags Specify zero. This parameter is reserved for future use.
     * @param {IUnknown} punkDeviceFinderCallback Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface object that specifies the callback that the UPnP framework must use to communicate the results of this asynchronous search.
     * 
     * The object referred to by <i>pUnkCallback</i> must support either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefindercallback">IUPnPDeviceFinderCallback</a> interface or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface. The object referred to by <i>pUnkCallback</i> might support the <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevicefinderaddcallbackwithinterface">IUPnPDeviceFinderAddCallbackWithInterface</a> interface, in addition to the <b>IUPnPDeviceFinderCallback</b> interface.
     * @returns {Integer} Reference to a <b>LONG</b> that receives the identifier for this particular search. The application must supply this identifier to other asynchronous search methods that are called.
     * @see https://learn.microsoft.com/windows/win32/api//content/upnp/nf-upnp-iupnpdevicefinder-createasyncfind
     */
    CreateAsyncFind(bstrTypeURI, dwFlags, punkDeviceFinderCallback) {
        if(bstrTypeURI is String) {
            pin := BSTR.Alloc(bstrTypeURI)
            bstrTypeURI := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrTypeURI, "uint", dwFlags, "ptr", punkDeviceFinderCallback, "int*", &plFindData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plFindData
    }

    /**
     * The StartAsyncFind method starts an asynchronous search operation.
     * @remarks
     * You can have more than one 
     * <b>StartAsyncFind</b> operation running at the same time; starting another 
     * <b>StartAsyncFind</b> does not cancel a previous 
     * <b>StartAsyncFind</b> operation.
     * @param {Integer} lFindData Specifies the search to start. The value of <i>lFindData</i> is the value returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/upnp/nf-upnp-iupnpdevicefinder-startasyncfind
     */
    StartAsyncFind(lFindData) {
        result := ComCall(9, this, "int", lFindData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CancelAsyncFind method cancels an asynchronous search.
     * @remarks
     * Applications can keep asynchronous searches running until the application exits. Always cancel outstanding operations when exiting an application.
     * @param {Integer} lFindData Specifies the search to cancel. The value of <i>lFindData</i> is the value returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicefinder-createasyncfind">IUPnPDeviceFinder::CreateAsyncFind</a>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/upnp/nf-upnp-iupnpdevicefinder-cancelasyncfind
     */
    CancelAsyncFind(lFindData) {
        result := ComCall(10, this, "int", lFindData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FindByUDN method searches synchronously for a device by its unique device name (UDN).
     * @remarks
     * This method returns as soon as a device that matches the specified UDN is found. If no device is found, the method takes at least nine seconds to return, and possibly longer.
     * @param {BSTR} bstrUDN Specifies the UDN for which to search. This value is case sensitive, and should be provided as  lower-case (e.g. uuid:e8f85dfd-ff...).
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> object that contains the requested device. Receives <b>NULL</b> if the specified device is not found.
     * @see https://learn.microsoft.com/windows/win32/api//content/upnp/nf-upnp-iupnpdevicefinder-findbyudn
     */
    FindByUDN(bstrUDN) {
        if(bstrUDN is String) {
            pin := BSTR.Alloc(bstrUDN)
            bstrUDN := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrUDN, "ptr*", &pDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUPnPDevice(pDevice)
    }
}
