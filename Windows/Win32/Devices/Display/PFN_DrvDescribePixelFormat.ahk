#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\OpenGL\PIXELFORMATDESCRIPTOR.ahk" { PIXELFORMATDESCRIPTOR }
#Import ".\DHPDEV.ahk" { DHPDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvDescribePixelFormat {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvDescribePixelFormat) {
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
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<PIXELFORMATDESCRIPTOR>} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, DHPDEV, param0, Int32, param1, UInt32, param2, PIXELFORMATDESCRIPTOR.Ptr, param3, Int32)
        return result
    }

    /**
     * A PFN_DrvDescribePixelFormat that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvDescribePixelFormat {
        /**
         * Creates a PFN_DrvDescribePixelFormat pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, Int32, UInt32, PIXELFORMATDESCRIPTOR) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, Int32, UInt32, PIXELFORMATDESCRIPTOR.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
