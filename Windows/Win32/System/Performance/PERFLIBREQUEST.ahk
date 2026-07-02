#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Providers can implement this function to receive notification when consumers perform certain actions, such as adding or removing counters from a query.
 * @remarks
 * If the <b>callback</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element is "custom" or you used the <b>-NotificationCallback</b> argument when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>, you must implement this function. You pass the name of your callback function to <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a>.
 * 
 * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/counterinitialize">CounterInitialize</a> function is named <b>PerfAutoInitialize</b>. The <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool also generates a skeleton of this callback for you that includes all the request codes. You then add code to the request codes that you want to support and remove the others.
 * 
 * The callback must complete within one second. If the callback does not complete in time, PERFLIB continues with the consumer's request and ignores the callback's return value when it completes.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/nc-perflib-perflibrequest
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERFLIBREQUEST {
    value : IntPtr

    __value {
        set {
            if (value is PERFLIBREQUEST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} RequestCode 
     * @param {Pointer<Void>} _Buffer The contents of the buffer depends on the request. For possible content, see the <i>RequestCode</i> parameter.
     * @param {Integer} BufferSize Size, in bytes, of the <i>Buffer</i> parameter.
     * @returns {Integer} Return ERROR_SUCCESS if the callback succeeds. 
     * 
     * If the callback fails, PERFLIB will return the error code to the consumer if the request is <b>PERF_ADD_COUNTER</b>, <b>PERF_ENUM_INSTANCES</b>, or <b>PERF_COLLECT_START</b>; otherwise, the error code is ignored.
     */
    Call(RequestCode, _Buffer, BufferSize) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, RequestCode, _BufferMarshal, _Buffer, UInt32, BufferSize, UInt32)
        return result
    }

    /**
     * A PERFLIBREQUEST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PERFLIBREQUEST {
        /**
         * Creates a PERFLIBREQUEST pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
