#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import ".\DXVAHD_CONTENT_DESC.ahk" { DXVAHD_CONTENT_DESC }
#Import ".\DXVAHD_DEVICE_USAGE.ahk" { DXVAHD_DEVICE_USAGE }

/**
 * Gets the input formats that are supported by a software plug-in Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_getvideoprocessorinputformats
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_GetVideoProcessorInputFormats {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_GetVideoProcessorInputFormats) {
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
     * @param {DXVAHD_DEVICE_USAGE} Usage A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_device_usage">DXVAHD_DEVICE_USAGE</a> enumeration, describing how the device will be used.
     * @param {Integer} Count The number of formats to retrieve.
     * @returns {D3DFORMAT} A pointer to an array of <b>D3DFORMAT</b> values. The <i>Count</i> parameter specifies the number of elements in the array. The method fills the array with a list of input formats.
     */
    Call(hDevice, pContentDesc, Usage, Count) {
        result := DllCall(this.value, HANDLE, hDevice, DXVAHD_CONTENT_DESC.Ptr, pContentDesc, DXVAHD_DEVICE_USAGE, Usage, UInt32, Count, "uint*", &pFormats := 0, "HRESULT")
        return pFormats
    }

    /**
     * A PDXVAHDSW_GetVideoProcessorInputFormats that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_GetVideoProcessorInputFormats {
        /**
         * Creates a PDXVAHDSW_GetVideoProcessorInputFormats pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DXVAHD_CONTENT_DESC, DXVAHD_DEVICE_USAGE, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DXVAHD_CONTENT_DESC.Ptr, DXVAHD_DEVICE_USAGE, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
