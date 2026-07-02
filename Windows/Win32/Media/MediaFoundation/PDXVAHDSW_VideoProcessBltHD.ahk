#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DXVAHD_STREAM_DATA.ahk" { DXVAHD_STREAM_DATA }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Performs a video processing blit.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_videoprocessblthd
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_VideoProcessBltHD {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_VideoProcessBltHD) {
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
     * @param {IDirect3DSurface9} pOutputSurface A pointer to the <b>IDirect3DSurface9</b> interface of a Direct3D surface that receives the blit.
     * @param {Integer} OutputFrame The frame number of the output video frame, indexed from zero.
     * @param {Integer} StreamCount The number of input streams to process.
     * @param {Pointer<DXVAHD_STREAM_DATA>} pStreams A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_stream_data">DXVAHD_STREAM_DATA</a> structures that contain information about the input streams. The number of elements in the array is given in the <i>StreamCount</i> parameter.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hVideoProcessor, pOutputSurface, OutputFrame, StreamCount, pStreams) {
        result := DllCall(this.value, HANDLE, hVideoProcessor, "ptr", pOutputSurface, UInt32, OutputFrame, UInt32, StreamCount, DXVAHD_STREAM_DATA.Ptr, pStreams, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_VideoProcessBltHD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_VideoProcessBltHD {
        /**
         * Creates a PDXVAHDSW_VideoProcessBltHD pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", UInt32, UInt32, DXVAHD_STREAM_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", UInt32, UInt32, DXVAHD_STREAM_DATA.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
