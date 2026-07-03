#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Creates a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_createvideoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_CreateVideoProcessor {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_CreateVideoProcessor) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDevice A handle to the plug-in DXVA-HD device that creates the video processor.
     * @param {Pointer<Guid>} pVPGuid A GUID that identifies the video processor to create.
     * @returns {HANDLE} Receives a handle to the software video processor.
     */
    Call(hDevice, pVPGuid) {
        phVideoProcessor := HANDLE.Owned()
        result := DllCall(this.value, HANDLE, hDevice, Guid.Ptr, pVPGuid, HANDLE.Ptr, phVideoProcessor, "HRESULT")
        return phVideoProcessor
    }

    /**
     * A PDXVAHDSW_CreateVideoProcessor that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_CreateVideoProcessor {
        /**
         * Creates a PDXVAHDSW_CreateVideoProcessor pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Guid.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
