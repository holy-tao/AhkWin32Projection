#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXVAHD_VPCAPS.ahk" { DXVAHD_VPCAPS }
#Import ".\DXVAHD_DEVICE_USAGE.ahk" { DXVAHD_DEVICE_USAGE }
#Import ".\DXVAHD_CONTENT_DESC.ahk" { DXVAHD_CONTENT_DESC }

/**
 * Gets the capabilities of one or more software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processors.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorcaps
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_GetVideoProcessorCaps {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_GetVideoProcessorCaps) {
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
     * @param {Pointer<DXVAHD_CONTENT_DESC>} pContentDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_content_desc">DXVAHD_CONTENT_DESC</a> structure that describes the video content.
     * @param {DXVAHD_DEVICE_USAGE} Usage A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_usage">DXVAHD_DEVICE_USAGE</a> enumeration, describing how the video processor will be used.
     * @param {Integer} Count The number of elements in the <i>pCaps</i> array.
     * @param {Pointer<DXVAHD_VPCAPS>} pCaps A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpcaps">DXVAHD_VPCAPS</a> structures. The function fills the structures with the capabilities of the plug-in video processors.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hDevice, pContentDesc, Usage, Count, pCaps) {
        result := DllCall(this.value, HANDLE, hDevice, DXVAHD_CONTENT_DESC.Ptr, pContentDesc, DXVAHD_DEVICE_USAGE, Usage, UInt32, Count, DXVAHD_VPCAPS.Ptr, pCaps, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_GetVideoProcessorCaps that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_GetVideoProcessorCaps {
        /**
         * Creates a PDXVAHDSW_GetVideoProcessorCaps pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DXVAHD_CONTENT_DESC, DXVAHD_DEVICE_USAGE, UInt32, DXVAHD_VPCAPS) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DXVAHD_CONTENT_DESC.Ptr, DXVAHD_DEVICE_USAGE, UInt32, DXVAHD_VPCAPS.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
