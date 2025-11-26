#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SILO_INFO.ahk
#Include ..\..\Devices\PortableDevices\IPortableDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IEnhancedStorageSilo interface is the point of access for an IEEE 1667 silo and is used to obtain information and perform operations at the silo level.
 * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nn-ehstorapi-ienhancedstoragesilo
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageSilo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnhancedStorageSilo
     * @type {Guid}
     */
    static IID => Guid("{5aef78c6-2242-4703-bf49-44b29357a359}")

    /**
     * The class identifier for EnhancedStorageSilo
     * @type {Guid}
     */
    static CLSID => Guid("{cb25220c-76c7-4fee-842b-f3383cd022bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "GetActions", "SendCommand", "GetPortableDevice", "GetDevicePath"]

    /**
     * Returns the descriptive information associated with the silo object.
     * @returns {SILO_INFO} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ehstorapi/ns-ehstorapi-silo_info">SILO_INFO</a> object containing descriptive information associated with the silo.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstoragesilo-getinfo
     */
    GetInfo() {
        pSiloInfo := SILO_INFO()
        result := ComCall(3, this, "ptr", pSiloInfo, "HRESULT")
        return pSiloInfo
    }

    /**
     * Returns an enumeration of all actions available to the silo object.
     * @param {Pointer<Pointer<IEnhancedStorageSiloAction>>} pppIEnhancedStorageSiloActions Array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstoragesiloaction">IEnhancedStorageAction</a> interface objects that represent the actions available for the silo object. This array is allocated within the API when at least one action is available to the silo.
     * @param {Pointer<Integer>} pcEnhancedStorageSiloActions Count of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ehstorapi/nn-ehstorapi-ienhancedstoragesiloaction">IEnhancedStorageAction</a> pointers returned. This value indicates the dimension of the  array represented by <i>pppIEnhancedStorageSilos</i>.
     * @returns {HRESULT} This method can return one of these values.
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
     * One or more ACTs were found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pppIEnhancedStorageSiloActions</i> or  <i>pcEnhancedStorageSiloActions</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstoragesilo-getactions
     */
    GetActions(pppIEnhancedStorageSiloActions, pcEnhancedStorageSiloActions) {
        pppIEnhancedStorageSiloActionsMarshal := pppIEnhancedStorageSiloActions is VarRef ? "ptr*" : "ptr"
        pcEnhancedStorageSiloActionsMarshal := pcEnhancedStorageSiloActions is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pppIEnhancedStorageSiloActionsMarshal, pppIEnhancedStorageSiloActions, pcEnhancedStorageSiloActionsMarshal, pcEnhancedStorageSiloActions, "HRESULT")
        return result
    }

    /**
     * Sends a raw silo command to the silo object. This method is utilized to communicate with a silo which is not represented by a driver.
     * @param {Integer} Command The silo command to be issued. 8 bits of this value are placed in the byte at position 3 of the CDB sent to the device; i.e. the second byte of the <b>SecurityProtocolSpecific</b> field.
     * @param {Pointer<Integer>} pbCommandBuffer The command payload sent to the device in the send data phase of the command.
     * @param {Integer} cbCommandBuffer The count of bytes contained in the <i>pbCommandBuffer</i> buffer.
     * @param {Pointer<Integer>} pcbResponseBuffer On method entry, contains the size of <i>pbResponseBuffer</i> in bytes. On method exit, it contains the count of bytes contained in the returned <i>pbResponse</i> buffer.
     * @returns {Integer} The response payload that is returned to the host from the device in the receive data phase of the command.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstoragesilo-sendcommand
     */
    SendCommand(Command, pbCommandBuffer, cbCommandBuffer, pcbResponseBuffer) {
        pbCommandBufferMarshal := pbCommandBuffer is VarRef ? "char*" : "ptr"
        pcbResponseBufferMarshal := pcbResponseBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "char", Command, pbCommandBufferMarshal, pbCommandBuffer, "uint", cbCommandBuffer, "char*", &pbResponseBuffer := 0, pcbResponseBufferMarshal, pcbResponseBuffer, "HRESULT")
        return pbResponseBuffer
    }

    /**
     * Obtains an IPortableDevice pointer used to issue commands to the corresponding Enhanced Storage silo driver.
     * @returns {IPortableDevice} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledevice">IPortableDevice</a>  object.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstoragesilo-getportabledevice
     */
    GetPortableDevice() {
        result := ComCall(6, this, "ptr*", &ppIPortableDevice := 0, "HRESULT")
        return IPortableDevice(ppIPortableDevice)
    }

    /**
     * Retrieves the path to the silo device node. The returned string is suitable for passing to Windows System APIs such as CreateFile or SetupDiOpenDeviceInterface.
     * @returns {PWSTR} A pointer to a string that represents the path to the Silo device node.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstoragesilo-getdevicepath
     */
    GetDevicePath() {
        result := ComCall(7, this, "ptr*", &ppwszSiloDevicePath := 0, "HRESULT")
        return ppwszSiloDevicePath
    }
}
