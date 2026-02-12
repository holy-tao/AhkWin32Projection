#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback prototype used in association with selecting Bluetooth devices.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure pointed to in <i>pDevice</i> is the device that the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothselectdevices">BluetoothSelectDevices</a> function is querying to determine if that device should be added to the list view.
 * 
 * If the callback performs SDP queries for each device, the list of devices from which the user can choose will be delayed until all devices can be queried. A recommended approach is to use the service to call bitfield in the class of device, available through <b>GET_COD_SERVICE</b>, to determine whether the device should be displayed to the user. The service class bitfield is available in the <b>pDevice</b> parameter through the <b>ulClassOfDevice</b> member.
 * @see https://learn.microsoft.com/windows/win32/api//content/bluetoothapis/nc-bluetoothapis-pfn_device_callback
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class PFN_DEVICE_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} pvParam 
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pDevice 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvParam, pDevice) {
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvParamMarshal, pvParam, "ptr", pDevice, "int")
        return result
    }
}
