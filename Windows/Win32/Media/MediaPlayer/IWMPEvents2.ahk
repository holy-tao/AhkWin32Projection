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
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents2-deviceconnect
     */
    DeviceConnect(pDevice) {
        ComCall(48, this, "ptr", pDevice)
    }

    /**
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents2-devicedisconnect
     */
    DeviceDisconnect(pDevice) {
        ComCall(49, this, "ptr", pDevice)
    }

    /**
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @param {Integer} NewStatus 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents2-devicestatuschange
     */
    DeviceStatusChange(pDevice, NewStatus) {
        ComCall(50, this, "ptr", pDevice, "int", NewStatus)
    }

    /**
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @param {Integer} NewState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents2-devicesyncstatechange
     */
    DeviceSyncStateChange(pDevice, NewState) {
        ComCall(51, this, "ptr", pDevice, "int", NewState)
    }

    /**
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @param {IDispatch} pMedia 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents2-devicesyncerror
     */
    DeviceSyncError(pDevice, pMedia) {
        ComCall(52, this, "ptr", pDevice, "ptr", pMedia)
    }

    /**
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @param {HRESULT} hrResult 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents2-createpartnershipcomplete
     */
    CreatePartnershipComplete(pDevice, hrResult) {
        ComCall(53, this, "ptr", pDevice, "int", hrResult)
    }
}
