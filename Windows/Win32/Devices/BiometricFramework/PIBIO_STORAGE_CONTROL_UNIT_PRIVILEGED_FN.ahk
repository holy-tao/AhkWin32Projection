#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN callback function (winbio_adapter.h) performs a vendor-defined control operation that requires elevated privilege.
 * @remarks
 * Your implementation of this function should be identical to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_control_unit_fn">StorageAdapterControlUnit</a> function except that elevated privileges are required to perform the operations specified by the <i>ControlCode</i> parameter. You are responsible for defining the operations and deciding which will require elevated privilege.
 * 
 * This function must check the value of the <i>ReceiveBufferSize</i> parameter to be certain that the buffer specified by the <i>ReceiveBuffer</i> parameter is large enough to hold the data being returned.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_storage_control_unit_privileged_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN extends IUnknown {

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
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Integer} ControlCode 
     * @param {Pointer} SendBuffer 
     * @param {Pointer} SendBufferSize 
     * @param {Pointer} ReceiveBuffer 
     * @param {Pointer} ReceiveBufferSize 
     * @param {Pointer<Pointer>} ReceiveDataSize 
     * @param {Pointer<Integer>} OperationStatus 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, ControlCode, SendBuffer, SendBufferSize, ReceiveBuffer, ReceiveBufferSize, ReceiveDataSize, OperationStatus) {
        ReceiveDataSizeMarshal := ReceiveDataSize is VarRef ? "ptr*" : "ptr"
        OperationStatusMarshal := OperationStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "uint", ControlCode, "ptr", SendBuffer, "ptr", SendBufferSize, "ptr", ReceiveBuffer, "ptr", ReceiveBufferSize, ReceiveDataSizeMarshal, ReceiveDataSize, OperationStatusMarshal, OperationStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
