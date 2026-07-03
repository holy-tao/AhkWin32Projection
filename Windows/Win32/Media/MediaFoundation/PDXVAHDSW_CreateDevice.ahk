#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\IDirect3DDevice9Ex.ahk" { IDirect3DDevice9Ex }

/**
 * Creates an instance of a software plug-in Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_createdevice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_CreateDevice {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_CreateDevice) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDirect3DDevice9Ex} pD3DDevice A pointer to the <b>IDirect3DDevice9Ex</b> interface of the Direct3D device.
     * @returns {HANDLE} Receives a handle to the plug-in DXVA-HD device.
     */
    Call(pD3DDevice) {
        phDevice := HANDLE.Owned()
        result := DllCall(this.value, "ptr", pD3DDevice, HANDLE.Ptr, phDevice, "HRESULT")
        return phDevice
    }

    /**
     * A PDXVAHDSW_CreateDevice that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_CreateDevice {
        /**
         * Creates a PDXVAHDSW_CreateDevice pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
