#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DXVAHD_STREAM_STATE.ahk" { DXVAHD_STREAM_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Sets a state parameter for an input stream on a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessstreamstate
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_SetVideoProcessStreamState {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_SetVideoProcessStreamState) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hVideoProcessor A handle to the software DXVA-HD video processor.
     * @param {Integer} StreamNumber The zero-based index of the input stream.
     * @param {DXVAHD_STREAM_STATE} State The state parameter to set, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_stream_state">DXVAHD_STREAM_STATE</a> enumeration.
     * @param {Integer} DataSize The size of the buffer pointed to by <i>pData</i>, in bytes.
     * @param {Integer} pData A pointer to a buffer that contains the state data.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hVideoProcessor, StreamNumber, State, DataSize, pData) {
        result := DllCall(this.value, HANDLE, hVideoProcessor, UInt32, StreamNumber, DXVAHD_STREAM_STATE, State, UInt32, DataSize, IntPtr, pData, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_SetVideoProcessStreamState that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_SetVideoProcessStreamState {
        /**
         * Creates a PDXVAHDSW_SetVideoProcessStreamState pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, DXVAHD_STREAM_STATE, UInt32, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, DXVAHD_STREAM_STATE, UInt32, IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
