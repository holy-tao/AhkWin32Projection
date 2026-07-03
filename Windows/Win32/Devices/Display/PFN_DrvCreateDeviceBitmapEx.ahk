#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\DHSURF.ahk" { DHSURF }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvCreateDeviceBitmapEx {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvCreateDeviceBitmapEx) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} param0 
     * @param {SIZE} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {DHSURF} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @param {Pointer<HANDLE>} param7 
     * @returns {HBITMAP} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        result := DllCall(this.value, DHPDEV, param0, SIZE, param1, UInt32, param2, UInt32, param3, DHSURF, param4, UInt32, param5, UInt32, param6, HANDLE.Ptr, param7, HBITMAP.Owned)
        return result
    }

    /**
     * A PFN_DrvCreateDeviceBitmapEx that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvCreateDeviceBitmapEx {
        /**
         * Creates a PFN_DrvCreateDeviceBitmapEx pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, SIZE, UInt32, UInt32, DHSURF, UInt32, UInt32, HANDLE) => HBITMAP} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, SIZE, UInt32, UInt32, DHSURF, UInt32, UInt32, HANDLE.Ptr, HBITMAP])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
