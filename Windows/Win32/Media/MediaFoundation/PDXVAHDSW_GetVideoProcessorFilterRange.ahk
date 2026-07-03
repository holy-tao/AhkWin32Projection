#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXVAHD_FILTER.ahk" { DXVAHD_FILTER }
#Import ".\DXVAHD_FILTER_RANGE_DATA.ahk" { DXVAHD_FILTER_RANGE_DATA }

/**
 * Gets the supported range of image filter values from a software plug-in Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorfilterrange
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_GetVideoProcessorFilterRange {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_GetVideoProcessorFilterRange) {
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
     * @param {DXVAHD_FILTER} Filter The type of image filter, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_filter">DXVAHD_FILTER</a> enumeration.
     * @param {Pointer<DXVAHD_FILTER_RANGE_DATA>} pRange A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_filter_range_data">DXVAHD_FILTER_RANGE_DATA</a> structure. The function fills the structure with the range of values for the specified filter.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hDevice, Filter, pRange) {
        result := DllCall(this.value, HANDLE, hDevice, DXVAHD_FILTER, Filter, DXVAHD_FILTER_RANGE_DATA.Ptr, pRange, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_GetVideoProcessorFilterRange that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_GetVideoProcessorFilterRange {
        /**
         * Creates a PDXVAHDSW_GetVideoProcessorFilterRange pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DXVAHD_FILTER, DXVAHD_FILTER_RANGE_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DXVAHD_FILTER, DXVAHD_FILTER_RANGE_DATA.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
