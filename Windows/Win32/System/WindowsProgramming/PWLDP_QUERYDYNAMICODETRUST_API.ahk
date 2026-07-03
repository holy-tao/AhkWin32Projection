#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_QUERYDYNAMICODETRUST_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_QUERYDYNAMICODETRUST_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} fileHandle 
     * @param {Integer} baseImage 
     * @param {Integer} imageSize 
     * @returns {HRESULT} 
     */
    Call(fileHandle, baseImage, imageSize) {
        result := DllCall(this.value, HANDLE, fileHandle, IntPtr, baseImage, UInt32, imageSize, "HRESULT")
        return result
    }

    /**
     * A PWLDP_QUERYDYNAMICODETRUST_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_QUERYDYNAMICODETRUST_API {
        /**
         * Creates a PWLDP_QUERYDYNAMICODETRUST_API pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, IntPtr, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, IntPtr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
