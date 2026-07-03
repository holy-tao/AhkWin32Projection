#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_INFO.ahk" { IMAGE_INFO }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PLOAD_IMAGE_NOTIFY_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PLOAD_IMAGE_NOTIFY_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} FullImageName 
     * @param {HANDLE} ProcessId 
     * @param {Pointer<IMAGE_INFO>} _ImageInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FullImageName, ProcessId, _ImageInfo) {
        DllCall(this.value, UNICODE_STRING.Ptr, FullImageName, HANDLE, ProcessId, IMAGE_INFO.Ptr, _ImageInfo)
    }

    /**
     * A PLOAD_IMAGE_NOTIFY_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLOAD_IMAGE_NOTIFY_ROUTINE {
        /**
         * Creates a PLOAD_IMAGE_NOTIFY_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(UNICODE_STRING, HANDLE, IMAGE_INFO) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UNICODE_STRING.Ptr, HANDLE, IMAGE_INFO.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
