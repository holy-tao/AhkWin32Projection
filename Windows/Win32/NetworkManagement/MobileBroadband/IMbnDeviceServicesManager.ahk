#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMbnDeviceServicesContext.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to IMbnDeviceServicesContext objects and Mobile Broadband device service notifications.
 * @remarks
 * 
 * The following procedure describes how to register for notifications.<ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iconnectionpoint">IConnectionPoint</a> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an <b>IMbnDeviceServicesManager</b> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass IID_IMbnDeviceServicesEvents to RIID.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on an object that implements <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> to PUNK.</li>
 * </ol>
 * 
 * 
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * 
 * For sample code that registers COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/january/msdn-magazine-january-2001">COM Connection Points article</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbndeviceservicesmanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnDeviceServicesManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnDeviceServicesManager
     * @type {Guid}
     */
    static IID => Guid("{20a26258-6811-4478-ac1d-13324e45e41c}")

    /**
     * The class identifier for MbnDeviceServicesManager
     * @type {Guid}
     */
    static CLSID => Guid("{2269daa3-2a9f-4165-a501-ce00a6f7a75b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceServicesContext"]

    /**
     * Gets the IMbnDeviceServicesContext interface for a specific Mobile Broadband device.
     * @param {BSTR} networkInterfaceID A string that contains the ID of the Mobile Broadband device. The ID can be obtained using the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-get_interfaceid">InterfaceID</a> property
     * @returns {IMbnDeviceServicesContext} Pointer to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicescontext">IMbnDeviceServicesContext</a> for the device specified by <i>networkInterfaceID</i> or <b>NULL</b> if there is no matching interface.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicesmanager-getdeviceservicescontext
     */
    GetDeviceServicesContext(networkInterfaceID) {
        networkInterfaceID := networkInterfaceID is String ? BSTR.Alloc(networkInterfaceID).Value : networkInterfaceID

        result := ComCall(3, this, "ptr", networkInterfaceID, "ptr*", &mbnDevicesContext := 0, "HRESULT")
        return IMbnDeviceServicesContext(mbnDevicesContext)
    }
}
