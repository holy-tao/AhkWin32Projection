#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Signals an application about notification events related to Mobile Broadband device services on the system.
 * @remarks
 * 
 * The following procedure describes how to register for notifications.<ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iconnectionpoint">IConnectionPoint</a> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesmanager">IMbnDeviceServicesManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass IID_IMbnDeviceServicesEvents to RIID.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on an object that implements <b>IMbnDeviceServicesEvents</b> to PUNK.</li>
 * </ol>
 * 
 * 
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/january/msdn-magazine-january-2001">COM Connection Points article</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbndeviceservicesevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnDeviceServicesEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnDeviceServicesEvents
     * @type {Guid}
     */
    static IID => Guid("{0a900c19-6824-4e97-b76e-cf239d0ca642}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnQuerySupportedCommandsComplete", "OnOpenCommandSessionComplete", "OnCloseCommandSessionComplete", "OnSetCommandComplete", "OnQueryCommandComplete", "OnEventNotification", "OnOpenDataSessionComplete", "OnCloseDataSessionComplete", "OnWriteDataComplete", "OnReadData", "OnInterfaceStateChange"]

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {Pointer<SAFEARRAY>} commandIDList 
     * @param {HRESULT} status 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onquerysupportedcommandscomplete
     */
    OnQuerySupportedCommandsComplete(deviceService, commandIDList, status, requestID) {
        result := ComCall(3, this, "ptr", deviceService, "ptr", commandIDList, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {HRESULT} status 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onopencommandsessioncomplete
     */
    OnOpenCommandSessionComplete(deviceService, status, requestID) {
        result := ComCall(4, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {HRESULT} status 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onclosecommandsessioncomplete
     */
    OnCloseCommandSessionComplete(deviceService, status, requestID) {
        result := ComCall(5, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {Integer} responseID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @param {HRESULT} status 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onsetcommandcomplete
     */
    OnSetCommandComplete(deviceService, responseID, deviceServiceData, status, requestID) {
        result := ComCall(6, this, "ptr", deviceService, "uint", responseID, "ptr", deviceServiceData, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {Integer} responseID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @param {HRESULT} status 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onquerycommandcomplete
     */
    OnQueryCommandComplete(deviceService, responseID, deviceServiceData, status, requestID) {
        result := ComCall(7, this, "ptr", deviceService, "uint", responseID, "ptr", deviceServiceData, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {Integer} eventID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-oneventnotification
     */
    OnEventNotification(deviceService, eventID, deviceServiceData) {
        result := ComCall(8, this, "ptr", deviceService, "uint", eventID, "ptr", deviceServiceData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {HRESULT} status 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onopendatasessioncomplete
     */
    OnOpenDataSessionComplete(deviceService, status, requestID) {
        result := ComCall(9, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {HRESULT} status 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onclosedatasessioncomplete
     */
    OnCloseDataSessionComplete(deviceService, status, requestID) {
        result := ComCall(10, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {HRESULT} status 
     * @param {Integer} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onwritedatacomplete
     */
    OnWriteDataComplete(deviceService, status, requestID) {
        result := ComCall(11, this, "ptr", deviceService, "int", status, "uint", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnDeviceService} deviceService 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onreaddata
     */
    OnReadData(deviceService, deviceServiceData) {
        result := ComCall(12, this, "ptr", deviceService, "ptr", deviceServiceData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} interfaceID 
     * @param {Integer} stateChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-oninterfacestatechange
     */
    OnInterfaceStateChange(interfaceID, stateChange) {
        interfaceID := interfaceID is String ? BSTR.Alloc(interfaceID).Value : interfaceID

        result := ComCall(13, this, "ptr", interfaceID, "int", stateChange, "HRESULT")
        return result
    }
}
