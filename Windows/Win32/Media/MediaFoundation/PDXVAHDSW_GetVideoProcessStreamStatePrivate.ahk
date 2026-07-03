#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXVAHD_STREAM_STATE_PRIVATE_DATA.ahk" { DXVAHD_STREAM_STATE_PRIVATE_DATA }

/**
 * Gets a private stream state from a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessstreamstateprivate
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_GetVideoProcessStreamStatePrivate {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_GetVideoProcessStreamStatePrivate) {
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
     * @param {Pointer<DXVAHD_STREAM_STATE_PRIVATE_DATA>} pData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_state_private_data">DXVAHD_STREAM_STATE_PRIVATE_DATA</a> structure. On input, the <b>Guid</b> member specifies the private state to query. On output, the structure contains the state information.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hVideoProcessor, StreamNumber, pData) {
        result := DllCall(this.value, HANDLE, hVideoProcessor, UInt32, StreamNumber, DXVAHD_STREAM_STATE_PRIVATE_DATA.Ptr, pData, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_GetVideoProcessStreamStatePrivate that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_GetVideoProcessStreamStatePrivate {
        /**
         * Creates a PDXVAHDSW_GetVideoProcessStreamStatePrivate pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, DXVAHD_STREAM_STATE_PRIVATE_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, DXVAHD_STREAM_STATE_PRIVATE_DATA.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
