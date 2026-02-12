#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * PFN_AUTHENTICATION_CALLBACK_EX function is a callback function prototype used in conjunction with the BluetoothRegisterForAuthenticationEx function.
 * @see https://learn.microsoft.com/windows/win32/api//content/bluetoothapis/nc-bluetoothapis-pfn_authentication_callback_ex
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class PFN_AUTHENTICATION_CALLBACK_EX extends IUnknown {

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
     * @param {Pointer<BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS>} pAuthCallbackParams 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvParam, pAuthCallbackParams) {
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvParamMarshal, pvParam, "ptr", pAuthCallbackParams, "int")
        return result
    }
}
