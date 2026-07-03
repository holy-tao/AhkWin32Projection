#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * Begins an asynchronous biometric capture.
 * @remarks
 * This function does not block. If the adapter issues multiple commands to the sensor to prepare for a capture operation, all but the final command can be synchronous. The final command, issued immediately before <i>SensorAdapterStartCapture</i> returns control to the Windows Biometric Framework, must be asynchronous and must use overlapped I/O.
 * 
 * To use overlapped I/O, begin by adding an <b>OVERLAPPED</b> object to the definition of the private sensor adapter context structure. This structure is available to the adapter through the <b>SensorContext</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> object.
 * 
 * When you implement <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_attach_fn">SensorAdapterAttach</a>, you must perform the following actions to initialize the <b>OVERLAPPED</b> structure:
 * 
 * <ul>
 * <li>Clear the <b>OVERLAPPED</b> structure by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366920(v=vs.85)">ZeroMemory</a> function.</li>
 * <li>Create a manual reset event object by using the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function. It is critical that the event object be manual rather than  auto-reset. The use of auto-reset events in overlapped I/O can lead to an unrecoverable lack of response in the I/O processing operation.</li>
 * <li>Save the handle of this event in the <b>hEvent</b> member of the <b>OVERLAPPED</b> structure.</li>
 * </ul>
 * When you implement <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_detach_fn">SensorAdapterDetach</a>, you must release the event object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function. It is important not to release this handle until after all input and output operations related to the capture have been completed or canceled.
 * 
 * The Windows Biometric Framework uses the <b>OVERLAPPED</b> object when it calls operating system functions such as <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> and <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitformultipleobjects">WaitForMultipleObjects</a> to determine when the capture operation has completed.
 * 
 * The event handle in the <b>OVERLAPPED</b> structure must be in the non-signaled state when <i>SensorAdapterStartCapture</i> returns. Calling <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-deviceiocontrol">DeviceIoControl</a> to start an overlapped I/O operation automatically resets the event. If your adapter uses some other mechanism to start an I/O operation, you must reset the event yourself.
 * 
 * The Windows Biometric Framework guarantees that only one asynchronous I/O operation is outstanding at any time for each biometric unit. Consequently, the sensor adapter only needs one <b>OVERLAPPED</b> structure for each processing pipeline.
 * 
 * The Windows Biometric Framework opens and closes the sensor adapter handle and is responsible for ensuring that the handle has been configured for overlapped I/O.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_start_capture_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_START_CAPTURE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_START_CAPTURE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Integer} Purpose 
     * @returns {Pointer<OVERLAPPED>} Address of a variable that receives a pointer to an <b>OVERLAPPED</b> structure that tracks the state of the asynchronous capture operation. This structure is created and managed by the sensor adapter but is used by the Windows Biometric Framework for synchronization. For more information, see the Remarks section.
     */
    Call(Pipeline, Purpose) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Int8, Purpose, "ptr*", &_Overlapped := 0, "HRESULT")
        return _Overlapped
    }

    /**
     * A PIBIO_SENSOR_START_CAPTURE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_START_CAPTURE_FN {
        /**
         * Creates a PIBIO_SENSOR_START_CAPTURE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Int8) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Int8, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
