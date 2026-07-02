#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DXVAHD_BLT_STATE_PRIVATE_DATA.ahk" { DXVAHD_BLT_STATE_PRIVATE_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Gets a private blit state from a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessbltstateprivate
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_GetVideoProcessBltStatePrivate {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_GetVideoProcessBltStatePrivate) {
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
     * @param {Pointer<DXVAHD_BLT_STATE_PRIVATE_DATA>} pData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_blt_state_private_data">DXVAHD_BLT_STATE_PRIVATE_DATA</a> structure. On input, the <b>Guid</b> member specifies the private state to query. On output, the structure contains the state information.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hVideoProcessor, pData) {
        result := DllCall(this.value, HANDLE, hVideoProcessor, DXVAHD_BLT_STATE_PRIVATE_DATA.Ptr, pData, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_GetVideoProcessBltStatePrivate that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_GetVideoProcessBltStatePrivate {
        /**
         * Creates a PDXVAHDSW_GetVideoProcessBltStatePrivate pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DXVAHD_BLT_STATE_PRIVATE_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DXVAHD_BLT_STATE_PRIVATE_DATA.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
