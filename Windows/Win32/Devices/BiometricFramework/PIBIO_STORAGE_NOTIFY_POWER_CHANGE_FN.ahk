#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Receives notification about a change in the computer power state and prepares the storage adapter accordingly.
 * @remarks
 * When it receives a 
 *     <a href="https://docs.microsoft.com/windows/desktop/Power/pbt-apmpowerstatuschange">PBT_APMPOWERSTATUSCHANGE</a> event, the adapter 
 *      should call the Microsoft Win32 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getsystempowerstatus">GetSystemPowerStatus</a> API to 
 *      determine the new power status.
 * 
 * The biometric framework calls this adapter entry point asynchronously, in the context of an arbitrary thread. 
 *      It is the adapter's responsibility to synchronize the processing of this call with any other work it may be 
 *      doing.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_notify_power_change_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure 
     *       associated with the biometric unit performing the operation.
     * @param {Integer} PowerEventType 
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it returns an 
     *        <b>HRESULT</b> value that indicates the error. Possible values include, but are not 
     *        limited to, those in the following table.  For a list of common error codes, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The <i>Pipeline</i> argument was <b>NULL</b>.
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
     * The <i>PowerEventType</i> argument was not one of the values listed in the table.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, PowerEventType) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, UInt32, PowerEventType, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN {
        /**
         * Creates a PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
