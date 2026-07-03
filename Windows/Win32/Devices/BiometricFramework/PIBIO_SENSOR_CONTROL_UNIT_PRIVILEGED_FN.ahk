#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN callback function (winbio_adapter.h) performs a vendor-defined control operation that requires elevated privileges.
 * @remarks
 * Your implementation of this function should be identical to your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_control_unit_fn">SensorAdapterControlUnit</a> function except that elevated privileges are required to perform the operations specified by the <i>ControlCode</i> parameter. You are responsible for defining the operations and deciding which will require elevated privilege.
 * 
 * This function must check the value of the <i>ReceiveBufferSize</i> parameter to be certain that the buffer specified by the <i>ReceiveBuffer</i> parameter is large enough to hold the data being returned.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_control_unit_privileged_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Integer} ControlCode A <b>ULONG</b> value that specifies the vendor-defined operation to perform.
     * @param {Integer} SendBuffer Pointer to a buffer that contains the control information sent to the sensor adapter. The format and content of the buffer is vendor-defined.
     * @param {Pointer} SendBufferSize Size, in bytes, of the buffer specified by the <i>SendBuffer</i> parameter.
     * @param {Integer} ReceiveBuffer Pointer to a  buffer that receives information returned by the sensor adapter in response to the control operation.  The format of the buffer is vendor-defined.
     * @param {Pointer} ReceiveBufferSize Size, in bytes, of the buffer specified by the <i>ReceiveBuffer</i> parameter.
     * @param {Pointer<Pointer>} ReceiveDataSize Pointer to a variable that receives the size, in bytes, of the data written to the buffer specified by the <i>ReceiveBuffer</i> parameter.
     * @param {Pointer<Integer>} OperationStatus Pointer to a variable that receives a vendor-defined status code that specifies the outcome of the control operation.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it must return one of the following <b>HRESULT</b> values to indicate the error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mandatory pointer argument is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b> E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size or format of the buffer specified by the <i>SendBuffer</i> parameter is not correct, or the value specified in the <i>ControlCode</i> parameter is not recognized by the adapter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_SUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified by the <i>ReceiveBuffer</i> parameter is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_DEVICE_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was a hardware failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_INVALID_CONTROL_CODE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>ControlCode</i> parameter is not recognized by the adapter.
     * 
     * <div class="alert"><b>Note</b>  Beginning with Windows 8, use only <b>E_INVALIDARG</b> to signal this condition.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, ControlCode, SendBuffer, SendBufferSize, ReceiveBuffer, ReceiveBufferSize, ReceiveDataSize, OperationStatus) {
        ReceiveDataSizeMarshal := ReceiveDataSize is VarRef ? "ptr*" : "ptr"
        OperationStatusMarshal := OperationStatus is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, UInt32, ControlCode, IntPtr, SendBuffer, IntPtr, SendBufferSize, IntPtr, ReceiveBuffer, IntPtr, ReceiveBufferSize, ReceiveDataSizeMarshal, ReceiveDataSize, OperationStatusMarshal, OperationStatus, "HRESULT")
        return result
    }

    /**
     * A PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN {
        /**
         * Creates a PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, UInt32, IntPtr, IntPtr, IntPtr, IntPtr, "ptr*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, UInt32, IntPtr, IntPtr, IntPtr, IntPtr, "ptr*", "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
