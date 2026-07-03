#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\IDirect3DDevice9Ex.ahk" { IDirect3DDevice9Ex }
#Import ".\DXVAHD_CONTENT_DESC.ahk" { DXVAHD_CONTENT_DESC }
#Import ".\DXVAHD_DEVICE_USAGE.ahk" { DXVAHD_DEVICE_USAGE }
#Import ".\IDXVAHD_Device.ahk" { IDXVAHD_Device }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHD_CreateDevice {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHD_CreateDevice) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDirect3DDevice9Ex} pD3DDevice 
     * @param {Pointer<DXVAHD_CONTENT_DESC>} pContentDesc 
     * @param {DXVAHD_DEVICE_USAGE} Usage 
     * @param {Pointer<PDXVAHDSW_Plugin>} pPlugin 
     * @returns {IDXVAHD_Device} 
     */
    Call(pD3DDevice, pContentDesc, Usage, pPlugin) {
        result := DllCall(this.value, "ptr", pD3DDevice, DXVAHD_CONTENT_DESC.Ptr, pContentDesc, DXVAHD_DEVICE_USAGE, Usage, "ptr", pPlugin, "ptr*", &ppDevice := 0, "HRESULT")
        return IDXVAHD_Device(ppDevice)
    }

    /**
     * A PDXVAHD_CreateDevice that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHD_CreateDevice {
        /**
         * Creates a PDXVAHD_CreateDevice pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DXVAHD_CONTENT_DESC, DXVAHD_DEVICE_USAGE, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DXVAHD_CONTENT_DESC.Ptr, DXVAHD_DEVICE_USAGE, "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
