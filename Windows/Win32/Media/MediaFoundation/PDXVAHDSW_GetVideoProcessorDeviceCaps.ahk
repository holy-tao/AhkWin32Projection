#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVAHD_VPDEVCAPS.ahk" { DXVAHD_VPDEVCAPS }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXVAHD_DEVICE_USAGE.ahk" { DXVAHD_DEVICE_USAGE }
#Import ".\DXVAHD_CONTENT_DESC.ahk" { DXVAHD_CONTENT_DESC }

/**
 * Gets the capabilities of a software plug-in Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessordevicecaps
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_GetVideoProcessorDeviceCaps {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_GetVideoProcessorDeviceCaps) {
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
     * @param {DXVAHD_DEVICE_USAGE} Usage A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_usage">DXVAHD_DEVICE_USAGE</a> enumeration, describing how the device will be used. The value indicates the desired trade-off between speed and video quality.
     * @param {Pointer<DXVAHD_VPDEVCAPS>} pCaps A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_vpdevcaps">DXVAHD_VPDEVCAPS</a> structure that receives the device capabilities.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hDevice, pContentDesc, Usage, pCaps) {
        result := DllCall(this.value, HANDLE, hDevice, DXVAHD_CONTENT_DESC.Ptr, pContentDesc, DXVAHD_DEVICE_USAGE, Usage, DXVAHD_VPDEVCAPS.Ptr, pCaps, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_GetVideoProcessorDeviceCaps that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_GetVideoProcessorDeviceCaps {
        /**
         * Creates a PDXVAHDSW_GetVideoProcessorDeviceCaps pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DXVAHD_CONTENT_DESC, DXVAHD_DEVICE_USAGE, DXVAHD_VPDEVCAPS) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DXVAHD_CONTENT_DESC.Ptr, DXVAHD_DEVICE_USAGE, DXVAHD_VPDEVCAPS.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
