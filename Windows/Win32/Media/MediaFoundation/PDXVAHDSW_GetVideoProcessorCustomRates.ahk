#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DXVAHD_CUSTOM_RATE_DATA.ahk" { DXVAHD_CUSTOM_RATE_DATA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Gets the custom rates that a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor supports.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcustomrates
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_GetVideoProcessorCustomRates {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_GetVideoProcessorCustomRates) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDevice A handle to the plug-in DXVA-HD device.
     * @param {Pointer<Guid>} pVPGuid A GUID that identifies the video processor to query.
     * @param {Integer} Count The number of rates to retrieve.
     * @param {Pointer<DXVAHD_CUSTOM_RATE_DATA>} pRates A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_custom_rate_data">DXVAHD_CUSTOM_RATE_DATA</a> structures. The <i>Count</i> parameter specifies the number of elements in the array. The function fills the array with a list of custom rates.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hDevice, pVPGuid, Count, pRates) {
        result := DllCall(this.value, HANDLE, hDevice, Guid.Ptr, pVPGuid, UInt32, Count, DXVAHD_CUSTOM_RATE_DATA.Ptr, pRates, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_GetVideoProcessorCustomRates that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_GetVideoProcessorCustomRates {
        /**
         * Creates a PDXVAHDSW_GetVideoProcessorCustomRates pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Guid, UInt32, DXVAHD_CUSTOM_RATE_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Guid.Ptr, UInt32, DXVAHD_CUSTOM_RATE_DATA.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
