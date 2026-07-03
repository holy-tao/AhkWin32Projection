#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOS_IMAGE_INFO.ahk" { DOS_IMAGE_INFO }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct FOUND_IMAGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is FOUND_IMAGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<DOS_IMAGE_INFO>} _ImageInfo 
     * @returns {BOOL} 
     */
    Call(_Context, _ImageInfo) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, DOS_IMAGE_INFO.Ptr, _ImageInfo, BOOL)
        return result
    }

    /**
     * A FOUND_IMAGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FOUND_IMAGE_CALLBACK {
        /**
         * Creates a FOUND_IMAGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DOS_IMAGE_INFO) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DOS_IMAGE_INFO.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
