#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Pointer to a function that initializes a software plug-in device for Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahdsw_callbacks">DXVAHDSW_CALLBACKS</a> structure contains pointers to callback functions. The software plug-in device must implement these callback functions. The  DXVA-HD device calls the <b>PDXVAHDSW_Plugin</b> function to get the callback function pointers from the plug-in device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_plugin
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_Plugin {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_Plugin) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Size The size of the structure pointed to by the <i>pCallbacks</i> parameter, in bytes.
     * @param {Integer} pCallbacks A pointer to an uninitialized <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahdsw_callbacks">DXVAHDSW_CALLBACKS</a> structure. The function fills this structure with pointers to the plug-in device's callback functions.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(_Size, pCallbacks) {
        result := DllCall(this.value, UInt32, _Size, IntPtr, pCallbacks, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_Plugin that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_Plugin {
        /**
         * Creates a PDXVAHDSW_Plugin pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
