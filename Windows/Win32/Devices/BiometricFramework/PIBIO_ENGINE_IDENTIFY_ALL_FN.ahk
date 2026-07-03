#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import ".\WINBIO_PRESENCE.ahk" { WINBIO_PRESENCE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Determines the identities of any people who are currently in camera frame.
 * @remarks
 * The biometric service calls this method after it sends a new frame of data to the engine adapter.
 * 
 * After processing the data frame, this function should return one <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-presence">WINBIO_PRESENCE</a> element for each presence detected in the data frame.
 * 
 * In the event that the <b>EngineAdapterIdentifyAll</b> function can’t find any faces in frame, it returns an <b>HRESULT</b> of <b>S_OK</b> and sets the <i>PresenceCount</i> and <i>PresenceArray</i> return parameters to zero and <b>NULL</b>, respectively. In other words, a frame that doesn’t contain any human presences is not an error condition. 
 * 
 * The only time <b>EngineAdapterIdentifyAll</b> should return an <b>HRESULT</b> other than <b>S_OK</b> is if it doesn’t want the bio service to use the frame to update the Presence Monitor state. This should be a rare occurrence.
 * The engine adapter is responsible for allocating the array of <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-presence">WINBIO_PRESENCE</a> elements it returns in the <i>PresenceArray</i> parameter. It must allocate this memory from the process heap by using the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function. After the array is created, it becomes the property of the Windows Biometric Framework. Because the Framework deallocates this memory after using it, your engine adapter must not attempt to deallocate the array or save a pointer to it. Failure to follow this rule will lead to heap corruption and possible crashes of the biometric service.
 * 
 * 
 * The values of the individual <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-presence">WINBIO_PRESENCE</a> items in the <i>PresenceArray</i> will determine the events generated for client applications. See the discussion of the <b>WINBIO_PRESENCE</b> structure for details.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_all_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_IDENTIFY_ALL_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_IDENTIFY_ALL_FN) {
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
     * @param {Pointer<Pointer>} PresenceCount Address of a variable that receives the number of presences detected by the function.
     * @param {Pointer<Pointer<WINBIO_PRESENCE>>} PresenceArray Address of a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-presence">WINBIO_PRESENCE</a> elements.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it must return one of the following <b>HRESULT</b> values to indicate the error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_some_error </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any error code will cause the Biometric Service to log the error and ignore the camera frame.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, PresenceCount, PresenceArray) {
        PresenceCountMarshal := PresenceCount is VarRef ? "ptr*" : "ptr"
        PresenceArrayMarshal := PresenceArray is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, PresenceCountMarshal, PresenceCount, PresenceArrayMarshal, PresenceArray, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_IDENTIFY_ALL_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_IDENTIFY_ALL_FN {
        /**
         * Creates a PIBIO_ENGINE_IDENTIFY_ALL_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "ptr*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
