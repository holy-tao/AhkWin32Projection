#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXVAHD_BLT_STATE.ahk" { DXVAHD_BLT_STATE }

/**
 * Sets a state parameter for blit operations by a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessbltstate
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_SetVideoProcessBltState {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_SetVideoProcessBltState) {
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
     * @param {DXVAHD_BLT_STATE} State The state parameter to set, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_blt_state">DXVAHD_BLT_STATE</a> enumeration.
     * @param {Integer} DataSize The size of the buffer pointed to by <i>pData</i>, in bytes.
     * @param {Integer} pData A pointer to a buffer that contains the state data.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hVideoProcessor, State, DataSize, pData) {
        result := DllCall(this.value, HANDLE, hVideoProcessor, DXVAHD_BLT_STATE, State, UInt32, DataSize, IntPtr, pData, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_SetVideoProcessBltState that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_SetVideoProcessBltState {
        /**
         * Creates a PDXVAHDSW_SetVideoProcessBltState pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DXVAHD_BLT_STATE, UInt32, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DXVAHD_BLT_STATE, UInt32, IntPtr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
