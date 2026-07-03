#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvCreateDeviceBitmap {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvCreateDeviceBitmap) {
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
     * @returns {HBITMAP} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, DHPDEV, param0, SIZE, param1, UInt32, param2, HBITMAP.Owned)
        return result
    }

    /**
     * A PFN_DrvCreateDeviceBitmap that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvCreateDeviceBitmap {
        /**
         * Creates a PFN_DrvCreateDeviceBitmap pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, SIZE, UInt32) => HBITMAP} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, SIZE, UInt32, HBITMAP])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
