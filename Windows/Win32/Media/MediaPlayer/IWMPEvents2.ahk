#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPEvents.ahk

/**
 * The IWMPEvents2 interface provides events originating from the Windows Media Player 10 or later control to which an embedding program can respond. The events exposed by IWMPEvents2 are also exposed by the _WMPOCXEvents interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpevents2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPEvents2 extends IWMPEvents{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPEvents2
     * @type {Guid}
     */
    static IID => Guid("{1e7601fa-47ea-4107-9ea9-9004ed9684ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 48

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeviceConnect", "DeviceDisconnect", "DeviceStatusChange", "DeviceSyncStateChange", "DeviceSyncError", "CreatePartnershipComplete"]

    /**
     * The DeviceConnect event occurs when the user connects a device to the computer.
     * @remarks
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPSyncDevice} pDevice Address of the <b>IWMPSyncDevice</b> interface that represents the device that the user connected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents2-deviceconnect
     */
    DeviceConnect(pDevice) {
        ComCall(48, this, "ptr", pDevice)
    }

    /**
     * The DeviceDisconnect event occurs when the user disconnects a device from the computer.
     * @remarks
     * 
     * Use <b>IWMPSyncDevice::isIdentical</b> to determine whether a particular device matches the device that the user disconnected.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPSyncDevice} pDevice Address of the <b>IWMPSyncDevice</b> interface that represents the device that the user disconnected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents2-devicedisconnect
     */
    DeviceDisconnect(pDevice) {
        ComCall(49, this, "ptr", pDevice)
    }

    /**
     * The DeviceStatusChange event occurs when the partnership status of a device changes.
     * @remarks
     * 
     * Use <b>IWMPSyncDevice::isIdentical</b> to determine whether a particular device matches the device for which the status changed.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPSyncDevice} pDevice Address of the <b>IWMPSyncDevice</b> interface that represents the device for which the status changed.
     * @param {Integer} NewStatus <b>WMPDeviceStatus</b> enumeration value that represents the new status for the device specified by <i>pDevice</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents2-devicestatuschange
     */
    DeviceStatusChange(pDevice, NewStatus) {
        ComCall(50, this, "ptr", pDevice, "int", NewStatus)
    }

    /**
     * The DeviceSyncStateChange event occurs when the synchronization state of a device changes.
     * @remarks
     * 
     * Use <b>IWMPSyncDevice::isIdentical</b> to determine whether a particular device matches the device for which the synchronization state changed.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPSyncDevice} pDevice Address of the <b>IWMPSyncDevice</b> interface that represents the device for which the synchronization state changed.
     * @param {Integer} NewState <b>WMPSyncState</b> enumeration value that represents the new synchronization state for the device specified by <i>pDevice</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents2-devicesyncstatechange
     */
    DeviceSyncStateChange(pDevice, NewState) {
        ComCall(51, this, "ptr", pDevice, "int", NewState)
    }

    /**
     * The DeviceSyncError event occurs in response to a synchronization error.
     * @remarks
     * 
     * You should call <b>QueryInterface</b> on <i>pMedia</i> to get the <b>IWMPMedia2</b> interface for the <b>Media</b> object. You can then use <b>IWMPMedia2::get_error</b> to retrieve more information about the error that occurred.
     * 
     * Use <b>IWMPSyncDevice::isIdentical</b> to determine whether a particular device matches the device for which the error occurred.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPSyncDevice} pDevice Address of the <b>IWMPSyncDevice</b> interface that represents the device for which the synchronization error occurred.
     * @param {IDispatch} pMedia Address of the <b>IWMPDispatch</b> interface that represents the media item for which the synchronization error occurred.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents2-devicesyncerror
     */
    DeviceSyncError(pDevice, pMedia) {
        ComCall(52, this, "ptr", pDevice, "ptr", pMedia)
    }

    /**
     * The CreatePartnershipComplete event occurs when an asynchronous call to IWMPSyncDevice::createPartnership completes.
     * @remarks
     * 
     * A call to <b>IWMPSyncDevice::createPartnership</b> starts the asynchronous operation of creating a partnership between Windows Media Player and a device. This call returns immediately. When the operation that creates the partnership ends, <b>CreatePartnershipComplete</b> occurs.
     * 
     * Receiving this event notification does not guarantee that a partnership exists.
     * 
     * This event is broadcasted to all remoted Windows Media Player control instances.
     * 
     * Use <b>IWMPSyncDevice::isIdentical</b> to determine whether a particular device matches the device for which the partnership was created.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPSyncDevice} pDevice Address of the <b>IWMPSyncDevice</b> interface that represents the device object for which the partnership was created.
     * @param {HRESULT} hrResult The success or error <b>HRESULT</b> for the create partnership operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents2-createpartnershipcomplete
     */
    CreatePartnershipComplete(pDevice, hrResult) {
        ComCall(53, this, "ptr", pDevice, "int", hrResult)
    }
}
