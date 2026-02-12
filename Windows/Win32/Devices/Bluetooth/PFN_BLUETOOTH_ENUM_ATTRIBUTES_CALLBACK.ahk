#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback function prototype that is called once for each attribute found in the pSDPStream parameter passed to the BluetoothSdpEnumAttributes function call.
 * @see https://learn.microsoft.com/windows/win32/api//content/bluetoothapis/nc-bluetoothapis-pfn_bluetooth_enum_attributes_callback
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK extends IUnknown {

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
     * @param {Integer} uAttribId 
     * @param {Pointer} pValueStream 
     * @param {Integer} cbStreamSize 
     * @param {Pointer<Void>} pvParam 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(uAttribId, pValueStream, cbStreamSize, pvParam) {
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", uAttribId, "ptr", pValueStream, "uint", cbStreamSize, pvParamMarshal, pvParam, "int")
        return result
    }
}
